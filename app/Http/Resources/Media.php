<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class Media extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'title' => $this->title,
            'title_sub' => $this->title_sub,
            'duration' => $this->duration,
            'updatetime' => $this->updatetime,
            'publishtime' => $this->publishtime,
            'cp_id' => $this->cp_id,
            'score' => $this->score,
            'click_num' => $this->click_num,
            'language' => $this->language,
            'class' => $this->class,
            'intro' => $this->intro,
            'url' => $this->url,
            'video_url' => $this->video_url
        ];
    }
}
