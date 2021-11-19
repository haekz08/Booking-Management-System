<?php

namespace App\Http\Controllers;

use App\AddOn;
use App\Ambassador;
use App\AmbassadorItineraryCode;
use App\Boat;
use App\BoatCrew;
use App\CrewType;
use App\DietOption;
use App\Exclusion;
use App\Gender;
use App\Guest;
use App\GuestTitle;
use App\Http\Services\RolePermissions;
use App\Inclusion;
use App\Itinerary;
use App\ItineraryAddOn;
use App\ItineraryBrand;
use App\ItineraryCabin;
use App\ItineraryCity;
use App\ItineraryCountry;
use App\ItineraryExclusion;
use App\ItineraryInclusion;
use App\LeadSource;
use App\Nationality;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;


class ItineraryController extends Controller
{
    protected $model;
    protected $request;
    protected $search = '';
    protected $per_page;
    protected $sort_by = 'name';
    protected $sort_dir = 'asc';
    protected $role_permission_svc;
    protected $brand = -1;

    public function __construct(Request $request)
    {
        $this->request = $request;
        $this->per_page = isset($request->per_page) ? $request->per_page : $this->per_page;
        $this->search = isset($request->search) ? $request->search : $this->search;
        $this->sort_by = isset($request->sort_by) ? $request->sort_by : $this->sort_by;
        $this->sort_dir = isset($request->sort_dir) ? $request->sort_dir : $this->sort_dir;
        $this->brand = isset($request->brand) ? $request->brand : $request->brand;
        $this->model = new Itinerary();
        $this->role_permission_svc = new RolePermissions();
    }

    public function getUserId()
    {
        return Auth::id();
    }

    public function getAll()
    {
        if (!$this->role_permission_svc->itineraryRead())
            return response('Authorization Required', 401);

        $data = $this->request->all();
        $itinerary_brands = (isset($data['itinerary_brands'])) ? $data['itinerary_brands'] : [];
        $itinerary_countries = (isset($data['itinerary_countries'])) ? $data['itinerary_countries'] : [];

        $itinerary_cities_from = (isset($data['itinerary_cities_from'])) ? $data['itinerary_cities_from'] : [];
        $itinerary_cities_to = (isset($data['itinerary_cities_to'])) ? $data['itinerary_cities_to'] : [];
        if (isset($data['per_page'])) {
            $itineraries = Itinerary::with([
                'itinerary_media',
                'inclusions',
                'exclusions',
                'add_ons',
                'itinerary_brand',
                'itinerary_country',
                'itinerary_ambassador',
                'ambassador_itinerary_codes',
                'itinerary_crews',
                'itinerary_cabins',
                'itinerary_boat',
                'itinerary_city_from' => function ($query) {
                    $query->with('ports');
                },
                'itinerary_city_to' => function ($query) {
                    $query->with('ports');
                },
                'port_from',
                'port_to',
                'itinerary_bookings'
            ])
                ->when(!empty($data['search']), function($query) use ($data){
                    $query->whereRaw("DATE_FORMAT(check_in_date, '%M %d, %Y') like ?", array('%' . $data['search'] . '%'));
                })
                ->when(!empty($itinerary_brands), function($query) use ($itinerary_brands){
                    $query->whereIn('itinerary_brand_id',$itinerary_brands);
                })
                ->when(!empty($itinerary_countries), function($query) use ($itinerary_countries){
                    $query->whereIn('itinerary_country_id',$itinerary_countries);
                })
                ->when(!empty($itinerary_cities_from), function($query) use ($itinerary_cities_from){
                    $query->whereIn('city_id_from',$itinerary_cities_from);
                })
                ->when(!empty($itinerary_cities_to), function($query) use ($itinerary_cities_to){
                    $query->whereIn('city_id_to',$itinerary_cities_to);
                })
                ->orderBy('check_in_date')
                ->paginate($data['per_page']);


        } else {
            $itineraries = Itinerary::with('itinerary_boat')->orderBy('departure_date')->get();
        }
        $itinerary_brands = ItineraryBrand::all();
        $itinerary_countries = ItineraryCountry::all();
        $itinerary_cities = ItineraryCity::all();
        $result=array(
            'itineraries'=>$itineraries,
            'itinerary_brands'=>$itinerary_brands,
            'itinerary_countries'=>$itinerary_countries,
            'itinerary_cities'=>$itinerary_cities,
        );
        return empty($result) ? response('Internal Server Error',500) : response($result,200);
    }

