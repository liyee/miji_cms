<?php

namespace App\Admin\Actions\Form;

use Encore\Admin\Actions\RowAction;
use Illuminate\Database\Eloquent\Model;

class Download extends RowAction
{
    public $name = 'Download';

    public function handle(Model $model)
    {
        // $model ...
        $line = $model->toArray();
        $msg = 'Download Fail.';
        if (in_array($line['name'], ['yesAuto', 'wangbo'])){
            $downLoad = new \App\Admin\Fun\Download($line['url'], $line['name'], $line['apikey'], $line['apisecret']);
            $downLoad->init();
            $msg = 'Download Success.';
        }

        return $this->response()->success($msg)->refresh();
    }
}
