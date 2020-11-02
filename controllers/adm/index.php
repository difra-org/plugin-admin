<?php

namespace Controller\Adm;

use Difra\Controller;
use Difra\View\HttpError;

class Index extends \Difra\Controller\Adm
{
    public function indexAction()
    {
        if (Controller::hasUnusedParameters()) {
            throw new HttpError(404);
        }
        \Difra\View::redirect('/adm/status');
    }
}
