<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group([
    'namespace' => 'Auth',
    'middleware' => 'api',
    'prefix' => 'password'
], function () {
    Route::post('create', 'PasswordResetController@create');
    Route::get('find', 'PasswordResetController@find');
    Route::post('reset', 'PasswordResetController@reset');
});

Route::group(['prefix' => 'send_email', 'middleware' => 'auth:api'], function() {
    Route::post("/invoice", "EmailController@sendInvoice");
    Route::post("/itinerary", "EmailController@sendItinerary");
    Route::post("/boat_manifest", "EmailController@sendBoatManifest");
    Route::post("/crew_list", "EmailController@sendCrewList");
    Route::post("/inquiry", "EmailController@sendInquiry");
    Route::post("/deposit_reminder", "EmailController@sendDepositReminder");
    Route::post("/balance_reminder", "EmailController@sendBalanceReminder");
    Route::post("/crew_list_reminder", "EmailController@sendCrewListReminder");
    Route::post("/default_credentials", "EmailController@sendDefaultCredentials");
});

Route::group(['prefix' => 'maintenance', 'middleware' => 'auth:api'], function() {

    Route::get("/routes/get_all","RouteController@getAll");
    Route::post("/routes/save_route", "RouteController@saveRoute");
    Route::get("/routes/get_route", "RouteController@getRoute");

    //LEAD SOURCES
    Route::get("/lead_sources/get_all", "LeadSourceController@getAll");
    Route::post("/lead_sources/save", "LeadSourceController@save");
    Route::delete("/lead_sources/delete", "LeadSourceController@delete");

    //GENDER
    Route::get("/genders/get_all", "GenderController@getAll");
    Route::post("/genders/save", "GenderController@save");
    Route::delete("/genders/delete", "GenderController@delete");

    //DIET OPTIONS
    Route::get("/diet_options/get_all", "DietOptionController@getAll");
    Route::post("/diet_options/save", "DietOptionController@save");
    Route::delete("/diet_options/delete", "DietOptionController@delete");

    //GENERAL SETTINGS
    Route::post("/general_settings/save", "GeneralSettingController@save");
    Route::get("/general_settings/get", "GeneralSettingController@get");

    //BOAT MODELS
    Route::get("/boat_models/get_all","BoatModelController@getAll");
    Route::post("/boat_models/save","BoatModelController@save");
    Route::delete("/boat_models/delete","BoatModelController@delete");

    //BOAT TYPES
    Route::get("/boat_types/get_all","BoatTypeController@getAll");
    Route::post("/boat_types/save","BoatTypeController@save");
    Route::delete("/boat_types/delete","BoatTypeController@delete");

    //BOAT BRANDS
    Route::get("/boat_brands/get_all","BoatBrandController@getAll");
    Route::post("/boat_brands/save","BoatBrandController@save");
    Route::delete("/boat_brands/delete","BoatBrandController@delete");

    //BOAT CABIN TYPES
    Route::get("/cabin_types/get_all","CabinTypeController@getAll");
    Route::post("/cabin_types/save","CabinTypeController@save");
    Route::delete("/cabin_types/delete","CabinTypeController@delete");

    //NATIONALITIES
    Route::get("/nationalities/get_all","NationalityController@getAll");
    Route::post("/nationalities/save","NationalityController@save");
    Route::delete("/nationalities/delete","NationalityController@delete");

    //GUEST TITLES
    Route::get("/guest_titles/get_all","GuestTitleController@getAll");
    Route::post("/guest_titles/save","GuestTitleController@save");
    Route::delete("/guest_titles/delete","GuestTitleController@delete");

    //PAYMENT TYPES
    Route::get("/payment_types/get_all","PaymentTypeController@getAll");
    Route::post("/payment_types/save","PaymentTypeController@save");
    Route::delete("/payment_types/delete","PaymentTypeController@delete");

    //ID CARD TYPES
    Route::get("/identification_card_types/get_all","IdentificationCardTypeController@getAll");
    Route::post("/identification_card_types/save","IdentificationCardTypeController@save");
    Route::delete("/identification_card_types/delete","IdentificationCardTypeController@delete");

    //CREW TYPES
    Route::get("/crew_types/get_all","CrewTypeController@getAll");
    Route::post("/crew_types/save","CrewTypeController@save");
    Route::delete("/crew_types/delete","CrewTypeController@delete");

    //BOAT CREWS
    Route::get("/boat_crews/get_all","BoatCrewController@getAll");
    Route::post("/boat_crews/save","BoatCrewController@save");
    Route::delete("/boat_crews/delete","BoatCrewController@delete");

    //INCLUSIONS
    Route::get("/inclusions/get_all","InclusionController@getAll");
    Route::post("/inclusions/save","InclusionController@save");
    Route::delete("/inclusions/delete","InclusionController@delete");

    //EXCLUSIONS
    Route::get("/exclusions/get_all","ExclusionController@getAll");
    Route::post("/exclusions/save","ExclusionController@save");
    Route::delete("/exclusions/delete","ExclusionController@delete");

    //ADD ONS
    Route::get("/add_ons/get_all","AddOnController@getAll");
    Route::post("/add_ons/save","AddOnController@save");
    Route::post("/add_ons/delete","AddOnController@delete");

    //ITINERARY BRANDS
    Route::get("/itinerary_brands/get_all","ItineraryBrandController@getAll");
    Route::post("/itinerary_brands/save","ItineraryBrandController@save");
    Route::delete("/itinerary_brands/delete","ItineraryBrandController@delete");

    //ITINERARY COUNTRIES
    Route::get("/itinerary_countries/get_all","ItineraryCountryController@getAll");
    Route::post("/itinerary_countries/save","ItineraryCountryController@save");
    Route::delete("/itinerary_countries/delete","ItineraryCountryController@delete");

    //BOAT SETTINGS
    Route::get("/boats/get_all","BoatController@getAll");
    Route::get("/boats/get_boat_setup_options","BoatController@getBoatSetupOptions");
    Route::post("/boats/save","BoatController@save");
    Route::delete("/boats/delete","BoatController@delete");

    //CABIN TYPES
    Route::get("/cabin_types/get_all","CabinTypeController@getAll");

    //ITINERARY CITY
    Route::get("/itinerary_city/get_all", "ItineraryCityController@getAll");
    Route::post("/itinerary_city/save", "ItineraryCityController@save");
    Route::delete("/itinerary_city/delete", "ItineraryCityController@delete");

    //BOAT AMBASSADORS
    Route::get("/ambassadors/get_all","AmbassadorController@getAll");
    Route::post("/ambassadors/save","AmbassadorController@save");
    Route::post("/ambassadors/save_image","AmbassadorController@saveImage");
    Route::delete("/ambassadors/delete","AmbassadorController@delete");

    //GUESTS
    Route::post('/guests/save', "GuestController@save");

    //USERS
    Route::post('/user/validate_password', 'UserController@validateOldPassword');
    Route::post('/user/save_new_password', 'UserController@saveNewPassword');
    Route::post('/user/upload_profile_picture', 'UserController@uploadProfilePicture');
});

