<?php


namespace App;

use Illuminate\Database\Eloquent\Model;

class Booking extends Model
{
    protected $fillable = [
        'title',
        'start_date',
        'end_date',
    ];
}