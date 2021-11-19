<?php

namespace App\Http\Controllers;

use App\AmbassadorItineraryCode;
use App\Booking;
use App\BookingAddOn;
use App\BookingCabin;
use App\BookingCabinAssignment;
use App\BookingCabinDiscount;
use App\BookingInvoice;
use App\BookingInvoicePayment;
use App\BookingReferral;
use App\DietOption;
use App\Gender;
use App\Guest;
use App\GuestTitle;
use App\Itinerary;
use App\ItineraryBrand;
use App\ItineraryCountry;
use App\Jobs\SendBookingNotificationJob;
use App\LeadSource;
use App\Nationality;
use App\PaymentType;
use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Jobs\SendEmailItineraryJob;
use App\Jobs\SendEmailAccountCredentialsJob;
use Illuminate\Support\Facades\Log;

class BookingController extends Controller
{
    protected $model;
    protected $request;
    protected $per_page;
    protected $brand = -1;
    protected $search = "";

    public function __construct(Request $request)
    {
        $this->request = $request;
        $this->per_page = isset($request->per_page) ? $request->per_page : $this->per_page;
        $this->search = isset($request->search) ? $request->search : $this->search;
        $this->brand = isset($request->brand) ? $request->brand : $request->brand;
        $this->model = new ItineraryBrand();
    }

    public function getUserId()
    {
        return Auth::id();
    }

    public function updateCabinAssignment(){

        $cabin_guests = $this->request->all();

        foreach($cabin_guests as $row){
            if(!empty($row['booking_cabins'])){
                foreach($row['booking_cabins'] as $cabin){
                    $booking_cabin = BookingCabin::find($cabin['id']);
                    $booking_cabin->itinerary_cabin_id = $row['id'];
                    $booking_cabin->save();
                }
            }
        }
    }

    public function getAllItineraryBrands()
    {
        $data = ItineraryBrand::all();
        return response($data);
    }

    public function getAllItineraryCountries()
    {
        $itinerary_countries = ItineraryCountry::with(['itinerary_country_media'])->where('is_displayed', 1)->get();
        $itinerary_brands = ItineraryBrand::all();
        return response(array('itinerary_countries' => $itinerary_countries, 'itinerary_brands' => $itinerary_brands));
    }

