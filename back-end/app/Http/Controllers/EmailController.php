<?php

namespace App\Http\Controllers;

use App\Booking;
use App\Itinerary;
use App\Jobs\SendCrewListEmailReminderJob;
use App\Jobs\SendEmailDefaultAccountCredentialsJob;
use App\Jobs\SendEmailReminderJob;
use App\Jobs\SendBalanceEmailReminderJob;
use App\Mail\MailBoatManifest;
use App\Mail\MailCrewList;
use App\Mail\MailInquiry;
use App\Mail\MailInvoice;
use App\Mail\MailItinerary;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use PDF;

class EmailController extends Controller
{
    public function sendInvoice(Request $request){
        $booking = Booking::with(
            [
                'itinerary_details'=>function($query){
                    $query->with('itinerary_brand','itinerary_country','itinerary_boat','port_from','port_to','inclusions','exclusions','add_ons','itinerary_cabins','itinerary_cabins_for_booking','itinerary_city_from','itinerary_city_to');
                },
                'guests'=>function($query){
                    $query->with(
                        [
                            'guest_details'=>function($query){
                                $query->with(
                                    ['nationality_details']);
                            },
                            'guest_cabin_details'
                        ]);
                },
                'add_ons'=>function($query){
                    $query->with('details');
                },
                'user',
                'active_invoice'=>function($query){
                    $query->with(['payments'=>function($query){
                        $query->with('payment_type');
                    }]);
                },
                'other_invoices',
                'invoices'=>function($query){
                    $query->with(['payments'=>function($query){
                        $query->with('payment_type');
                    }]);
                }
            ])->find($request->id);

//        return response($booking);
        Mail::to($booking->user->email)->send(new MailInvoice($booking));
//
//        $pdf = PDF::loadView('pdf-tpl.test', ['data' => $booking]);
//
//        $content = $pdf->download()->getOriginalContent();
//        Storage::put('name.pdf',$content);
//        try{
//            Mail::send('email-tpl.test', ['data' => $booking], function($message)use($booking,$pdf) {
//                $message->to($booking->user->email, $booking->user->full_name)
//                    ->subject('Medsailing - MailInvoice')
//                    ->attachData($pdf->output(), "invoice.pdf");
//            });
//        }catch(JWTException $exception){
//            $this->serverstatuscode = "0";
//            $this->serverstatusdes = $exception->getMessage();
//        }
//        if (Mail::failures()) {
//            $this->statusdesc  =   "Error sending mail";
//            $this->statuscode  =   "0";
//
//        }else{
//
//            $this->statusdesc  =   "Message sent Succesfully";
//            $this->statuscode  =   "1";
//        }
//        return response()->json(compact('this'));
    }

    public function sendInquiry(Request $request){
//        return response($request->inquiry['email']);
        Mail::to('info@medsailingholidays.com')->send(new MailInquiry($request));
    }

    public function inquiryFormView(){
        return view('email-tpl.inquiry', ['form-data']);
    }

    public function sendItinerary(Request $request){
        $booking = Booking::with(
            [
                'itinerary_details'=>function($query){
                    $query->with('itinerary_brand','itinerary_country','itinerary_boat','port_from','port_to','inclusions','exclusions','add_ons','itinerary_cabins','itinerary_cabins_for_booking','itinerary_city_from','itinerary_city_to');
                },
                'guests'=>function($query){
                    $query->with(
                        [
                            'guest_details'=>function($query){
                                $query->with(
                                    ['nationality_details']);
                            },
                            'guest_cabin_details'
                        ]);
                },
                'add_ons'=>function($query){
                    $query->with('details');
                },
                'user',
                'active_invoice'=>function($query){
                    $query->with(['payments'=>function($query){
                        $query->with('payment_type');
                    }]);
                },
                'other_invoices',
                'invoices'=>function($query){
                    $query->with(['payments'=>function($query){
                        $query->with('payment_type');
                    }]);
                }
            ])->find($request->id);

        Mail::to($booking->user->email)->send(new MailItinerary($booking));
    }

    public function invoiceView(){

        $booking = Booking::with(
            [
                'itinerary_details'=>function($query){
                    $query->with('itinerary_brand','itinerary_country','itinerary_boat','port_from','port_to','inclusions','exclusions','add_ons','itinerary_cabins','itinerary_cabins_for_booking','itinerary_city_from','itinerary_city_to');
                },
                'guests'=>function($query){
                    $query->with(
                        [
                            'guest_details'=>function($query){
                                $query->with(
                                    ['nationality_details']);
                            },
                            'guest_cabin_details'
                        ]);
                },
                'add_ons'=>function($query){
                    $query->with('details');
                },
                'user',
                'active_invoice'=>function($query){
                    $query->with(['payments'=>function($query){
                        $query->with('payment_type');
                    }]);
                },
                'other_invoices',
                'invoices'=>function($query){
                    $query->with(['payments'=>function($query){
                        $query->with('payment_type');
                    }]);
                }
            ])->find(2);

        return view('email-tpl.invoice', ['data' => $booking]);
    }


