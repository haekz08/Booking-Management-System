<?php

namespace App\Http\Controllers;

use App\Boat;
use App\BoatBrand;
use App\BoatCabin;
use App\BoatModel;
use App\BoatType;
use App\CabinType;
use App\Http\Services\RolePermissions;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class BoatController extends Controller
{
    protected $model;
    protected $request;
    protected $search = '';
    protected $per_page;
    protected $sort_by = 'name';
    protected $sort_dir = 'asc';
    protected $role_permission_svc;

    public function __construct(Request $request)
    {
        $this->request = $request;
        $this->per_page = isset($request->per_page) ? $request->per_page : $this->per_page;
        $this->search = isset($request->search) ? $request->search : $this->search;
        $this->sort_by = isset($request->sort_by) ? $request->sort_by : $this->sort_by;
        $this->sort_dir = isset($request->sort_dir) ? $request->sort_dir : $this->sort_dir;
        $this->model = new Boat();
        $this->role_permission_svc = new RolePermissions();
    }

    public function getUserId()
    {
        return Auth::id();
    }

    public function getAll()
    {
        if (!$this->role_permission_svc->boatRead())
            return response('Authorization Required', 401);

        if (isset($this->request->per_page)) {
            $data = Boat::with(['boat_type', 'boat_brand', 'boat_model', 'boat_cabins' => function($query){
                $query->with('cabin_media');
            }, 'boat_media'])
                ->where('name', 'like', '%' . $this->search . '%')
                ->orWhereHas('boat_type', function($query){
                    $query->where('name', 'like', '%' . $this->search . '%');
                })
                ->orWhereHas('boat_brand', function($query){
                    $query->where('name', 'like', '%' . $this->search . '%');
                })
                ->orWhereHas('boat_model', function($query){
                    $query->where('name', 'like', '%' . $this->search . '%');
                })
                ->paginate($this->per_page);
        } else {
            $data = Boat::all();
        }
        return response($data);
    }

    public function getBoatSetupOptions()
    {
        if (!$this->role_permission_svc->boatRead())
            return response('Authorization Required', 401);

        $boat_types = BoatType::all();
        $boat_brands = BoatBrand::all();
        $boat_models = BoatModel::all();
        $cabin_types = CabinType::all();

        return response([
            'boat_types' => $boat_types,
            'boat_brands' => $boat_brands,
            'boat_models' => $boat_models,
            'cabin_types' => $cabin_types
        ]);
    }

    public function save()
    {

        if (!$this->role_permission_svc->boatAdd())
            return response('Authorization Required', 401);

        $boat_data = [
            'boat_type_id' => $this->request->boat_type_id,
            'boat_brand_id' => $this->request->boat_brand_id,
            'boat_model_id' => $this->request->boat_model_id,
            'name' => $this->request->name,
            'created_by' => $this->getUserId(),
            'updated_by' => $this->getUserId()
        ];
        $boat = Boat::updateOrCreate(
            ['id' => $this->request->id], $boat_data
        );

        $media_ids = collect($this->request->boat_media)->pluck('id')->toArray();
        $boat->boat_media()->sync($media_ids);

        foreach ($this->request->boat_cabins as $cabin) {
            if ($cabin['is_deleted'] == 0) {

                $result = BoatCabin::updateOrCreate(['id' => $cabin['id']], [
                    'boat_id' => $boat->id,
                    'cabin_type_id' => $cabin['cabin_type_id'],
                    'code' => $cabin['code'],
                    'cabin_description' => $cabin['cabin_description'],
                    'occupancy' => $cabin['occupancy'],
                    'created_by' => $this->getUserId(),
                    'updated_by' => $this->getUserId()
                ]);
                $cabin_media_ids = collect($cabin['cabin_media'])->pluck('id')->toArray();
                $result->cabin_media()->sync($cabin_media_ids);
            } else {
                $cabin = BoatCabin::find($cabin['id']);
                if (!empty($cabin))
                    $cabin->delete();
            }
        }

        $result = Boat::with(['boat_type', 'boat_brand', 'boat_model', 'boat_cabins' => function($query){
            $query->with('cabin_media');
        }, 'boat_media'])->whereId($boat->id)->first();
        return response($result);
    }

    public function delete()
    {
        if (!$this->role_permission_svc->boatDelete())
            return response('Authorization Required', 401);

        $data = $this->request->all();
        $boat = Boat::find($data['id']);
        $boat->updated_by = $this->getUserId();
        $boat->save();
        $boat->delete();
        return response($this->request);
    }
}
