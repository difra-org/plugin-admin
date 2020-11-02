<?php

namespace Controller\Adm\Development;

class Config extends \Difra\Controller\Adm
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
        $config = \Difra\Config::getInstance();
        /** @var \DOMElement $configNode */
        $configNode = $this->root->appendChild($this->xml->createElement('configuration'));
        $conf = $config->getConfig();
        $configNode->setAttribute('current', var_export($conf, true));
        $configNode->setAttribute('diff', var_export($config->getDiff(), true));
    }

    public function resetAjaxAction()
    {
        \Difra\Config::getInstance()->reset();
        \Difra\Ajaxer::notify(\Difra\Locales::get('adm/config/reset-done'));
        \Difra\Ajaxer::refresh();
    }
}
