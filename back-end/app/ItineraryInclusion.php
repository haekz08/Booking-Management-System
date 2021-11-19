<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ItineraryInclusion extends Model
{
    use SoftDeletes;
    protected $fillable=[
        'itinerary_id',
        'inclusion_id',
    ];
}
