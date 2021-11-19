<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Booking extends Model
{
    use SoftDeletes;
    use Logs;
    protected $fillable=[
        'reference_code_char',
        'reference_code',
        'itinerary_id',
        'user_id',
        'is_early_bird',
        'lead_source_id',
        'ambassador_itinerary_code_id',
        'payment_reminder_sent',
        'is_active',
        'admin_booking',
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
    protected $appends = ['data_logs','total_payment','booking_balance','total_booking_guest_occupancy'];
    public function guests(){
        return $this->hasMany(BookingCabin::class, 'booking_id', 'id')->with(['guest_cabin_details']);
    }
    public function itinerary_details(){
        return $this->belongsTo(Itinerary::class, 'itinerary_id', 'id');
    }
    public function add_ons(){
        return $this->hasMany(BookingAddOn::class, 'booking_id', 'id')->with(['details']);
    }
    public function user(){
        return $this->belongsTo(User::class, 'user_id', 'id');
    }
    public function active_invoice(){
        return $this->hasOne(BookingInvoice::class, 'booking_id', 'id')->where('is_active',1);
    }
    public function other_invoices(){
        return $this->hasMany(BookingInvoice::class, 'booking_id', 'id')->where('is_active',0);
    }
    public function invoices(){
        return $this->hasMany(BookingInvoice::class, 'booking_id', 'id');
    }
    public function getTotalPaymentAttribute(){
        return $this->format_amount($this->invoices->sum('total_payment.default'));
    }
    public function getBookingBalanceAttribute(){
        return $this->active_invoice->invoice_balance;
    }
    public function getTotalBookingGuestOccupancyAttribute(){
        return $this->format_amount($this->guests->sum('occupancy'));
    }
}
