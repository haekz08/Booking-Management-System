<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ItineraryExclusion extends Model
{
    use SoftDeletes;
    protected $fillable=[
        'itinerary_id',
        'exclusion_id',
    ];
}
