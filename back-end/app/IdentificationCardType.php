<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class IdentificationCardType extends Model
{
    use SoftDeletes;
    protected $fillable=[
        'name',
        'is_active',
        'created_by',
        'updated_by',
    ];
}
