<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Encore\Admin\Traits\ModelTree;

class Group extends Model
{
    use HasFactory;
    use ModelTree;

    protected $table = 'm_group';

    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

        $this->setParentColumn('parent_id');
        $this->setOrderColumn('sort');
        $this->setTitleColumn('title');
    }

    /**
     * @param array $fields
     * @param array $where
     * 获取数据列表
     */
    public static function getList($where = []){
        return self::query()->where($where);
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     * 对应多条媒资
     */
    public function medias(){
        return $this->belongsToMany(Media::class, 'm_media_group');
    }

    public function activity(){
        return $this->hasOne(Activity::class);
    }
}
