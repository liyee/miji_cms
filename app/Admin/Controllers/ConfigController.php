<?php

namespace App\Admin\Controllers;

use App\Models\Config;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class ConfigController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Config';
    protected $type = ['1' => 'Language', 2 => 'Pay Mark', 3 => 'Feature Content Mark', 4 => 'Clarity Mark', 5 => 'Operation Mark', 6 => 'Component', 7 => 'Mode', 8 => 'Memory'];
    protected $status = [0 => 0, 1 => 1, 2 => 2];

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Config());

        $grid->disableFilter();
        $grid->selector(function (Grid\Tools\Selector $selector) {
            $selector->select('type', 'Type', $this->type);
        });

        $grid->column('id', __('Id'));
        $grid->column('name', __('Name'));
        $grid->column('value', __('Value'));
        $grid->column('description', __('Description'));
        $grid->column('type', __('Type'))->using($this->type);
        $grid->column('status', __('Status'))->using($this->status);
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
        $show = new Show(Config::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('Name'));
        $show->field('value', __('Value'));
        $show->field('description', __('Description'));
        $show->field('type', __('Type'))->using($this->type);
        $show->field('status', __('Status'))->using($this->status);
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
        $form = new Form(new Config());

        $form->text('name', __('Name'));
        $form->text('value', __('Value'));
        $form->textarea('description', __('Description'));
        $form->select('type', __('Type'))->options($this->type)->default(1);
        $form->switch('status', __('Status'))->default(1);

        return $form;
    }
}
