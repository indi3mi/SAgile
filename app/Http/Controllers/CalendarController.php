<?php

namespace App\Http\Controllers;
use App\Booking;
use App\Project;
use Illuminate\Http\Request;
use DB;

class CalendarController extends Controller
{
    public function index()
    {
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
    
        return view('calendar.index', ['events' => $events]);
    }
    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string'
        ]);

        $booking = Booking::create([
            'title' => $request->title,
            'start_date' => $request->start_date,
            'end_date' => $request->end_date,
        ]);

        $color = null;

        if($booking->title == 'Test') {
            $color = '#924ACE';
        }

        return response()->json([
            'id' => $booking->id,
            'start' => $booking->start_date,
            'end' => $booking->end_date,
            'title' => $booking->title,
            'color' => $color ? $color: '',

        ]);
    }
    
    public function update(Request $request, $id)
    {
        $booking = DB::table('bookings')
                    ->where('id','=',$id)
                    ->update([
                        'start_date' => $request->start_date,
                        'end_date' => $request->end_date,
                    ]);
    }
    
    public function destroy($id)
    {
        $booking = Booking::find($id);
        if(! $booking) {
            return response()->json([
                'error' => 'Unable to locate the event'
            ], 404);
        }
        $booking->delete();
        return $id;
    }
}

