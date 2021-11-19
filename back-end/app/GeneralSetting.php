<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class GeneralSetting extends Model
{
    protected $fillable = [
        'currency',
        'paypal_sdk_url',
        'google_analytics'
    ];
}
