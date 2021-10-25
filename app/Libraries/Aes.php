<?php


namespace App\Libraries;


class Aes
{
    /**
     * @param $encrypt
     * @return false|string
     * 解密-ase
     */
    public static function decrypt($encrypt, $cipher = 'AES-256-CBC')
    {
        $AES_KEY = env('AES_KEY');
        $AES_IV = env('AES_IV');
        return openssl_decrypt(base64_decode($encrypt), $cipher, $AES_KEY, OPENSSL_RAW_DATA, $AES_IV);
    }

    /**
     * @param $decrypt
     * @return string
     * 加密-aes
     */
    public static function encrypt($decrypt, $cipher = 'AES-256-CBC')
    {
        $AES_KEY = env('AES_KEY');
        $AES_IV = env('AES_IV');
        $encrypt = openssl_encrypt($decrypt, $cipher, $AES_KEY, OPENSSL_RAW_DATA, $AES_IV);

        return base64_encode($encrypt);
    }

}
