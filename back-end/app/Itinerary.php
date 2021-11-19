<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Log;

class Itinerary extends Model
{
    use SoftDeletes;
    use Logs;
    protected $fillable = [
        'itinerary_brand_id',
        'itinerary_country_id',
        'check_in_date',
        'check_in_time',
        'check_out_date',
        'check_out_time',
        'city_id_from',
        'city_id_to',
        'city_port_id_from',
        'city_port_id_to',
        'is_locked_to_ambassador',
        'ambassador_id',
        'is_referral_active',
        'referral_price',
        'is_early_bird_active',
        'early_bird_cut_off_date',
        'boat_id',
        'is_private_charter_active',
        'private_charter_price',
        'deposit_per_person',
        'is_shared_offered',
        'is_private_offered',
        'is_double_offered',
        'is_displayed',
        'is_cabin_same_price',
        'price_per_person',
        'cabin_price',
        'early_bird_price',
        'cabin_early_bird_price',
        'is_cancelled',
        'is_active',
        'created_by',
        'updated_by',

        'is_cabin_same_price',
        'price_per_person',
        'cabin_price',
        'early_bird_price',
        'cabin_early_bird_price',

        'disclaimer'

    ];

    protected  $appends = [
        'check_in',
        'check_out',
        'data_logs',
        'total_guest_occupancy',
        'total_cabin_occupancy',
        'lowest_price',
        'slot_left',
        'early_bird_validity',
        'twelve_weeks_before',
        'total_booking_balance',
        'details_complete'
    ];
    protected $hidden=[
        'itinerary_brand_id',
        'itinerary_country_id',
        'check_in_date',
        'check_in_time',
        'check_out_date',
        'check_out_time',

        'city_id_from',
        'city_id_to',
        'city_port_id_from',
        'city_port_id_to',

        'is_active',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
        'deleted_at',
        'data_logs'
    ];

    public function getCheckInAttribute(){
        $data = array(
            'default_date' => $this->attributes['check_in_date'],
            'default_time' => $this->attributes['check_in_time'],
            'hh' => Carbon::parse($this->attributes['check_in_time'])->format('g'),
            'mm' => Carbon::parse($this->attributes['check_in_time'])->format('i'),
            'meridian' => Carbon::parse($this->attributes['check_in_time'])->format('A'),
            'other_formats' => array(
                'format_1' => Carbon::parse($this->attributes['check_in_date'])->format('F d, Y'),
                'format_2' => Carbon::parse($this->attributes['check_in_date'])->format('F d, Y').' | '.Carbon::parse($this->attributes['check_in_date'])->format('D').' • '.Carbon::parse($this->attributes['check_in_time'])->format('Hi').' H '.Carbon::parse($this->attributes['check_in_time'])->format('(g:i A)'),
                'format_3' => Carbon::parse($this->attributes['check_in_date'])->format('D').' • '.Carbon::parse($this->attributes['check_in_time'])->format('Hi').' H '.Carbon::parse($this->attributes['check_in_time'])->format('(g:i A)')
            )
        );
        return $data;
    }


    public function getCheckOutAttribute(){
        $data = array(
            'default_date' => $this->attributes['check_out_date'],
            'default_time' => $this->attributes['check_out_time'],
            'hh' => Carbon::parse($this->attributes['check_out_time'])->format('g'),
            'mm' => Carbon::parse($this->attributes['check_out_time'])->format('i'),
            'meridian' => Carbon::parse($this->attributes['check_out_time'])->format('A'),
            'other_formats' => array(
                'format_1' => Carbon::parse($this->attributes['check_out_date'])->format('F d, Y'),
                'format_2' => Carbon::parse($this->attributes['check_out_date'])->format('F d, Y').' | '.Carbon::parse($this->attributes['check_out_date'])->format('D').' • '.Carbon::parse($this->attributes['check_out_time'])->format('Hi').' H '.Carbon::parse($this->attributes['check_out_time'])->format('(g:i A)'),
                'format_3' => Carbon::parse($this->attributes['check_out_date'])->format('D').' • '.Carbon::parse($this->attributes['check_out_time'])->format('Hi').' H '.Carbon::parse($this->attributes['check_out_time'])->format('(g:i A)')
            )
        );
        return $data;
    }
    public function itinerary_brand(){
        return $this->belongsTo(ItineraryBrand::class, 'itinerary_brand_id', 'id');
    }

    public function itinerary_country(){
        return $this->belongsTo(ItineraryCountry::class, 'itinerary_country_id', 'id');
    }

    public function inclusions()
    {
        return $this->belongsToMany(Inclusion::class, 'itinerary_inclusions', 'itinerary_id', 'inclusion_id');
    }

