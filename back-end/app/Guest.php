<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Guest extends Model
{
    use SoftDeletes;
    use Logs;
    protected $fillable=[
        'guest_title_id',
        'gender_id',
        'first_name',
        'last_name',
        'middle_name',
        'birth_date',
        'nationality_id',
        'country_code_id',
        'phone_number',
        'email',
        'pob_country',
        'pob_city',
        'current_residency',
        'identification_card_type_id',
        'other_id_type',
        'id_number',
        'passport_number',
        'expiration_date',
        'medical_issues',
        'allergies',
        'diet_option_id',
        'other_concerns',
        'user_id',
        'is_active',
        'created_by',
        'updated_by'
    ];

    protected $hidden=[
        'is_active',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
        'deleted_at',
    ];
    protected $appends=['full_name','details_complete'];
    public function getFullNameAttribute(){
        return $this->attributes['first_name'].' '.$this->attributes['last_name'];
    }
    public function guests_list(){
        return $this->hasMany(Guest::class, 'created_by', 'user_id')->whereNull('user_id');
    }
    public function nationality_details(){
        return $this->belongsTo(Nationality::class, 'nationality_id', 'id');
    }
    public function diet_option(){
        return $this->belongsTo(DietOption::class, 'diet_option_id', 'id');
    }
    public function country_code(){
        return $this->belongsTo(Nationality::class, 'country_code_id', 'id');
    }
    public function guest_title(){
        return $this->belongsTo(GuestTitle::class, 'guest_title_id', 'id');
    }
    public function gender(){
        return $this->belongsTo(Gender::class, 'gender_id', 'id');
    }
    public function getBirthDateAttribute(){
        return $this->format_birth_date($this->attributes['birth_date']);
    }
    public function getPhoneNumberAttribute(){
        return !empty($this->attributes['phone_number']) ? $this->attributes['phone_number'] : '';
    }
    public function getEmailAttribute(){
        return !empty($this->attributes['email']) ? $this->attributes['email'] : '';
    }
    public function getPobCountryAttribute(){
        return !empty($this->attributes['pob_country']) ? $this->attributes['pob_country'] : '';
    }
    public function getPobCityAttribute(){
        return !empty($this->attributes['pob_city']) ? $this->attributes['pob_city'] : '';
    }
    public function getCurrentResidencyAttribute(){
        return !empty($this->attributes['current_residency']) ? $this->attributes['current_residency'] : '';
    }
    public function getPassportNumberAttribute(){
        return !empty($this->attributes['passport_number']) ? $this->attributes['passport_number'] : '';
    }
    public function getExpirationDateAttribute(){
        return !empty($this->attributes['expiration_date']) ? $this->attributes['expiration_date'] : '';
    }
    public function getMedicalIssuesAttribute(){
        return !empty($this->attributes['medical_issues']) ? $this->attributes['medical_issues'] : '';
    }
    public function getAllergiesAttribute(){
        return !empty($this->attributes['allergies']) ? $this->attributes['allergies'] : '';
    }
    public function getDietOptionIdAttribute(){
        return !empty($this->attributes['diet_option_id']) ? $this->attributes['diet_option_id'] : '';
    }
    public function getOtherConcernsAttribute(){
        return !empty($this->attributes['other_concerns']) ? $this->attributes['other_concerns'] : '';
    }
    public function getGenderIdAttribute(){
        return !empty($this->attributes['gender_id']) ? $this->attributes['gender_id'] : '';
    }
    public function getNationalityIdAttribute(){
        return !empty($this->attributes['nationality_id']) ? $this->attributes['nationality_id'] : '';
    }
    public function getCountryCodeIdAttribute(){
        return !empty($this->attributes['country_code_id']) ? $this->attributes['country_code_id'] : '';
    }
    public function getGuestTitleIdAttribute(){
        return !empty($this->attributes['guest_title_id']) ? $this->attributes['guest_title_id'] : '';
    }
    public function setFirstNameAttribute($value){
        $this->attributes['first_name'] =  empty($value) ? '' : $value ;
    }
    public function setLastNameAttribute($value){
        $this->attributes['last_name'] =  empty($value) ? '' : $value ;
    }
    public function setMiddleNameAttribute($value){
        $this->attributes['middle_name'] =  empty($value) ? '' : $value ;
    }
    public function setBirthDateAttribute($value){
        $this->attributes['birth_date'] =  empty($value['default']) ? null : $value['default'] ;
    }
    public function setNationalityIdAttribute($value){
        $this->attributes['nationality_id'] =  empty($value) ? null : $value ;
    }
    public function setCountryCodeIdAttribute($value){
        $this->attributes['country_code_id'] =  empty($value) ? null : $value ;
    }
    public function setPhoneNumberAttribute($value){
        $this->attributes['phone_number'] =  empty($value) ? '' : $value ;
    }
    public function setEmailAttribute($value){
        $this->attributes['email'] =  empty($value) ? '' : $value ;
    }
    public function setPobCountryAttribute($value){
        $this->attributes['pob_country'] =  empty($value) ? '' : $value ;
    }
    public function setPobCityAttribute($value){
        $this->attributes['pob_city'] =  empty($value) ? '' : $value ;
    }
    public function setCurrentResidencyAttribute($value){
        $this->attributes['current_residency'] =  empty($value) ? '' : $value ;
    }
    public function setPassportNumberAttribute($value){
        $this->attributes['passport_number'] =  empty($value) ? '' : $value ;
    }
    public function setExpirationDateAttribute($value){
        $this->attributes['expiration_date'] =  empty($value) ? '' : $value ;
    }
    public function setIdentificationCardTypeIdAttribute($value){
        $this->attributes['identification_card_type_id'] =  empty($value) ? null : $value ;
    }
    public function setOtherTypeIdAttribute($value){
        $this->attributes['other_id_type'] =  empty($value) ? '' : $value ;
    }
    public function setIdNumberAttribute($value){
        $this->attributes['id_number'] =  empty($value) ? '' : $value ;
    }
    public function setMedicalIssuesAttribute($value){
        $this->attributes['medical_issues'] =  empty($value) ? '' : $value ;
    }
    public function setAllergiesAttribute($value){
        $this->attributes['allergies'] =  empty($value) ? '' : $value ;
    }
    public function setDietOptionIdAttribute($value){
        $this->attributes['diet_option_id'] =  empty($value) ? '' : $value ;
    }
    public function setGenderIdAttribute($value){
        $this->attributes['gender_id'] =  empty($value) ? '' : $value ;
    }
    public function setOtherConcernsAttribute($value){
        $this->attributes['other_concerns'] =  empty($value) ? '' : $value ;
    }
    public function getDetailsCompleteAttribute(){
        if(empty($this->attributes['guest_title_id'])
            || empty($this->attributes['gender_id'])
            || empty($this->attributes['first_name'])
            || empty($this->attributes['last_name'])
            || empty($this->attributes['birth_date'])
            || empty($this->attributes['nationality_id'])
            || empty($this->attributes['country_code_id'])
            || empty($this->attributes['phone_number'])
            || empty($this->attributes['email'])
            || empty($this->attributes['pob_country'])
            || empty($this->attributes['pob_city'])
            || empty($this->attributes['current_residency'])
            || empty($this->attributes['passport_number'])
            || empty($this->attributes['expiration_date'])
            || empty($this->attributes['medical_issues'])
            || empty($this->attributes['allergies'])
            || empty($this->attributes['diet_option_id'])
            || empty($this->attributes['other_concerns']))
            return 'NO';
        return 'YES';
    }
}
