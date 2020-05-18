<?php

namespace Its\Common\Controller;
use Phalcon\Mvc\Controller;

class LandingController extends Controller
{

    public function indexAction()
    {
        // return '404 - not found';
    }

    public function serverErrorAction()
    {
        echo 'Server Error';
    }

    public function errorAction()
    {
        echo 'Terjadi Error';
    }

}