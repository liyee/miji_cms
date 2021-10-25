<?php

namespace App\Admin\Controllers;

use App\Models\Customer;
use App\Models\Recommend;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class RecommendController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Recommend';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Recommend());
        $grid->disableExport();
        $grid->disableCreateButton();
        $grid->selector(function (Grid\Tools\Selector $selector) {
            $selector->select('pn', 'PN', Customer::selectPn());
        });
        $grid->model()->orderBy('sort')->orderBy('id');

        $grid->column('id', __('Id'))->sortable();
        $grid->column('pn', __('Pn'))->ucfirst();
        $grid->column('media.title', __('title'));
        $grid->column('media.img_original', __('title'))->image();
        $grid->column('sort', __('Sort'))->editable();
        $grid->column('status', __('Status'))->radio([0 => 'OFF', 1 => 'ON']);
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
        $show = new Show(Recommend::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('pn', __('Pn'));
        $show->field('media_id', __('Media id'));
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
        $form = new Form(new Recommend());

        $form->text('pn', __('Pn'));
        $form->number('media_id', __('Media id'));
        $form->number('sort', __('Sort'));
        $form->switch('status', __('Status'))->default(1);

        return $form;
    }
}
