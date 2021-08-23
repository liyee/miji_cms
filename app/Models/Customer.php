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
     * 获取项目列表数据
     */
    public static function getList($pn, $pt)
    {
        $key = config('cacheKey.cp_list');

        $value = Cache::remember($key, 3600, function () {
            $list = [];
            $data = self::query()->where('status', 1)->get(['id', 'name', 'item'])->toArray();
            array_walk($data, function ($val) use (&$list) {
                $list[$val['name'] . '_' . $val['item']] = $val['id'];
            });

            return $list;
        });

        return isset($value[$pn . '_' . $pt]) ? $value[$pn . '_' . $pt] : 0;
    }
}
