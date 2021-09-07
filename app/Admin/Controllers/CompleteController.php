<?php
/* 完成媒资测试 */

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
use Illuminate\Database\Eloquent\Model;

class CompleteController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Test Complete';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Media());
        $grid->model()->whereIn('status', [2])->orderBy('updated_at', 'desc');
        $grid->disableCreateButton();
        $grid->actions(function ($actions) {
            $actions->disableDelete(); // 去掉删除
        });
        $grid->batchActions(function ($batch) {
            $batch->disableDelete();
        });

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
        $grid->column('img_original', __('Img original'))->image();
        $grid->column('title_sub', __('Title sub'))->hide();
        $grid->column('duration', __('Duration'))->hide();
        $grid->column('serie_num', __('Serie num'));
        $grid->column('serie_end', __('Serie end'))->display(function ($serie_end) {
            return $serie_end ? 'Yes' : 'No';
        })->hide();
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
        $grid->column('intro', __('Intro'))->hide();
        $grid->column('title_original', __('Title original'))->hide();
        $grid->column('url', __('Url'))->hide();
        $grid->column('tag', __('Tag'))->hide();
        $grid->column('keyword', __('Keyword'))->hide();
        $grid->column('area', __('Area'))->hide();
        $grid->column('status', __('Status'))->using(Status::getList(2));
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
        $show->field('serie_num', __('Serie num'));
        $show->field('serie_end', __('Serie end'));
        $show->field('updatetime', __('Updatetime'));
        $show->field('publishtime', __('Publishtime'));
        $show->field('cp_id', __('Cp id'));
        $show->field('score', __('Score'));
        $show->field('click_num', __('Click num'));
        $show->field('language', __('Language'));
        $show->field('class_sub', __('Class sub'));
        $show->field('intro', __('Intro'));
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
        $show->field('parent_id', __('Parent id'));
        $show->field('sort', __('Sort'));
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
        $form->tools(function (Form\Tools $tools) {
            $tools->disableDelete();
        });

        $form->text('title', __('Title'));
        $form->text('title_sub', __('Title sub'));
        $form->multipleSelect('groups', 'Group')->options(Group::selectOptions());
        $form->number('duration', __('Duration'));
        $form->number('serie_num', __('Serie num'))->default(1);
        $form->switch('serie_end', __('Serie end'))->default(1);
        $form->date('updatetime', __('Updatetime'))->default(date('Y-m-d'));
        $form->date('publishtime', __('Publishtime'))->default(date('Y-m-d'));
        $form->select('cp_id', __('Cp'))->options(Cp::select())->readOnly();
        $form->number('score', __('Score'));
        $form->number('click_num', __('Click num'));
        $form->select('language', __('Language'))->options(Config::select(1))->required();
        $form->hidden('class');
        $form->select('class_sub', 'Class sub')->options(Category::selectOptions())->readOnly();
        $form->textarea('intro', __('Intro'));
        $form->url('url', __('Url'));
        $form->text('url_jump', __('Url jump'));
        $form->text('img_original', __('Img original'));
        $form->text('title_original', __('Title original'));
        $form->text('tag', __('Tag'));
        $form->text('keyword', __('Keyword'));
        $form->listbox('region', __('Region'))->options(function ($id) {
            return Region::selectByCode($this->area);
        });
        $form->radio('is_adv', __('Is adv'))->options([0 => 'OFF', 1 => 'ON'])->when(1, function (Form $form) {
            $form->number('adv_freq', __('Adv freq'))->default(5);
        })->default(1);
        $form->switch('is_direction', __('Is direction'));
        $form->select('memory', __('Memory'))->options([0 => 'unknown', 1 => 'Low', 2 => 'Medium', 3 => 'High'])->readOnly();
        $form->number('parent_id', __('Parent id'));
        $form->number('sort', __('Sort'));
        $form->text('expand', __('Expand'));
        $form->text('remark', __('Remark'));
        $form->radio('status', __('Status'))->options(Status::getList(2));

        return $form;
    }
}