    public function itineraryView(){
        $booking = Booking::with(
            [
                'itinerary_details'=>function($query){
                    $query->with('itinerary_brand','itinerary_country','itinerary_boat','port_from','port_to','inclusions','exclusions','add_ons','itinerary_cabins','itinerary_cabins_for_booking','itinerary_city_from','itinerary_city_to');
                },
                'guests'=>function($query){
                    $query->with(
                        [
                            'guest_details'=>function($query){
                                $query->with(
                                    ['nationality_details']);
                            },
                            'guest_cabin_details'
                        ]);
                },
                'add_ons'=>function($query){
                    $query->with('details');
                },
                'user',
                'active_invoice'=>function($query){
                    $query->with(['payments'=>function($query){
                        $query->with('payment_type');
                    }]);
                },
                'other_invoices',
                'invoices'=>function($query){
                    $query->with(['payments'=>function($query){
                        $query->with('payment_type');
                    }]);
                }
            ])->find(2);

        return view('email-tpl.itinerary', ['data' => $booking]);
    }

    public function boatManifestView(){

        $boat_manifest =  Itinerary::with(
            [
                'itinerary_ambassador',
                'itinerary_brand',
                'itinerary_country',
                'itinerary_boat',
                'port_from',
                'port_to',
                'inclusions',
                'exclusions',
                'add_ons',
                'itinerary_city_from',
                'itinerary_city_to',
                'itinerary_bookings'
            ])->find(12);
        return view('email-tpl.boat_manifest', ['data' => $boat_manifest]);
    }

    public function sendBoatManifest(Request $request){
        $boat_manifest =  Itinerary::with(
            [
                'itinerary_ambassador',
                'itinerary_brand',
                'itinerary_country',
                'itinerary_boat',
                'port_from',
                'port_to',
                'inclusions',
                'exclusions',
                'add_ons',
                'itinerary_city_from',
                'itinerary_city_to',
                'itinerary_bookings'
            ])->find($request->id);

        Mail::to('haekz08@gmail.com')->send(new MailBoatManifest($boat_manifest));
//        if(!empty($boat_manifest->itinerary_ambassador->email)){
//            Mail::to($boat_manifest->itinerary_ambassador->email)->send(new MailBoatManifest($boat_manifest));
//        }
    }

    public function crewListView(){
        $boat_manifest =  Itinerary::with(
            [
                'itinerary_ambassador',
                'itinerary_brand',
                'itinerary_country',
                'itinerary_boat',
                'port_from',
                'port_to',
                'inclusions',
                'exclusions',
                'add_ons',
                'itinerary_city_from',
                'itinerary_city_to',
                'itinerary_bookings'
            ])->find(12);

        return view('email-tpl.crew_list', ['data' => $boat_manifest]);
    }

    public function sendCrewList(Request $request){
        $validator = Validator::make(['email' => $request->email], [
            'email' => 'required|email',
        ]);

        if ($validator->fails()) {
            $errors = $validator->errors();
            return response($errors->first('email'),422);
        }

        $boat_manifest =  Itinerary::with(
            [
                'itinerary_ambassador',
                'itinerary_brand',
                'itinerary_country',
                'itinerary_boat',
                'port_from',
                'port_to',
                'inclusions',
                'exclusions',
                'add_ons',
                'itinerary_city_from',
                'itinerary_city_to',
                'itinerary_bookings'
            ])->find($request->id);

        if(!empty($request->email)){
            Mail::to($boat_manifest->itinerary_ambassador->email)->send(new MailCrewList($boat_manifest));
        }
    }
    public function sendDepositReminder(Request $request){
        $data = $request->all();
        $booking = Booking::with(
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
            ])->find($data['booking_id']);
        $custom_data = array(
            'subject'=>$data['subject'],
            'booking_id'=>$data['booking_id'],
            'content'=>$data['content'],
            'email_to'=>$data['email_to'],
        );
        $result['custom_data']=$custom_data;
        $result['data']=$booking;
        dispatch(new SendEmailReminderJob($result));
    }

    public function sendBalanceReminder(Request $request){
        $data = $request->all();
        $booking = Booking::with(
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
            ])->find($data['booking_id']);
        $custom_data = array(
            'subject'=>$data['subject'],
            'booking_id'=>$data['booking_id'],
            'content'=>$data['content'],
            'email_to'=>$data['email_to'],
        );
        $result['custom_data']=$custom_data;
        $result['data']=$booking;
        dispatch(new SendBalanceEmailReminderJob($result));
    }
    public function sendCrewListReminder(Request $request){
        $data = $request->all();
        $booking = Booking::with(
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
            ])->find($data['booking_id']);
        $custom_data = array(
            'subject'=>$data['subject'],
            'booking_id'=>$data['booking_id'],
            'content'=>$data['content'],
            'email_to'=>$data['email_to'],
        );
        $result['custom_data']=$custom_data;
        $result['data']=$booking;
        dispatch(new SendCrewListEmailReminderJob($result));
    }
    public function sendDefaultCredentials(Request $request){
        $data = $request->all();
        $booking = Booking::with(
            [
                'user'
            ])->find($data['id']);
        $result['data']=$booking;
        dispatch(new SendEmailDefaultAccountCredentialsJob($result));
    }
}
