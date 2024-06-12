<?php

namespace App\Http\Controllers\scrum;
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
        $data= DB::table('projects')
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

        return view('scrum.home',compact('data', 'count', 'completed', 'schedule', 'inprogress','project', 'notification'));
    }
    public function markNotification(Request $request)
    {
        auth()->user()
            ->unreadNotifications
            ->when($request->input('id'), function ($query) use ($request) {
                return $query->where('id', $request->input('id'));
            })
            ->markAsRead();

        return response()->noContent();
    }

}
