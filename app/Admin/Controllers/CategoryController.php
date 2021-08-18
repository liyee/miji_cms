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
        $form->text('des', __('Des'));
        $form->text('sort', __('Sort'));
        $form->switch('status', __('Status'))->default(1);

        return $form;
    }

    public function categories(Request $request)
    {
        $q = $request->get('q', 0);
        $data = Category::where([['parent_id', $q]])->get(['id', 'title as text']);
        return $data;
    }
}
