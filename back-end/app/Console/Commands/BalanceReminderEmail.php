<?php

namespace App\Console\Commands;

use App\Jobs\SendBalanceEmailReminderJob;
use App\Jobs\SendCrewListEmailReminderJob;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Log;

class BalanceReminderEmail extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'email:balance-reminder';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'This command sends a reminder email to all guest who has still a balance';

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
        $twelve_weeks_before = $current->addWeeks(12);
        $limit = $twelve_weeks_before->toDateString();
        $bookings = \App\Booking::with(
            [
                'itinerary_details' => function ($query) use ($limit) {
                    $query->with('itinerary_brand', 'itinerary_country', 'itinerary_city_from', 'itinerary_city_to')
                        ->whereRaw("DATE_FORMAT(check_in_date, '%Y-%m-%d') <= '".$limit."'");
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
            ])->where('balance_reminder_sent',  0)
            ->get();
        $result = collect($bookings)->where('booking_balance.default','>', 0);
        foreach ($result as $key => $row) {
//            Log::debug($row->id);
            $data_array['data']=$row;
            dispatch(new SendBalanceEmailReminderJob($data_array));
            dispatch(new SendCrewListEmailReminderJob($data_array));
            $booking = \App\Booking::find($row->id);
            $booking->balance_reminder_sent = 1;
            $booking->crew_details_reminder_sent = 1;
            $booking->save();
        }

    }
}
