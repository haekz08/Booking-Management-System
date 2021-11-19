<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ItineraryBrand extends Model
{
    use SoftDeletes;
    protected $fillable=[
        'slug',
        'description',
        'details',
        'color',
        'is_ambassador_required',
        'is_active',
        'created_by',
        'updated_by',
    ];

    protected $hidden=[
        'is_active',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
        'deleted_at',
    ];
    public function brandItineraries(){
        return $this->hasMany(Itinerary::class, 'itinerary_brand_id', 'id')->where('is_displayed',1)->where('is_cancelled',0);
    }
}
