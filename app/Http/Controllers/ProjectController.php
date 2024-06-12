<?php

namespace App\Http\Controllers;
use App\Project;
use Illuminate\Http\Request;
use App\Notifications\NotificationController;
use Illuminate\Support\Facades\Notification;
use DB;

class ProjectController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $project = new Project;
        if (\Auth::check())
        {
            $id = \Auth::user()->getId();
            
        }
        if($id)
        {
            $pro = \App\Project::where('user_id', '=', $id)->get();
            // $pro = \App\Project::where('id', '=', $id)->get();

            return view('profeature.index',['projects'=>$project->all(), 'pros'=>$pro->all()]);
        }
      
        return view('project.index')->with ('projects',$project->all());
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $project = new Project;
        // $pro = new Project;
        $dataPM= DB::table('users')
                ->select('id','name')
                ->where('role_name', '=', 'Project Manager')
                ->get();
        $dataSM= DB::table('users')
                ->select('id','name')
                ->where('role_name', '=', 'Scrum Master')
                ->get();
        $dataSA= DB::table('users')
                ->select('id','name')
                ->where('role_name', '=', 'System Analyst')
                ->get();
        $dataST= DB::table('users')
                ->select('id','name')
                ->where('role_name', '=', 'Software Tester')
                ->get();
        $dataCP= DB::table('users')
                ->select('id','name')
                ->where('role_name', '=', 'Chief Programmer')
                ->get();
        $dataP= DB::table('users')
                ->select('id','name')
                ->where('role_name', '=', 'Programmer')
                ->get();
        $dataU= DB::table('users')
                ->select('id','name')
                ->where('role_name', '=', 'User')
                ->get();

        return view('project.create',compact('dataPM','dataSM','dataSA','dataST','dataCP','dataP','dataU'))->with ('projects',$project->all());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
       
        $project =new Project();
        $project->user_id = \Auth::user()->id;
        $project->proj_name=$request->proj_name;
        $project->proj_desc=$request->proj_desc;
        $project->start_date=$request->start_date;
        $project->end_date=$request->end_date; 
        $project->ProjectManager=$request->ProjectManager; 
        $project->ScrumMaster=$request->ScrumMaster; 
        $project->SystemAnalyst=$request->SystemAnalyst; 
        $project->ChiefProgrammer=$request->ChiefProgrammer; 
        $project->Programmer=$request->Programmer; 
        $project->SoftwareTester=$request->SoftwareTester; 
        $project->User=$request->User; 
        //it will store the current logged in user id in user_id field
        $project->status_project="New";
        $project->progress=0;
        
        
        $validation = $request->validate([

            'proj_name' => 'required',
            'proj_desc' => 'required',
            'start_date' => 'required|date|after_or_equal:today',
            'end_date' => 'required|date|after_or_equal:start_date'
        ],
    
        [
            'proj_name.required' => '*The Project Title is required',
            'proj_desc.required' => '*The Description is required',
            'start_date.required' => '*The Start Date is required',
            'end_date.required' => '*The Completion Date is required'


        ]
   
        );

        $project->save();
        $message="successfully add!";
        echo "<script type='text/javascript'>alert('$message');</script>";
        request()->user()->notify(new NotificationController($project->proj_name));
        return redirect()->route('profeature.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Project $project)
    {
        $project = new Project();
        return view('profeature.index')->with ('projects',$project->all());
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Project $project)
    {
        $dataPM= DB::table('users')
                ->select('id','name')
                ->where('role_name', '=', 'Project Manager')
                ->get();
        $dataSM= DB::table('users')
                ->select('id','name')
                ->where('role_name', '=', 'Scrum Master')
                ->get();
        $dataSA= DB::table('users')
                ->select('id','name')
                ->where('role_name', '=', 'System Analyst')
                ->get();
        $dataST= DB::table('users')
                ->select('id','name')
                ->where('role_name', '=', 'Software Tester')
                ->get();
        $dataCP= DB::table('users')
                ->select('id','name')
                ->where('role_name', '=', 'Chief Programmer')
                ->get();
        $dataP= DB::table('users')
                ->select('id','name')
                ->where('role_name', '=', 'Programmer')
                ->get();
        $dataU= DB::table('users')
                ->select('id','name')
                ->where('role_name', '=', 'User')
                ->get();

        return view('project.edit',compact('dataPM','dataSM','dataSA','dataST','dataCP','dataP','dataU'))->with('projects', Project::all())->with('project', $project);
     }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,Project $project)
    {
        $project->proj_name=$request->proj_name;
        $project->proj_desc=$request->proj_desc;
        $project->start_date=$request->start_date;
        $project->end_date=$request->end_date; 
        $project->ProjectManager=$request->ProjectManager; 
        $project->ScrumMaster=$request->ScrumMaster; 
        $project->SystemAnalyst=$request->SystemAnalyst; 
        $project->ChiefProgrammer=$request->ChiefProgrammer; 
        $project->Programmer=$request->Programmer; 
        $project->SoftwareTester=$request->SoftwareTester; 
        $project->User=$request->User; 
        $project->status_project=$request->status_project;
        $project->save(); 
    
        return redirect()->route('profeature.index', $project);
    }
    

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Project $project)
    {
        $project->delete();
        return redirect()->route('profeature.index', $project);
    }
}
