<?php

namespace App\Providers;

use App\Jobs\ProcessJob;
use Illuminate\Support\ServiceProvider;

class JobServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        //
        $this->app->bindMethod(ProcessJob::class.'@handle', function ($job, $app){
            return $job->handle($app->make(Job));
        });

    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        //

    }
}