    public function step1Options()
    {
        if (!$this->role_permission_svc->itineraryRead())
            return response('Authorization Required', 401);

        $itinerary_brands = ItineraryBrand::all();
        $itinerary_cities = ItineraryCity::with('ports')->get();
        $itinerary_countries = ItineraryCountry::all();

        return response([
            'itinerary_brands' => $itinerary_brands,
            'itinerary_cities' => $itinerary_cities,
            'itinerary_countries' => $itinerary_countries
        ]);
    }

    public function step2GetAll()
    {
        if (!$this->role_permission_svc->itineraryRead())
            return response('Authorization Required', 401);

        $ambassadors = Ambassador::orderBy('first_name')->get();
        $crew_types = CrewType::with('boat_crews')->get();
        $step2_get_all = [
            'ambassadors' => $ambassadors,
            'crew_types' => $crew_types
        ];

        return response($step2_get_all);
    }

    public function step3GetAll()
    {
        if (!$this->role_permission_svc->itineraryRead())
            return response('Authorization Required', 401);

        $boats = Boat::with(['boat_cabins' => function ($query) {
            $query->with('cabin_type');
        }])->get();
        return response($boats);
    }

    public function step4Options()
    {
        $add_ons = AddOn::all();
        $inclusions = Inclusion::all();
        $exclusions = Exclusion::all();

        return response([
            'add_ons' => $add_ons,
            'inclusions' => $inclusions,
            'exclusions' => $exclusions
        ]);
    }

    public function save()
    {
        //return response( $this->request,500);
        DB::beginTransaction();
        try {

            $check_in_time = Carbon::parse($this->request->step1['check_in_time_hh'] . ':' . $this->request->step1['check_in_time_mm'] . " " . $this->request->step1['check_in_time_meridian'])->format('H:i:s');
            $check_out_time = Carbon::parse($this->request->step1['check_out_time_hh'] . ':' . $this->request->step1['check_out_time_mm'] . " " . $this->request->step1['check_out_time_meridian'])->format('H:i:s');
            $itinerary_data = [
                'itinerary_brand_id' => $this->request->step1['itinerary_brand_id'],
                'itinerary_country_id' => $this->request->step1['itinerary_country_id'],
                'check_in_date' => $this->request->step1['check_in_date'],
                'check_in_time' => $check_in_time,
                'check_out_date' => $this->request->step1['check_out_date'],
                'check_out_time' => $check_out_time,
                'city_id_from' => $this->request->step1['city_id_from'],
                'city_id_to' => $this->request->step1['city_id_to'],
                'city_port_id_from' => $this->request->step1['city_port_id_from'],
                'city_port_id_to' => $this->request->step1['city_port_id_to'],
                'is_displayed' => $this->request->step1['is_displayed'],
                'is_locked_to_ambassador' => $this->request->step2['is_locked_to_ambassador'],
                'is_referral_active' => $this->request->step3['is_referral_active'],
                'referral_price' => $this->request->step3['referral_price'],
                'is_early_bird_active' => $this->request->step3['is_early_bird_active'],
                'early_bird_cut_off_date' => $this->request->step3['early_bird_cut_off_date'],
                'boat_id' => $this->request->step3['boat_id'],
                'is_private_charter_active' => $this->request->step3['is_private_charter_active'],
                'private_charter_price' => $this->request->step3['private_charter_price'],
                'deposit_per_person' => $this->request->step3['deposit_per_person'],

                'is_shared_offered' => $this->request->step3['is_shared_offered'],
                'is_private_offered' => $this->request->step3['is_private_offered'],
                'is_double_offered' => $this->request->step3['is_double_offered'],

                'is_cabin_same_price' => $this->request->step3['is_cabin_same_price'],
                'price_per_person' => $this->request->step3['price_per_person'],
                'cabin_price' => $this->request->step3['cabin_price'],
                'early_bird_price' => $this->request->step3['early_bird_price'],
                'cabin_early_bird_price' => $this->request->step3['cabin_early_bird_price'],

                'disclaimer' => $this->request->step3['disclaimer'],

                'created_by' => $this->getUserId(),
                'updated_by' => $this->getUserId()
            ];
            if ($this->request->step2['ambassador_id'] != -1) {
                $itinerary_data['ambassador_id'] = $this->request->step2['ambassador_id'];
            } else {
                $itinerary_data['ambassador_id'] = null;
            }


            if ($this->request->step1['id'] != -1) {
                unset($itinerary_data['created_by']);
            }
            $itinerary = Itinerary::updateOrCreate(['id' => $this->request->step1['id']], $itinerary_data);

            $media_ids = collect($this->request->step1['itinerary_media'])->pluck('id')->toArray();
            $itinerary->itinerary_media()->sync($media_ids);
            $this->itineraryInclusions($itinerary);
            $this->itineraryExclusions($itinerary);
            $this->addOns($itinerary);

            $this->ambassadorItineraryAccessCodes($itinerary);
            $this->itineraryCabins($itinerary);
            $this->itineraryCrews($itinerary);

            DB::commit();
            return response($itinerary);
        } catch (\Exception $e) {
            DB::rollback();
            return response($e, 422);
        }
    }

