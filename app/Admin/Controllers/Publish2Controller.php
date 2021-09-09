<?php

namespace App\Admin\Controllers;

use App\Libraries\Status;
use App\Models\MediaGroup;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class Publish2Controller extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'MediaGroup';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $group_id = request('group_id', 0);
        $grid = new Grid(new MediaGroup());
        $grid->model()->where('group_id', $group_id);

//        $grid->column('id', __('Id'));
        $grid->column('media_id', __('Media id'));
        $grid->column('group_id', __('Group id'));
        $grid->column('sort', __('Sort'))->editable();
        $grid->column('status', __('Status'))->switch([
            'ON' => ['value' => 1, 'text' => '打开', 'color' => 'default'],
            'OFF' => ['value' => 0, 'text' => '关闭', 'color' => 'primary']
        ]);
        $grid->column('updated_at', __('Updated at'));
        $grid->column('created_at', __('Created at'));

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(MediaGroup::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('media_id', __('Media id'));
        $show->field('group_id', __('Group id'));
        $show->field('sort', __('Sort'));
        $show->field('status', __('Status'));
        $show->field('updated_at', __('Updated at'));
        $show->field('created_at', __('Created at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new MediaGroup());

        $form->number('media_id', __('Media id'));
        $form->number('group_id', __('Group id'));
        $form->number('sort', __('Sort'));
        $form->switch('status', __('Status'))->default(1);

        return $form;
    }
}
