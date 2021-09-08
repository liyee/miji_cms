<?php

namespace App\Admin\Controllers;

use App\Models\Media;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class TestController extends AdminController
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

        $grid->column('id', __('Id'));
        $grid->column('title', __('Title'));
        $grid->column('title_sub', __('Title sub'));
        $grid->column('duration', __('Duration'));
        $grid->column('serie_num', __('Serie num'));
        $grid->column('serie_end', __('Serie end'));
        $grid->column('updatetime', __('Updatetime'));
        $grid->column('publishtime', __('Publishtime'));
        $grid->column('cp_id', __('Cp id'));
        $grid->column('score', __('Score'));
        $grid->column('click_num', __('Click num'));
        $grid->column('language', __('Language'));
        $grid->column('class', __('Class'));
        $grid->column('class_sub', __('Class sub'));
        $grid->column('intro', __('Intro'));
        $grid->column('pay_mark', __('Pay mark'));
        $grid->column('con_mark', __('Con mark'));
        $grid->column('cla_mark', __('Cla mark'));
        $grid->column('ope_mark', __('Ope mark'));
        $grid->column('url', __('Url'));
        $grid->column('url_jump', __('Url jump'));
        $grid->column('img_original', __('Img original'));
        $grid->column('title_original', __('Title original'));
        $grid->column('uuid', __('Uuid'));
        $grid->column('tag', __('Tag'));
        $grid->column('keyword', __('Keyword'));
        $grid->column('area', __('Area'));
        $grid->column('region', __('Region'));
        $grid->column('is_adv', __('Is adv'));
        $grid->column('is_direction', __('Is direction'));
        $grid->column('adv_freq', __('Adv freq'));
        $grid->column('memory', __('Memory'));
        $grid->column('type', __('Type'));
        $grid->column('parent_id', __('Parent id'));
        $grid->column('sort', __('Sort'));
        $grid->column('expand', __('Expand'));
        $grid->column('remark', __('Remark'));
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
        $show = new Show(Media::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('title', __('Title'));
        $show->field('title_sub', __('Title sub'));
        $show->field('duration', __('Duration'));
        $show->field('serie_num', __('Serie num'));
        $show->field('serie_end', __('Serie end'));
        $show->field('updatetime', __('Updatetime'));
        $show->field('publishtime', __('Publishtime'));
        $show->field('cp_id', __('Cp id'));
        $show->field('score', __('Score'));
        $show->field('click_num', __('Click num'));
        $show->field('language', __('Language'));
        $show->field('class', __('Class'));
        $show->field('class_sub', __('Class sub'));
        $show->field('intro', __('Intro'));
        $show->field('pay_mark', __('Pay mark'));
        $show->field('con_mark', __('Con mark'));
        $show->field('cla_mark', __('Cla mark'));
        $show->field('ope_mark', __('Ope mark'));
        $show->field('url', __('Url'));
        $show->field('url_jump', __('Url jump'));
        $show->field('img_original', __('Img original'));
        $show->field('title_original', __('Title original'));
        $show->field('uuid', __('Uuid'));
        $show->field('tag', __('Tag'));
        $show->field('keyword', __('Keyword'));
        $show->field('area', __('Area'));
        $show->field('region', __('Region'));
        $show->field('is_adv', __('Is adv'));
        $show->field('is_direction', __('Is direction'));
        $show->field('adv_freq', __('Adv freq'));
        $show->field('memory', __('Memory'));
        $show->field('type', __('Type'));
        $show->field('parent_id', __('Parent id'));
        $show->field('sort', __('Sort'));
        $show->field('expand', __('Expand'));
        $show->field('remark', __('Remark'));
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

        $form->text('title', __('Title'));
        $form->text('title_sub', __('Title sub'));
        $form->number('duration', __('Duration'));
        $form->number('serie_num', __('Serie num'))->default(1);
        $form->switch('serie_end', __('Serie end'))->default(1);
        $form->date('updatetime', __('Updatetime'))->default(date('Y-m-d'));
        $form->date('publishtime', __('Publishtime'))->default(date('Y-m-d'));
        $form->number('cp_id', __('Cp id'));
        $form->decimal('score', __('Score'));
        $form->number('click_num', __('Click num'));
        $form->text('language', __('Language'));
        $form->number('class', __('Class'));
        $form->number('class_sub', __('Class sub'));
        $form->textarea('intro', __('Intro'));
        $form->text('pay_mark', __('Pay mark'));
        $form->text('con_mark', __('Con mark'));
        $form->text('cla_mark', __('Cla mark'));
        $form->text('ope_mark', __('Ope mark'));
        $form->url('url', __('Url'));
        $form->text('url_jump', __('Url jump'));
        $form->text('img_original', __('Img original'));
        $form->text('title_original', __('Title original'));
        $form->text('uuid', __('Uuid'));
        $form->text('tag', __('Tag'));
        $form->text('keyword', __('Keyword'));
        $form->textarea('area', __('Area'));
        $form->text('region', __('Region'));
        $form->switch('is_adv', __('Is adv'))->default(1);
        $form->switch('is_direction', __('Is direction'));
        $form->number('adv_freq', __('Adv freq'));
        $form->number('memory', __('Memory'));
        $form->switch('type', __('Type'));
        $form->number('parent_id', __('Parent id'));
        $form->number('sort', __('Sort'));
        $form->text('expand', __('Expand'));
        $form->text('remark', __('Remark'));
        $form->switch('status', __('Status'))->default(1);

        return $form;
    }
}
