<?php

namespace App\Admin\Controllers;

use App\Admin\Actions\Form\NewForm;
use App\Models\Category;
use App\Models\Media;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class MediaController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Media';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Media());

        $class = $_GET['class'] ?? 0;
        $childIds = Category::getchild($class);

        $grid->model()->whereIn('class', $childIds);
        $grid->filter(function ($filter) {
            $filter->disableIdFilter(); // 去掉默认的id过滤器
        });


        $grid->actions(function ($actions) {
            $actions->disableDelete(); // 去掉删除
        });

        $grid->batchActions(function ($batch) {
            $batch->disableDelete();
        });

        $grid->disableCreateButton();
        $grid->tools(function (Grid\Tools $tools) {
            $tools->append(new NewForm());
        });

        $grid->column('id', __('Id'))->hide();
        $grid->column('title', __('Title'));
        $grid->column('title_sub', __('Title sub'))->hide();
        $grid->column('duration', __('Duration'));
        $grid->column('drama_num', __('Drama num'));
        $grid->column('drama_end', __('Drama end'));
        $grid->column('updatetime', __('Updatetime'));
        $grid->column('publishtime', __('Publishtime'));
        $grid->column('cps', 'Cp')->display(function ($cps) {
            return $cps['name'];
        });
        $grid->column('score', __('Score'));
        $grid->column('click_num', __('Click num'))->hide();
        $grid->column('languages', __('Language'))->display(function ($languages) {
            return $languages['name'];
        });
        $grid->column('class', __('Class'));
        $grid->column('class_sub', __('Class sub'));
        $grid->column('intro', __('Intro'))->hide();
        $grid->column('pay_mark', __('Pay Mark'))->display(function ($pay_mark_val) {
            $val = '';
            foreach ($pay_mark_val as $k => $v) {
                if ($k > 0) $val .= ',' . $v;
            }
            return $val;
        });
        $grid->column('feature_content_mark', __('Feature Content Mark'))->hide();
        $grid->column('clarity_mark', __('Clarity Mark'))->hide();
        $grid->column('operation_mark', __('Operation Mark'))->hide();
        $grid->column('img_original', __('Img original'));
        $grid->column('img_input', __('Img input'))->image('/uploads');
        $grid->column('title_original', __('Title original'))->hide();
        $grid->column('uuid', __('Uuid'))->hide();
        $grid->column('sort', __('Sort'))->integer();
        $grid->column('url', __('Url'))->hide();
        $grid->column('tag', __('Tag'))->hide();
        $grid->column('keyword', __('Keyword'))->hide();
        $grid->column('area', __('Area'))->hide();
        $grid->column('items', __('Item'))->display(function ($items) {
            return $items['name'] . '(' . $items['customer'] . ')';
        });
        $grid->column('status', __('Status'));
        $grid->column('updated_at', __('Updated at'))->hide();
        $grid->column('created_at', __('Created at'))->hide();

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
        $show = new Show(Media::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('title', __('Title'));
        $show->field('title_sub', __('Title sub'));
        $show->field('duration', __('Duration'));
        $show->field('drama_num', __('Drama num'));
        $show->field('drama_end', __('Drama end'));
        $show->field('updatetime', __('Updatetime'));
        $show->field('publishtime', __('Publishtime'));
        $show->field('cp_id', __('Cp id'));
        $show->field('score', __('Score'));
        $show->field('click_num', __('Click num'));
        $show->field('language', __('Language'));
        $show->field('class', __('Class'));
        $show->field('class_sub', __('Class sub'));
        $show->field('intro', __('Intro'));
        $show->field('pay_mark', __('Pay Mark'));
        $show->field('feature_content_mark', __('Feature Content Mark'));
        $show->field('clarity_mark', __('Clarity Mark'));
        $show->field('operation_mark', __('Operation Mark'));
        $show->field('img_original', __('Img original'));
        $show->field('img_input', __('Img input'));
        $show->field('title_original', __('Title original'));
        $show->field('uuid', __('Uuid'));
        $show->field('sort', __('Sort'));
        $show->field('url', __('Url'));
        $show->field('tag', __('Tag'));
        $show->field('keyword', __('Keyword'));
        $show->field('area', __('Area'));
        $show->field('item_id', __('Item'));
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
        $form = new Form(new Media());

        $class = $_GET['class'] ?? 0;
        $form->text('title', __('Title'));
        $form->text('title_sub', __('Title sub'));
        $form->number('duration', __('Duration'))->default(0)->required();
        $form->number('drama_num', __('Drama num'))->default(0)->required();
        $form->switch('drama_end', __('Drama end'));
        $form->datetime('updatetime', __('Updatetime'))->required();
        $form->datetime('publishtime', __('Publishtime'))->required();
        $form->select('cp_id', __('Cp'))->options('/admin/api/cps')->required();
        $form->select('language', __('Language'))->options('/admin/api/configs/1')->required();
        $form->select('class', 'Class')->options(Category::selectOptions())->default($class);
        $form->text('intro', __('Intro'));
        $form->multipleSelect('pay_mark', __('Pay Mark'))->options('/admin/api/configs/2');
        $form->multipleSelect('feature_content_mark', __('Feature Content Mark'))->options('/admin/api/configs/3');
        $form->select('clarity_mark', __('Clarity Mark'))->options('/admin/api/configs/4');
        $form->select('operation_mark', __('Operation Mark'))->options('/admin/api/configs/5');
        $form->image('img_original', __('Img original'))->removable();
        $form->image('img_input', __('Img input'))->removable()->required();
        $form->text('title_original', __('Title original'))->required();
        $form->number('sort', __('Sort'))->default(0);
        $form->url('url', __('Url'))->required();
        $form->text('tag', __('Tag'));
        $form->text('keyword', __('Keyword'));
        $form->listbox('area', __('Area'))->options('/admin/api/regions')->required();
        $form->select('item_id', __('Item'))->options('/admin/api/customers');
        $form->switch('status', __('Status'));

        return $form;
    }
}
