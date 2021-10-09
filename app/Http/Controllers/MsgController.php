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
        $email = $request->input('email');
        $content = $request->input('content');

        if ($email) {
            $pattern = '/^[a-z0-9]+([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/i';
            if (preg_match($pattern, $email) == 0) {
                return response([
                    'code' => 412,
                    'msg' => 'The email format is not supported!'
                ]);
            }
        }

        $ip = $request->ip();
        $msg = new Msg();
        $msg->email = $email;
        $msg->content = $content;
        $msg->ip = $ip;
        $msg->region = IpHelp::getCountryCode($ip, null);

        return response([
            'data' => $msg->save(),
            'code' => 200,
            'msg' => 'success'
        ]);
    }
}