    public function getAllItineraries()
    {
        $data = $this->request->all();
        $itineraries = Itinerary::with(
            [
                'itinerary_media',
                'itinerary_brand',
                'itinerary_country',
                'itinerary_boat' => function ($query) {
                    $query->with(['boat_media']);
                },
                'port_from',
                'port_to',
                'inclusions',
                'exclusions',
                'add_ons',
                'itinerary_bookings',
                'itinerary_cabins',
                'itinerary_city_from',
                'itinerary_city_to',
                'ambassador' => function ($query) {
                    $query->with(['ambassador_media']);
                },
                'ambassador_itinerary_codes' => function ($query) {
                    $query->where('is_active', true);
                }
            ]
        )
            ->where('is_displayed', '=', true)
            ->whereHas('itinerary_brand', function ($query) use ($data) {
                $query->where('slug', $data['brand_slug']);
            })->whereHas('itinerary_country', function ($query) use ($data) {
                $query->where('slug', $data['country_slug']);
            })->orderBy('check_in_date')->get();

        $new_itineraries = $itineraries->toArray();
//        $booking_add_ons = DB::select('SELECT itinerary_add_ons.*,total_qty, (available_qty-IFNULL(total_qty,0)) AS remaining_balance
//                FROM itinerary_add_ons
//                LEFT JOIN
//                (SELECT itinerary_id,add_on_id,SUM(qty) total_qty FROM
//                (SELECT booking_add_ons.*, bookings.itinerary_id
//                FROM booking_add_ons
//                INNER JOIN bookings ON bookings.id=booking_add_ons.booking_id) TABLE1
//                GROUP BY itinerary_id,add_on_id) TABLE2
//                ON TABLE2.itinerary_id=itinerary_add_ons.itinerary_id AND TABLE2.add_on_id=itinerary_add_ons.add_on_id');
        $booking_add_ons = app(ItineraryController::class)->getAddOnsUsage();
        foreach ($new_itineraries as $main_key => $row) {
            $add_ons_balance = array();

            foreach($booking_add_ons as $row_booking_add_ons){
                if($row_booking_add_ons->itinerary_id==$row['id'])
                {
                    array_push($add_ons_balance,$row_booking_add_ons);

                    foreach ($row['add_ons'] as $add_on_key => $row_add_on){
                        if($row_add_on['add_on_id']==$row_booking_add_ons->add_on_id)
                            $new_itineraries[$main_key]['add_ons'][$add_on_key]['remaining_balance']=$row_booking_add_ons->remaining_balance;
                    }
                }
            }
            $new_itineraries[$main_key]['booking_add_ons']=$add_ons_balance;

            $date_now = Carbon::now()->format('Y-m-d');
            $early_bird_date = Carbon::parse($row['early_bird_cut_off_date']);

            if ($row['is_early_bird_active'] == "true" && $early_bird_date->gte($date_now) && !empty($row['early_bird_cut_off_date'])) {
                //Log::debug($row['itinerary_cabins_for_booking']);
                foreach ($row['itinerary_cabins_for_booking'] as $key => $cabin) {
                    $new_itineraries[$main_key]['itinerary_cabins_for_booking'][$key]['price_pp'] = $cabin['early_bird_price'];
                    $new_itineraries[$main_key]['itinerary_cabins_for_booking'][$key]['price_cbn'] = $cabin['cabin_early_bird_price'];
                }
            }
        }
        $guest_titles = GuestTitle::all();
        $nationalities = Nationality::orderByRaw('is_preferred DESC, description')->get();
        $lead_sources = LeadSource::orderBy('description')->get();
        $result = array(
            'itineraries' => $new_itineraries,
            'guest_titles' => $guest_titles,
            'nationalities' => $nationalities,
            'lead_sources' => $lead_sources
        );
        return response($result);
    }

