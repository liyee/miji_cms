<?php

namespace App\Http\Middleware;

use App\Libraries\Aes;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use phpDocumentor\Reflection\DocBlock\Tags\Throws;
use Prophecy\Exception\Prophecy\MethodProphecyException;

class Secret
{
    /**
     * Handle an incoming request.
     *
     * @param \Illuminate\Http\Request $request
     * @param \Closure $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        $secret = $request->input('secret');
        $tmp = $request->input('tmp');
        try {
            $now = time();
            $decrypted = Aes::decrypt($secret);
            if (!$decrypted || $tmp < $now - 300 || $tmp > $now) {
                abort(203, 'Signature failure!');
                return false;
            }

            return $next($request);
        } catch (DecryptException $e) {
            //
            report($e);
            return false;
        }
    }
}
