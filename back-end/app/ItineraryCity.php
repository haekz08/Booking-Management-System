<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ItineraryCity extends Model
{
    use SoftDeletes;
    protected $fillable=[
        'name',
        'is_active',
        'created_by',
        'updated_by'
    ];

    public function ports(){
        return $this->hasMany(CityPort::class, 'itinerary_city_id', 'id');
    }
}
