<?php

namespace App\Http\Controllers;
use App\Task2;
use App\Project;
use Illuminate\Http\Request;
use DB;


class Task2Controller extends Controller
{

    //return view of task page
    public function index($projects)
    {
        return view('task2.index', [$projects]);
    }

    public function viewList($projects){ 
        $input = DB::table('projects')
                    ->select('id', 'proj_name')
                    ->where('user_id', '=', \Auth::user()->id)
                    ->where('id', '=', [$projects])
                    ->get();
        
        $data= DB::table('task')
                    ->join('users','users.id','=','task.userID')
                    ->join('projects', 'projects.id', '=', 'task.projectID')
                    ->select('task.*')
                    ->where('userID','=',\Auth::user()->id)
                    ->where('projectID', '=', [$projects])
                    ->get();
        
        return view('task2.index', compact('input', 'data')); 
    }

    public function storeTask(Request $request, $projects)
    {
        $Task2 = new Task2;
        $Task2->taskDesc = $request->taskDesc;
        $Task2->projectID = $projects;
        $Task2->userID = \Auth::user()->id;
        $Task2->status = "In Progress";
        $Task2->save();

        $updateProgress = $this->countProgress($projects);

        $data = DB::table('projects')
                    ->where('user_id','=',\Auth::user()->id)
                    ->where('id', '=', [$projects])
                    ->update(['progress'=>$updateProgress]);

        $message="successfully added!";
        echo "<script type='text/javascript'>alert('$message');</script>";
        return redirect()->route('task2.index', $projects);
    }

    // function to calculate project progress
    public function countProgress($projects)
    {
        $task = DB::table('task')
                    ->join('projects', 'projects.id', '=', 'task.projectID')
                    ->select('task.*')
                    ->where('userID','=',\Auth::user()->id)
                    ->where('projectID', '=', [$projects])
                    ->count();

        $taskDone = DB::table('task')
                    ->join('projects', 'projects.id', '=', 'task.projectID')
                    ->select('task.*')
                    ->where('userID','=',\Auth::user()->id)
                    ->where('projectID', '=', [$projects])
                    ->where('status', '=', 'Done')
                    ->count();
        
        if (empty($result)) { 
            $percentage = 0;
        } else {
            $percentage = $taskDone/$task*100;
        }
        
        return $percentage;
        
    }

    public function updateStatus(Request $request, $projects, $task2)
    {
        // $task2->taskDesc = taskDesc;
        // $task2->status = $request->status;
        // $task2->save();

        $update= DB::table('task')
                    ->where('taskID','=',$task2)
                    ->update([
                        // 'taskDesc'=>$request->taskDesc,
                        'status'=>$request->status
                    ]);

        $message="successfully update!";
        echo "<script type='text/javascript'>alert('$message');</script>";

        $updateProgress = $this->countProgress($projects);

        $pro = DB::table('projects')
                ->where('user_id','=',\Auth::user()->id)
                ->where('id', '=', [$projects])
                ->update(['progress'=>$updateProgress]);

        $data= DB::table('task')
                ->join('users','users.id','=','task.userID')
                ->join('projects', 'projects.id', '=', 'task.projectID')
                ->select('task.*')
                ->where('userID','=',\Auth::user()->id)
                ->where('projectID', '=', [$projects])
                ->get();

        return redirect()->route('task2.index', $projects);
    }

    public function delete($projects, $task2){

        $deleted = DB::table('task')
                    ->where('taskID', '=', $task2)
                    ->delete();

        $message="task successfully deleted!";
        echo "<script type='text/javascript'>alert('$message');</script>";

        $updateProgress = $this->countProgress($projects);

        $pro = DB::table('projects')
                ->where('user_id','=',\Auth::user()->id)
                ->where('id', '=', [$projects])
                ->update(['progress'=>$updateProgress]);

        $data= DB::table('task')
                ->join('users','users.id','=','task.userID')
                ->join('projects', 'projects.id', '=', 'task.projectID')
                ->select('task.*')
                ->where('userID','=',\Auth::user()->id)
                ->where('projectID', '=', [$projects])
                ->get();

        return redirect()->route('task2.index', $projects);
    }

}