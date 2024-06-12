<?php

namespace App\Http\Controllers\user;
use App\Project;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use DB;

class DashboardController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        
        $data2= DB::table('projects')
                ->select('*')
                ->where('user_id','=',\Auth::user()->id)
                ->limit(3)
                ->get();

        $count= DB::table('projects')->count();
        $completed = DB::table('projects')
                    ->where('status_project', '=', 'Completed')
                    ->count();

        $schedule = DB::table('projects')
                    ->where('end_date', '<', now())
                    ->where('status_project', '=', 'In Progress')
                    ->count();

        $inprogress = DB::table('projects')
                    ->where('status_project', '=', 'In Progress')
                    ->where('end_date', '>', now())
                    ->count();

        $project = DB::table('projects')
                        ->select('*')
                        ->where('user_id','=',\Auth::user()->id)
                        ->orderby('status_project')
                        //->where('status_project','=','In Progress')
                        ->paginate(3);

        $notification = auth()->user()->unreadNotifications;

        $notification->markAsRead();

        $data = DB::table('task')
                ->where('userID', '=', \Auth::user()->id)
                ->get();

        $events = array();
        $bookings = DB::table('bookings')->get();                          
        foreach($bookings as $booking) {
            $color = null;
            $events[] = [
                'id'   => $booking->id,
                'title' => $booking->title,
                'start' => $booking->start_date,
                'end' => $booking->end_date,
                'color' => $color ? $color: '',
            ];
        }

        // return view('layouts.devPage',[
        //     'notifications'=>auth()->user()->notifications
        // ],['data'=>$data])
        // ->with('events', $events);
        return view('user.home',
                        ['notifications'=>auth()->user()->notifications],
                        compact('data2', 'count', 'completed', 'schedule', 'inprogress','project', 'notification','data','events'));
                        // ->with('events', $events));
        

        
    }
}
