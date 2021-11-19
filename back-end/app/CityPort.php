<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CityPort extends Model
{
   use SoftDeletes;
   protected $fillable=[
       'itinerary_city_id',
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

   protected $appends=['is_removed'];

   public function getIsRemovedAttribute(){
       return 0;
   }
}
