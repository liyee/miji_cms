<?php

namespace App\Jobs;

use App\Admin\Fun\Download;
use App\Jobs\Middleware\RateLimited;
use App\Models\Media;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Log;

class ProcessJob implements ShouldQueue
{

    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $message;


    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($message)
    {
        //
        $this->message = $message;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        //
        Log::info($this->message);
        $data = json_decode($this->message, true);
        switch ($data['type']){
            case 'download':
                $download = new Download($data['info']);
                $download->init();
                break;
            default:
        }
    }

    public function middleware()
    {
        return [new RateLimited];
    }
}
