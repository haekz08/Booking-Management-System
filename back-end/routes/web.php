<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
use \App\Jobs\SendEmailJob;

Route::get('/', function () {
//    $current = \Carbon\Carbon::now();
//    $twelve_weeks_before = $current->addWeeks(12);
//    $limit = $twelve_weeks_before->toDateString();
//    $bookings = \App\Booking::with(
//        [
//            'itinerary_details' => function ($query) use ($limit) {
//                $query->with('itinerary_brand', 'itinerary_country', 'itinerary_city_from', 'itinerary_city_to')
//                    ->whereRaw("DATE_FORMAT(check_in_date, '%Y-%m-%d') <= '".$limit."'");
//            },
//            'guests' => function ($query) {
//                $query->with(['guest_details' => function ($query) {
//                    $query->with('nationality_details');
//                }]);
//            },
//            'add_ons' => function ($query) {
//                $query->with('details');
//            },
//            'user'
//        ])->where('balance_reminder_sent',  0)
//        ->get();
//    return $result = collect($bookings)->where('booking_balance.default','>', 0);
});
Route::get('/email_reminder', function () {
//    $current = \Carbon\Carbon::now();
//    $five_days_before = $current->subDays(5);
//    $limit = $five_days_before->toDateString();
//    $bookings = \App\Booking::with(
//        [
//            'itinerary_details' => function ($query) {
//                $query->with('itinerary_brand', 'itinerary_country', 'itinerary_city_from', 'itinerary_city_to');
//            },
//            'guests' => function ($query) {
//                $query->with(['guest_details' => function ($query) {
//                    $query->with('nationality_details');
//                }]);
//            },
//            'add_ons' => function ($query) {
//                $query->with('details');
//            },
//            'user'
//        ])->where('payment_reminder_sent',  0)
//        //->whereRaw("DATE_FORMAT(created_at, '%Y-%m-%d') = '2020-03-28'")
//        ->whereRaw("DATE_FORMAT(created_at, '%Y-%m-%d') <= '".$limit."'")
//        ->get();
//    $result = collect($bookings)->where('total_payment.default','<=', 0);
//    return $result;
//    foreach ($result as $key => $row) {
//        print_r($row);
//        echo '<hr>';
//    }

    //return $result;
});
Route::get('/email_reminder_view', function () {
//    $current = \Carbon\Carbon::now();
//    $five_days_before = $current->subDays(5);
//    $limit = $five_days_before->toDateString();
//    $bookings = \App\Booking::with(
//        [
//            'itinerary_details' => function ($query) {
//                $query->with('itinerary_brand', 'itinerary_country', 'itinerary_city_from', 'itinerary_city_to');
//            },
//            'guests' => function ($query) {
//                $query->with(['guest_details' => function ($query) {
//                    $query->with('nationality_details');
//                }]);
//            },
//            'add_ons' => function ($query) {
//                $query->with('details');
//            },
//            'user'
//        ])->where('payment_reminder_sent',  0)
//        //->whereRaw("DATE_FORMAT(created_at, '%Y-%m-%d') = '2020-03-28'")
//        ->whereRaw("DATE_FORMAT(created_at, '%Y-%m-%d') <= '".$limit."'")
//        ->get();
//    $result = collect($bookings)->where('total_payment.default','<=', 0)->first();
//    return view('email-tpl.payment_reminder',['data' => $result]);

    //return $result;
});
Route::get('/queue', function () {

//    $data = [
//        'name' => 'kim',
//        'message' => 'test'
//    ];
//    dispatch(new SendEmailJob($data));
//    return "sent";
});

Route::get('/system_routes', function(){
   $data = \App\Route::with('parent')->paginate(10);

   echo "<pre>";
   print_r($data->toArray()) ;
    echo "</pre>";
});

Route::get('/send_email', function(){
//    $data = [
//        'name' => 'kim',
//        'message' => 'test'
//    ];
//    Mail::to('kim@qallity.com')->send(new \App\Mail\SendEmail($data));
});

Route::get('/invoice-view', 'EmailController@invoiceView');
Route::get('/itinerary-view', 'EmailController@itineraryView');
Route::get('/boat-manifest-view', 'EmailController@boatManifestView');
Route::get('/crew-list-view', 'EmailController@crewListView');
Route::get('/account-credentials',function(){
    return view('email-tpl.account_credentials');
});