    public function exclusions()
    {
        return $this->belongsToMany(Exclusion::class, 'itinerary_exclusions', 'itinerary_id', 'exclusion_id');
    }

    public function add_ons()
    {
        return $this->hasMany(ItineraryAddOn::class, 'itinerary_id', 'id')->with(['add_on']);
    }

    public function itinerary_cabins(){
        return $this->belongsToMany(BoatCabin::class, 'itinerary_cabins', 'itinerary_id', 'boat_cabin_id')->with('cabin_type')->withPivot('price_per_person', 'cabin_price', 'early_bird_price', 'cabin_early_bird_price', 'ambassador_allocation');
    }

    public function itinerary_crews(){
        return $this->belongsToMany(BoatCrew::class, 'itinerary_crews', 'itinerary_id', 'boat_crew_id')->with(['nationality_details']);
    }

    public function itinerary_city_from(){
        return $this->belongsTo(ItineraryCity::class, 'city_id_from' ,'id');
    }

    public function itinerary_city_to(){
        return $this->belongsTo(ItineraryCity::class, 'city_id_to' ,'id');
    }
    public function port_from(){
        return $this->belongsTo(CityPort::class, 'city_port_id_from' ,'id');
    }

    public function port_to(){
        return $this->belongsTo(CityPort::class, 'city_port_id_to' ,'id');
    }


    public function ambassador_itinerary_codes(){
        return $this->hasMany(AmbassadorItineraryCode::class, 'itinerary_id', 'id');
    }
    public function ambassador(){
        return $this->belongsTo(Ambassador::class, 'ambassador_id' ,'id');
    }

    public function setPrivateCharterPriceAttribute($value)
    {
        if (empty($value)){
            $this->attributes['private_charter_price'] = 0;
        }else{
            $this->attributes['private_charter_price'] = $value;
        }
    }

    public function getIsPrivateCharterActiveAttribute(){
        if($this->attributes['is_private_charter_active'] == 0)
            return "false";
        return "true";
    }

    public function setIsPrivateCharterActiveAttribute($value){
        if($value == "true"){
            $this->attributes['is_private_charter_active'] = 1;
        }else{
            $this->attributes['is_private_charter_active'] = 0;
        }
    }

    public function setIsCabinSamePriceAttribute($value){
        if($value == "true"){
            $this->attributes['is_cabin_same_price'] = 1;
        }else{
            $this->attributes['is_cabin_same_price'] = 0;
        }
    }

    public function getIsCabinSamePriceAttribute()
    {
        if($this->attributes['is_cabin_same_price'] == 0)
            return false;
        return true;
    }

    public function getIsLockedToAmbassadorAttribute(){
        if($this->attributes['is_locked_to_ambassador'] == 0)
            return "false";
        return "true";
    }

    public function setIsLockedToAmbassadorAttribute($value){
        if($value == "true"){
            $this->attributes['is_locked_to_ambassador'] = 1;
        }else{
            $this->attributes['is_locked_to_ambassador'] = 0;
        }
    }
    public function setIsReferralActiveAttribute($value){
        if($value == "true"){
            $this->attributes['is_referral_active'] = 1;
        }else{
            $this->attributes['is_referral_active'] = 0;
        }
    }
    public function getIsReferralActiveAttribute(){
        if($this->attributes['is_referral_active'] == 0)
            return "false";
        return "true";
    }
    public function getIsEarlyBirdActiveAttribute(){
        if($this->attributes['is_early_bird_active'] == 0)
            return false;
        return true;
    }

    public function setIsEarlyBirdActiveAttribute($value){
        if($value == "true"){
            $this->attributes['is_early_bird_active'] = 1;
        }else{
            $this->attributes['is_early_bird_active'] = 0;
        }
    }
    public function getIsDisplayedAttribute(){
        if($this->attributes['is_displayed'] == 0)
            return "false";
        return "true";
    }



//    public function setIsCabinSamePriceAttribute($value){
//        if($value == "true"){
//            $this->attributes['is_displayed'] = 1;
//        }else{
//            $this->attributes['is_displayed'] = 0;
//        }
//    }
//    public function getIsCabinSamePriceAttribute(){
//        if($this->attributes['is_displayed'] == 0)
//            return "false";
//        return "true";
//    }



    public function setIsDisplayedAttribute($value){
        if($value == "true"){
            $this->attributes['is_displayed'] = 1;
        }else{
            $this->attributes['is_displayed'] = 0;
        }
    }
    public function itinerary_boat(){
        return $this->belongsTo(Boat::class, 'boat_id', 'id')->with('boat_type','boat_brand');
    }
    public function itinerary_cabins_for_booking(){
        return $this->hasMany(ItineraryCabin::class, 'itinerary_id', 'id')->with('booking_cabins','cabin_description');
    }

