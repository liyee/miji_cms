<?php

namespace App\Admin\Controllers;

use App\Models\Category;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Encore\Admin\Tree;
use Illuminate\Http\Request;

class CategoryController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Category';

    public function index(Content $content)
    {
        $tree = new Tree(new Category());
        $tree->disableSave();
        $tree->branch(function ($branch) {
            return "<a href='medias?class=" . $branch['id'] . "' class='dd-nodrag'>{$branch['title']}</a>";
        });

        return $content->header('媒资类别')->body($tree);
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Category());

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
        $show = new Show(Category::findOrFail($id));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Category());

        $form->text('title', __('Title'));
        $form->select('parent_id', __('Parent'))->options(Category::selectOptions());
        $form->hidden('depth');
        $form->text('des', __('Des'));
        $form->text('sort', __('Sort'));
        $form->switch('status', __('Status'))->default(1);

        $form->saving(function (Form $form) {
            $parent_id = $form->parent_id;
            if ($parent_id == 0) {
                $form->depth = 0;
            } else {
                $parentInfo = Category::query()->find($parent_id);
                $form->depth = $parentInfo->depth + 1;
            }
        });

        return $form;
    }

    public function classSub(Request $request)
    {
        $provinceId = $request->get('q');
        $id = Category::getTop(Category::getList(),1);

        $aa = $id;
    }
}