Route::group(['middleware' => 'auth:api'], function() {

    //REFUND
    Route::get("/refund/get_all", "RefundController@getAll");
    Route::get("/refund/get", "RefundController@get");
    Route::post("/refund/save", "RefundController@save_per_guest");
    Route::post("/refund/save_per_booking", "RefundController@save_per_booking");
    Route::put("/refund/approve", "RefundController@approve");

    //MEDIA
    Route::get("/media/get_all","MediaController@getAll");
    //Route::post("/media/save","MediaController@save");
    //Route::post("/media/save2","MediaController@save2");

    Route::post("/media/save_media","MediaController@saveMedia");
    //Route::post("/media/delete","ExclusionController@delete");

    Route::get("/bookings/get_all","BookingController@getAll");
    Route::get("/bookings/get","BookingController@get");
    Route::post('/bookings/save_invoice_payment', "BookingController@saveInvoicePayment");
    Route::post('/bookings/save_invoice_payment_paypal', "BookingController@saveInvoicePaymentPaypal");
    Route::post('/bookings/save_guest_booking_details', "BookingController@saveGuestBookingDetails");
    Route::put('/bookings/update_cabin_assignment', "BookingController@updateCabinAssignment");

    //updating booking details
    Route::post("/booking/update","BookingController@update");

    Route::get("/user/get", "Api\AuthController@get");
});

Route::group(['prefix' => 'itinerary','middleware' => 'auth:api'], function() {

    Route::get('/step1_get_options', "ItineraryController@step1Options");
    Route::get('/step2_get_all', "ItineraryController@step2GetAll");
    Route::get('/step3_get_all', "ItineraryController@step3GetAll");
    Route::get('/step4_get_options', "ItineraryController@step4Options");

    Route::post('/save', "ItineraryController@save");
    Route::post('/duplicate', "ItineraryController@duplicate");
    Route::get('/get_all', "ItineraryController@getAll");
    Route::get('/get', "ItineraryController@get");


    Route::get('/get_boat_manifest', "ItineraryController@boatManifest");
    Route::get('/get_crew_list', "ItineraryController@boatManifest");

    Route::post('/update_crews', "ItineraryController@updateCrews");
});

Route::group(['middleware' => 'auth:api'], function() {

    Route::post("/booking/cancel","BookingController@cancel");
    Route::post("/booking/admin_booking","BookingController@adminBooking");
});
//Route::middleware('auth:api')->get('/user', function (Request $request) {
//    return $request->user();
//});

//Route::middleware('auth:api')->get('/user/get', 'Api\AuthController@get');

Route::post('oauth/token', 'Api\AuthController@auth');
Route::post('/register', 'Api\AuthController@register');
//Route::post('/login', 'Api\AuthController@login');

Route::get("/booking/itinerary_brands","BookingController@getAllItineraryBrands");
Route::get("/booking/itinerary_countries","BookingController@getAllItineraryCountries");
Route::get("/booking/itineraries","BookingController@getAllItineraries");
Route::post("/booking/save","BookingController@save");
