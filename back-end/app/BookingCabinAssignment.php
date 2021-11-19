<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class BookingCabinAssignment extends Model
{
    use SoftDeletes;
    use Logs;
    protected $fillable=[
        'booking_cabin_id',
        'itinerary_cabin_id',
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
