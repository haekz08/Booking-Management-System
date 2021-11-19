<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class RefundDetail extends Model
{
    protected $fillable = [
        'refund_id',
        'booking_cabin_id',
        'amount_refunded'
    ];

    public function refund(){
        return $this->belongsTo(Refund::class, 'refund_id','id');
    }

    public function booking_cabin(){
        return $this->belongsTo(BookingCabin::class, 'booking_cabin_id','id');
    }
}
