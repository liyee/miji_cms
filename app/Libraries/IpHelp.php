<?php


namespace App\Libraries;


use GeoIp2\Database\Reader;
use Illuminate\Support\Facades\Cache;

class IpHelp
{
    /**
     * @param $ip
     * @return string|null
     * @throws \GeoIp2\Exception\AddressNotFoundException
     * @throws \MaxMind\Db\Reader\InvalidDatabaseException
     * 获取国家iosCode
     */
    public static function getCountryCode($ip)
    {
        $iosCode = 'US';
        $key = 'iosCode_' . md5($ip);
        if (Cache::has($key)) {
            return Cache::get($key);
        }else{
            $reader = new Reader(resource_path('file/GeoLite2-Country.mmdb'));
            try {
                $contry = $reader->country($ip);
                $iosCode = $contry->country->isoCode;
            } catch (\Throwable $e) {
//            report($e);
            }
        }

        Cache::put($key, $iosCode, 3600);

        return $iosCode;
    }
}
