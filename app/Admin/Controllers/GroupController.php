<?php

namespace App\Admin\Controllers;

use App\Models\Config;
use App\Models\Group;
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
    protected $title = 'Group';

    public function index(Content $content)
    {
        $tree = new Tree(new Group());

        return $content->header('分组管理')->body($tree);
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
        $tab = new Tab();
        $tab->add('Pie', 'pie');
        $tab->add('Table', new Group());
        $tab->add('Text', 'blablablabla....');

        echo $tab->render();


//        $form = new Form(new Group());
//
//        $form->text('title', __('Title'));
//        $form->select('parent_id', __('Parent id'))->options(Group::selectOptions());
//        $form->select('component_id', __('Component'))->options(Config::select(6));
//        $form->switch('show_more', __('Show more'))->default(1);
//        $form->switch('show_title', __('Show title'))->default(1);
//        $form->image('img', __('Img'))->removable();
//        $form->text('des', __('Des'));
//        $form->number('sort', __('Sort'))->default(1);
//        $form->switch('status', __('Status'));
//
//        return $form;
    }
}
