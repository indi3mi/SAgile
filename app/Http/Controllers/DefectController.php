<?php

namespace App\Http\Controllers;
use App\Defect;
use App\Project;
use Illuminate\Http\Request;
use DB;

class DefectController extends Controller
{
    //return view of home page forum
    public function index($projects)
    {
        return view('defect.index', [$projects]);
    }


    /*Feature create defect
    * by Mimi, 5/12/2022
    */
    //return view of edit forum when click on +Create button
    public function create($projects)
    {

        // faiq update field project
        $data= DB::table('projects')
                ->select('id', 'proj_name')
                ->where('user_id','=',\Auth::user()->id)
                ->where('id', '=', [$projects]) //mimi tambah
                ->get();
        return view('defect.create',['data'=>$data]);
    }

    /*Feature store defect
    * by Mimi, 5/12/2022
    */
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    //save values from form into database and redirect to forum page
    public function store(Request $request, $projects)
    {
        $this->validate(request(), [
            'def_title' => 'required|unique:defect',
            ]);

        $Defect = new Defect();
        $Defect->def_title = $request->def_title;
        $Defect->def_desc = $request->def_desc;
        $Defect->def_status = $request->def_status;
        $Defect->def_severity = $request->def_severity;
        $Defect->def_actual_result = $request->def_actual_result;
        $Defect->def_expected_result = $request->def_expected_result;
        $Defect->def_flow = $request->def_flow;
        if($files=$request->file('def_attachment')){
            $name=$files->getClientOriginalName();
            $files->move('def_attachment', $name);
            $Defect->def_attachment=$name;
        }
        //$Defect->def_attachment = $request->def_attachment;
        $Defect->project_id = $projects;
        $Defect->createdBy = \Auth::user()->id;
       // $Defect->create_date = date('Y-m-d H:i:s');
        //$Defect->update_date = date('Y-m-d H:i:s');
        $Defect->save();


        $message="successfully add!";
        echo "<script type='text/javascript'>alert('$message');</script>";
        return redirect()->route('defect.index', $projects);
    }
    // Display defects' list
    // Hannan 1/12/22

    public function viewList($projects){
        $input =  DB::table('projects')
                ->select('id','proj_name')
                ->where('user_id','=',\Auth::user()->id)
                ->where('id', '=', [$projects]) //mimi tambah
                ->get();

        $data= DB::table('defect')
                    ->join('users','users.id','=','defect.createdBy')
                    ->join('projects', 'projects.id', '=', 'defect.project_id')
                    ->select('defect.*', 'users.name', 'users.role_name')
                    ->where('createdBy','=',\Auth::user()->id)
                    ->where('project_id', '=', [$projects])
                    ->paginate(2);  // for pagination
        return view('defect.index',compact('input', 'data'));
    }

    //Feature Search & Filter Defect list
//by Nik 29/11/2022

public function search(Request $request,$projects){
    $input =  DB::table('projects')
                ->select('id','proj_name')
                ->where('user_id','=',\Auth::user()->id)
                ->where('id', '=', [$projects])
                ->get();

    if($request->def_title == '' && $request->def_severity == '' && $request->def_status == ''){
        $data= DB::table('defect')
                ->join('users','users.id','=','defect.createdBy')
                ->select('defect.*', 'users.name', 'users.role_name')
                ->where('project_id', '=', [$projects]) 
                ->where('createdBy','=',\Auth::user()->id)
                // ->get();
                ->paginate(2);
    } else {
        $data= DB::table('defect')
                ->join('users','users.id','=','defect.createdBy')
                ->select('defect.*', 'users.name', 'users.role_name')
                ->where('project_id', '=', [$projects]) 
                ->where('createdBy','=',\Auth::user()->id);
        if($request->def_title != ''){
            $data   ->where('def_title','LIKE','%'.$request->def_title.'%');        
        }
        if($request->def_severity != ''){
            $data    ->where('def_severity','=',$request->def_severity);
        } 
        if($request->def_status != ''){
            $data->where('def_status','=',$request->def_status);
        }
        $data->paginate(2);
        // $data -> dd();
    }
    return view('defect.index',compact('input', 'data'));
 }

    /**
     * Feature delete defect
    * by Faiq, 4/12/2022
    */
    public function delete($project,$id){
        $deleted = DB::table('defect')->where('def_id', '=', $id)->delete();

        $message="defect successfully deleted!";
        echo "<script type='text/javascript'>alert('$message');</script>";
        return redirect()->route('defect.index',$project);
    }

    public function edit($projects, $id)
    {
         $data= DB::table('defect')
                ->select('defect.*')
                    ->where('def_id','=',$id)
                    ->get();
        return view('defect.edit',compact('data'));
    }

    public function update(Request $request, $projects, $id)
    {
        $data= DB::table('defect')
                    ->where('def_id','=',$id)
                    ->where('project_id', '=', [$projects])
                    ->update([
                        'def_status'=>$request->def_status
                    ]);

        $message="successfully update!";
        echo "<script type='text/javascript'>alert('$message');</script>";
        // call function view list
        return redirect()->route('defect.index', $projects);
        
    }
}
