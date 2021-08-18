<?php


namespace App\Admin\Fun;

class Download
{
    protected $url;
    protected $name;
    protected $args;

    /**
     * Download constructor.
     */
    public function __construct($url, $name, ...$args)
    {
        $this->url = $url;
        $this->name = $name;
        $this->args = $args;
    }

    /**
     * 下载
     */
    public function init()
    {
        $media_list = $this->getList();
    }

    /**
     * 信息列表
     */
    protected function getList()
    {
        $cp_name = 'App\\Admin\\Fun\\' . $this->name;
        $cp = new $cp_name;
        return $cp->getList($this->url, $this->args);
    }
}
