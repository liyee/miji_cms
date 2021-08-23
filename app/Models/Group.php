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
        $where = array_merge($where, [
            'status' => 1
        ]);

        return self::query()->where($where);
    }

    /**
     * @param $pn
     * @param $pt
     * @return \Illuminate\Database\Eloquent\Builder|\Illuminate\Database\Eloquent\Builder[]|\Illuminate\Database\Eloquent\Collection|Model|null
     * 通过客户信息获取对应的栏目信息
     */
    public static function getParentId($pn, $pt){
        $pt_id = Customer::getList($pn, $pt);
        $data = self::query()->where('pt_id', $pt_id)->first(['id']);
        return  $data->id;
    }

    public function medias(){
        return $this->belongsToMany(Media::class, 'm_media_group');
    }
}
