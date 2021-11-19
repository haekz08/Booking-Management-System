<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Boat extends Model
{
    use SoftDeletes;
    protected $fillable=[
        'boat_type_id',
        'boat_brand_id',
        'boat_model_id',
        'name',
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

    protected $appends=['total_occupancy'];

    public function boat_type(){
        return $this->belongsTo(BoatType::class ,'boat_type_id', 'id');
    }

    public function boat_brand(){
        return $this->belongsTo(BoatBrand::class, 'boat_brand_id','id');
    }

    public function boat_media(){
        return $this->belongsToMany(Media::class);
    }

    public function boat_model(){
        return $this->belongsTo(BoatModel::class, 'boat_model_id', 'id');
    }

    public function boat_cabins(){
        return $this->hasMany(BoatCabin::class, 'boat_id', 'id')->where('deleted_at', '=' , null);
    }

    public function getTotalOccupancyAttribute(){
        return $this->boat_cabins->where('is_deleted', '=', 0)->sum('occupancy');
    }
}