    public function save()
    {

        $data = $this->request->all();
//        return $data['promo_code']['code'];
        //return response($test);
//        $booking_cabin_data = array(
//            'booking_id' => $booking_id,
//            'guest_id' => $guest['id'],
//            'itinerary_cabin_id' => $row['cabin']['id'],
//            'occupancy' => $row['occupancy'],
//            'is_cabin_occupied' => 0,
//            'price_per_person' => $row['cabin']['price_per_person'],
//            'cabin_price' => $row['cabin']['cabin_price'],
//            'early_bird_price' => $row['cabin']['early_bird_price'],
//            'cabin_early_bird_price' => $row['cabin']['cabin_early_bird_price'],
//            'total_amount_due' => $row['amount_due'],
//            'created_by' => $user['id'],
//            'updated_by' => $user['id']this.booking_details.itinerary.early_bird_validity
//        );
        //this.selected_guest.main_guest && JSON.parse(this.booking_details.itinerary.is_referral_active) && this.booking_details.number_of_guest.value>1
        $total_discount = collect($data['discounts'])->sum('total');
        $baf_qty=count($data['guests'])-1;
        $baf_discount=array();
        if($baf_qty>0 && $data['itinerary']['is_referral_active']){
            $baf_discount_amount=$data['itinerary']['referral_price'];
            $baf_discount_amount_total=$baf_discount_amount*$baf_qty;
            $baf_discount=array(
                'discount_description'=>'Bring a Friend Promo ('.$baf_qty.' friend/s)',
                'qty'=>$baf_qty,
                'amount'=>$baf_discount_amount,
                'total'=>$baf_discount_amount_total
            );
        }

        foreach ($data['itinerary']['itinerary_cabins_for_booking'] as $index=>$value) {
            if($value['user_selection']['cabin_type']!=-1){
                if($value['user_selection']['cabin_type']==3){
                    $amount_due = $value['user_selection']['price']/2;
                    $counter=2;
                    $occupancy = $value['user_selection']['occupancy']/2;
                }else{
                    $counter=1;
                    $amount_due = $value['user_selection']['price'];
                    $occupancy = $value['user_selection']['occupancy'];
                }

                $options = collect($value['cabin_type_options']);
                //return $options['cabin_type_options'];
                $cabin_type = $options->where('cabin_type',$value['user_selection']['cabin_type'])->first();
                $discounts=array();
                if($data['promo_code']['is_active']){
                    $discount=array(
                        'discount_description'=>'Ambassador Promo Code - '.$data['promo_code']['code'],
                        'qty'=>1,
                        'amount'=>$data['promo_code']['discount_amount'],
                        'total'=>$data['promo_code']['discount_amount']
                    );
                    array_push($discounts,$discount);
                }else{
                    if($data['itinerary']['early_bird_validity']){
                        $discount=array(
                            'discount_description'=>'Early Bird Promo',
                            'qty'=>1,
                            'amount'=>$cabin_type['discount'],
                            'total'=>$cabin_type['discount']
                        );
                        array_push($discounts,$discount);
                    }
                }
                while($counter>0){

                    foreach ($data['guests'] as $row_guest_index=>$row_guest_value) {
                        if($row_guest_value['cabin']['id']==-1){
                            $data['guests'][$row_guest_index]['cabin']=$value;
                            $data['guests'][$row_guest_index]['amount_due']=$amount_due;
                            $data['guests'][$row_guest_index]['occupancy']=$occupancy;

                            if($row_guest_index==0 && !empty($baf_discount)){
                                array_push($discounts,$baf_discount);
                                $data['guests'][$row_guest_index]['amount_due']=$data['guests'][$row_guest_index]['amount_due']-$total_discount;
                            }
                            $data['guests'][$row_guest_index]['discounts']=$discounts;
                            $counter--;
                            break;
                        }
                    }

                }
            }
        }
        DB::beginTransaction();

        try {
            $user_check=User::where('email', $data['guests'][0]['email']['value'])->first();
            if($user_check)
            {
                $user=$user_check;
            }else{
                $random = str_shuffle('ABCDEFGHJKLMNOPQRSTUVWXYZ234567890');
                $password = substr($random, 0, 6);
                $user_data = array(
                    'last_name' => $data['guests'][0]['last_name']['value'],
                    'first_name' => $data['guests'][0]['first_name']['value'],
                    'default' => $password,
                    'email' => $data['guests'][0]['email']['value'],
                    'role_id' => 4,
                    'password' => bcrypt($password)
                );
                $user = User::create($user_data);
            }

            $accessToken = $user->createToken('authToken')->accessToken;
            $last_reference_code = Booking::max('reference_code');
            $reference_code_char = substr(str_shuffle("ABCDEFGHIJKLMNOPQRSTUVWXYZ"), -4);
            if (empty($last_reference_code)) {
                $reference_code = 100001;
            } else {
                $reference_code = $last_reference_code + 1;
            }
            $booking_data = array(
                'reference_code_char' => $reference_code_char,
                'reference_code' => $reference_code,
                'itinerary_id' => $data['itinerary']['id'],
                'user_id' => $user['id'],
                'lead_source_id' => $data['lead_source_id']['value'],
                'ambassador_itinerary_code_id' => NULL,
                'created_by' => $user['id'],
                'updated_by' => $user['id'],
            );
            if($data['promo_code']['code']!=''){

                $code_check=AmbassadorItineraryCode::where('code', $data['promo_code']['code'])
                    ->where('itinerary_id',$data['itinerary']['id'])->first();

                if($code_check)
                    $booking_data['ambassador_itinerary_code_id']=$code_check['id'];
            }
            $booking = Booking::create($booking_data);
            $booking_id = $booking['id'];


            $last_invoice_number = BookingInvoice::max('invoice_number');
            if (empty($last_invoice_number)) {
                $invoice_number = 100001;
            } else {
                $invoice_number = $last_invoice_number + 1;
            }
            $booking_invoice_data = array(
                'booking_id' => $booking_id,
                'invoice_number' => $invoice_number,
                'sub_total' => $data['grand_total'],
                'discount' => 0,
                'grand_total' => $data['grand_total'],
                'deposit_amount_due' => $data['deposit_amount_due'],
                'payment_terms' => $data['payment_terms'],
                'created_by' => $user['id'],
                'updated_by' => $user['id'],
            );
            $booking_invoice_id = BookingInvoice::create($booking_invoice_data);

            $booking_cabins_array = [];
            foreach ($data['guests'] as $row) {
                if($row['db_id']==-1)
                {
                    $guest_data = array(
                        'guest_title_id' => $row['guest_title_id']['value'],
                        'first_name' => !$row['first_name']['value'] ? '' : $row['first_name']['value'],
                        'last_name' => !$row['last_name']['value'] ? '' : $row['last_name']['value'],
                        'middle_name' => '',
                        'country_code_id' => !$row['country_code']['value'] ? null : $row['country_code']['value'],
                        'phone_number' => !$row['phone_number']['value'] ? '' : $row['phone_number']['value'],
                        'email' => !$row['email']['value'] ? '' : $row['email']['value'],
                        'created_by' => $user['id'],
                        'updated_by' => $user['id']
                    );
                    if ($row['email']['value'] == $user['email'])
                        $guest_data['user_id'] = $user['id'];
                    $guest = Guest::create($guest_data);
                    $guest_id = $guest['id'];
                }else{
                    $guest_id = $row['db_id'];
                }

                $booking_cabin_data = array(
                    'booking_id' => $booking_id,
                    'guest_id' => $guest_id,
                    'itinerary_cabin_id' => $row['cabin']['id'],
                    'original_itinerary_cabin_id' => $row['cabin']['id'],
                    'occupancy' => $row['occupancy'],
                    'is_cabin_occupied' => 0,
                    'price_per_person' => $row['cabin']['price_per_person'],
                    'cabin_price' => $row['cabin']['cabin_price'],
                    'early_bird_price' => $row['cabin']['early_bird_price'],
                    'cabin_early_bird_price' => $row['cabin']['cabin_early_bird_price'],
                    'total_amount_due' => $row['amount_due'],
                    'created_by' => $user['id'],
                    'updated_by' => $user['id']
                );
                $booking_cabin = BookingCabin::create($booking_cabin_data);
                if(!empty($row['discounts']))
                {
                    $booking_cabin_discounts_array = [];
                    foreach ($row['discounts'] as $discount){
                        if($discount['total']>0){
                            $booking_cabin_discount_data = array(
                                'discount_description' => $discount['discount_description'],
                                'qty' => $discount['qty'],
                                'amount' => $discount['amount'],
                                'total' => $discount['total'],
                                'created_by' => $user['id'],
                                'updated_by' => $user['id']
                            );
                            array_push($booking_cabin_discounts_array, $booking_cabin_discount_data);
                        }
                    }

                    $booking_cabin->discounts()->createMany($booking_cabin_discounts_array);
                }



            }

            //$booking->guests()->createMany($booking_cabins_array);

            //return $booking_id;
            //BOOKING ADD ONS
            $add_ons_array = [];
            foreach ($data['add_ons'] as $row) {
                if ($row['is_selected'] == true) {
                    $add_on_data = array(
                        'booking_id' => $booking_id,
                        'add_on_id' => $row['add_on_id'],
                        'price' => $row['price'],
                        'qty' => $row['qty'],
                        'total' => $row['price'] * $row['qty'],
                        'created_by' => $user['id'],
                        'updated_by' => $user['id']
                    );
                    array_push($add_ons_array, $add_on_data);
                }
            }
            //return response($add_ons_array);
            BookingAddOn::insert($add_ons_array);
            DB::commit();
        } catch (\Exception $e) {
            DB::rollback();
            return response($e, 422);
        }
        //send email
        dispatch(new SendEmailItineraryJob($booking));

        $booking_data = Booking::with(
            [
                'itinerary_details' => function ($query) {
                    $query->with('itinerary_brand', 'itinerary_country', 'itinerary_city_from', 'itinerary_city_to');
                },
                'guests' => function ($query) {
                    $query->with(['guest_details' => function ($query) {
                        $query->with('nationality_details');
                    }]);
                },
                'add_ons' => function ($query) {
                    $query->with('details');
                },
                'user'
            ])
            ->find($booking_id);
        $result_data['data']=$booking_data;
        dispatch(new SendBookingNotificationJob($result_data));
        if(!$user_check)
            dispatch(new SendEmailAccountCredentialsJob(['email'=>$data['guests'][0]['email']['value'],'password'=>$password]));

        $result = Booking::with(
            [
                'active_invoice' => function ($query) {
                    $query->with(['payments' => function ($query) {
                        $query->with('payment_type');
                    }]);
                }
            ])->find($booking_id);
        return response(array('token' => $accessToken, 'booking_details' => $result), 200);
    }
    public function adminBooking(){
        $data = $this->request->all();
        $user_id = $this->getUserId();
        DB::beginTransaction();

        try {
            if($data['guests'][0] && $data['guests'][0]['id']=='-1'){
                $user_check=User::where('email', $data['guests'][0]['email'])->first();
                if($user_check)
                {
                    $user=$user_check;
                }else{
                    $random = str_shuffle('ABCDEFGHJKLMNOPQRSTUVWXYZ234567890');
                    $password = substr($random, 0, 6);
                    $user_data = array(
                        'last_name' => $data['guests'][0]['last_name'],
                        'first_name' => $data['guests'][0]['first_name'],
                        'default' => $password,
                        'email' => $data['guests'][0]['email'],
                        'role_id' => 4,
                        'password' => bcrypt($password)
                    );

                    $user = User::create($user_data);
                }
            }else{
                $guest_data_result = Guest::find($data['guests'][0]['id']);
                $user = User::find($guest_data_result['user_id']);
            }

            $last_reference_code = Booking::max('reference_code');
            $reference_code_char = substr(str_shuffle("ABCDEFGHIJKLMNOPQRSTUVWXYZ"), -4);
            if (empty($last_reference_code)) {
                $reference_code = 100001;
            } else {
                $reference_code = $last_reference_code + 1;
            }
            $booking_data = array(
                'reference_code_char' => $reference_code_char,
                'reference_code' => $reference_code,
                'itinerary_id' => $data['itinerary_id'],
                'admin_booking' => 1,
                'user_id' => $user['id'],
                'created_by' => $user_id,
                'updated_by' => $user_id,
            );

            $booking = Booking::create($booking_data);
            $booking_id = $booking['id'];


            $last_invoice_number = BookingInvoice::max('invoice_number');
            if (empty($last_invoice_number)) {
                $invoice_number = 100001;
            } else {
                $invoice_number = $last_invoice_number + 1;
            }
            $booking_invoice_data = array(
                'booking_id' => $booking_id,
                'invoice_number' => $invoice_number,
                'sub_total' => $data['grand_total'],
                'discount' => 0,
                'grand_total' => $data['grand_total'],
                'deposit_amount_due' => $data['grand_total'],
                'payment_terms' => 1,
                'admin_booking' => 1,
                'created_by' => $user_id,
                'updated_by' => $user_id,
            );
            BookingInvoice::create($booking_invoice_data);

            foreach($data['guests'] as $key=>$row){

                    if($row['id']==-1)
                    {
                        $guest_data = array(
                            'guest_title_id' => $row['guest_title_id']['value'],
                            'first_name' => !$row['first_name'] ? '' : $row['first_name'],
                            'last_name' => !$row['last_name'] ? '' : $row['last_name'],
                            'middle_name' => '',
                            'email' => '',
                            'country_code_id' => !$row['country_code_id'] ? null : $row['country_code_id'],
                            'phone_number' => !$row['phone_number'] ? '' : $row['phone_number'],
                            'created_by' => $user['id'],
                            'updated_by' => $user['id']
                        );
                        if($key==0){
                            $guest_data['email']=$row['email'];
                            $guest_data['user_id']=$user['id'];
                        }
                        $guest = Guest::create($guest_data);

                        $guest_id = $guest['id'];
                    }else{
                        $guest_id = $row['id'];
                    }

                    $booking_cabin_data = array(
                        'booking_id' => $booking_id,
                        'guest_id' => $guest_id,
                        'itinerary_cabin_id' => $row['cabin']['id'],
                        'original_itinerary_cabin_id' => $row['cabin']['id'],
                        'occupancy' => $row['cabin_occupancy'],
                        'is_cabin_occupied' => 0,
                        'price_per_person' => $row['cabin']['price_per_person'],
                        'cabin_price' => $row['cabin']['cabin_price'],
                        'early_bird_price' => $row['cabin']['early_bird_price'],
                        'cabin_early_bird_price' => $row['cabin']['cabin_early_bird_price'],
                        'total_amount_due' => $row['total_amount_due'],
                        'created_by' => $user_id,
                        'updated_by' => $user_id
                    );
                    $booking_cabin = BookingCabin::create($booking_cabin_data);
                    if(!empty($row['discounts']))
                    {
                        $booking_cabin_discounts_array = [];
                        foreach ($row['discounts'] as $discount){
                                $booking_cabin_discount_data = array(
                                    'discount_description' => $discount['discount_description'],
                                    'qty' => $discount['qty'],
                                    'amount' => $discount['amount'],
                                    'total' => $discount['amount']*$discount['qty'],
                                    'created_by' => $user_id,
                                    'updated_by' => $user_id
                                );
                                array_push($booking_cabin_discounts_array, $booking_cabin_discount_data);
                        }

                        $booking_cabin->discounts()->createMany($booking_cabin_discounts_array);
                    }
            }
            $add_ons_array = [];
            foreach ($data['add_ons'] as $row) {
                if (isset($row['is_selected']) && $row['is_selected'] == true && $row['qty']>0) {
                    $add_on_data = array(
                        'booking_id' => $booking_id,
                        'add_on_id' => $row['add_on_id'],
                        'price' => $row['price'],
                        'qty' => $row['qty'],
                        'total' => $row['price'] * $row['qty'],
                        'created_by' => $user_id,
                        'updated_by' => $user_id
                    );
                    array_push($add_ons_array, $add_on_data);
                }
            }
            //return response($add_ons_array);
            BookingAddOn::insert($add_ons_array);
            DB::commit();
            return response("Success", 200);
        } catch (\Exception $e) {
            DB::rollback();
            return response($e, 422);
        }
    }

