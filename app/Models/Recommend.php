<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Cache;

class Recommend extends Model
{
    use HasFactory;

    protected $table = 'm_media_recommend';

    /**
     * @param string $iosCode
     * @param $customer_id
     * @param int $memory
     * @param int $status
     * @return mixed
     * 推荐数据列表
     */
    public static function getList($collection_id = [], $iosCode = 'US', $customer_id, $memory = 1, $status = 2)
    {
        $params = ['collection_id' => $collection_id, 'iosCode' => $iosCode, 'customer_id' => $customer_id, 'memory' => $memory, 'status' => $status];
        $key = config('cacheKey.recommend_list') . '_' . md5(json_encode($params));

        $value = Cache::remember($key, 3600, function () use ($params) {
            $data = self::query()
                ->select(['id AS mId', 'intent_uri', 'poster_art_aspect_ratio', 'poster_art_img', 'title', 'start_time_utc_millis'
                    , 'end_time_utc_millis', 'season_display_number', 'episode_number', 'durationmillis', 'type', 'deeplink_type',
                    'back_url', 'intent_uri_key', 'back_key', 'sort AS weight'])
                ->where('status', 1)
                ->where('memory', '<=', $params['memory'])
                ->whereIn('collection_id', $params['collection_id'])
                ->whereRaw('find_in_set(\'' . $params['iosCode'] . '\', `region`)')
                ->get()
                ->toArray();

            $dataNew = array_map(function ($v){
                $poster_art_img = json_decode($v['poster_art_img'],true);
                $v['img'] = $poster_art_img['img'];
                $v['mId'] = (string)$v['mId'];
                unset($v['poster_art_img']);
                return $v;
            }, $data);

            return $dataNew;
        });

        return $value;
    }
}
