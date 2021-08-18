<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class UsersController extends Controller
{
    //
    public function test()
    {
        Cache::put('a', '1112');
        $val = Cache::get('a');
        return $val;
    }

    /**
     * @return array[]
     * 首屏数据json
     */
    public function index()
    {
        $data = [
            [
                'id' => 1,
                'text' => 'Hot',
                'group' => [
                    [
                        'id' => 7,
                        'text' => 'Popular Games',
                        'sort' => 1,
                        'component_id' => 1,
                        'show_title' => 1,
                        'show_more' => 1,
                        'img' => 'http://xx.xx.xx/1.jpg',
                        'media' => [
                            [
                                "id" => 1,  //媒资id
                                "title" => "Talking Tom Shorts", //--媒资主标题
                                "title_sub" => "Talking Tom Shorts", //--媒资副标题
                                "is_direction" => 1, //--是否是跳转到第三方链接
                                "url" => 'https://html5.toongoggles.com', //--媒资链接（外部链接才有值）
//                            'video_url' => 'https://html5.toongoggles.com/11.mp4',
                                'img' => [
                                    '16_9' => ['url' => 'http://xx.xx.xx/1.jpg', 'url_bg' => 'http://xx.xx.xx/2.jpg'],
                                    '7_10' => ['url' => 'http://xx.xx.xx/3.jpg', 'url_bg' => 'http://xx.xx.xx/4.jpg']
                                ],
//                            'subtitle' => [ // 字幕列表
//                                ['language_id' => 1, 'url' => 'https://html5.toongoggles.com/1.ttl'],
//                                ['language_id' => 2, 'url' => 'https://html5.toongoggles.com/2.ttl']
//                            ],
                                "class" => 1, //--媒资类型 video
                                "is_series" => 0, //-- 是否是剧集
                                "score" => 50,
                                "duration" => 1200,
                                "publishtime" => "0", //发行日期
                                "mark_id" => 1, //角标id
                                "cp" => "ytgame" //-- 内容供应商
                            ],
                        ],
                    ]
                ]
            ],
        ];

        return $data;
    }
}
