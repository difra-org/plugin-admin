<?php

namespace Controller\Adm\Status;

class Unify extends \Difra\Controller\Adm
{
    /**
     * Create table for Unify object
     *
     * @param \Difra\Param\AnyString $name
     */
    public function createAjaxAction(\Difra\Param\AnyString $name)
    {
        try {
            /** @var \Difra\Unify\Item $class */
            $class = \Difra\Unify\Storage::getClass($name->val());
            $class::createDb();
        } catch (\Difra\Exception $ex) {
            \Difra\Ajaxer::notify($ex->getMessage());
        }
        \Difra\Ajaxer::refresh();
    }

    /**
     * Alter table for Unify object
     *
     * @param \Difra\Param\AnyString $name
     */
    public function alterAjaxAction(\Difra\Param\AnyString $name)
    {
        try {
            /** @var \Difra\Unify\Item $class */
            $class = \Difra\Unify\Storage::getClass($name->val());
            $status = $class::getObjDbStatus();
            if ($status['status'] == 'alter') {
                \Difra\MySQL::getInstance()->query($status['sql']);
            }
        } catch (\Difra\Exception $ex) {
            \Difra\Ajaxer::notify($ex->getMessage());
        }
        \Difra\Ajaxer::refresh();
    }
}
