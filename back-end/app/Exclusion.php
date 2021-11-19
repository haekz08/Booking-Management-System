<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Exclusion extends Model
{
    use SoftDeletes;
    protected $fillable=[
        'description',
        'details',
        'is_default_checked',
        'is_active',
        'created_by',
        'updated_by'
    ];
    protected $hidden=[
        'is_active',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    public function itineraries(){
        return $this->belongsToMany(Itinerary::class, 'itinerary_exclusions', 'exclusion_id', 'itinerary_id');
    }
}