    public function duplicate()
    {
        //return response( $this->request->id,500);
        DB::beginTransaction();
        try {
            $itinerary = Itinerary::find($this->request->id);
            $duplicate_itinerary = $itinerary->replicate();
            $duplicate_itinerary->is_displayed="false";
            $duplicate_itinerary->save();

            $itinerary_inclusions = collect($itinerary->inclusions)->pluck('id')->toArray();

            $duplicate_itinerary->inclusions()->sync($itinerary_inclusions);

            $itinerary_exclusions = collect($itinerary->exclusions)->pluck('id')->toArray();
            $duplicate_itinerary->exclusions()->sync($itinerary_exclusions);

            $this->duplicateAddOns($duplicate_itinerary);

            foreach ($itinerary->ambassador_itinerary_codes as $row) {
                $ambassador_itinerary_codes = [
                    'itinerary_id' => $duplicate_itinerary->id,
                    'ambassador_id' => $row['ambassador_id'],
                    'code' => $row['code'],
                    'discount_amount' => $row['discount_amount'],
                    'is_active' => $row['is_active'],
                    'created_by' => $this->getUserId(),
                    'updated_by' => $this->getUserId()
                ];
                AmbassadorItineraryCode::create($ambassador_itinerary_codes);
            }
            //return response($itinerary->itinerary_cabins);
            $cabins = [];
            foreach ($itinerary->itinerary_cabins as $row) {
                $cabins[$row['id']] = [
                    'boat_cabin_id' => $row['pivot']['boat_cabin_id'],
                    'price_per_person' => $row['pivot']['price_per_person'],
                    'cabin_price' => $row['pivot']['cabin_price'],
                    'early_bird_price' => $row['pivot']['early_bird_price'],
                    'cabin_early_bird_price' => $row['pivot']['cabin_early_bird_price'],
                ];
                if (!empty($row['pivot']['ambassador_allocation'])) {
                    $cabins[$row['id']]['ambassador_allocation'] = $row['pivot']['ambassador_allocation'];
                } else {
                    $cabins[$row['id']]['ambassador_allocation'] = 0;
                }
            }
            $duplicate_itinerary->itinerary_cabins()->sync($cabins);

            $crews = [];
            foreach ($itinerary->itinerary_crews as $row) {
                $crews[$row['id']] = [
                    'boat_crew_id' => $row['id'],
                    'crew_type_id' => $row['crew_type_id']
                ];
            }
            //return response($itinerary,500);
            $duplicate_itinerary->itinerary_crews()->sync($crews);
            DB::commit();
            return response($duplicate_itinerary);
        } catch (\Exception $e) {
            DB::rollback();
            return response($e, 422);
        }

    }

