<?php

namespace Controller\Adm\Development;

class Database extends \Difra\Controller\Adm
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
        $node = $this->root->appendChild($this->xml->createElement('database'));
        // stats/mysql
        /** @var \DOMElement $mysqlNode */
        $mysqlNode = $node->appendChild($this->xml->createElement('mysql'));
        try {
            \Difra\MySQL\Parser::getStatusXML($mysqlNode);
        } catch (\Exception $ex) {
            $mysqlNode->setAttribute('error', $ex->getMessage() . ': ' . \Difra\MySQL::getInstance()->getError());
        }
        // stats of Unify tables
        $unifyNode = $node->appendChild($this->xml->createElement('unify'));
        \Difra\Unify\DBAPI::getDbStatusXML($unifyNode);
    }
}
