<?php

namespace App\Http\Resources;

use App\Models\Category;
use Illuminate\Http\Resources\Json\JsonResource;

class MediaSingle extends JsonResource
{
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
        $act = $request->input('act', 0);
        $act = $this->act ?? $act;

        return [
            'id' => $this->id,
            'title' => $this->title,
            'title_sub' => $this->title_sub,
            'is_direction' => $this->is_direction,
            'duration' => $this->duration,
            'type' => $this->type,
            'publishtime' => $this->publishtime,
            'cp' => $this->cp->name,
            'score' => $this->score,
            'is_adv' => $this->is_adv,
            'class' => Category::getNameById($this->class),
            'class_sub' => Category::getNameById($this->class_sub),
            'url_jump' => $this->url_jump,
            'img' => MediaImg::collection($this->getImg($this->imgs->where('config', $clarity)->wherein('act', [0, $act]), $act))
        ];
    }

    /**
     * @param $imgs
     * @param int $act
     * @return mixed
     * 过滤图片
     */
    public function getImg($imgs, $act = 0)
    {
        if (count($imgs) != 2) {
            return $imgs;
        }

        foreach ($imgs as $key => $img) {
            if ($img->act != $act) {
                unset($imgs[$key]);
            }
        }
        return $imgs;
    }
}
