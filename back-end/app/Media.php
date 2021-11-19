<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Media extends Model
{
    use SoftDeletes;
    protected $fillable=[
        'type',
        'extension',
        'batch_code',
        'original_file_name',
        'new_file_name',
        'full_path',
        'is_active',
        'created_by',
        'updated_by'
    ];

    public function boats(){
        return $this->belongsToMany(Boat::class);
    }

    public function boat_cabins(){
        return $this->belongsToMany(BoatCabin::class);
    }
}
