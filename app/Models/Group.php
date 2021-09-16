<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Encore\Admin\Traits\ModelTree;
use Illuminate\Support\Facades\Cache;

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
        $key = config('cacheKey.group_list');
        $value = Cache::remember($key, 3600, function () use ($status) {
            return self::query()->where(['status' => $status])->get()->keyBy('id');
        });

        $item = isset($value[$id]) ? $value[$id] : null;

        return $item;
//        return self::query()->where(['status' => $status])->find($id);
    }

    /**
     * @param array $fields
     * @param array $where
     * 获取数据列表-分页
     */
    public static function getList($params = [])
    {
        $key = config('cacheKey.group_list_page') . '_' . md5(json_encode($params));
        $value = Cache::remember($key, 3600, function () use ($params) {
            return self::query()->where($params['where'])->orderBy('sort')->orderBy('id')->paginate($params['size']);;
        });

        return $value;

//        return self::query()->where($where)->orderBy('sort')->orderBy('id')->paginate($size);
    }

    /**
     * @param int $parent_id
     * @param int $group_num
     * @param int $status
     * @return \Illuminate\Database\Eloquent\Builder[]|\Illuminate\Database\Eloquent\Collection
     * 根据父级id查询子栏目信息
     */
    public static function getListByPid($parent_id = 0, $group_num = 999, $status = 1)
    {
        $params = ['parent_id' => $parent_id, 'group_num' => $group_num, 'status' => $status];
        $key = config('cacheKey.group_pid') . '_' . implode('_', array_values($params));

        $value = Cache::remember($key, 3600, function () use ($params) {
            $data = self::query()
                ->where(['parent_id' => $params['parent_id'], 'status' => $params['status']])
                ->orderBy('sort')
                ->orderBy('id')
                ->limit($params['group_num'])
                ->get();

            return $data;
        });

        return $value;
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
