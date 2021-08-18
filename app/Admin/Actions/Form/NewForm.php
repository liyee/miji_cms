<?php

namespace App\Admin\Actions\Form;

use Encore\Admin\Actions\Action;
use Illuminate\Http\Request;

class NewForm extends Action
{
    protected $selector = '.new-form';

    public function handle(Request $request)
    {
        // $request ...
        return $this->response()->success('Success message...')->refresh();
    }

    public function html()
    {
        $new = trans('admin.new');
        $class = $_REQUEST['class'] ?? 0;

        return <<<HTML
<div class="btn-group pull-right grid-create-btn" style="margin-right: 10px">
        <a class="btn btn-sm btn-default new-form" href="medias/create?class={$class}">
        <i class="fa fa-plus"></i><span class="hidden-xs">&nbsp;&nbsp;{$new}</span>
        </a>
</div>
HTML;
    }
}
