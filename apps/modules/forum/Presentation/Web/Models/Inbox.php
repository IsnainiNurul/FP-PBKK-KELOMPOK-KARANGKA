<?php

namespace Its\Example\Forum\Presentation\Web\Models;

use Phalcon\Mvc\Model;

class Inbox extends Model
{   public $id;
    public $judul;
    public $usernamepengirim;
    public $usernamepenerima;
    public $pesan;
    public $time;

}
