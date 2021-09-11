<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Encore\Admin\Traits\ModelTree;

class Group extends Model
{
    use HasFactory;
    use ModelTree;

    protected $table = 'm_group';

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

        $this->setParentColumn('parent_id');
        $this->setOrderColumn('sort');
        $this->setTitleColumn('title');
    }

    /**
     * @param $id
     * @param int $status
     * @return \Illuminate\Database\Eloquent\Builder|\Illuminate\Database\Eloquent\Builder[]|\Illuminate\Database\Eloquent\Collection|Model|null
     * 获取单条信息
     */
    public static function getOne($id, $status = 1)
    {
        return self::query()->where(['status' => $status])->find($id);
    }

    /**
     * @param array $fields
     * @param array $where
     * 获取数据列表-分页
     */
    public static function getList($size, $where = [])
    {
        return self::query()->where($where)->paginate($size);
    }

    public static function getListByPro($parent_id = 0, $status = 1, $group_num = 999)
    {
        return self::query()->where(['parent_id' => $parent_id, 'status' => $status])->orderBy('sort')->limit($group_num)->get(['id', 'title', 'sort', 'parent_id', 'depth', 'activity_id']);
    }

    public static function getListByNav($parent_id = 0, $status = 1, $group_num = 999)
    {
        return self::query()->where(['parent_id' => $parent_id, 'status' => $status])->orderBy('sort')->limit($group_num)->get();
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     * 对应多条媒资
     */
    public function medias()
    {
        return $this->belongsToMany(Media::class, 'm_media_group');
    }

    public function activity()
    {
        return $this->hasOne(Activity::class);
    }
}
