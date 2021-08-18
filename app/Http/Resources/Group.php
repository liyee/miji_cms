<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class Group extends JsonResource
{
    public $preserveKeys = true;

    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        //        return parent::toArray($request);
        $data = [
            'title' => $this->title,
            'component' => $this->component,
            'more' => $this->more,
            'title_show' => $this->title_show,
            'img' => $this->img,
            'sort' => $this->sort,
            'medias' => $this->whenPivotLoaded('m_media_group', function (){
                $pivot = $this->pivot;
                return $pivot->media_id;
            })
        ];

        return $data;
    }
}