    public function getLowestPriceAttribute(){
        $data = array(
            'price_per_person' => $this->format_amount($this->itinerary_cabins_for_booking->min('price_per_person')),
            'cabin_price' => $this->format_amount($this->itinerary_cabins_for_booking->min('cabin_price')),
            'early_bird_price' => $this->format_amount($this->itinerary_cabins_for_booking->min('early_bird_price')),
            'cabin_early_bird_price' => $this->format_amount($this->itinerary_cabins_for_booking->min('cabin_early_bird_price'))
        );
        return $data;
    }
    public function itinerary_bookings(){
        return $this->hasMany(Booking::class, 'itinerary_id', 'id')->with(['add_ons','guests'=>function($query){
            $query->with(['guest_details'=>function($query){$query->with(['nationality_details','diet_option','gender','country_code','guest_title']);}]);
        }]);
    }
    public function getSlotLeftAttribute(){
        return $this->format_amount($this->itinerary_cabins->sum('occupancy') - $this->itinerary_cabins->sum('pivot.ambassador_allocation') - $this->itinerary_bookings->sum('total_booking_guest_occupancy.default'));
    }
    public function getTotalBookingBalanceAttribute(){
        return $this->format_amount($this->itinerary_bookings->sum('booking_balance.default'));
    }

    public function getDetailsCompleteAttribute(){
        $result = 'NO';
        foreach ($this->itinerary_bookings as $row){

            foreach($row['guests'] as $guest){
                if($guest['guest_details']['details_complete']=='YES')
                    $result = 'YES';
            }
        }
        return $result;
        //return $this->format_amount($this->itinerary_bookings->sum('booking_balance.default'));
    }
    public function getTotalGuestOccupancyAttribute(){
        return $this->format_amount($this->itinerary_bookings->sum('total_booking_guest_occupancy.default'));
    }
    public function getTotalCabinOccupancyAttribute(){
        return $this->format_amount($this->itinerary_cabins->sum('occupancy') - $this->itinerary_cabins->sum('pivot.ambassador_allocation'));
    }
    public function itinerary_ambassador(){
        return $this->belongsTo(Ambassador::class, 'ambassador_id', 'id');
    }
    public function getEarlyBirdValidityAttribute(){
        $date_now = Carbon::now()->format('Y-m-d');
        $early_bird_date = Carbon::parse($this->attributes['early_bird_cut_off_date']);

        if($this->attributes['is_early_bird_active'] == 1 && $early_bird_date->gte($date_now) && !empty($this->attributes['early_bird_cut_off_date'])){
            return "true";
        }else{
            return "false";
        }
    }
    public function itinerary_media(){
        return $this->belongsToMany(Media::class);
    }

    public function getAmbassadorIdAttribute($value){
        if($value == null){
            return -1;
        }else{
            return $value;
        }
    }

    public function setIsSharedOfferedAttribute($value){
        if($value == "true"){
            $this->attributes['is_shared_offered'] = 1;
        }else{
            $this->attributes['is_shared_offered'] = 0;
        }
    }
    public function getIsSharedOfferedAttribute(){
        if($this->attributes['is_shared_offered'] == 0)
            return "false";
        return "true";
    }
    public function setIsPrivateOfferedAttribute($value){
        if($value == "true"){
            $this->attributes['is_private_offered'] = 1;
        }else{
            $this->attributes['is_private_offered'] = 0;
        }
    }
    public function getIsPrivateOfferedAttribute(){
        if($this->attributes['is_private_offered'] == 0)
            return "false";
        return "true";
    }
    public function setIsDoubleOfferedAttribute($value){
        if($value == "true"){
            $this->attributes['is_double_offered'] = 1;
        }else{
            $this->attributes['is_double_offered'] = 0;
        }
    }
    public function getIsDoubleOfferedAttribute(){
        if($this->attributes['is_double_offered'] == 0)
            return "false";
        return "true";
    }
    public function getTwelveWeeksBeforeAttribute()
    {
        $date = Carbon::createFromFormat('Y-m-d', $this->attributes['check_in_date']);
        $twelve_weeks_before = $date->subWeeks(12);
        $twelve_weeks_before->toDateString();
        return $this->format_date($twelve_weeks_before->toDateString());
    }





//    public function itinerary_crews(){
//        return $this->hasMany(ItineraryCrew::class, 'itinerary_id', 'id');
//    }
}