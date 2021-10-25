<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Cache;

class Collection extends Model
{
    use HasFactory;

    protected $table = 'm_media_collection';

    /**
     * @param int $product_id
     * @param $iosCode
     * @param $customer_id
     * @param $memory
     * @return \Illuminate\Database\Eloquent\Builder
     * 推荐数据列表
     */
    public static function getList($product = 'ob')
    {
        $key = config('cacheKey.collection_list') . '_' . $product;

        $value = Cache::remember($key, 3600, function () use ($product) {
            $data = self::query()
                ->select(['id as mId', 'title', 'description', 'art_uri'])
                ->where([
                    'product'  => $product,
                    'status' =>  1
                ])
                ->get()
                ->toArray();

            return $data;
        });

        return $value;
    }
}
