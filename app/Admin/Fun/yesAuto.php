<?php
/**
 * 汽车之家
 * 视频 video-auto-Car News
 * busy_type=2(1:图文; 2:视频-当前接入)
 * video_region 媒资在哪里发出的，作为语言使用
 */

namespace App\Admin\Fun;


use App\Models\Category;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class yesAuto
{
    /**
     * 信息类别
     */
    public function getCategory($url = '')
    {
        $url_category = $url . '/overseas-api-server/third_platform/query_contenttype_list';
        $response = Http::get($url_category, [
            'video_type' => 'Movies'
        ])->json();

        return $response;
    }

    /**
     * 信息类别
     */
    public function getList($info = [])
    {
        $category = $this->getCategory($info['url']);
        $categoryNew = $this->insertCategory($category['category_list']);
        $url_list = $info['url'] . '/data/page/metax_query_contentlist_by_catagory';
        $data = [];
        $categories = Category::getList();
        if ($category) {
            foreach ($category['category_list'] as $item) {
                $isContinue = true;
                $page_size = 500;
                $page_num = 1;
                $total = 100;
                while ($isContinue) {
                    $response = Http::get($url_list, [
                        '_appid' => 'metax',
                        'page_num' => $page_num,
                        'page_size' => $page_size,
                        'category_unique' => $item['catagroy_uniqure']
                    ])->json();
                    $total = $response['video_count'];
                    if ($page_num >= $total / $page_size) $isContinue = false;

                    $video_list = $response['video_list'];
                    $catagroy_name = strtr($item['catagroy_name'], ' ', '_');
                    $class_sub = $categoryNew[$catagroy_name]['id'];
                    $class = Category::getTop($categories, $class_sub);
                    $video_list_filter = array_filter(array_map(function ($val) use ($class, $class_sub) {
                        if ($val['busy_type'] == 2 && isset($val['video_url'])) {//接入视频
                            $language = 'en';
                            switch ($val['video_region']){
                                case 'DE':
                                    $language = 'de';
                                    break;
                                default:
                                    $language = 'en';
                            }

                            $valNew = [
                                'title' => $val['video_name'],
                                'title_original' => $val['video_name'],
                                'language' => $language,
                                'url' => isset($val['video_url']) ? $val['video_url'] : '',
                                'img_original' => $val['video_img'],
                                'intro' => $val['video_introduce'],
                                'publishtime' => $val['video_online_time'],
                                'url_jump' => $val['jump_detail_url'],
                                'uuid' => 'yesAuto_' . $val['video_unique'],
                                'cp_id' => 11,
                                'class' => $class,
                                'class_sub' => $class_sub,
                                'remark' => $val['video_region'],
                            ];
                            return $valNew;
                        }
                    }, $video_list));

                    $data = array_merge($data, $video_list_filter);
                    $page_num++;
                }
                if (!$isContinue) continue;
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
        $category = Category::where('parent_id', 31)->get(['id', 'title'])->toArray();
        $titleHave = array_column($category, 'title');

        $categoryNew = array_filter(array_map(function ($val) use ($titleHave) {
            if (!in_array($val['catagroy_name'], $titleHave)) {
                return ['parent_id' => 31, 'title' => $val['catagroy_name'], 'depth' => 2];
            }
        }, $data));

        if ($categoryNew){
            Category::query()->insert($categoryNew);
        }

        $category = Category::where('parent_id', 31)->get(['id', 'title'])->toArray();
        $titles = array_column($category, 'title');
        $titlesNew = array_map(function ($val) {
            return strtr($val, ' ', '_');
        }, $titles);

        return array_combine($titlesNew, $category);
    }
}
