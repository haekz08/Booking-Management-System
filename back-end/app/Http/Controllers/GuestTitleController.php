<?php

namespace App\Http\Controllers;

use App\GuestTitle;
use App\Http\Services\RolePermissions;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class GuestTitleController extends Controller
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
        $this->model = new GuestTitle();
        $this->role_permission_svc = new RolePermissions();
    }
    public function getUserId(){
        return Auth::id();
    }
    public function getAll(){
        if(!$this->role_permission_svc->superAdminRestriction())
            return response('Authorization Required',401);

        if(isset($this->request->per_page))
        {
            $data = GuestTitle::where('description', 'like', '%'.$this->search.'%')->paginate($this->per_page);
        }else
        {
            $data = GuestTitle::all();
        }
        return response($data);
    }
    public function save(){
        if(!$this->role_permission_svc->superAdminRestriction())
            return response('Authorization Required',401);
        $data = $this->request->all();
        if (isset($data['id']) && $data['id'] != -1) {
            $data['updated_by'] = $this->getUserId();
        } else {
            $data['created_by'] = $this->getUserId();
            $data['updated_by'] = $this->getUserId();
        }
        $result = GuestTitle::updateOrCreate(['id'=>$data['id']],$data);
        return empty($result) ? response('Internal Server Error',500) : response(GuestTitle::whereId($result->id)->first());
    }
    public function delete(){
        if(!$this->role_permission_svc->superAdminRestriction())
            return response('Authorization Required',401);
        $data = $this->request->all();
        $result = GuestTitle::find( $data['id'] );
        $result->updated_by = $this->getUserId();
        $result->save();
        $result->delete();
        return empty($result) ? response('Internal Server Error',500) : response('Successfully Deleted Record',200);
    }
}
