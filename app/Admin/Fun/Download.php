<?php


namespace App\Admin\Fun;

use App\Models\Media;

class Download
{
    protected $info;

    /**
     * Download constructor.
     */
    public function __construct($info = [])
    {
        $this->info = $info;
    }

    /**
     * 下载
     */
    public function init()
    {
        $this->getList();
    }

    /**
     * 信息列表
     */
    protected function getList()
    {
        $name = $this->info['name'];
        $cp_name = 'App\\Admin\\Fun\\' . $this->info['name'];
        $cp = new $cp_name;
        $data = $cp->getList($this->info);
        $mediaHava = Media::query()->where('uuid', 'like', $name . '_%')->pluck('uuid')->toArray();
        $dataNew = array_filter($data, function ($val) use ($mediaHava) {
            if (!in_array($val['uuid'], $mediaHava)) {
                return $val;
            }
        });
        if ($dataNew){
            Media::query()->insert($dataNew);
        }
    }
}
