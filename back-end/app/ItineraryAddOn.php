<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ItineraryAddOn extends Model
{
    protected $fillable=[
        'itinerary_id',
        'add_on_id',
        'price',
        'available_qty',
    ];
    protected  $appends = [
        'remaining_balance',
    ];
    public function add_on(){
        return $this->belongsTo(AddOn::class, 'add_on_id' ,'id');
    }
    public function getRemainingBalanceAttribute(){
        return $this->attributes['available_qty'];
    }
}