    public function itineraryInclusions($itinerary)
    {
        $itinerary_inclusions = collect($this->request->step4['itinerary_inclusions'])->where('is_selected', '=', true)->pluck('id')->toArray();
        $itinerary->inclusions()->sync($itinerary_inclusions);
    }

    public function itineraryExclusions($itinerary)
    {
        $itinerary_exclusions = collect($this->request->step4['itinerary_exclusions'])->where('is_selected', '=', true)->pluck('id')->toArray();
        $itinerary->exclusions()->sync($itinerary_exclusions);
    }

    public function addOns($itinerary)
    {
        ItineraryAddOn::where('itinerary_id', $itinerary['id'])->delete();
        $add_ons_array = [];
        foreach ($this->request->step4['itinerary_add_ons'] as $row) {
            if ($row['is_selected'] == true) {
                $add_on_data = array(
                    'itinerary_id' => $itinerary['id'],
                    'add_on_id' => $row['id'],
                    'price' => $row['price'],
                    'available_qty' => $row['available_qty']
                );
                array_push($add_ons_array, $add_on_data);
            }
        }
        ItineraryAddOn::insert($add_ons_array);
    }
    public function duplicateAddOns($itinerary)
    {
        ItineraryAddOn::where('itinerary_id', $itinerary['id'])->delete();
        $add_ons_array = [];
        foreach ($itinerary->add_ons as $row) {
                $add_on_data = array(
                    'itinerary_id' => $itinerary['id'],
                    'add_on_id' => $row['add_on_id'],
                    'price' => $row['price'],
                    'available_qty' => $row['available_qty']
                );
                array_push($add_ons_array, $add_on_data);
        }

        ItineraryAddOn::insert($add_ons_array);
    }


    public function ambassadorItineraryAccessCodes($itinerary)
    {
        $access_codes = $this->request->step2['access_codes'];
        foreach ($access_codes as $row) {
            if ($row['is_removed'] == 0) {
                $ambassador_itinerary_codes = [
                    'itinerary_id' => $itinerary->id,
                    'ambassador_id' => $row['ambassador_id'],
                    'code' => $row['code'],
                    'discount_amount' => $row['discount_amount'],
                    'is_active' => $row['is_active'],
                    'created_by' => $this->getUserId(),
                    'updated_by' => $this->getUserId()
                ];
                if ($row['id'] != -1) {
                    unset($ambassador_itinerary_codes['created_by']);
                }
                AmbassadorItineraryCode::updateOrCreate(
                    ['id' => $row['id']], $ambassador_itinerary_codes
                );
            } else {
                if ($row['id'] != -1) {
                    $access_code = AmbassadorItineraryCode::find($row['id']);
                    $access_code->delete();
                }
            }
        }
    }

    public function itineraryCabins($itinerary)
    {
        $cabins = $this->request->step3['itinerary_cabins'];
        $itinerary_cabins = [];
        foreach ($cabins as $row) {
            $itinerary_cabins[$row['id']] = [
                'price_per_person' => $row['price_per_person'],
                'cabin_price' => $row['cabin_price'],
            ];
            if(isset($row['cabin_early_bird_price']) && isset($row['early_bird_price'])){
                $itinerary_cabins[$row['id']]['cabin_early_bird_price'] = $row['cabin_early_bird_price'];
                $itinerary_cabins[$row['id']]['early_bird_price'] = $row['early_bird_price'];
            }
            if (!empty($row['ambassador_allocation'])) {
                $itinerary_cabins[$row['id']]['ambassador_allocation'] = $row['ambassador_allocation'];
            } else {
                $itinerary_cabins[$row['id']]['ambassador_allocation'] = 0;
            }
        }

        $itinerary->itinerary_cabins()->sync($itinerary_cabins);
    }

    public function itineraryCrews($itinerary)
    {
        $crews = $this->request->step2['itinerary_crews'];
        $itinerary_crews = [];
        foreach ($crews as $row) {
            $itinerary_crews[$row['crew_id']] = [
                'crew_type_id' => $row['crew_type_id']
            ];
        }
        $itinerary->itinerary_crews()->sync($itinerary_crews);
    }

