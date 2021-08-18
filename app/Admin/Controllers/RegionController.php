<?php

namespace App\Admin\Controllers;

use App\Models\Region;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class RegionController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Region';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Region());

        $grid->column('id', __('Id'));
        $grid->column('code', __('Code'));
        $grid->column('code3', __('Code3'));
        $grid->column('name', __('Name'));
        $grid->column('name_zh', __('Name zh'));
        $grid->column('status', __('Status'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));

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
        $show = new Show(Region::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('code', __('Code'));
        $show->field('code3', __('Code3'));
        $show->field('name', __('Name'));
        $show->field('name_zh', __('Name zh'));
        $show->field('status', __('Status'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Region());

        $form->text('code', __('Code'));
        $form->text('code3', __('Code3'));
        $form->text('name', __('Name'));
        $form->text('name_zh', __('Name zh'));
        $form->switch('status', __('Status'))->default(1);

        return $form;
    }

    public function regions(Request $request)
    {
        $q = $request->get('q');
        $cacheKey = 'region_' . $q;
        $value = Cache::remember($cacheKey, 3600, function () use ($q) {
            $list = Region::where([['name', 'like', "%$q%"], ['status', 1]])->get(['id', 'name'])->toArray();

            array_walk($list, function ($val, $key) use (&$data) {
                $data[$val['id']] = $val['name'];
            });

            return json_encode($data);
        });

        return json_decode($value, true);

    }
}
