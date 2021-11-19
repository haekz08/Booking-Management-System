<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class MailCrewList extends Mailable
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
        return $this->from('medsailingholidays@doNotReply.com', 'medsailingholidays@doNotReply.com')
            ->subject('Med Sailing Holidays - Crew List')
            ->view('email-tpl.crew_list')
            ->with('data', $this->data);
    }
}
