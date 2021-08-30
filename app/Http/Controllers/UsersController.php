<?php

namespace App\Http\Controllers;

use App\Jobs\ProcessJob;
use App\Models\Config;
use App\Models\Media;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class UsersController extends Controller
{
    //
    public function test()
    {
        $url = 'http://www.baidu.com?name=qq';
        echo strpos($url, '?');


//        Cache::put('a', '1112');
//        $val = Cache::get('a');
//        return $val;
    }

    public function store(Request $request)
    {
        $media = Media::query()->find(1);
        $result = ProcessJob::dispatch($media);
        return $result;
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
                                "duration" => 1200,
                                "publishtime" => "0", // 发行日期
                                "cp" => "ytgame", // 内容供应商
                                "score" => 50,
                                "class" => 1, // 媒资类型 video
                                "url" => 'https://html5.toongoggles.com', //--媒资链接（外部链接才有值）
                                'img' => [
                                    '16_9' => ['url' => 'http://xx.xx.xx/1.jpg', 'url_bg' => 'http://xx.xx.xx/2.jpg'],
                                    '7_10' => ['url' => 'http://xx.xx.xx/3.jpg', 'url_bg' => 'http://xx.xx.xx/4.jpg']
                                ],

                                "is_series" => 0, // 是否是剧集
                                'drama_end' => 1, // 是否完结
//                                "mark_id" => 1, //角标id
//                                'video_url' => 'https://html5.toongoggles.com/11.mp4',
//                                'subtitle' => [ // 字幕列表
//                                    ['language_id' => 1, 'url' => 'https://html5.toongoggles.com/1.ttl'],
//                                    ['language_id' => 2, 'url' => 'https://html5.toongoggles.com/2.ttl']
//                                ],
                            ],
                        ],
                    ]
                ]
            ],
        ];

        return $data;
    }
}
