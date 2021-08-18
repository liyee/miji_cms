<?php

/**
 * 汽车之家
 */

namespace App\Admin\Fun;

use App\Models\Category;
use Illuminate\Support\Facades\Http;

class wangbo
{
//    protected $type = ['Shows', 'Movies', 'Videos'];
    protected $type = ['Movies'];
    protected $fild = [''];

    /**
     * 信息类别
     */
    public function getToken($url = '', $args)
    {
        $token = '';
        $url_category = $url . '/api/channel/token';
        $response = Http::get($url_category, [
            'key' => $args[0],
            'secret' => $args[1],
            'timestamp' => time()
        ])->json();
        if ($response['code'] == 'success') {
            $token = $response['data']['token'];
        }

        return $token;
    }

    /**
     * 信息类别
     */
    public function getCategory($url = '', $token = '')
    {
        $data = [];
        $url_category = $url . '/api/channel/mediaTypeList';

        foreach ($this->type as $type) {
            $num = 1;
            $page_num = 100;
            for ($i = 1; $i <= $num; $i++) {
                $response = Http::withToken('vitiu:' . $token, '')->post($url_category, [
                    'video_type' => $type,
                    'page_num' => $page_num,
                    'page_size' => $i
                ])->json();

                if ($response['code'] == 'success') {
                    $num = ceil($response['data']['total'] / $page_num);
                    $data = array_merge($data, $response['data']['data']['category_list']);
                }
            }
        }

        return $data;
    }

    /**
     * 信息列表
     */
    public function getList($url = '', $args)
    {
        $token = $this->getToken($url, $args);
        $data = [];

        if (!$token) return $data;

        $category_new = $this->getCategory($url, $token);
        $category_insert = $this->insertCategory($category_new);

        $url_list = $url . '/api/channel/mediaListSrf';
        foreach ($category_new as $item) {
            $page_num = 20;
            $num = 1;
            for ($i = 1; $i <= $num; $i++) {
                $response = Http::withToken('vitiu:' . $token, '')->post($url_list, [
                    'category_unique' => (string)$item['category_unique'],
                    'api_key' => $args[0],
                    'page_num' => $page_num,
                    'page_size' => $i,
                ])->json();

                if ($response['code'] == 'success') {
                    $num = ceil($response['data']['total'] / $page_num);
                    $movie_sub = $response['data']['data'];
                    if ($movie_sub) {
                        $category_name = $item['category_name'];
                        $category_db_id = $category_insert[$category_name]['id'];
                        $video_list = [];
                        array_walk($movie_sub['video_list'], function ($item, $key) use (&$video_list, $category_db_id) {
                            $item['uuid'] = 'wangbo_' . $item['video_unique'];
                            $item['class'] = $category_db_id;
                            $video_list[] = $item;
                        });

                        $data = array_merge($data, $video_list);
                    }
                }
            }
        }

        return $data;
    }

    /**
     * @param array $data
     * @return array|false
     * 添加媒资分类
     */
    protected function insertCategory($data = [])
    {
        $category_new = array_map(function ($val) {
            return ['parent_id' => 1, 'title' => $val['category_name']];
        }, $data);
        Category::upsert($category_new, ['parent_id', 'title']);

        $category = Category::where('parent_id', 1)->get(['id', 'title'])->toArray();
        $titles = array_column($category, 'title');

        return array_combine($titles, $category);
    }

    /**
     * @param array $data
     * 添加媒资
     */
    protected function insertMedia($data = [])
    {

    }
}
