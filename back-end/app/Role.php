<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    protected $fillable = [
        'name'
    ];

    protected $hidden=[
        'routes',
        'is_active',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
        'deleted_at',
    ];
    public function role_routes(){
        return $this->belongsToMany(Route::class);
    }
}
