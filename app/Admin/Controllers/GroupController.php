<?php

namespace App\Admin\Controllers;

use App\Models\Activity;
use App\Models\Config;
use App\Models\Group;
use App\Models\MediaGroup;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Encore\Admin\Tree;
use Encore\Admin\Widgets\Tab;

class GroupController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Project';

    public function index(Content $content)
    {
        $tree = new Tree(new Group());
        $tree->disableSave();
        $tree->branch(function ($branch) {
            $activity_name = '';
            $activity_id = $branch['activity_id'];
            if ($activity_id) {
                $activity_name = Activity::getName($activity_id);
            }

            $id = $branch['id'];
            $num = MediaGroup::getNumById($branch['id']);
            if ($num > 0) {
                return "<a href='publish2?group_id={$id}' class='dd-nodrag'>{$branch['title']}</a> <span class='label label-info'>{$num}</span> <span class=\"label label-success\">{$activity_name}</span>";
            } else {
                return "<a href='publish2?group_id={$id}' class='dd-nodrag'>{$branch['title']}</a> <span class='label label-success'>{$activity_name}</span>";
            }

        });
        return $content->header('Project')->body($tree);
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Group());
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

        $form->column(10 / 12, function ($form) {
            $form->text('title', __('Title'));
            $form->select('parent_id', __('Parent id'))->options(Group::selectOptions());
            $form->hidden('depth');
            $form->select('component', __('Component'))->options(Config::select(6));
            $form->switch('more', __('Show more'))->default(1);
            $form->switch('title_show', __('Show title'))->default(1);
            $form->image('img', __('Img'))->removable();
            $form->select('activity_id', 'Activity')->default(0)->options(Activity::getName(0, 2));
            $form->text('des', __('Des'));
            $form->number('sort', __('Sort'))->default(1);
            $form->switch('status', __('Status'));
        });

        $form->saving(function (Form $form) {
            $parent_id = $form->parent_id;
            if ($parent_id == 0) {
                $form->depth = 0;
            } else {
                $parentInfo = Group::query()->find($parent_id);
                $form->depth = $parentInfo->depth + 1;
            }

            if (!$form->activity_id) $form->activity_id = 0;
        });

        return $form;
    }
}
