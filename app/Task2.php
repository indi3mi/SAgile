<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Task2 extends Model
{
    protected $table = 'task';

    protected $fillable = [
        'taskID',
        'projectID',
        'userID',
        'taskDesc',
        'status',
        'created_at',
        'updated_at'
        
    ];
}
