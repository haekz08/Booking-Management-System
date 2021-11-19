<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ItineraryCountry extends Model
{
    use SoftDeletes;
    protected $fillable=[
        'slug',
        'name',
        'is_displayed',
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
    public function countryItineraries(){
        return $this->hasMany(Itinerary::class, 'itinerary_country_id', 'id')->where('is_displayed',1)->where('is_cancelled',0);
    }

    public function getIsDisplayedAttribute(){
        if($this->attributes['is_displayed'] == 0)
            return "false";
        return "true";
    }

    public function setIsDisplayedAttribute($value){
        if($value == "true"){
            $this->attributes['is_displayed'] = 1;
        }else{
            $this->attributes['is_displayed'] = 0;
        }
    }
    public function itinerary_country_media(){
        return $this->belongsToMany(Media::class);
    }
}
