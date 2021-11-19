<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class MailDefaultAccountCredentials extends Mailable
{
    use Queueable, SerializesModels;

    public $data;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($data)
    {
        $this->data = $data;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->from(config('app.from_email'), config('app.from_name'))
            ->replyTo(config('app.reply_to_email'), config('app.reply_to_name'))
            ->subject('Med Sailing Holidays – Online Booking System')
            ->to($this->data['data']->user->email)
            ->view('email-tpl.default_account_credentials')
            ->with('data', $this->data);
    }
}
