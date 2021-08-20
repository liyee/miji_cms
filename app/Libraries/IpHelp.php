<?php


namespace App\Libraries;


use GeoIp2\Database\Reader;

class IpHelp
{
    /**
     * @param $ip
     * @return string|null
     * @throws \GeoIp2\Exception\AddressNotFoundException
     * @throws \MaxMind\Db\Reader\InvalidDatabaseException
     * 获取国家iosCode
     */
    public static function getCountryCode($ip){
        $iosCode = 'US';
        $reader = new Reader(resource_path('file/GeoLite2-Country.mmdb'));
        try {
            $contry = $reader->country($ip);
//            $contry = $reader->country('103.105.48.138');
            $iosCode = $contry->country->isoCode;
        }catch (\Throwable $e){
//            report($e);
        }

        return $iosCode;
    }
}
