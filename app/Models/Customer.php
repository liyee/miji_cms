<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

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
    public static function getList($pn, $pt){
        $key = config('cacheKey.cp_list');

        $value = Cache::remember($key, 3600, function () {
            return self::query()->where()->get(['id', 'name', '']);
        });


    }
}
