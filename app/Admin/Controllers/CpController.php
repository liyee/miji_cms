<?php

namespace App\Admin\Controllers;

use App\Admin\Actions\Form\Download;
use App\Models\Cp;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Http\Request;

class CpController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'CP';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Cp());

        $grid->disableExport();
        $grid->disableFilter();
        $grid->disableBatchActions(); // 去掉批量操作
        $grid->actions(function ($actions) {
            $actions->disableDelete(); // 去掉删除
            $actions->add(new Download());
        });
        $grid->quickSearch('name')->placeholder('name');

        $grid->column('id', __('Id'));
        $grid->column('name', __('Name'))->editable();
        $grid->column('category', __('Category'));
        $grid->column('des', __('Des'));
        $grid->column('country', __('Country'));
        $grid->column('status', __('Status'))->editable('select',[0 => 'OFF', 1 => 'ON']);
        $grid->column('start', __('Start'))->editable('date');
        $grid->column('end', __('End'))->date('Y-m-d');
        $grid->column('created_at', __('Created at'))->hide();
        $grid->column('updated_at', __('Updated at'))->hide();

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
        $show = new Show(Cp::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('Name'));
        $show->field('category', __('Category'));
        $show->field('des', __('Des'));
        $show->field('country', __('Country'));
        $show->field('status', __('Status'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Cp());

        $form->text('name', __('Name'))->setWidth(3);
        $form->text('category', __('Category'));
        $form->datetime('start', __('Start'));
        $form->datetime('end', __('End'));
        $form->text('des', __('Des'));
        $form->text('country', __('Country'));
        $form->switch('status', __('Status'))->default(1);

        return $form;
    }
}
