<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class BoatCabin extends Model
{
    use SoftDeletes;
    protected $fillable = [
        'boat_id',
        'cabin_type_id',
        'code',
        'cabin_description',
        'occupancy',
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
    protected $appends = [
        'is_deleted'
    ];

    public function cabin_media()
    {
        return $this->belongsToMany(Media::class);
    }

    public function cabin_type()
    {
        return $this->belongsTo(CabinType::class, 'cabin_type_id', 'id');
    }

    public function itineraries()
    {
        return $this->belongsToMany(Itinerary::class, 'itinerary_cabins', 'boat_cabin_id', 'itinerary_id');
    }

    public function getIsDeletedAttribute()
    {
        return 0;
    }
//    public function setCabinDescriptionAttribute($value){
//        if($value == ""){
//            $this->attributes['cabin_description'] = '';
//        }else{
//            $this->attributes['cabin_description'] = $this->attributes['cabin_description'];
//        }
//    }
}
