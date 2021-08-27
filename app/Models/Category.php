<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Encore\Admin\Traits\ModelTree;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;


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
     * @return mixed
     * 获取列表数据
     */
    public static function getList()
    {
        $key = config('cacheKey.category_list');

        $value = Cache::remember($key, 300, function () {
            $data = DB::table('m_category')->get(['id', 'parent_id', 'depth'])->toArray();
            $id = array_column($data, 'id');
            return array_combine($id, $data);
        });

        return $value;
    }

    /**
     * @param int $nodeIds
     * 获取所有子项id数据
     */
    public static function getchild($nodeId = 0)
    {
        $list = self::getList();
        self::recursion($list, $nodeId);
        return array_merge(self::$childIds, [(int)$nodeId]);
    }

    /**
     * 递归获取子类别
     */
    protected static function recursion($list = [], $nodeid = 0)
    {
        $data = [];
        foreach ($list as $item) {
            if (is_object($item)) $item = (array)$item;
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
     * @param $sub
     * @param int $depth
     * @return array
     * 推荐位所用
     */
    public static function getDepth($sub, $depth = 2)
    {
        $data = [];
        $list = self::getList();
        switch ($list[$sub]->depth) {
            case 1:
                self::recursion($list, $sub);
                $data = self::$childIds;
                break;
            case 2:
                self::recursion($list, $list[$sub]->parent_id);
                $data = self::$childIds;
                break;
            default:
        }

        return $data;
    }
}
