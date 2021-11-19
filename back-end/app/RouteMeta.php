<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class RouteMeta extends Model
{
    use SoftDeletes;
    protected $fillable = [
        'route_id',
        'name',
        'value',
        'created_by',
        'updated_by'
    ];

    protected $appends = [
        'is_removed'
    ];

    public function getIsRemovedAttribute(){
        if($this->attributes['deleted_at'] == null)
            return 0;
        return 1;
    }
}
