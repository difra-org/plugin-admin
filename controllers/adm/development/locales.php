<?php

namespace Controller\Adm\Development;

class Locales extends \Difra\Controller
{
    /**
     * Dispatcher
     * @throws \Difra\View\HttpError
     */
    public function dispatch()
    {
        if (!\Difra\Debugger::isEnabled()) {
            throw new \Difra\View\HttpError(404);
        }
    }

    public function indexAction()
    {
        $localeNode = $this->root->appendChild($this->xml->createElement('locales'));
        \Difra\Adm\LocaleManage::getInstance()->getLocalesTreeXML($localeNode);
    }
}
