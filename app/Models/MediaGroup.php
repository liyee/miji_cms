<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Cache;

class MediaGroup extends Model
{
    use HasFactory;

    protected $table = 'm_media_group';

    public static function getNumById($id = 0)
    {
        $key = config('cacheKey.group_num');
        $value = Cache::remember($key, 60, function () {
            $list = self::query()->from('m_media_group as G')
                ->selectRaw('G.group_id,COUNT(G.media_id) num')
                ->leftJoin('m_media as M', 'M.id', '=', 'G.media_id')
                ->where(['G.status' => 1, 'M.status' => 2])
                ->groupBy('group_id')
                ->get()->toArray();
            $group = array_column($list, 'group_id');
            $num = array_column($list, 'num');

            return array_combine($group, $num);
        });

        return isset($value[$id]) ? $value[$id] : 0;
    }
}
