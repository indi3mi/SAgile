<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    protected $fillable = ['user_id','proj_name','proj_desc','start_date','end_date', 'ProjectManager','ScrumMaster','SystemAnalyst','ChiefProgrammer','Programmer','SoftwareTester','User', 'status_project'];

    //public $foreignKey = 'user_id';
     
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}


