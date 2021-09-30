<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Cache;

class Recommend extends Model
{
    use HasFactory;

    protected $table = 'm_media_recommend';

    public function media()
    {
        return $this->belongsTo(Media::class);
    }

    public function imgs()
    {
        return $this->hasMany(MediaImg::class, 'media_id');
    }

    /**
     * @param string $iosCode
     * @param $customer_id
     * @param int $memory
     * @param int $status
     * @return mixed
     * 推荐数据列表
     */
    public static function getList($pn, $iosCode = 'US', $customer_id, $memory = 1, $status = 2)
    {
        $pn = strtolower($pn);
        $params = ['iosCode' => $iosCode, 'customer_id' => $customer_id, 'memory' => $memory, 'status' => $status, 'pn' => $pn];
        $key = config('cacheKey.recommend_list') . '_' . md5(json_encode($params));

        $value = Cache::remember($key, 5, function () use ($params) {
            $data = self::query()
                ->from('m_media_recommend as R')
                ->select(['M.id', 'M.title', 'M.title_sub', 'M.class', 'M.class_sub', 'M.cp_id', 'M.duration', 'M.type', 'M.is_direction', 'M.publishtime', 'M.score', 'M.url_jump', 'A.customer_id', 'A.mode'])
                ->leftJoin('m_media as M', 'M.id', '=', 'R.media_id')
                ->leftJoin('m_media_attr as A', 'A.media_id', '=', 'R.media_id')
                ->where([
                    'A.customer_id' => $params['customer_id'],
                    'M.status' => $params['status'],
                    'R.pn' => $params['pn'],
                    'R.status' => 1,
                ])
                ->where('M.memory', '<=', $params['memory'])
                ->whereRaw('find_in_set(\'' . $params['iosCode'] . '\', `M`.`region`)')
                ->get();

            return $data;
        });

        return $value;
    }
}
