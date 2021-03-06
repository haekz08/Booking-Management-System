<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class MailInquiry extends Mailable
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
        return $this->from($this->data->inquiry['email'], $this->data->inquiry['email'])
            ->replyTo($this->data->inquiry['email'], $this->data->inquiry['full_name'])
            ->subject('Med Sailing Holidays - Inquiry')
            ->view('email-tpl.inquiry')
            ->with('data', $this->data);
    }
}
