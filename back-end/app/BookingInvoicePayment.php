<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class BookingInvoicePayment extends Model
{
    use SoftDeletes;
    use Logs;
    protected $fillable=[
        'booking_invoice_id',
        'invoice_payment_number',
        'payment_type_id',
        'paypal_response',
        'amount_paid',
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
        'created_by_user',
        'updated_by_user',
        'paypal_response'
    ];
    protected $appends = ['data_logs'];

    public function getAmountPaidAttribute(){
        return $this->format_amount($this->attributes['amount_paid']);
    }
    public function payment_type(){
        return $this->belongsTo(PaymentType::class, 'payment_type_id', 'id');
    }
}
