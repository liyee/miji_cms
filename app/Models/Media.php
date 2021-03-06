<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;

class Media extends Model
{
    use HasFactory;

    protected $table = 'm_media';
    public $timestamps = true;

    protected $attributes = [
        'duration' => 0,
        'status' => 1,
    ];

    /**
     * @param $value
     * @return false|string[]
     * pay_mark-PayMark
     */
    public function getPayMarkAttribute($value)
    {
        return explode(',', $value);
    }

    public function setPayMarkAttribute($value)
    {
        //tags 是分类字段名 我的叫tags
        $this->attributes['pay_mark'] = implode(',', $value);
    }

    /**
     * @param $value
     * @return false|string[]
     * feature_content_mark-FeatureContentMark
     */
    public function getFeatureContentMarkAttribute($value)
    {
        return explode(',', $value);
    }

    public function setFeatureContentMarkAttribute($value)
    {
        $this->attributes['feature_content_mark'] = implode(',', $value);
    }

    /**
     * @param $value
     * @return false|string[]
     * area-Area
     */
    public function getAreaAttribute($value)
    {
        $res = explode(',', $value);
        return $res;
    }

    public function setAreaAttribute($value)
    {
        $this->attributes['area'] = implode(',', $value);
    }

    /**
     * @param $value
     * @return false|string[]
     * region-Region
     */
    public function getRegionAttribute($value)
    {
        $res = explode(',', $value);
        return $res;
    }

    public function setRegionAttribute($value)
    {
        $val = implode(',', array_filter($value));
        $this->attributes['region'] = $val;
    }

    /**
     * @param $value
     * @return false|string[]
     * parent_id-ParentId
     */
    public function getParentIdAttribute($value)
    {
        $res = explode(',', $value);
        return $res;
    }

    public function setParentIdAttribute($value)
    {
        $val = implode(',', array_filter($value));
        $this->attributes['parent_id'] = $val;
    }

    /**
     * @param $id
     * @param array $fields
     * @param array $where
     * 获取媒资详情
     */
    public static function getOne($id, $status = 2)
    {
        $params = ['id' => $id, 'status' => $status];
        $key = config('cacheKey.media_one') . '_' . $id . '_' . $status;

        $value = Cache::remember($key, 3600, function () use ($params) {
            $d = date('Y-m-d H:i:s', time());
            $data = self::query()
                ->where('status', $params['status'])
                ->where('onlinetime', '<=', $d)
                ->where('offlinetime', '>=', $d)
                ->find($params['id']);

            return $data;
        });

        return $value;
    }

    /**
     * @param $id
     * @param int $type
     * @param int $status
     * @param int $parent_id
     * 获取单条媒资信息
     */
    public static function getOne2($id, $status = 2, $customer_id = 0, $memory = 1)
    {
        $params = ['id' => $id, 'status' => $status, 'customer_id' => $customer_id, 'memory' => $memory];
        $key = config('cacheKey.media_one2') . '_' . implode('_', array_values($params));

        $value = Cache::remember($key, 3600, function () use ($params) {
            $d = date('Y-m-d H:i:s', time());
            $one = self::query()->from('m_media as M')->select(['M.*', 'A.customer_id', 'A.mode'])
                ->rightJoin('m_media_attr as A', 'A.media_id', '=', 'M.id')
                ->where([
                    'M.id' => $params['id'],
                    'M.status' => $params['status'],
                    'A.customer_id' => $params['customer_id'],
                ])
                ->where('M.memory', '<=', $params['memory'])
                ->where('M.onlinetime', '<=', $d)
                ->where('M.offlinetime', '>=', $d)
                ->first();

            return $one;
        });

        return $value;
    }

    /**
     * @param int $groupid
     * @param int $parent_id
     * @return \Illuminate\Database\Eloquent\Builder[]|\Illuminate\Database\Eloquent\Collection
     * 媒资列表-根据分组id
     */
    public static function getList($parent_id = 0, $iosCode = 'US', $customer_id = 0, $memory = 1, $act = 0, $status = 2)
    {
        $d = date('Y-m-d H:i:s', time());
        $additional = "$act as act";
        $data = self::query()->select('M.*', 'A.customer_id', 'A.mode')->selectRaw($additional)->from('m_media as M')
            ->rightJoin('m_media_attr as A', 'A.media_id', '=', 'M.id')
            ->where([
                'M.status' => $status,
                'A.customer_id' => $customer_id
            ])
            ->where('M.memory', '<=', $memory)
            ->where('M.onlinetime', '<=', $d)
            ->where('M.offlinetime', '>=', $d)
            ->whereRaw('find_in_set(\'' . $parent_id . '\', `M`.`parent_id`)')
            ->whereRaw('find_in_set(\'' . $iosCode . '\', `M`.`region`)')
            ->orderBy('M.sort')
            ->get(['M.*', 'act']);

        return $data;
    }

    /**
     * @param int $parent_id
     * @return mixed
     * 获取连续剧具体媒资id
     */
    public static function getListBySerie($parent_id = 0, $customer_id = 0, $memory = 1, $status = 2)
    {
        $params = ['parent_id' => $parent_id, 'customer_id' => $customer_id, 'memory' => $memory, 'status' => $status];
        $key = config('cacheKey.media_serie') . '_' . md5(json_encode($params));

        $value = Cache::remember($key, 3600, function () use ($params) {
            $data = self::query()->from('m_media as M')
                ->rightJoin('m_media_attr as A', 'A.media_id', '=', 'M.id')
                ->leftJoin('m_media_serie as S', 'M.id', '=', 'S.serie_id')
                ->where([
                    'M.status' => $params['status'],
                    'A.customer_id' => $params['customer_id']
                ])
                ->whereRaw('find_in_set(\'' . $params['parent_id'] . '\', `M`.`parent_id`)')
                ->where('M.memory', '<=', $params['memory'])
                ->orderBy('S.sort')->get(['M.id', 'M.url_jump']);

            return $data;
        });

        return $value;
    }

