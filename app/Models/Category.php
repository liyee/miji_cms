<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Encore\Admin\Traits\ModelTree;


class Category extends Model
{
    use HasFactory;
    use ModelTree;

    protected $table = 'm_category';
    protected static $childIds = [];

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

        $this->setParentColumn('parent_id');
        $this->setOrderColumn('sort');
        $this->setTitleColumn('title');
    }

    public function scopeProvince()
    {
        return $this->where('type', 1);
    }

    /**
     * @param int $nodeIds
     * 获取所有子项id数据
     */
    public static function getchild($nodeId = 0)
    {
        $list = self::get(['id', 'parent_id'])->toArray();
        $recursion = self::recursion($list, $nodeId);
        return array_merge(self::$childIds, [(int)$nodeId]);
    }

    /**
     * 递归获取子类别
     */
    protected static function recursion($list = [], $nodeid = 0)
    {
        $data = [];
        foreach ($list as $item) {
            if ($item['parent_id'] == $nodeid) {
                self::$childIds[] = $item['id'];
                $arr['id'] = $item['id'];
                $cate = self::recursion($list, $item['id']);
                if (!empty($cate)) {
                    $arr[] = $cate;
                }
                $data[] = $arr;
                unset($arr);
            }
        }
        return $data;
    }

    /**
     * @param array $data
     * 数据批量插入
     */
    public function batchInsert($data = []){

    }
}
