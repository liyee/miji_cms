<?php


namespace App\Jobs\Middleware;


use Illuminate\Support\Facades\Redis;

class RateLimited
{
    public function handle($job, $next)
    {
        Redis::throttle('key')
            ->block(0)->allow(1)->every(5)
            ->then(function () use ($job, $next) {
                // 获取锁 ...

                $next($job);
            }, function () use ($job) {
                // 无法获取锁 ...

                $job->release(5);
            });
    }
}