    /**
     * @param int $groupid
     * @param int $parent_id
     * @return \Illuminate\Database\Eloquent\Builder[]|\Illuminate\Database\Eloquent\Collection
     * 媒资列表-根据分组id
     */
    public static function getListByGroup($groupid = 0, $iosCode = 'US', $limit = 999, $customer_id = 0, $memory = 1, $act = 0, $status = 2)
    {
        $params = ['groupid' => $groupid, 'iosCode' => $iosCode, 'limit' => $limit, 'customer_id' => $customer_id, 'memory' => $memory, 'act' => $act, 'status' => $status];
        $key = config('cacheKey.media_list_by_group') . '_' . md5(json_encode($params));

        $value = Cache::remember($key, 3600, function () use ($params) {
            $d = date('Y-m-d h:i:s');
            $additional = $params['act'] . " as act";
            $data = self::query()->from('m_media as M')->select(['M.id', 'M.title', 'M.title_sub', 'M.class', 'M.class_sub', 'M.cp_id', 'M.duration', 'M.type', 'M.is_direction', 'M.publishtime', 'M.score', 'M.url', 'M.url_jump', 'M.serie_end', 'A.customer_id', 'A.mode'])->selectRaw($additional)
                ->rightJoin('m_media_group as G', 'G.media_id', '=', 'M.id')
                ->rightJoin('m_media_attr as A', 'A.media_id', '=', 'M.id')
                ->where([
                    'G.group_id' => $params['groupid'],
                    'G.status' => 1,
                    'A.customer_id' => $params['customer_id'],
                    'M.status' => $params['status']
                ])
                ->where('M.memory', '<=', $params['memory'])
                ->where('M.onlinetime', '<=', $d)
                ->where('M.offlinetime', '>=', $d)
                ->whereRaw('find_in_set(\'' . $params['iosCode'] . '\', `M`.`region`)')
                ->orderBy('G.sort')
                ->orderBy('M.id')
                ->limit($params['limit'])
                ->get();

            return $data;
        });

        return $value;
    }

    /**
     * @param array $sub
     * @param string $iosCode
     * @param $customer_id
     * @param int $memory
     * @return \Illuminate\Database\Eloquent\Builder[]|\Illuminate\Database\Eloquent\Collection
     * 随机获取推荐数据
     */
    public static function getRecommend($id, $sub = [], $iosCode = 'US', $customer_id, $memory = 1, $status = 2)
    {
        $params = ['id' => $id, 'sub' => $sub, 'iosCode' => $iosCode, 'customer_id' => $customer_id, 'memory' => $memory, 'status' => $status];
        $key = config('cacheKey.media_recommend') . '_' . md5(json_encode($params));

        $value = Cache::remember($key, 5, function () use ($params) {
            $data = self::query()
                ->from('m_media as M')
                ->select(['M.id', 'M.title', 'M.title_sub', 'M.class', 'M.class_sub', 'M.cp_id', 'M.duration', 'M.type', 'M.is_direction', 'M.publishtime', 'M.score', 'M.url_jump', 'A.customer_id', 'A.mode'])
                ->rightJoin('m_media_attr as A', 'A.media_id', '=', 'M.id')
                ->where([
                    'A.customer_id' => $params['customer_id'],
                    'M.status' => $params['status'],
                    'M.parent_id' => 0
                ])
                ->where('M.type', '<>', 2)
                ->where('M.memory', '<=', $params['memory'])
                ->whereIn('class_sub', $params['sub'])
                ->where('M.id', '!=', $params['id'])
                ->whereRaw('find_in_set(\'' . $params['iosCode'] . '\', `M`.`region`)')
                ->orderByRaw('rand()')
                ->limit(6)
                ->get();

            return $data;
        });

        return $value;
    }

    public static function selectBytype()
    {
        $key = config('cacheKey.media_select');

        $value = Cache::remember($key, 0, function () {
            $data = self::query()->where(['parent_id' => 0])->whereIn('type', [1, 2])->get(['id', 'type', 'title_original'])->sortBy('type')->toArray();
            $list = [];
            array_walk($data, function ($val) use (&$list) {
                $type_name = $val['type'] == 1 ? 'Serie' : 'Activity';
                $list[$val['id']] = '[' . $type_name . '] ' . $val['title_original'];
            });

            return $list;
        });

        return $value;
    }

    public function cp()
    {
        return $this->hasOne(Cp::class, 'id', 'cp_id');
    }

    public function languages()
    {
        return $this->belongsTo(Config::class, 'language', 'value');
    }

    public function categorie()
    {
        return $this->belongsTo(Category::class, 'class', 'id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     * 媒资图片
     */
    public function imgs()
    {
        return $this->hasMany(MediaImg::class, 'media_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     * 媒资模式
     */
    public function modes()
    {
        return $this->hasMany(MediaAttr::class, 'media_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     * 媒资字幕: 一对多
     */
    public function subtitles()
    {
        return $this->hasMany(MediaSubtitle::class);
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     * 对应多个分组
     */
    public function groups()
    {
        return $this->belongsToMany(Group::class, 'm_media_group');
    }
}
