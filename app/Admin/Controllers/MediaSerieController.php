<?php

namespace App\Admin\Controllers;

use App\Models\MediaSerie;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Http\Request;

class MediaSerieController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'MediaSerie';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new MediaSerie());

        $grid->column('id', __('Id'));
        $grid->column('media_id', __('Media id'));
        $grid->column('serie_id', __('Serie id'));
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
        $show = new Show(MediaSerie::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('media_id', __('Media id'));
        $show->field('serie_id', __('Serie id'));
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
        $form = new Form(new MediaSerie());
        $isCreate = $form->isCreating();
        if ($isCreate){
            $media_id = $_REQUEST['media_id'];
            $serie_id = $_REQUEST['serie_id'];
            $form->hidden('media_id', __('Media id'))->value($media_id);
            $form->hidden('serie_id', __('Serie id'))->value($serie_id);
        }else{
            $form->hidden('media_id', __('Media id'));
            $form->hidden('serie_id', __('Serie id'));
        }

        $form->number('sort', __('Sort'));
        $form->hidden('status', __('Status'))->value(1);

        $form->saved(function (Form $form) {
            return redirect('admin/medias');
        });

        return $form;
    }
}
