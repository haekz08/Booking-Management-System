<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CrewType extends Model
{
    use SoftDeletes;
    protected $fillable=[
        'description',
        'is_active',
        'created_by',
        'updated_by'
    ];

    public function boat_crews(){
        return $this->hasMany(BoatCrew::class, 'crew_type_id', 'id');
    }
}
