<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Country extends Model
{
    protected $table = 'countries';
    
    protected $fillable = [
        'name',
        'short_code',
    ];
}
