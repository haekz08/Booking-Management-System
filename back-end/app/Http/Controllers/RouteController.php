<?php

namespace App\Http\Controllers;

use App\Route;
use App\RouteMeta;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class RouteController extends Controller
{
    protected $model;
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
        $this->model = new Route();
    }

    public function getAll()
    {
        if (isset($this->request->per_page)) {
            $data = Route::with(['parent', 'route_metas', 'children' => function ($query) {
                $query->with(['parent' => function ($query) {
                    $query->with(['children' => function ($query) {
                        $query->with('parent');
                    }]);
                }]);
            }])
                ->where('parent_id', '=', -1)
                ->where('name', 'like', '%' . $this->search . '%')->paginate($this->per_page);
        } else {
            $data = Route::all();
        }
        return response($data);
    }

    public function saveRoute()
    {
        $parent_data = [
            'path' => $this->request->path,
            'redirect' => isset($this->request->redirect) ? $this->request->redirect : '',
            'name' => $this->request->name,
            'component' => $this->request->component,
            'created_by' => Auth::id(),
            'updated_by' => Auth::id()
        ];
        if (isset($this->request->id) && $this->request->id != -1) {
            unset($parent_data['created_by']);
        }

        $route = Route::updateOrCreate(['id' => $this->request->id], $parent_data);

        foreach ($this->request->children as $row_child) {
            if ($row_child['is_removed'] == 0) {
                $row_child['redirect'] = isset($row_child['redirect']) ? $row_child['redirect'] : '';
                if (isset($row_child['id']) && $row_child['id'] != -1) {
                    $row_child['updated_by'] = Auth::id();
                } else {
                    $row_child['parent_id'] = $route->id;
                    $row_child['created_by'] = Auth::id();
                    $row_child['updated_by'] = Auth::id();
                }
                Route::updateOrCreate(['id' => $row_child['id']], $row_child);
            } else {
                $child = Route::with('children')->whereId($row_child['id'])->first();
                if(!empty($child)){
                    $child->updated_by = Auth::id();
                    $child->save();
                    $child->delete();
                    $this->recursion($child);
                }
            }
        }

        foreach ($this->request->route_metas as $row_meta) {
            if ($row_meta['is_removed'] == 0) {
                if (isset($row_meta['id']) && $row_meta['id'] != -1) {
                    $row_meta['updated_by'] = Auth::id();
                } else {
                    $row_meta['route_id'] = $route->id;
                    $row_meta['updated_by'] = Auth::id();
                    $row_meta['created_by'] = Auth::id();
                }
                RouteMeta::updateOrCreate(['id' => $row_meta['id']], $row_meta);
            } else {
                $meta = RouteMeta::whereId($row_meta['id'])->first();
                if (!empty($meta)){
                    $meta->updated_by = Auth::id();
                    $meta->save();
                    $meta->delete();
                }
            }
        }

        $return_data = Route::with('route_metas', 'children')->whereId($route->id)->first();
        return response($return_data);
    }

    private function recursion($child)
    {
        foreach ($child->children->toArray() as $sub_child) {
            $s_child = Route::with('children')->whereId($sub_child['id'])->first();
            $s_child->updated_by = Auth::id();
            $s_child->save();
            $s_child->delete();
            if (!empty($s_child->children->toArray())) {
                $this->recursion($s_child);
            }
        }
    }

    public function getRoute()
    {
        $route = Route::with('parent', 'children')->whereId($this->request->id)->first();
        return response($route);
    }
}
