<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Notification extends Model
{
    protected $table = 'notifications';

    protected $fillable = ['id','type', 'notifiable_id','notifiable_type','data','read_at', 'created_at'];

}