<?php

namespace App\Admin\Actions\Form;

use App\Models\Customer;
use Encore\Admin\Actions\BatchAction;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;

class Recommend extends BatchAction
{
    public $name = 'Recommend';
    protected $selector = '.recommend';

    public function handle(Collection $collection, Request $request)
    {
        $pn = $request->get('pn');
        $pn = array_filter($pn);
        $data = [];
        $date = date('Y-m-d H:i:s');
        if (!$pn) {
            return $this->response()->success('Choose at least one channel...')->refresh();
        }
        foreach ($collection as $model) {
            if (!$model) continue;
            $id = $model->id;
            foreach ($pn as $val) {
                $data[] = [
                    'pn' => $val,
                    'media_id' => $id,
                    'updated_at' => $date,
                    'created_at' => $date
                ];
            }
        }

        if ($data) {
            $result = \App\Models\Recommend::query()->upsert($data, ['pn_id', 'media_id'], ['updated_at']);
        }

        return $this->response()->success('Success message...')->refresh();
    }

    public function form()
    {
        $this->checkbox('pn', 'Pn')->options(Customer::selectPn());
    }

    public function html()
    {
        return "<a class='recommend btn btn-sm btn-info'><i class='fa fa-bullhorn'></i> " . $this->name . "</a>";
    }
}