    public function getAll()
    {

        $search = (!empty($this->search) ? $this->search : "");
        $user = User::with('role')->find(Auth::id());
        if (isset($this->request->per_page)) {
            $bookings = Booking::with(
                [
                    'itinerary_details' => function ($query) {
                        $query->with('itinerary_brand', 'itinerary_country', 'itinerary_city_from', 'itinerary_city_to');
                    },
                    'guests' => function ($query) {
                        $query->with(['guest_details' => function ($query) {
                            $query->with('nationality_details');
                        }]);
                    },
                    'add_ons' => function ($query) {
                        $query->with('details');
                    },
                    'user'
                ])->where(function ($query) use ($user) {
                if ($user['role']['id'] == 4)
                    $query->where('user_id', $user['id']);
            })
                ->when($this->brand != -1, function ($query) {
                    $query->whereHas("itinerary_details", function ($id_query) {
                        $id_query->where("itinerary_brand_id", "=", $this->brand);
                    });
                })
                ->when(!empty($this->search), function($query){
                    $query->whereHas("itinerary_details", function($id_query){
                        $id_query->whereRaw("DATE_FORMAT(check_in_date, '%M %d, %Y') like ?", array('%' . $this->search . '%'));
                    })
                        ->orWhere('reference_code_char', 'like', '%'.$this->search.'%')
                        ->orWhere('reference_code', 'like', '%'.$this->search.'%')
                        ->orWhereHas("user", function($query){
                            $query->where('first_name', 'like', '%'.$this->search.'%')
                                ->orWhere('last_name', 'like', '%'.$this->search.'%');
                    });
                })
                ->paginate($this->per_page);
        } else {
            //$bookings = MailItinerary::with('itinerary_boat')->get();
        }
        return response($bookings, 200);
    }

