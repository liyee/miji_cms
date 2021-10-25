<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Cache;

class Customer extends Model
{
    use HasFactory;

    protected $table = 'm_customer';
    public $timestamps = true;

    protected $attributes = [
        'status' => 1,
    ];

    /**
     * @return mixed
     * 获取渠道列表信息
     */
    public static function getList()
    {
        $key = config('cacheKey.customer_list');

        $value = Cache::remember($key, 3600, function () {
            $list = [];
            $data = self::query()->where('status', 1)->get(['id', 'name', 'tag'])->toArray();
            array_walk($data, function ($val) use (&$list) {
                $list[$val['name'] . '_' . $val['tag']] = $val['id'];
            });

            return $list;
        });

        return $value;
    }

    /**
     * @param int $pn
     * @param int $pt
     * @return int|mixed
     * 获取项目id
     */
    public static function getCustomerId($pn = 0, $pt = 0)
    {
        $list = self::getList();
        return isset($list[$pn . '_' . $pt]) ? $list[$pn . '_' . $pt] : 0;
    }

    /**
     * 客户下拉列表
     */
    public static function selectPn()
    {
        $key = config('cacheKey.customer_select_pn');
        $value = Cache::remember($key, 3600, function () {
            $data = self::query()->where('status', 1)->distinct()->get(['name'])->toArray();
            $select = [];
            array_walk($data, function ($val) use (&$select) {
                $select[strtolower($val['name'])] = $val['name'];
            });
            return $select;
        });

        return $value;
    }
}
