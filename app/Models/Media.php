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
    public static function getOne($id)
    {
        $fields = ['title', 'title_sub', 'duration', 'updatetime', 'publishtime', 'cp_id', 'score', 'click_num', 'language', 'class', 'intro', 'url', 'video_url'];
        return self::find($id, $fields);
    }

    public function cps()
    {
        return $this->belongsTo(Cp::class, 'cp_id', 'id');
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

}
