<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class LeadSource extends Model
{
    use SoftDeletes;
    protected $fillable = [
        'description',
        'is_active',
        'created_by',
        'updated_by'
    ];
}
