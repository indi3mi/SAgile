<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Forum extends Model
{
    protected $table = 'Forum';

    protected $fillable = ['forumID','forumTitle', 'forumDesc','updated_at','created_at','createdBy','thread_parent'];

}
