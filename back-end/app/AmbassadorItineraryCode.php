<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class AmbassadorItineraryCode extends Model
{
    use SoftDeletes;
    protected $fillable=[
        'itinerary_id',
        'ambassador_id',
        'code',
        'discount_amount',
        'is_active',
        'created_by',
        'updated_by',
    ];

    protected $appends=[
        'is_removed',
    ];

    public function getIsRemovedAttribute(){
        return 0;
    }

    public function getIsActiveAttribute(){
        if($this->attributes['is_active'] == 1)
            return true;
        return false;
    }

    public function setIsActiveAttribute($value){
        if($value == "true"){
            $this->attributes['is_active'] = 1;
        }else{
            $this->attributes['is_active'] = 0;
        }
    }

}
