<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class AddOn extends Model
{
    use SoftDeletes;
    protected $fillable = [
        'description',
        'details',
        'price',
        'is_default_offered',
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

    public function itineraries()
    {
        return $this->belongsToMany(Itinerary::class, 'itinerary_add_ons', 'add_on_id','itinerary_id');
    }
}
