<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Nationality extends Model
{
    use SoftDeletes;
    protected $fillable=[
        'description',
        'country_code',
        'is_preferred',
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
}
