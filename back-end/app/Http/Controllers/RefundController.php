<?php

namespace App\Http\Controllers;

use App\Booking;
use App\BookingCabin;
use App\Http\Services\RefundStatus;
use App\Http\Services\RefundTypes;
use App\Http\Services\RolePermissions;
use App\Refund;
use App\RefundDetail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class RefundController extends Controller
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
        $this->model = new Refund();
        $this->role_permission_svc = new RolePermissions();
    }

    public function getUserId()
    {
        return Auth::id();
    }

    public function getAll()
    {
        if (isset($this->request->per_page)) {
            $data = Refund::with(
                [
                    'booking' => function($query){
                        return $query->withTrashed();
                    },
                    'refund_details' => function ($query) {
                        return $query->with(['booking_cabin' => function ($query) {
                            return $query->with(['guest_details'])->withTrashed();
                        }]);
                    }
                ])->where('description', 'like', '%' . $this->search . '%')->paginate($this->per_page);
        } else {
            $data = Refund::all();
        }
        return response($data);
    }

    public function get(){
        $refund_details = RefundDetail::whereHas('refund', function($query){
            return $query->where('booking_id', '=', $this->request->id);
        })->get();
        return response($refund_details);
    }


    public function approve()
    {
        $refund = Refund::find($this->request->id);

        if($refund->refund_type_id == RefundTypes::PER_BOOKING){
            $booking = Booking::find($refund->booking_id);
            $booking->delete();
        }

        $refund->status_id = RefundStatus::APPROVED;
        $refund->approved_by = $this->getUserId();
        $refund->save();

        $cabin_ids = collect($this->request->refund_details)->pluck('booking_cabin_id');
        BookingCabin::destroy($cabin_ids);
    }

    public function save_per_guest()
    {
        $refund_data = [
            'booking_id' => $this->request->booking_id,
            'description' => $this->request->description,
            'refund_type_id' => RefundTypes::PER_GUEST
        ];

        if (isset($this->request->id) && $this->request->id != -1) {
            $refund_data['updated_by'] = $this->getUserId();
        } else {
            $refund_data['created_by'] = $this->getUserId();
            $refund_data['updated_by'] = $this->getUserId();
        }

        $refund = Refund::updateOrCreate(['id' => $this->request->id], $refund_data);

        foreach ($this->request->details as $detail) {
            $refund_detail_data = [
                'refund_id' => $refund->id,
                'booking_cabin_id' => $detail['id'],
                'amount_refunded' => $detail['total_amount_due']
            ];
            RefundDetail::create($refund_detail_data);
        }
    }


    public function save_per_booking()
    {
        $refund_data = [
            'booking_id' => $this->request->booking_id,
            'description' => $this->request->description,
            'refund_type_id' => RefundTypes::PER_BOOKING
        ];

        if (isset($this->request->id) && $this->request->id != -1) {
            $refund_data['updated_by'] = $this->getUserId();
        } else {
            $refund_data['created_by'] = $this->getUserId();
            $refund_data['updated_by'] = $this->getUserId();
        }

        $refund = Refund::updateOrCreate(['id' => $this->request->id], $refund_data);

        foreach ($this->request->details as $detail) {
            $refund_detail_data = [
                'refund_id' => $refund->id,
                'booking_cabin_id' => $detail['id'],
                'amount_refunded' => $detail['total_amount_due']
            ];
            RefundDetail::create($refund_detail_data);
        }
    }
}
