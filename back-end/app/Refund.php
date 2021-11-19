<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Refund extends Model
{
    protected $fillable=[
        'booking_id',
        'description',
        'refund_type_id',
        'status_id',
        'approved_by',
        'created_by',
        'updated_by'
    ];

    protected $appends=['status'];

    public function booking(){
        return $this->belongsTo(Booking::class, 'booking_id','id');
    }

    public function refund_details(){
        return $this->hasMany(RefundDetail::class, 'refund_id', 'id');
    }

    public function getStatusAttribute(){
        if($this->attributes['status_id'] == 0){
            return "Pending";
        }else if($this->attributes['status_id'] == 1) {
            return "Approved";
        }
    }
}
