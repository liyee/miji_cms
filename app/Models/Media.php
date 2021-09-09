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
     * @param $id
     * @param array $fields
     * @param array $where
     * 获取媒资详情
     */
    public static function getOne($id, $type = 0, $status = 2, $parent_id = 0)
    {
        $data = self::query()->where([
            'status' => $status
        ])->find($id);

        return $data;
    }

    /**
     * @param $id
     * @param int $type
     * @param int $status
     * @param int $parent_id
     * 获取单条媒资信息
     */
    public static function getOne2($id, $type = 0, $status = 2, $parent_id = 0, $customer_id = 0, $memory = 1)
    {
        $one = self::query()->from('m_media as M')->select(['M.*', 'A.customer_id', 'A.mode'])
            ->rightJoin('m_media_attr as A', 'A.media_id', '=', 'M.id')
            ->where([
                'M.id' => $id,
//                'M.type' => $type,
                'M.status' => $status,
//                'M.parent_id' => $parent_id,
                'A.customer_id' => $customer_id,
            ])
            ->where('M.memory', '<=', $memory)
            ->first();

        return $one;
    }

    /**
     * @param int $groupid
     * @param int $parent_id
     * @return \Illuminate\Database\Eloquent\Builder[]|\Illuminate\Database\Eloquent\Collection
     * 媒资列表-根据分组id
     */
    public static function getList($parent_id = 0, $iosCode = 'US', $customer_id = 0, $memory = 1, $act = 0, $status = 2)
    {
        $additional = "$act as act";
        $data = self::query()->select('*')->selectRaw($additional)->from('m_media as M')
            ->rightJoin('m_media_attr as A', 'A.media_id', '=', 'M.id')
            ->where([
                'M.parent_id' => $parent_id,
                'M.status' => $status,
                'A.customer_id' => $customer_id
            ])
            ->where('M.memory', '<=', $memory)
            ->whereRaw('find_in_set(\'' . $iosCode . '\', `M`.`region`)')
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
        $data = self::query()->from('m_media as M')
            ->rightJoin('m_media_attr as A', 'A.media_id', '=', 'M.id')
            ->where([
                'M.parent_id' => $parent_id,
                'M.status' => $status,
                'A.customer_id' => $customer_id
            ])
            ->where('M.memory', '<=', $memory)
            ->orderBy('M.sort')->pluck('M.id');

        return $data;
    }

    /**
     * @param int $groupid
     * @param int $parent_id
     * @return \Illuminate\Database\Eloquent\Builder[]|\Illuminate\Database\Eloquent\Collection
     * 媒资列表-根据分组id
     */
    public static function getListByGroup($groupid = 0, $iosCode = 'US', $limit = 999, $customer_id = 0, $memory = 1, $act = 0, $status = 2)
    {
        $additional = "$act as act";
        $data = self::query()->from('m_media as M')->select(['M.id', 'M.title', 'M.title_sub', 'M.class', 'M.class_sub', 'M.cp_id', 'M.duration', 'M.type', 'M.is_direction', 'M.publishtime', 'M.score', 'M.url', 'M.url_jump', 'M.serie_end'])->selectRaw($additional)
            ->rightJoin('m_media_group as G', 'G.media_id', '=', 'M.id')
            ->rightJoin('m_media_attr as A', 'A.media_id', '=', 'M.id')
            ->where([
                'G.group_id' => $groupid,
                'G.status' => 1,
                'A.customer_id' => $customer_id,
                'M.status' => $status
            ])
            ->where('M.memory', '<=', $memory)
            ->whereRaw('find_in_set(\'' . $iosCode . '\', `M`.`region`)')
            ->orderBy('M.sort')
            ->orderBy('M.id')
            ->limit($limit)
            ->get();

        return $data;
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
        $data = self::query()->from('m_media as M')->select(['M.id', 'M.title', 'M.title_sub', 'M.class', 'M.class_sub', 'M.cp_id', 'M.duration', 'M.type', 'M.is_direction', 'M.publishtime', 'M.score', 'M.url'])
            ->rightJoin('m_media_attr as A', 'A.media_id', '=', 'M.id')
            ->where([
                'A.customer_id' => $customer_id,
                'M.status' => $status
            ])
            ->where('M.memory', '<=', $memory)
            ->whereIn('class_sub', $sub)
            ->where('M.id', '!=', $id)
            ->whereRaw('find_in_set(\'' . $iosCode . '\', `M`.`region`)')
            ->orderByRaw('rand()')
            ->limit(6)
            ->get();

        return $data;
    }

    public static function selectBytype($type = 1)
    {
        $key = config('cacheKey.media_select') . $type;

        $value = Cache::remember($key, 0, function () use ($type) {
            $data = self::where(['type' => $type, 'parent_id' => 0])->get(['id', 'title'])->toArray();
            $list = [];
            array_walk($data, function ($val) use (&$list) {
                $list[$val['id']] = $val['title'];

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