    public function get()
    {

        $data = $this->request->all();

        $booking = Booking::with(
            [
                'itinerary_details' => function ($query) {
                    $query->with('itinerary_brand', 'itinerary_country', 'itinerary_boat', 'port_from', 'port_to', 'inclusions', 'exclusions', 'add_ons', 'itinerary_cabins', 'itinerary_cabins_for_booking', 'itinerary_city_from', 'itinerary_city_to');
                },
                'guests' => function ($query) {
                    $query->with(
                        [
                            'guest_details' => function ($query) {
                                $query->with(
                                    ['nationality_details', 'diet_option', 'gender']);
                            },
                            'guest_cabin_details'
                        ]);
                },
                'add_ons' => function ($query) {
                    $query->with('details');
                },
                'user',
                'active_invoice' => function ($query) {
                    $query->with(['payments' => function ($query) {
                        $query->with('payment_type');
                    }]);
                },
                'other_invoices',
                'invoices' => function ($query) {
                    $query->with(['payments' => function ($query) {
                        $query->with('payment_type');
                    }]);
                }
            ])->find($data['booking_id']);

        $add_ons = $this->getAddOns();
        $itinerary_add_ons = collect($add_ons)->where('itinerary_id','=', $booking['itinerary_details']['id']);
//
        foreach($booking['itinerary_details']['add_ons'] as  $key => $row){
            $new_collection = collect($itinerary_add_ons)->where('add_on_id','=',$row['add_on_id'])->first();
            $booking['itinerary_details']['add_ons'][$key]['balance_left'] = (int)$new_collection->remaining_balance;
        }

        $guest_titles = GuestTitle::all();
        $nationalities = Nationality::all();
        $diet_options = DietOption::all();
        $genders = Gender::all();
        $payment_types = PaymentType::all();
        $result = array(
            'booking' => $booking,
            'guest_titles' => $guest_titles,
            'nationalities' => $nationalities,
            'diet_options' => $diet_options,
            'genders' => $genders,
            'payment_types' => $payment_types,
            'test'=>$itinerary_add_ons
        );
        return response($result);
    }

