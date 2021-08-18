<?php

namespace App\Admin\Controllers;

use App\Models\Group;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class TestController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Group';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Group());

        $grid->column('id', __('Id'));
        $grid->column('title', __('Title'));
        $grid->column('parent_id', __('Parent id'));
        $grid->column('component_id', __('Component id'));
        $grid->column('show_more', __('Show more'));
        $grid->column('show_title', __('Show title'));
        $grid->column('img', __('Img'));
        $grid->column('des', __('Des'));
        $grid->column('sort', __('Sort'));
        $grid->column('status', __('Status'));
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
        $show = new Show(Group::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('title', __('Title'));
        $show->field('parent_id', __('Parent id'));
        $show->field('component_id', __('Component id'));
        $show->field('show_more', __('Show more'));
        $show->field('show_title', __('Show title'));
        $show->field('img', __('Img'));
        $show->field('des', __('Des'));
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
        $form = new Form(new Group());

        $form->text('title', __('Title'));
        $form->number('parent_id', __('Parent id'));
        $form->text('component_id', __('Component id'));
        $form->switch('show_more', __('Show more'))->default(1);
        $form->switch('show_title', __('Show title'))->default(1);
        $form->image('img', __('Img'));
        $form->text('des', __('Des'));
        $form->number('sort', __('Sort'))->default(1);
        $form->switch('status', __('Status'))->default(1);

        return $form;
    }
}
