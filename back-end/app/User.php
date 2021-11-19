<?php

namespace App;

use Laravel\Passport\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Contracts\Auth\CanResetPassword;
use Illuminate\Foundation\Auth\User as Authenticatable;
use App\Role;

class User extends Authenticatable
{
    use HasApiTokens, Notifiable;
    protected $fillable = [
        'image',
        'thumbnail',
        'last_name',
        'first_name',
        'middle_name',
        'default',
        'is_active',
        'email',
        'password',
        'role_id'
    ];

    protected $hidden=[
        'password',
        'remember_token',
        'is_active',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
        'deleted_at',
        'email_verified_at',
        'role_id',
        'default'
    ];
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
    protected $appends = ['full_name'];



    public function role(){
        return $this->belongsTo(Role::class, 'role_id', 'id');
    }

    public function getFullNameAttribute(){
        return $this->attributes['first_name'].' '.$this->attributes['last_name'];
    }
    public function guest_lists(){
        return $this->hasMany(Guest::class, 'created_by', 'id');
    }
}