    public function saveInvoicePayment()
    {
        $data = $this->request->all();

        $last_invoice_payment_number = BookingInvoicePayment::max('invoice_payment_number');
        if (empty($last_invoice_payment_number)) {
            $invoice_payment_number = 100001;
        } else {
            $invoice_payment_number = $last_invoice_payment_number + 1;
        }
        $booking_invoice_payment_data = array(
            'invoice_payment_number' => $invoice_payment_number,
            'booking_invoice_id' => $data['invoice']['id'],
            'payment_type_id' => $data['payment_type_id'],
            'amount_paid' => $data['amount_paid'],
            'created_by' => $this->getUserId(),
            'updated_by' => $this->getUserId()
        );
        $invoice_payment = BookingInvoicePayment::create($booking_invoice_payment_data);
        return response($invoice_payment, 200);
    }

    public function saveInvoicePaymentPaypal()
    {
        $data = $this->request->all();
        $last_invoice_payment_number = BookingInvoicePayment::max('invoice_payment_number');
        if (empty($last_invoice_payment_number)) {
            $invoice_payment_number = 100001;
        } else {
            $invoice_payment_number = $last_invoice_payment_number + 1;
        }
        $booking_invoice_payment_data = array(
            'invoice_payment_number' => $invoice_payment_number,
            'booking_invoice_id' => $data['active_invoice']['id'],
            'payment_type_id' => 1,
            //'paypal_response'=>$data['paypal_response'],
            'amount_paid' => $data['paypal_response']['purchase_units'][0]['amount']['value'],
            'created_by' => $this->getUserId(),
            'updated_by' => $this->getUserId()
        );
        $invoice_payment = BookingInvoicePayment::create($booking_invoice_payment_data);

        $result['data']=array();
        dispatch(new SendBookingNotificationJob($result));
        return response($invoice_payment, 200);
    }

