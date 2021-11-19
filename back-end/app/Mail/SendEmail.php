<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class SendEmail extends Mailable
{
    use Queueable, SerializesModels;

    private $data;
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
        return $this->from('medsailingholidays@doNotReply.com', 'medsailingholidays@doNotReply.com')
            ->replyTo('markg@ollhome.com', 'Reply Guy')
            ->to('jeofer@keeptracksolutions.com')
            ->subject('Test Email')
            ->view('send_email')
            ->with('data', $this->data);
    }
}
