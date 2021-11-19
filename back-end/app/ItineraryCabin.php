<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class ItineraryCabin extends Model
{
    protected $fillable=[
        'boat_cabin_id',
        'itinerary_id',
        'ambassador_allocation',
        'price_per_person',
        'cabin_price',
        'early_bird_price',
        'cabin_early_bird_price'
    ];
    protected  $appends = [
        'slot_left',
        'price_pp',
        'price_cbn'
    ];
    public function booking_cabins(){
        return $this->hasMany(BookingCabin::class, 'itinerary_cabin_id', 'id');
    }
    public function cabin_description(){
        return $this->belongsTo(BoatCabin::class, 'boat_cabin_id', 'id')->with('cabin_type');
    }
    public function getSlotLeftAttribute(){
        $availability = $this->cabin_description->occupancy - $this->booking_cabins->sum('occupancy') - $this->ambassador_allocation;
        return $availability;
    }
    public function setAmbassadorAllocationAttribute($value){
        $this->attributes['ambassador_allocation'] =  empty($value) ? '0' : $value ;
    }
    public function getPricePpAttribute(){
        return $this->price_per_person;
    }
    public function getPriceCbnAttribute(){
        return $this->cabin_price;
    }
}
