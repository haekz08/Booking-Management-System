<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class BookingInvoice extends Model
{
    use SoftDeletes;
    use Logs;
    protected $fillable=[
        'invoice_number',
        'booking_id',
        'sub_total',
        'discount',
        'grand_total',
        'deposit_amount_due',
        'payment_terms',
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
        'updated_by_user'
    ];
    protected $appends = ['data_logs','invoice_balance','total_payment'];
    public function payments(){
        return $this->hasMany(BookingInvoicePayment::class, 'booking_invoice_id', 'id');
    }
    public function getSubTotalAttribute(){
        return $this->format_amount($this->attributes['sub_total']);
    }
    public function getGrandTotalAttribute(){
        return $this->format_amount($this->attributes['grand_total']);
    }
    public function getDepositAmountDueAttribute(){
        return $this->format_amount($this->attributes['deposit_amount_due']);
    }
    public function getDiscountAttribute(){
        return $this->format_amount($this->attributes['discount']);
    }
    public function getTotalPaymentAttribute(){
        return $this->format_amount($this->payments->sum('amount_paid.default'));
    }
    public function getInvoiceBalanceAttribute(){
        $amount_paid = $this->payments->sum('amount_paid.default');
        $invoice_balance = $this->attributes['sub_total'] - $amount_paid;
        return $this->format_amount($invoice_balance);
    }
}
