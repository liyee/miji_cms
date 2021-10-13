<?php

namespace App\Http\Controllers;

use App\Libraries\IpHelp;
use App\Models\Msg;
use Illuminate\Http\Request;

class MsgController extends Controller
{

    /**
     * @param Request $request
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\Routing\ResponseFactory|\Illuminate\Http\Response
     * @throws \GeoIp2\Exception\AddressNotFoundException
     * @throws \MaxMind\Db\Reader\InvalidDatabaseException
     * 反馈消息上报功能
     */
    public function push(Request $request)
    {
        $email = $request->input('email', '');
        $content = $request->input('content');

        $ip = $request->ip();
        $msg = new Msg();
        $msg->email = $email;
        $msg->content = $content;
        $msg->ip = $ip;
        $msg->region = IpHelp::getCountryCode($ip, null);

        try {
            $msg->save();
        } catch (\Throwable $e) {
            report($e);
            return response(['data' => '', 'code' => 500, 'msg' => $e->getMessage()]);
        }

        return response(['data' => '', 'code' => 200, 'msg' => 'success']);
    }
}
