<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Support\Facades\Log;

class BookingNotificationEmail extends Mailable
{
    use Queueable, SerializesModels;

    private $data;

    public function __construct($data)
    {
        $this->data = $data;
    }
    public function build()
    {
        return $this->from(config('app.from_email'), config('app.from_name'))
            ->replyTo(config('app.reply_to_email'), config('app.reply_to_name'))
            ->subject('Payment Notification')
            ->to(config('app.notification_email_receiver'))
            ->view('email-tpl.booking_notification')
            ->with('data', $this->data);

    }
}
