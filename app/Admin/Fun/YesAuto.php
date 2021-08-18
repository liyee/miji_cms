<?php
/**
 * 网博
 */

namespace App\Admin\Fun;


use Illuminate\Support\Facades\Http;

class yesAuto
{
    /**
     * 信息类别
     */
    public function getCategory($url = '')
    {
        $url_category = $url . '/overseas-api-server/third_platform/query_contenttype_list';
        $response = Http::get($url_category)->json();

        return $response;
    }

    /**
     * 信息类别
     */
    public function getList($url = '', $args)
    {
        $category = $this->getCategory($url);
        $url_list = $url . '/data/page/metax_query_contentlist_by_catagory';
        $data = [];
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
//                    if ($page_num >= 2) $isContinue = false;

                    $video_list = $response['video_list'];
                    $video_list_filter = array_filter($video_list, function ($val) {
                        if ($val['busy_type'] == 2) {
                            return $val;
                        }
                    });
                    $data = array_merge($data, $video_list_filter);
                    $page_num++;
                }
                if (!$isContinue) continue;
            }
        }

        return $data;
    }
}
