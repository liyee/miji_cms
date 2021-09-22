<?php

namespace App\Admin\Controllers;

use App\Models\Msg;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class MsgController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Msg';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Msg());
        $grid->disableExport();
        $grid->disableCreateButton();
        $grid->actions(function ($actions) {
            $actions->disableDelete(); // 去掉删除
            $actions->disableEdit();
        });
        $grid->batchActions(function ($batch) {
            $batch->disableDelete();
        });

        $grid->expandFilter();
        $grid->filter(function ($filter) {
            $filter->disableIdFilter(); // 去掉默认的id过滤器
            $filter->column(1 / 4, function ($filter) {
                $filter->like('email', 'Email');
            });
        });

        $grid->column('id', __('Id'));
        $grid->column('email', __('Email'));
        $grid->column('content', __('Content'));
        $grid->column('ip', __('Ip'));
        $grid->column('region', __('Region'));
        $grid->column('status', __('Status'))->using([0 => 'Close', 1 => 'Open']);
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
        $show = new Show(Msg::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('email', __('Email'));
        $show->field('content', __('Content'));
        $show->field('ip', __('Ip'));
        $show->field('region', __('Region'));
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
        $form = new Form(new Msg());

        $form->email('email', __('Email'));
        $form->textarea('content', __('Content'));
        $form->ip('ip', __('Ip'));
        $form->text('region', __('Region'));
        $form->switch('status', __('Status'))->default(1);

        return $form;
    }
}
