<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class PasswordResetRequest extends Notification
{
    use Queueable;
    protected $token;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($token)
    {
        $this->token = $token;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        //$url = url('/api/password/find/'.$this->token);
        $url = config('app.front_url').'password-reset/'.$this->token;
        return (new MailMessage)
                    ->from(config('app.from_email'), config('app.from_name'))
                    ->subject('Reset password instructions for Med Sailing Holidays account')
                    ->line('Someone has requested a link to change your password. You can do this through the button below.')
                    ->action('Change my Password', url($url))
                    ->line('If you didn\'t request this, please ignore this email. Your password won\'t change until you access the link above and create a new one.');
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            //
        ];
    }
}
