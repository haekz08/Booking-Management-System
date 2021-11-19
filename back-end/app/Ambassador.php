<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Ambassador extends Model
{
    use SoftDeletes;
    use Logs;
    protected $fillable=[
        'guest_title_id',
        'instructor_profile',
        'first_name',
        'last_name',
        'middle_name',
        'birth_date',
        'nationality_id',
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
        'is_active',
        'created_by',
        'updated_by',
    ];

    protected $appends=['full_name'];

    public function getFullNameAttribute(){
        return $this->attributes['first_name'].' '.$this->attributes['last_name'];
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
    public function getDietAttribute(){
        return !empty($this->attributes['diet']) ? $this->attributes['diet'] : '';
    }
    public function getNationalityIdAttribute(){
        return !empty($this->attributes['nationality_id']) ? $this->attributes['nationality_id'] : '';
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
    public function setExpirationDateAttribute($value)
    {
        $this->attributes['expiration_date'] = empty($value) ? '' : $value;
    }
    public function ambassador_media(){
        return $this->belongsToMany(Media::class);
    }
}
