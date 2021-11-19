<?php

namespace App\Console\Commands;

use App\Jobs\SendEmailReminderJob;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Log;

class PaymentReminderEmail extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'email:payment-reminder';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'This command sends a reminder email to all guest who have not made any payment yet';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $current = \Carbon\Carbon::now();
        $five_days_before = $current->subDays(5);
        $limit = $five_days_before->toDateString();
        $bookings = \App\Booking::with(
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
            ])->where('payment_reminder_sent',  0)
            //->whereRaw("DATE_FORMAT(created_at, '%Y-%m-%d') = '2020-03-28'")
            ->whereRaw("DATE_FORMAT(created_at, '%Y-%m-%d') <= '".$limit."'")
            ->get();
        $result = collect($bookings)->where('total_payment.default','<=', 0);
        foreach ($result as $key => $row) {
//            Log::debug($row->id);
            $data_array['data']=$row;
            dispatch(new SendEmailReminderJob($data_array));
            $booking = \App\Booking::find($row->id);
            $booking->payment_reminder_sent = 1;
            $booking->save();

        }

    }
}
