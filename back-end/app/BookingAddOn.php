<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class BookingAddOn extends Model
{
    use SoftDeletes;
    protected $fillable=[
        'booking_id',
        'add_on_id',
        'price',
        'qty',
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
    public function details(){
        return $this->belongsTo(AddOn::class, 'add_on_id', 'id');
    }
}
