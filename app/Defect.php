<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Defect extends Model
{
    protected $table = 'defect';

    protected $fillable = [
        'def_id',
        'def_title',
        'def_desc',
        'def_status',
        'def_severity',
        'def_actual_result',
        'def_expected_result',
        'def_flow',
        'def_attachment',
        'project_id',
        'user_id',
        'create_date',
        'update_date',
    ];
}
