<?php

namespace App\Http\Controllers;

use App\GeneralSetting;
use Illuminate\Http\Request;

class GeneralSettingController extends Controller
{
    protected $request;
    protected $search = '';
    protected $per_page;
    protected $sort_by = 'name';
    protected $sort_dir = 'asc';

    public function __construct(Request $request)
    {
        $this->request = $request;
        $this->per_page = isset($request->per_page) ? $request->per_page : $this->per_page;
        $this->search = isset($request->search) ? $request->search : $this->search;
        $this->sort_by = isset($request->sort_by) ? $request->sort_by : $this->sort_by;
        $this->sort_dir = isset($request->sort_dir) ? $request->sort_dir : $this->sort_dir;
    }

    public function save(){
        $site_setting = GeneralSetting::updateOrCreate(['id' => $this->request->id], $this->request->toArray());
        return response($site_setting);
    }

    public function get(){
        $site_setting = GeneralSetting::whereId(1)->first();
        return response($site_setting);
    }
}
