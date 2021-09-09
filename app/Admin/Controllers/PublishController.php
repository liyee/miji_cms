<?php

namespace App\Admin\Controllers;

use App\Libraries\Status;
use App\Models\Category;
use App\Models\Config;
use App\Models\Cp;
use App\Models\Group;
use App\Models\Media;
use App\Models\Region;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Widgets\Table;

class PublishController extends AdminController
{
    /**再次
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
        $id = request('group_id', 0);
        $grid = new Grid(new Media());
        $grid->disableCreateButton();
        $grid->batchActions(function ($batch) {
            $batch->disableDelete();
        });

//        $grid->tools(function ($tools) {
//            $tools->batch(function ($batch) {
//                $batch->disableDelete();
//            });
//        });

        $grid->model()->from('m_media as M')->rightJoin('m_media_group as G', 'M.id', '=', 'G.media_id')->where(['G.status' => 1, 'G.group_id' => $id])->whereIn('M.status', [2])->select(['M.*','G.status']);

        $grid->column('id', __('Id'));
        $grid->column('title', __('Title'))->display(function ($title) {
            return $this->type > 0 ? $title . '&nbsp;&nbsp;&nbsp;&nbsp;[More]' : $title;
        })->expand(function () {
            if ($this->type > 0) {
                $child = Media::query()->where(['parent_id' => $this->id])->get(['id', 'title', 'title_sub'])->toArray();
                $childNew = array_map(function ($value) {
                    $id = $value['id'];
                    $value['action'] = '<a href="medias/' . $id . '/edit">Edit</a>|<a href="medias/' . $id . '">Show</a>';
                    return $value;
                }, $child);

                return new Table(['Id', 'Title', 'title_sub', 'Action'], $childNew);
            }
            return new Table();
        });

        $grid->column('title_sub', __('Title sub'))->hide();
        $grid->column('img_original', __('Img original'))->image();
        $grid->column('serie_num', __('Serie num'));
        $grid->column('duration', __('Duration'));
        $grid->column('serie_end', __('Serie end'))->display(function ($serie_end) {
            return $serie_end ? 'Yes' : 'No';
        });
        $grid->column('updatetime', __('Updatetime'));
        $grid->column('publishtime', __('Publishtime'))->hide();
        $grid->column('cp', 'CP')->display(function ($cp) {
            return $cp['name'];
        });
        $grid->column('score', __('Score'))->hide();
        $grid->column('click_num', __('Click num'))->hide();
        $grid->column('languages', __('Language'))->display(function ($languages) {
            return $languages['name'];
        });
        $grid->column('categorie', __('Class'))->display(function ($categorie) {
            return $categorie['title'];
        });
        $grid->column('intro', __('Intro'))->hide();//->popover('bottom');
        $grid->column('title_original', __('Title original'))->hide();
        $grid->column('url', __('Url'))->hide();
        $grid->column('keyword', __('Keyword'))->hide();
        $grid->column('area', __('Area'))->hide()->display(function ($val) {
            $valNew = implode(',', $val);
            $valArr = str_split($valNew, '63');
            return implode('<br/>', $valArr);

        });

        $grid->column('updated_at', __('Updated at'))->hide();

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
        $show->panel()->tools(function ($tools) {
            $tools->disableDelete();
        });

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

        $form->select('cp_id', __('Cp'))->options(Cp::select())->readOnly();
        $form->decimal('score', __('Score'))->pattern('\d(\.\d)?|10(\.0)?')->help('The score cannot be greater than 10!');
        $form->number('click_num', __('Click num'));
        $form->select('language', __('Language'))->options(Config::select(1))->required();
        $form->select('class', __('Class'))->options(Category::selectOptions())->readOnly();
        $form->select('class_sub', 'Class sub')->options(Category::selectOptions())->readOnly();
        $form->textarea('intro', __('Intro'));

        $form->url('url', __('Url'));
        $form->text('url_jump', __('Url jump'));
        $form->text('img_original', __('Img original'));
        $form->text('title_original', __('Title original'));
        $form->listbox('region', __('Region'))->options(function () {
            return Region::selectByCode($this->area);
        });

        $form->switch('is_adv', __('Is adv'))->default(1);
        $form->switch('is_direction', __('Is direction'));
        $form->number('adv_freq', __('Adv freq'));
        $form->select('memory', __('Memory'))->options([0 => 'unknown', 1 => 'Low', 2 => 'Medium', 3 => 'High'])->readOnly();
        $form->radio('status', __('Status'))->options(Status::getList(3));


        $form->multipleSelect('groups', 'Group')->options(Group::all()->pluck('status', 'id'));

        return $form;
    }
}
