<?php

namespace App\Http\Controllers;

use App\Media;
use App\Http\Services\RolePermissions;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;


class MediaController extends Controller
{
    protected $model;
    protected $role_permission_svc;
    protected $request;
    protected $search = '';
    protected $per_page;
    protected $sort_by = 'description';
    protected $sort_dir = 'asc';

    public function __construct(Request $request)
    {
        $this->request = $request;
        $this->per_page = isset($request->per_page) ? $request->per_page : $this->per_page;
        $this->search = isset($request->search) ? $request->search : $this->search;
        $this->sort_by = isset($request->sort_by) ? $request->sort_by : $this->sort_by;
        $this->sort_dir = isset($request->sort_dir) ? $request->sort_dir : $this->sort_dir;
        $this->model = new Media();
        $this->role_permission_svc = new RolePermissions();
    }

    public function getUserId()
    {
        return Auth::id();
    }

    public function getAll()
    {
//        if(!$this->role_permission_svc->superAdminRestriction())
//            return response('Authorization Required',401);

        if (isset($this->request->per_page)) {
            $data = Media::where('original_file_name', 'like', '%' . $this->search . '%')
                ->orderBy('id','desc')
                ->paginate($this->per_page);
        } else {
            $data = Media::all();
        }
        return response($data);
    }

    public function save2()
    {
        Log::debug($this->request);
        if ($this->request->get('image')) {
            $image = $this->request->get('image');
            $name = time() . '.' . explode('/', explode(':', substr($image, 0, strpos($image, ';')))[1])[1];
            \Image::make($this->request->get('image'))->save(public_path('images/') . $name);
        }
    }

    public function save()
    {
        //Log::debug(var_dump($this->request->file));
        //return $this->request;
        //Log::debug();
        $data = array();
        $batch_code=md5(Carbon::now().'-'.$this->getUserId());
        foreach ($this->request->get('files') as $key => $file) {
            $file_extension = explode('/', explode(':', substr($file['full_path'], 0, strpos($file['full_path'], ';')))[1])[1];
            $name = date('Ymd') . time() . '-' . $this->getUserId() . '-' . $key . '.' . $file_extension;
            \Image::make($file['full_path'])->save(public_path('images/') . $name);
            $full_path = url('/images/' . $name);
            array_push($data, [
                'type' => 1, //1 = image
                'extension' => $file_extension,
                'batch_code' => $batch_code,
                'original_file_name' => $file['original_file_name'],
                'new_file_name' => $name,
                'full_path' => $full_path,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
                'created_by' => $this->getUserId(),
                'updated_by' => $this->getUserId()
            ]);
            //Log::debug($file['code']);
        }
        $result = Media::insert($data);
        $inserted_media=Media::where('batch_code', '=', $batch_code)->get();
        return empty($result) ? response('Internal Server Error',500) : response($inserted_media);
//        if($this->request->get('image'))
//        {
//            $image = $this->request->get('image');
//            $name = time().'.' . explode('/', explode(':', substr($image, 0, strpos($image, ';')))[1])[1];
//            \Image::make($this->request->get('image'))->save(public_path('images/').$name);
//        }
        //return $name;
//        foreach ($this->request->file as $file){
//            return $file;
//            //return $name=$file->getClientOriginalName();
//            //$file->move(public_path().'/files/', $name);
//            //$data[] = $name;
//
//        }
//
//        if(!$this->role_permission_svc->superAdminRestriction())
//            return response('Authorization Required',401);
//        $data = $this->request->all();
//        if (isset($data['id']) && $data['id'] != -1) {
//            $data['updated_by'] = $this->getUserId();
//        } else {
//            $data['created_by'] = $this->getUserId();
//            $data['updated_by'] = $this->getUserId();
//        }
//        $result = Media::updateOrCreate(['id'=>$data['id']],$data);
//        return empty($result) ? response('Internal Server Error',500) : response(Media::whereId($result->id)->first());
    }
//    public function delete(){
//        if(!$this->role_permission_svc->superAdminRestriction())
//            return response('Authorization Required',401);
//        $data = $this->request->all();
//        $result = CrewType::find( $data['id'] );
//        $result->updated_by = $this->getUserId();
//        $result->save();
//        $result->delete();
//        return empty($result) ? response('Internal Server Error',500) : response('Successfully Deleted Record',200);
//    }

    public function saveMedia(Request $request)
    {
        $input_data = $request->all();
        Log::debug($input_data);
//        $file_count=count($input_data['files']);
//        if($file_count>30)
//            return response(['title'=>'Error!','content'=>'You can only upload maximum of 30 files.'],422);

        $error_messages=[
            'file.required' => json_encode(['title'=>'Invalid Upload','content'=>'Please upload an image/video']),
            'file.mimes' => json_encode(['title'=>'Invalid File Format','content'=>'Only the following formats are allowed : jpg,jpeg,png,bmp,svg,mp4']),
            'file.max' => json_encode(['title'=>'Invalid File Size','content'=>'Sorry! Maximum allowed size for an image/video is 20MB']),

        ];
        $validator = Validator::make(
            $input_data, [
            'file' => 'required|mimes:jpg,jpeg,png,bmp,svg,mp4|max:20000'
        ],$error_messages
        );

        if ($validator->fails()) {
            $errors = $validator->errors();
            //Log::debug($errors);
            return response($errors->first('file'),422);
            // Validation error..
        }
        //Log::debug($input_data);
        //return $input_data;
        //return response('no error');
        //Log::debug($this->request['files']);
//        foreach($this->request['files'] as $key => $file){
//
//        }
        $original_file_name = $input_data['file']->getClientOriginalName();
        $file_extension = $input_data['file']->getClientOriginalExtension();
        $batch_code=md5(Str::random(32).'-'.$this->getUserId().'-'.$original_file_name);
        $mime_type = explode("/", $input_data['file']->getMimeType());

        $type = $mime_type[0] == 'image' ? 1 : 2 ;
        $new_file_name = md5($batch_code.'-'.date('Ymd') . microtime() . '-' . $this->getUserId()) . '.' . $file_extension;
        $full_path = url('/media/' . $new_file_name);
        $file_data=array(
            'type' => $type, //1 = image, 2 = video
            'extension' => $file_extension,
            'batch_code' => $batch_code,
            'original_file_name' => $original_file_name,
            'new_file_name' => $new_file_name,
            'full_path' => $full_path,
            'created_by' => $this->getUserId(),
            'updated_by' => $this->getUserId()
        );

        $path = storage_path('/app/public/media_uploads/');
        $input_data['file']->move($path, $new_file_name);

        //return response($file_data);
        //$result = Media::insert($data);
        $result = Media::create($file_data);
        //$inserted_media=Media::where('batch_code', '=', $batch_code)->get();
        return empty($result) ? response('Internal Server Error',500) : response($result);
    }
}
