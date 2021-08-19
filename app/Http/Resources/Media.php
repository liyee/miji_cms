<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class Media extends JsonResource
{
    protected $use = 0;

    public function __construct($resource, $use = 0)
    {
        $this->use = $use;
        parent::__construct($resource);
    }

    /**
     * Transform the resource into an array.
     *
     * @param \Illuminate\Http\Request $request
     * @return array
     */
    public function toArray($request)
    {
        if (!$this->resource) {
            return [];
        }
        $clarity = $request->input('clarity', '720p');

        $addition = [];
        switch ($this->use) {
            case 1://媒资详情
                $addition = [
                    'updatetime' => $this->updatetime,
                    'click_num' => $this->click_num,
                    'language' => $this->language,
                    'intro' => $this->intro,
                    'video_url' => $this->video_url,
                    'is_adv' => $this->is_adv,
                    'subtitle' => Subtitles::collection($this->subtitles)
                ];
                break;
            case 2://剧集详情
                $addition = [
                    'is_serie' => $this->is_serie,
//                    'serie_num' => $this->serie_num,
                    'serie_end' => $this->serie_end,
                    'series' => \App\Models\Media::getListBySerie($this->id)
                ];
                break;
            default:
        }

        $base = [
            'id' => $this->id,
            'title' => $this->title,
            'title_sub' => $this->title_sub,
            'is_direction' => $this->is_direction,
            'duration' => $this->duration,
            'type' => $this->type,
            'publishtime' => $this->publishtime,
            'cp' => $this->cp->name,
            'score' => $this->score,
            'class' => $this->class,
            'url' => $this->url,
            'img' => MediaImg::collection($this->imgs->where('config', $clarity)),
        ];

        return array_merge($base, $addition);
    }
}
