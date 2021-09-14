<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Cache;

class Activity extends Model
{
    use HasFactory;

    protected $table = 'm_activity';

    /**
     * @param $id
     * 获取活动名称
     */
    public static function getName($id, $type = 1)
    {
        $key = config('cacheKey.activities');

        $value = Cache::remember($key, 3600, function () {
            $list = [];
            $data = self::query()->where('status', 1)->where('end', '>=', time())->get(['id', 'name'])->toArray();
            array_walk($data, function ($val) use (&$list) {
                $list[$val['id']] = $val['name'];
            });

            return $list;
        });
        if ($type == 2){
            return  $value;
        }else{
            return isset($value[$id]) ? $value[$id] : '';
        }
    }

    /**
     * @param int $type
     * @return mixed
     * 下拉框
     */
    public static function select($type = 1)
    {
        $key = config('cacheKey.activity_select');
        $value = Cache::remember($key, 10, function () use ($type) {
            $select = [];
            $d = date('Y-m-d H:i:s');
            $data = self::where('type', $type)->where('start', '<=', $d)->where('end', '>=', $d)->get(['id', 'name'])->toArray();
            array_walk($data, function ($val) use (&$select) {
                $select[$val['id']] = $val['name'];
            });

            return $select;
        });

        return $value;
    }
}
