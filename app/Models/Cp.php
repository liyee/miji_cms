<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Cache;

class Cp extends Model
{
    use HasFactory;

    protected $table = 'm_cp';
    public $timestamps = true;

    protected $attributes = [
        'status' => 1,
    ];

    public static function select($id = 0)
    {
        $key = config('cacheKey.cp_select');
        $value = Cache::remember($key, 0, function () {
            $select = [];
            $data = self::where('status', 1)->get(['id', 'name'])->toArray();
            array_walk($data, function ($val) use (&$select) {
                $select[$val['id']] = $val['name'];
            });

            return $select;
        });

        return $id != 0 ? $value[$id] : $value;
    }
}
