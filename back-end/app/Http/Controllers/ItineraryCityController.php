<?php

namespace App\Http\Controllers;

use App\CityPort;
use App\Http\Services\RolePermissions;
use App\ItineraryCity;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ItineraryCityController extends Controller
{
    protected $model;
    protected $role_permission_svc;
    protected $request;
    protected $search='';
    protected $per_page;
    protected $sort_by='description';
    protected $sort_dir = 'asc';

    public function __construct(Request $request)
    {
        $this->request = $request;
        $this->per_page = isset($request->per_page) ? $request->per_page : $this->per_page;
        $this->search = isset($request->search) ? $request->search : $this->search;
        $this->sort_by = isset($request->sort_by) ? $request->sort_by : $this->sort_by;
        $this->sort_dir = isset($request->sort_dir) ? $request->sort_dir : $this->sort_dir;
        $this->model = new ItineraryCity();
        $this->role_permission_svc = new RolePermissions();
    }
    public function getUserId(){
        return Auth::id();
    }

    public function getAll(){
        if(!$this->role_permission_svc->itineraryCityRead())
            return response('Authorization Required',401);

        if(isset($this->request->per_page))
        {
            $data = ItineraryCity::with('ports')
                ->where('name', 'like', '%'.$this->search.'%')
                ->when(is_numeric($this->search) == true, function($query){
                    $query->orWhereHas('ports', function($query){
                        $query->havingRaw('COUNT(id) = ?', array($this->search));
                    });
                })
                ->paginate($this->per_page);
        }else
        {
            $data = ItineraryCity::all();
        }
        return response($data);
    }

    public function save(){

        if (!$this->role_permission_svc->itineraryCityAdd())
            return response('Authorization Required', 401);

        $itinerary_data = [
            'name' => $this->request->name,
            'updated_by' => $this->getUserId(),
            'created_by' => $this->getUserId()
        ];

        if(isset($this->request->id) && $this->request->id != -1){
            unset($itinerary_data['created_by']);
        }

        $itinerary = ItineraryCity::updateOrCreate(['id' => $this->request->id],$itinerary_data);
        foreach($this->request->ports as $port){
            if($port['is_removed'] == 0){
                $port_data = [
                    'itinerary_city_id' => $itinerary->id,
                    'name' => $port['name'],
                    'created_by' => $this->getUserId(),
                    'updated_by' => $this->getUserId()
                ];
                if($port['id'] != -1){
                    unset($port_data['created_by']);
                }
               CityPort::updateOrCreate(['id' => $port['id']], $port_data);
            }else{
                $city_port = CityPort::find($port['id']);
                if (!empty($city_port))
                    $city_port->delete();
            }
        }


        $result = ItineraryCity::with('ports')->whereId($itinerary->id)->first();
        return response($result);
    }

    public function delete(){
        $itinerary_city = ItineraryCity::find($this->request->id);
        $itinerary_city->updated_by = $this->getUserId();
        $itinerary_city->save();
        $itinerary_city->delete();

        return response($itinerary_city);
    }
}
