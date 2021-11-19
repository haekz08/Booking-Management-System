<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Route extends Model
{
    use SoftDeletes;
    protected $fillable = [
        'path',
        'redirect',
        'name',
        'component',
        'parent_id',
        'props',
        'created_by',
        'updated_by'
    ];

    protected $appends=[
        'is_removed'
    ];

    protected $hidden=[
        'routes',
        'is_active',
        'created_by',
        'updated_by',
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    public function parent(){
        return $this->belongsTo(Route::class, 'parent_id','id');
    }

    public function roles(){
        return $this->belongsToMany(Role::class);
    }

    public function children(){
        return $this->hasMany(Route::class,'parent_id','id')->with('children','route_metas');
    }

    public function route_metas(){
        return $this->hasMany(RouteMeta::class,'route_id','id');
    }

    public function getIsRemovedAttribute(){
        return 0;
    }

//    public function getMetaAttribute(){
//        $meta=[];
//        foreach($this->route_metas as $row){
//
//            $meta[$row['name']] = $row['value']=="true" || $row['value']=="false" ? (bool)$row['value'] : $row['value'];
//        }
//        return $meta;
//    }
//
//    public function getRouteMetasAttribute(){
//        return $this->route_metas;
//    }
}