    public function boatManifest()
    {
        $data = $this->request->all();
        $itinerary = Itinerary::with(
            [
                'itinerary_brand',
                'itinerary_country',
                'itinerary_boat',
                'port_from',
                'port_to',
                'inclusions',
                'exclusions',
                'add_ons',
                'itinerary_city_from',
                'itinerary_crews',
                'itinerary_city_to',
                'itinerary_bookings',
                'itinerary_ambassador'
            ])->find($data['itinerary_id']);

        $guest_titles = GuestTitle::all();
        $nationalities = Nationality::all();
        $diet_options = DietOption::all();
        $gender = Gender::all();
        $crew_types = CrewType::with('boat_crews')->get();
        $ambassadors = Ambassador::orderBy('first_name')->get();

        $result = array(
            'itinerary' => $itinerary,
            'guest_titles' => $guest_titles,
            'nationalities' => $nationalities,
            'diet_options' => $diet_options,
            'gender' => $gender,
            'crew_types' => $crew_types,
            'ambassadors' => $ambassadors
        );
        return response($result);
    }
    public function updateCrews()
    {
        $data = $this->request->all();
        $itinerary = Itinerary::find($data['itinerary_id']);
        if($data['ambassador_id']=="-1"){
            $itinerary->ambassador_id = NULL;
        }else{
            $itinerary->ambassador_id = $data['ambassador_id'];
        }

        $itinerary->save();
        $itinerary->itinerary_crews()->sync($data['final_crews']);
    }
    public function get()
    {
        $data = $this->request->all();
        $itinerary = Itinerary::with(
            [
                'itinerary_media',
                'itinerary_brand',
                'itinerary_country',
                'itinerary_boat',
                'port_from',
                'port_to',
                'inclusions',
                'exclusions',
                'add_ons',
                'itinerary_bookings',
                'itinerary_cabins',
                'itinerary_city_from',
                'itinerary_city_to',
                'ambassador',
                'ambassador_itinerary_codes' => function ($query) {
                    $query->where('is_active', true);
                }
            ]
        )->find($data['id']);
        $booking_add_ons = $this->getAddOnsUsage();

        $add_ons_balance = array();

        foreach($booking_add_ons as $row_booking_add_ons){
            if($row_booking_add_ons->itinerary_id==$itinerary['id'])
            {
                array_push($add_ons_balance,$row_booking_add_ons);

                foreach ($itinerary['add_ons'] as $add_on_key => $row_add_on){
                    if($row_add_on['add_on_id']==$row_booking_add_ons->add_on_id)
                        $itinerary['add_ons'][$add_on_key]['remaining_balance']=$row_booking_add_ons->remaining_balance;
                }
            }
        }
        $itinerary['booking_add_ons']=$add_ons_balance;

        $guest_titles = GuestTitle::all();
        $nationalities = Nationality::orderByRaw('is_preferred DESC, description')->get();
        $lead_sources = LeadSource::orderBy('description')->get();

        $guests = Guest::with('guests_list')->whereNotNull('user_id')->get();
        $result = array(
            'itinerary' => $itinerary,
            'guest_titles' => $guest_titles,
            'nationalities' => $nationalities,
            'lead_sources' => $lead_sources,
            'guests'=>$guests
        );
        return response($result);
    }
    public function getAddOnsUsage(){
        return DB::select('SELECT itinerary_add_ons.*,total_qty, (available_qty-IFNULL(total_qty,0)) AS remaining_balance 
                FROM itinerary_add_ons
                LEFT JOIN 
                (SELECT itinerary_id,add_on_id,SUM(qty) total_qty FROM
                (SELECT booking_add_ons.*, bookings.itinerary_id
                FROM booking_add_ons
                INNER JOIN bookings ON bookings.id=booking_add_ons.booking_id) TABLE1
                GROUP BY itinerary_id,add_on_id) TABLE2
                ON TABLE2.itinerary_id=itinerary_add_ons.itinerary_id AND TABLE2.add_on_id=itinerary_add_ons.add_on_id');
    }
}
