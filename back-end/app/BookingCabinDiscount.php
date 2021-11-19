<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class BookingCabinDiscount extends Model
{
    use SoftDeletes;
    protected $fillable=[
        'booking_cabin_id',
        'discount_description',
        'qty',
        'amount',
        'total',
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
}
