<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

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
        return explode(',', $value);
    }

    public function setAreaAttribute($value)
    {
        $this->attributes['area'] = implode(',', $value);
    }

    /**
     * @param $id
     * @param array $fields
     * @param array $where
     * 获取媒资详情
     */
    public static function getOne($id, $type = 0, $status = 4, $parent_id = 0)
    {
        $where = [
            'status' => $status,
            'parent_id' => $parent_id,
            'type' => $type
        ];
        return self::query()->where($where)->find($id);
    }

    /**
     * @param int $groupid
     * @param int $parent_id
     * @return \Illuminate\Database\Eloquent\Builder[]|\Illuminate\Database\Eloquent\Collection
     * 媒资列表-根据分组id
     */
    public static function getList($id = 0)
    {
        $data = self::query()->where('parent_id', $id)->get();

        return $data;
    }

    /**
     * @param int $parent_id
     * @return mixed
     * 获取连续剧具体媒资id
     */
    public static function getListBySerie($parent_id = 0)
    {
        return self::where('parent_id', $parent_id)->orderBy('sort')->pluck('id');
    }

    /**
     * @param int $groupid
     * @param int $parent_id
     * @return \Illuminate\Database\Eloquent\Builder[]|\Illuminate\Database\Eloquent\Collection
     * 媒资列表-根据分组id
     */
    public static function getListByGroup($groupid = 0, $iosCode = 'US', $limit = 999)
    {
        $data = self::query()->from('m_media as M')->select(['M.id', 'M.title', 'M.title_sub', 'M.class', 'M.cp_id', 'M.duration', 'M.type', 'M.is_direction', 'M.publishtime', 'M.score', 'M.url'])
            ->rightJoin('m_media_group as G', 'G.media_id', '=', 'M.id')
            ->where('G.group_id', $groupid)
            ->whereRaw('find_in_set(\''.$iosCode.'\', `M`.`area`)')
            ->orderBy('M.sort')
            ->orderBy('M.id')
            ->limit($limit)
            ->get();

        return $data;
    }

    public function cp()
    {
        return $this->hasOne(Cp::class, 'id', 'cp_id');
    }

    public function languages()
    {
        return $this->belongsTo(Config::class, 'language', 'id');
    }

    public function items()
    {
        return $this->belongsTo(Customer::class, 'item_id', 'id');
    }

    public function categories()
    {
        return $this->belongsTo(Category::class, 'class', 'id');
    }

    /**
     * 媒资图片
     */
    public function imgs()
    {
        return $this->hasMany(MediaImg::class);
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     * 媒资字幕: 一对多
     */
    public function subtitles()
    {
        return $this->hasMany(MediaSubtitle::class);
    }
}
