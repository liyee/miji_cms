<?php

/**
 * 网博
 * video-movie
 */

namespace App\Admin\Fun;

use App\Models\Category;
use App\Models\Config;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class wangbo
{
//    protected $type = ['Shows', 'Movies', 'Videos'];
    protected $type = ['Movies'];
    protected $fild = [''];

    /**
     * 信息类别
     */
    public function getToken($url = '', $key, $secret)
    {
        $token = '';
        $url_category = $url . '/api/channel/token';
        $response = Http::get($url_category, [
            'key' => $key,
            'secret' => $secret,
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
    public function getList($info = [])
    {
        $token = $this->getToken($info['url'], $info['apikey'], $info['apisecret']);
        $data = [];

        if (!$token) return $data;

        $category_new = $this->getCategory($info['url'], $token);
        $category_insert = $this->insertCategory($category_new);
        $categories = Category::getList();
        $url_list = $info['url'] . '/api/channel/mediaListSrf';
        foreach ($category_new as $item) {
            $page_num = 20;
            $num = 1;
            for ($i = 1; $i <= $num; $i++) {
                $response = Http::withToken('vitiu:' . $token, '')->post($url_list, [
                    'category_unique' => (string)$item['category_unique'],
                    'api_key' => $info['apikey'],
                    'page_num' => $page_num,
                    'page_size' => $i,
                ])->json();

                if ($response['code'] == 'success') {
                    $num = ceil($response['data']['total'] / $page_num);
                    $movie_sub = $response['data']['data'];
                    if ($movie_sub) {
                        $category_name = $item['category_name'];
                        $class_sub = $category_insert[$category_name]['id'];
                        $class = Category::getTop($categories, $class_sub);
                        $video_list = [];
                        array_walk($movie_sub['video_list'], function ($val, $key) use (&$video_list, $class_sub, $class) {
                            $item = [
                                'title' => $val['video_name'],
                                'title_original' => $val['video_name'],
                                'language' => Config::getlist(1, $val['video_language']),
                                'video_url' => isset($val['video_url']) ? $val['video_url'] : '',
                                'img_original' => $val['video_image_7_10'],
                                'intro' => $val['video_introduce'],
                                'publishtime' => $val['video_online_time'] . '-01-01',
//                                'url' => $val['jump_detail_url'],
                                'uuid' => 'wangbo_' . $val['video_unique'],
                                'cp_id' => 12,
                                'class' => $class,
                                'class_sub' => $class_sub,
                                'remark' => $val['video_language'],
                            ];
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
        $category = Category::where('parent_id', 1)->get(['id', 'title'])->toArray();
        $titleHave = array_column($category, 'title');

        $categoryNew = array_filter(array_map(function ($val) use ($titleHave) {
            if (!in_array($val['category_name'], $titleHave)) {
                return ['parent_id' => 1, 'title' => $val['category_name'], 'depth' => 2];
            }
        }, $data));

        if ($categoryNew) {
            Category::query()->insert($categoryNew);
        }

        $category = Category::where('parent_id', 1)->get(['id', 'title'])->toArray();
        $titles = array_column($category, 'title');
        $titlesNew = array_map(function ($val) {
            return strtr($val, ' ', '_');
        }, $titles);

        return array_combine($titlesNew, $category);
    }
}