    public function saveGuestBookingDetails()
    {
        $data = $this->request->all();
        $guestController = new GuestController($this->request);
        return $guestController->save();
    }

    public function update()
    {
        $data = $this->request->all();
        DB::beginTransaction();
        try {
            $booking_id = $data['id'];

            BookingInvoice::where('booking_id', $booking_id)->update(['is_active' => 0]);
            $last_invoice_number = BookingInvoice::max('invoice_number');
            if (empty($last_invoice_number)) {
                $invoice_number = 100001;
            } else {
                $invoice_number = $last_invoice_number + 1;
            }
            $booking_invoice_data = array(
                'booking_id' => $booking_id,
                'invoice_number' => $invoice_number,
                'sub_total' => $data['grand_total'],
                'discount' => 0,
                'grand_total' => $data['grand_total'],
                'deposit_amount_due' => 0,
                'payment_terms' => 1,
                'created_by' => $this->getUserId(),
                'updated_by' => $this->getUserId(),
            );
            $booking_invoice_id = BookingInvoice::create($booking_invoice_data);


            BookingAddOn::where('booking_id', $booking_id)->delete();
            $add_ons_array = [];
            foreach ($data['add_ons'] as $row) {
                if ($row['is_selected'] == true) {
                    $add_on_data = array(
                        'booking_id' => $booking_id,
                        'add_on_id' => $row['add_on_id'],
                        'price' => $row['price'],
                        'qty' => $row['qty'],
                        'total' => $row['price'] * $row['qty'],
                        'created_by' => $this->getUserId(),
                        'updated_by' => $this->getUserId()
                    );
                    array_push($add_ons_array, $add_on_data);
                }
            }
            //return response($add_ons_array);
            BookingAddOn::insert($add_ons_array);
            DB::commit();
        } catch (\Exception $e) {
            DB::rollback();
            return response($e, 422);
        }
    }
    public function cancel()
    {
        $data = $this->request->all();
        DB::beginTransaction();
        try {
            $booking_id = $data['booking_id'];
            $booking = Booking::find($booking_id);
            $booking->delete();

            BookingAddOn::where('booking_id', $booking_id)->delete();
            BookingCabin::where('booking_id', $booking_id)->delete();

            //BookingCabinDiscount::where('booking_id', $booking_id)->delete();
            BookingInvoice::where('booking_id', $booking_id)->delete();
            //BookingInvoicePayment::where('booking_id', $booking_id)->delete();

        DB::commit();
            } catch (\Exception $e) {
        DB::rollback();
            return response($e, 422);
        }
    }
    public function getAddOns(){
        $booking_add_ons = DB::select('SELECT itinerary_add_ons.*,total_qty, (available_qty-IFNULL(total_qty,0)) AS remaining_balance 
                FROM itinerary_add_ons
                LEFT JOIN 
                (SELECT itinerary_id,add_on_id,SUM(qty) total_qty FROM
                (SELECT booking_add_ons.*, bookings.itinerary_id
                FROM booking_add_ons
                INNER JOIN bookings ON bookings.id=booking_add_ons.booking_id) TABLE1
                GROUP BY itinerary_id,add_on_id) TABLE2
                ON TABLE2.itinerary_id=itinerary_add_ons.itinerary_id AND TABLE2.add_on_id=itinerary_add_ons.add_on_id');
        return $booking_add_ons;
    }
}
