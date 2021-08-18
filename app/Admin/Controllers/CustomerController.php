<?php

namespace App\Admin\Controllers;

use App\Models\Customer;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Http\Request;

class CustomerController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Customer';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Customer());

        $grid->column('id', __('Id'));
        $grid->column('name', __('Name'));
        $grid->column('customer', __('Customer'));
        $grid->column('des', __('Des'));
        $grid->column('sort', __('Sort'));
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
        $show = new Show(Customer::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('Name'));
        $show->field('customer', __('Customer'));
        $show->field('des', __('Des'));
        $show->field('sort', __('Sort'));
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
        $form = new Form(new Customer());

        $form->text('name', __('Name'));
        $form->text('customer', __('Customer'));
        $form->text('des', __('Des'));
        $form->switch('sort', __('Sort'));

        return $form;
    }

    public function customers(Request $request)
    {
        $data = [];
        $q = $request->get('q');
        $list = Customer::where('name', 'like', "%$q%")->get(['id', 'name', 'customer'])->toArray();

        array_walk($list, function ($val, $key) use (&$data) {
            $data[] = [
                'id' => $val['id'],
                'text' => $val['name'] . '(' . $val['customer'] . ')'
            ];
//            $data[$val['id']] = $val['name'] . '(' . $val['customer'] . ')';
        });

        return $data;
    }
}
