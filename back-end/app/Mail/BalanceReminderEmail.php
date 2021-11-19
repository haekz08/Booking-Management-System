<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class BalanceReminderEmail extends Mailable
{
    use Queueable, SerializesModels;

    private $data;

    public function __construct($data)
    {
        $this->data = $data;
    }
    public function build()
    {
        $email_to = (isset($this->data['custom_data'])) ? $this->data['custom_data']['email_to'] : $this->data['data']->user->email;
        $subject = (isset($this->data['custom_data'])) ? $this->data['custom_data']['subject']: 'Outstanding Balance Payment Reminder';

        return $this->from(config('app.from_email'), config('app.from_name'))
            ->replyTo(config('app.reply_to_email'), config('app.reply_to_name'))
            ->subject($subject)
            ->to($email_to)
            ->view('email-tpl.balance_reminder')
            ->with('data', $this->data);
    }
}
