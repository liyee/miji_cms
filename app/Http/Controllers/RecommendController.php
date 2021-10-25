<?php

namespace App\Http\Controllers;

use App\Libraries\Aes;
use App\Models\Collection;
use App\Models\Recommend;
use Illuminate\Http\Request;

class RecommendController extends Controller
{
    public function test()
    {
        //b=SkyworthDigital&lang=en&av=2.1.1.0&cv=90.0.4430.210&ip=192.168.33.7&pn=Google&pt=MetaxAR&sv=29&tm=1987&cpu=armeabi-v7a
//        $params = [
//            "b" => "SkyworthDigital",
//            "lang" => "en",
//            "av" => "2.1.1.0",
//            "cv" => "90.0.4430.210",
//            "ip" => "192.168.33.7",
//            "pn" => "Google",
//            "pt" => "MetaxAR",
//            "sv" => "29",
//            "tm" => "1987",
//            "cpu" => "armeabi-v7a",
//            'product' => 'mp'
//        ];
//        return response([
//            'data' => Aes::encrypt(http_build_query($params)),
//        ]);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\Routing\ResponseFactory|\Illuminate\Http\Response
     * @throws \GeoIp2\Exception\AddressNotFoundException
     * @throws \MaxMind\Db\Reader\InvalidDatabaseException
     * 渠道推荐功能
     */
    public function channle(Request $request)
    {
        $param = $request->input('param');
        if (!$param) return response(['data' => '', 'message' => 'Param cannot be empty', 'status' => 401]);

        $decrypt = Aes::decrypt($param);
        if (!$decrypt) return response(['data' => '', 'message' => 'Signature verification failure', 'status' => 402]);

        $params = [];
        parse_str($decrypt, $params);

        $product = $params['product'] ?? 'ob';
        $pn = $params['pn'] ?? 'Google';
        $pt = $params['pt'] ?? '520678';
        $tm = $params['tm'] ?? 0;
        $memory = $tm >= 600 ? 2 : 1;

        $iosCode = \App\Libraries\IpHelp::getCountryCode($request->ip());
        $customer_id = \App\Models\Customer::getCustomerId($pn, $pt);
        if (!$customer_id) {
            return response(['data' => '', 'message' => 'The current channel does not exist', 'status' => 403]);
        }

        $collection = Collection::getList($product);
        if (!$collection) {
            return response(['data' => '', 'message' => 'Data does not exist', 'status' => 404]);
        }
        $recommend = Recommend::getList(array_column($collection, 'mId'), $iosCode, $customer_id, $memory, 2);

        $feed = [];
        foreach ($collection as $coll) {
            $collection_id = $coll['mId'];
            $coll['items'] = array_map(function ($v) use ($product, $collection_id) {
                if ($v['collection_id'] == $collection_id) {
                    $v['mId'] = (string)$v['mId'];
                    if ($product != 'ob') {
                        $intent_uri = $v['intent_uri'];
                        if ($intent_uri){
                            $intent_uri_mode = $v['intent_uri_key'] == 5 ? 'metax_mode=focus' : 'metax_mode=mouse';
                            $intent_uri_add = (strstr($intent_uri, '?') ? '&' : '?') . $intent_uri_mode;
                            $v['intent_uri'] .= $intent_uri ? $intent_uri_add : '';
                        }

                        $back_url = $v['back_url'];
                        if ($back_url){
                            $back_mode = $v['back_key'] == 5 ? 'metax_mode=focus' : 'metax_mode=mouse';
                            $intent_uri_add = (strstr($back_url, '?') ? '&' : '?') . $back_mode;
                            $v['back_url'] .= $back_url ? $intent_uri_add : '';
                        }
                    }
                    unset($v['collection_id']);

                    return $v;
                }
            }, $recommend);
            $feed[] = $coll;
        }

        $data['feed'] = $feed;
        $data['updateTime'] = 60;

        return response([
            'data' => Aes::encrypt(json_encode($data)),
            'message' => 'ok',
            'status' => 1
        ]);
    }
}
