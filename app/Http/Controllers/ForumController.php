<?php

namespace App\Http\Controllers;
use App\Forum;
use App\Project;
use Illuminate\Http\Request;
use DB;
use App\Notifications\ForumNotification;

class ForumController extends Controller
{

    //return view of home page forum
    public function index($projects)
    {
        return view('forum.index', [$projects]);
    }

    //return view of edit forum when click on +Create button
    public function create($projects)
    {
        // faiq update field project
        $data= DB::table('projects')
                ->select('id','proj_name')
                ->where('user_id','=',\Auth::user()->id)
                ->where('id', '=', [$projects]) //mimi tambah
                ->get();
        return view('forum.create',['data'=>$data]);
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    //save values from form into database and redirect to forum page
    public function store(Request $request, $projects)
    {
        $request->validate([
            'forumTitle' => 'unique:forum,forumTitle'
        ]);
        $Forum = new Forum();
        $Forum->project_id = $projects; //faiq tambah
        $Forum->forumTitle = $request->forumTitle;
        $Forum->forumDesc = $request->forumDesc;
        $Forum->createdBy = \Auth::user()->id; //faiq tambah
        $Forum->save();


        $message="successfully add!";
        echo "<script type='text/javascript'>alert('$message');</script>";
        return redirect()->route('forum.index', $projects);
    }

    /**
     * Display forum list
     * by Faiq, 22/11/2022
     * new update 26/11/22: only display projects from users
     */

    public function viewList($projects){ //inner join project
        $input =  DB::table('projects')
                ->select('id','proj_name')
                ->where('user_id','=',\Auth::user()->id)
                ->where('id', '=', [$projects]) //mimi tambah
                ->get();
        
        $data= DB::table('forum')
                    ->join('users','users.id','=','forum.createdBy')
                    ->join('projects', 'projects.id', '=', 'forum.project_id')
                    ->select('forum.*', 'users.name', 'users.role_name')
                    ->where('createdBy','=',\Auth::user()->id)
                    ->where('thread_parent','=','0')
                    ->where('project_id', '=', [$projects])//mimi tambah (only display forum based on project dia pilih dekat project list)
                    ->paginate(2);
        
        return view('forum.index',compact('input', 'data'));
    }
    /**
     * Display forum detail
     * by Nik,22/11/2022
     * updated by Hannan, 15/12/22
     */
    public function dispDetail($projects, $id){
        $data = DB::table('forum')
                ->join('users','users.id','=','forum.createdBy')
                ->join('projects', 'projects.id', '=', 'forum.project_id')
                ->select('forum.*', 'users.name', 'users.role_name')
                ->where('project_id', '=', [$projects]) // hannan (copy mimi punya je)
                ->where('forum.forumID', '=', $id)
                ->orWhere('thread_parent','=',$id)
                ->get();

        return view('forum.detail',['data'=>$data]);
    }
    public function storeComment(Request $request, $projects)
    {
        $Forum = new Forum;
        $Forum->forumDesc = $request->comment;
        $Forum->project_id = $projects; //nik tmbh
        $Forum->createdBy = \Auth::user()->id;
        $Forum->thread_parent = $request->parentID;
        $Forum->save();

        $data = DB::table('forum')
                ->where('forum.forumID', '=', $request->parentID)
                ->get();

        $message="successfully add!";
        echo "<script type='text/javascript'>alert('$message');</script>";

        $link=route('forum.detail', [$projects, $request->parentID]);
        request()->user()->notify(new ForumNotification($link,$data[0]->forumTitle,\Auth::user()->name));

        return redirect()->route('forum.detail', [$projects, $request->parentID]);
    }
    //update forum list
    /**public function update(Request $request, $id)
    {
        $Forum = Forum::find($id);
        $Forum->forumTitle = $request->forumTitle;
        $Forum->forumDesc = $request->forumDesc;
        $Forum->save();

        $message="successfully update!";
        echo "<script type='text/javascript'>alert('$message');</script>";
        return redirect()->route('forum.index');
    }*/
	public function edit($id, $projects)
    {
         $data= DB::table('forum')
                ->select('forum.*')
                    ->where('forumID','=',$id)
                    ->get();
        return view('forum.edit',compact('data'));
    }

    public function update(Request $request, $id, $projects)
    {
        $data= DB::table('forum')
                    ->where('forumID','=',$id)
                    ->update([
                        'forumTitle'=>$request->forumTitle,
                        'forumDesc'=>$request->forumDesc
                    ]);

        $message="successfully update!";
        echo "<script type='text/javascript'>alert('$message');</script>";
        return redirect()->route('forum.index', $projects);
    }
    /**
     * Feature Search & Filter Forum by ID
     * by Faiq 26/11/2022
     */
    public function search(Request $request,$projects){
        $input =  DB::table('projects')
                ->select('id','proj_name')
                ->where('user_id','=',\Auth::user()->id)
                ->where('id', '=', [$projects])
                ->get();

        if($request->forumTitle != ''){
            $data= DB::table('forum')
                    ->join('users','users.id','=','forum.createdBy')
                    ->select('forum.*', 'users.name', 'users.role_name')
                    ->where('createdBy','=',\Auth::user()->id)
                    ->where('thread_parent','=','0')
                    ->where('forumTitle','LIKE','%'.$request->forumTitle.'%')
                    ->where('project_id', '=', [$projects]) 
                    // ->get();
                    ->paginate(2);
        } else {
            $data= DB::table('forum')
                    ->join('users','users.id','=','forum.createdBy')
                    ->select('forum.*', 'users.name', 'users.role_name')
                    ->where('createdBy','=',\Auth::user()->id)
                    ->where('thread_parent','=','0')
                    ->where('project_id', '=', [$projects]) 
                    // ->get();
                    ->paginate(2);
        }
        return view('forum.index',compact('input', 'data'));
    }
}