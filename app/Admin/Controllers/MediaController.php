<?php

namespace App\Admin\Controllers;

use App\Admin\Actions\Form\NewForm;
use App\Libraries\Status;
use App\Models\Category;
use App\Models\Config;
use App\Models\Cp;
use App\Models\Customer;
use App\Models\Media;
use App\Models\Region;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Widgets\Table;
use Illuminate\Database\Eloquent\Model;

class MediaController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Waiting For Test';
    protected $type = [0 => 'Default', 1 => 'Serie', 2 => 'Activity'];

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

        $grid->model()->whereIn('class', $childIds)->where('parent_id', 0)->whereIn('status', [1, 3, 4])->orderBy('updated_at', 'desc');
        $grid->filter(function ($filter) {
            $filter->disableIdFilter(); // 去掉默认的id过滤器
        });

        $grid->actions(function ($actions) {
            $actions->disableDelete(); // 去掉删除
        });

        $grid->batchActions(function ($batch) {
            $batch->disableDelete();
        });

        $grid->tools(function (Grid\Tools $tools) {
            $tools->append(new NewForm());
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
        $grid->column('title_sub', __('Title sub'))->hide();
        $grid->column('duration', __('Duration'));
        $grid->column('serie_num', __('Serie num'));
        $grid->column('serie_end', __('Serie end'))->display(function ($serie_end) {
            return $serie_end ? 'Yes' : 'No';
        });
        $grid->column('updatetime', __('Updatetime'));
        $grid->column('publishtime', __('Publishtime'))->hide();
        $grid->column('cp', 'CP')->display(function ($cp) {
            return $cp['name'];
        });
        $grid->column('score', __('Score'));
        $grid->column('click_num', __('Click num'))->hide();
        $grid->column('languages', __('Language'))->display(function ($languages) {
            return $languages['name'];
        });
        $grid->column('categorie', __('Class'))->display(function ($categorie) {
            return $categorie['title'];
        });
        $grid->column('intro', __('Intro'))->hide();
        $grid->column('img_original', __('Img original'))->image();
        $grid->column('title_original', __('Title original'))->hide();
        $grid->column('url', __('Url'))->hide();
        $grid->column('tag', __('Tag'))->hide();
        $grid->column('keyword', __('Keyword'))->hide();
        $grid->column('area', __('Area'))->hide();
        $grid->column('status', __('Status'))->using(Status::getList(1));
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
            $form->text('title_original', __('Title original'))->required();
            $form->radio('type', __('Type'))->options($this->type)->when(1, function (Form $form) {
                $form->select('parent_id', 'Serie')->options(Media::selectBytype(1));
            })->when(2, function (Form $form) {
                $form->select('parent_id', 'Activity')->options(Media::selectBytype(2));
            })->default(0);
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
            $form->hidden('class');
            $form->hidden('uuid');
            $form->select('class_sub', 'Class sub')->options(Category::selectOptions());
            $form->text('intro', __('Intro'));
            $form->image('img_original', __('Img original'))->removable();
            $form->number('sort', __('Sort'))->default(0);
            $form->text('url', __('Url'))->required();
            $form->text('tag', __('Tag'));
            $form->text('keyword', __('Keyword'));
            $form->listbox('area', __('Area'))->options(Region::select())->required();
            $form->select('memory', __('Memory'))->options([0 => 'unknown', 1 => 'Low', 2 => 'Medium', 3 => 'High']);
            $form->radio('status', __('Status'))->options(Status::getList(1))->default(1);
        })->tab('Images', function ($form) {
            $form->hasMany('imgs', function ($form) {
                $form->select('config', 'Clarity')->options(Config::select(4))->setWidth(2)->required();
                $form->select('act', 'Type')->options([1 => 'General', 2 => 'Activity'])->setWidth(2)->required();
                $form->image('f_16x9', 'Foreground(16x9)')->removable()->setWidth(3);
                $form->image('b_16x9', 'Background(16x9)')->removable()->setWidth(3);
                $form->image('f_7x10', 'Foreground(7x10)')->removable()->setWidth(3);
                $form->image('b_7x10', 'Background(7x10)')->removable()->setWidth(3);
                $form->image('f_1x1', 'Foreground(1x1)')->removable()->setWidth(3);
                $form->image('b_1x1', 'Background(1x1)')->removable()->setWidth(3);
                $form->image('f_4x1', 'Foreground(4x1)')->removable()->setWidth(3);
                $form->image('b_4x1', 'Background(4x1)')->removable()->setWidth(3);
            });
        })->tab('Mode', function ($form) {
            $form->hasMany('modes', function ($form) {
                $form->select('customer_id', 'Customer')->options(array_flip(Customer::getCustomerId()))->required();
                $form->select('mode', 'Mode')->options(Config::select(7))->required()->default(5);
                $form->switch('status', 'Status');
            });
        });

        $form->saving(function (Form $form) {
            $class_sub = $form->class_sub;
            $form->class = Category::getTop(Category::getList(), $class_sub);
            if (!$form->parent_id) $form->parent_id = 0;
            if (!$form->uuid) $form->uuid = uniqid();
        });

        return $form;
    }
}
