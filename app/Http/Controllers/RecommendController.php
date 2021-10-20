<?php

namespace App\Http\Controllers;

use App\Models\Collection;
use App\Models\Recommend;
use Illuminate\Http\Request;

class RecommendController extends Controller
{
    public function test()
    {

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
        $product_id = $request->input('product_id', '13');
        $pn = $request->input('pn', 'Google');
        $pt = $request->input('pt', '520678');
        $tm = $request->input('tm', 0);
        $memory = $tm >= 600 ? 2 : 1;

        $iosCode = \App\Libraries\IpHelp::getCountryCode($request->ip());
        $customer_id = \App\Models\Customer::getCustomerId($pn, $pt);

        $collection = Collection::getList($product_id);
        if (!$collection) {
            return response(['data' => '', 'message' => 'ok']);
        }
        $recommend = Recommend::getList(array_column($collection, 'mId'), $iosCode, $customer_id, $memory, 2);

        $feed = array_map(function ($v) use ($recommend) {
            $collection_id = $v['mId'];
            $v['mId'] = (string)$v['mId'];
            $v['items'] = isset($recommend[$collection_id]) ? $recommend[$collection_id] : [];

            return $v;
        }, $collection);

        $data['feed'] = $feed;
        $data['updateTime'] = 60;

        return response(['data' => $data, 'message' => 'ok', 'status' => 1]);
    }
}
