<?php

namespace App\Admin\Controllers;

use App\Admin\Actions\Form\NewForm;
use App\Models\Category;
use App\Models\Config;
use App\Models\Cp;
use App\Models\Media;
use App\Models\Region;
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

        $grid->model()->whereIn('class', $childIds)->where('parent_id', 0);
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

        $grid->column('id', __('Id'));
        $grid->column('title', __('Title'));
        $grid->column('title_sub', __('Title sub'))->hide();
        $grid->column('duration', __('Duration'));
        $grid->column('serie_num', __('Serie num'));
        $grid->column('serie_end', __('Serie end'))->display(function ($serie_end) {
            return $serie_end ? 'Yes' : 'No';
        });
        $grid->column('updatetime', __('Updatetime'));
        $grid->column('publishtime', __('Publishtime'))->hide();
        $grid->column('cp', 'Cp')->display(function ($cp) {
            return $cp['name'];
        });
        $grid->column('score', __('Score'));
        $grid->column('click_num', __('Click num'))->hide();
        $grid->column('languages', __('Language'))->display(function ($languages) {
            return $languages['name'];
        });
        $grid->column('categorie', __('Class sub'))->display(function ($categorie) {
            return $categorie['title'];
        });
        $grid->column('intro', __('Intro'))->hide();
        $grid->column('img_original', __('Img original'));
        $grid->column('title_original', __('Title original'))->hide();
        $grid->column('url', __('Url'))->hide();
        $grid->column('tag', __('Tag'))->hide();
        $grid->column('keyword', __('Keyword'))->hide();
        $grid->column('area', __('Area'))->hide();
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
//        $show->field('pay_mark', __('Pay Mark'));
//        $show->field('feature_content_mark', __('Feature Content Mark'));
//        $show->field('clarity_mark', __('Clarity Mark'));
//        $show->field('operation_mark', __('Operation Mark'));
        $show->field('img_original', __('Img original'));
        $show->field('title_original', __('Title original'));
        $show->field('uuid', __('Uuid'));
        $show->field('sort', __('Sort'));
        $show->field('url', __('Url'));
        $show->field('tag', __('Tag'));
        $show->field('keyword', __('Keyword'));
        $show->field('area', __('Area'));
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
        $class = $_GET['class'] ?? 0;

        $form = new Form(new Media());
        $form->tab('Basic info', function ($form) use ($class) {
            $form->text('title', __('Title'));
            $form->text('title_sub', __('Title sub'));
            $form->number('duration', __('Duration'))->default(60)->required();
            $form->number('serie_num', __('Serie num'))->default(1)->required();
            $form->switch('serie_end', __('Serie end'))->states([
                'on' => ['value' => 1, 'text' => 'Yes', 'color' => 'success'],
                'off' => ['value' => 0, 'text' => 'No', 'color' => 'danger'],
            ])->default(1);
            $form->date('updatetime', __('Updatetime'))->required();
            $form->date('publishtime', __('Publishtime'))->required();
            $form->select('cp_id', __('Cp'))->options(Cp::select())->required();
            $form->select('language', __('Language'))->options(Config::select(1))->required();
            $form->select('class', 'Class')->options(Category::selectOptions())->default($class);
            $form->select('class_sub', 'Class sub')->options(Category::selectOptions())->default($class);
            $form->text('intro', __('Intro'));
            $form->image('img_original', __('Img original'))->removable();
            $form->text('title_original', __('Title original'))->required();
            $form->number('sort', __('Sort'))->default(0);
            $form->url('url', __('Url'))->required();
            $form->text('tag', __('Tag'));
            $form->text('keyword', __('Keyword'));
            $form->listbox('area', __('Area'))->options(Region::select())->required();
            $form->radio('status', __('Status'))->options([0 => 'DELETE', 1 => 'UNTESTED', 2 => 'TEST COMPLETE', 3 => 'TEST FAILURE', 4 => 'PUBLISH', 5 => 'UNPUBLISH'])->default(1);
        })->tab('Images', function ($form){
            $form->column(1/2, function ($form) {
                $form->hasMany('imgs', function ($form){
                    $form->select('config', 'Clarity')->options(Config::select(4));
                    $form->image('f_16x9', 'Foreground(16x9)')->removable();
                    $form->image('b_16x9', 'Background(16x9)')->removable();
                    $form->image('f_7x10', 'Foreground(7x10)')->removable();
                    $form->image('b_7x10', 'Background(7x10)')->removable();
                });
            });

        });

        return $form;

//        $form->multipleSelect('pay_mark', __('Pay Mark'))->options('/admin/api/configs/2');
//        $form->multipleSelect('feature_content_mark', __('Feature Content Mark'))->options('/admin/api/configs/3');
//        $form->select('clarity_mark', __('Clarity Mark'))->options('/admin/api/configs/4');
//        $form->select('operation_mark', __('Operation Mark'))->options('/admin/api/configs/5');


    }
}
