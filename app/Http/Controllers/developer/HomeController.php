<?php

namespace App\Http\Controllers\developer;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use DB;

class HomeController extends Controller
{
    public function index()
    {
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

        return view('layouts.devPage',[
            'notifications'=>auth()->user()->notifications
        ],['data'=>$data])
        ->with('events', $events);
    }
}
