<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Cache;

class Config extends Model
{
    use HasFactory;

    protected $table = 'm_config';

    public static function select($type = 1)
    {
        $key = config('cacheKey.config_select') . '_' . $type;
        $value = Cache::remember($key, 5, function () use ($type) {
            $select = [];
            $data = self::where('type', $type)->get(['name', 'value'])->toArray();
            array_walk($data, function ($val) use (&$select) {
                $select[$val['value']] = $val['name'];
            });

            return $select;
        });

        return $value;
    }

    public static function getlist($type = 1, $name = '')
    {
        $key = config('cacheKey.config_list') . '_' . $type;
        $value = Cache::remember($key, 3600, function () use ($type) {
            $select = [];
            $data = self::where('type', $type)->get(['name', 'value'])->toArray();
            array_walk($data, function ($val) use (&$select) {
                $select[$val['name']] = $val['value'];
            });

            return $select;
        });

        if ($name) {
            return isset($value[$name]) ? $value[$name] : '';
        }

        return $value;
    }
}
