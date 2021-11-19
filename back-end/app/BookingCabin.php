<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class BookingCabin extends Model
{
    use SoftDeletes;
    use Logs;
    protected $fillable=[
        'booking_id',
        'guest_id',
        'itinerary_cabin_id',
        'original_itinerary_cabin_id',
        'occupancy',
        'is_cabin_occupied',
        'price_per_person',
        'cabin_price',
        'early_bird_price',
        'cabin_early_bird_price',
        'total_amount_due',
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
    protected $appends = ['total_discount'];
    public function guest_details(){
        return $this->belongsTo(Guest::class, 'guest_id', 'id');
    }
    public function guest_cabin_details(){
        return $this->belongsTo(ItineraryCabin::class, 'itinerary_cabin_id', 'id');
    }
    public function setEarlyBirdPriceAttribute($value){
        $this->attributes['early_bird_price'] =  empty($value) ? '0' : $value ;
    }
    public function setCabinEarlyBirdPriceAttribute($value){
        $this->attributes['cabin_early_bird_price'] =  empty($value) ? '0' : $value ;
    }
    public function discounts(){
        return $this->hasMany(BookingCabinDiscount::class, 'booking_cabin_id', 'id');
    }
    public function getTotalDiscountAttribute(){
        return $this->format_amount($this->discounts->sum('total'));
    }
}
