<?php

namespace App\Admin\Controllers;

use App\Libraries\Status;
use App\Models\MediaGroup;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Cache;

class PublishController extends AdminController
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
        $grid->disableCreateButton();
        $grid->disableActions();
        $grid->disableExport();

        $grid->model()->from('m_media_group as MG')
            ->leftJoin('m_media as M', 'MG.media_id', '=', 'M.id')
            ->leftJoin('m_group as G', 'MG.group_id', '=', 'G.id')
            ->where(['G.id' => $group_id, 'M.status' => 2])
            ->select(['MG.*', 'M.title', 'G.title as g_title'])
            ->orderBy('updated_at', 'desc');

        $grid->column('media_id', __('ID'));
        $grid->column('title', __('Title'));
        $grid->column('g_title', __('Group Name'));
        $grid->column('sort', __('Sort'))->editable();
        $grid->column('status', __('Status'))->radio([
            0 => 'OFFLINE',
            1 => 'ONLINE'
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

        $form->saved(function (){
            Cache::flush();
        });

        return $form;
    }
}
