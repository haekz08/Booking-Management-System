<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ItineraryCrew extends Model
{
    use SoftDeletes;
    protected $fillable=[
        'itinerary_id',
        'crew_type_id',
        'boat_crew_id',
    ];
}
