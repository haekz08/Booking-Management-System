<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class BookingReferral extends Model
{
    use SoftDeletes;
    protected $fillable=[
        'referrer_id',
        'referred_id',
        'discount',
        'is_applied',
        'is_active',
        'created_by',
        'updated_by',
    ];
}
