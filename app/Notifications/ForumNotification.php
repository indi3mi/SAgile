<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class ForumNotification extends Notification
{
    use Queueable;
    protected $forumLink,$forumTitle,$commenter;
    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($forumLink,$forumTitle,$commenter)
    {
        $this->forumLink = $forumLink;
        $this->forumTitle = $forumTitle;
        $this->commenter = $commenter;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['database'];
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
            'forumLink' => $this->forumLink,
            'forumTitle' => $this->forumTitle,
            'commenter' => $this->commenter
        ];
    }
}