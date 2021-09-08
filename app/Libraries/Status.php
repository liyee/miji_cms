<?php


namespace App\Libraries;


class Status
{
    static $list = [0 => 'DELETE', 1 => 'UNTESTED', 2 => 'TEST COMPLETE', 3 => 'TEST FAILURE', 4 => 'REQUIRE TEST AGIN', 5 => 'UNPUBLISH'];

    /**
     * 更具当前状态获取状态列表
     */
    public static function getList($status = 0)
    {
        switch ($status) {
            case 0:
                return [0 => 'DELETE', 1 => 'UNTESTED'];
                break;
            case 1:
                return [0 => 'DELETE', 1 => 'UNTESTED', 2 => 'TEST COMPLETE', 3 => 'TEST FAILURE', 4 => 'REQUIRE TEST AGIN'];
                break;
            case 2:
                return [2 => 'TEST COMPLETE', 4 => 'REQUIRE TEST AGIN'];
                break;
            case 3:
                return [0 => 'OFFLINE', 1 => 'ONLINE'];
                break;
            case 4:
                return [4 => 'PUBLISH', 5 => 'UNPUBLISH'];
                break;
            case 5:
                return [4 => 'PUBLISH', 5 => 'UNPUBLISH'];
                break;
            default:
        }
    }
}
