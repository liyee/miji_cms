<?php

namespace App\Admin\Actions\Form;

use App\Jobs\ProcessJob;
use Encore\Admin\Actions\RowAction;
use Illuminate\Database\Eloquent\Model;

class Download extends RowAction
{
    public $name = 'Download';

    public function handle(Model $model)
    {
        // $model ...
        ProcessJob::dispatch(json_encode([
            'type' => 'download',
            'info' => $model->toArray()
        ]));

        $msg = 'Download is in progress.';

        return $this->response()->success($msg)->refresh();
    }
}
