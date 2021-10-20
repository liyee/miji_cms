<?php

namespace App\Http\Resources;

use App\Models\Category;
use Illuminate\Http\Resources\Json\JsonResource;

class Media extends JsonResource
{

    public function __construct($resource)
    {
        parent::__construct($resource);
        $this->resource = $resource;
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
        $pn = $request->input('pn', 0);
        $pt = $request->input('pt', 0);
        $memory = $request->input('memory', 1);
        $act = $request->input('act', 0);
        $act = $this->act ?? $act;

        $addition = [];
        $type = $this->type ?? 1;
        switch ($type) {
            case 0://媒资详情
                $addition = [
                    'updatetime' => $this->updatetime,
                    'click_num' => $this->click_num,
                    'language' => $this->languages ? $this->languages->name : '',
                    'intro' => $this->intro,
                    'url' => $this->url,
                    'adv_freq' => $this->adv_freq,
                    'subtitle' => Subtitles::collection($this->subtitles),
                    'mode' => $this->mode,
                ];
                break;
            case 1://剧集详情
                $customer_id = \App\Models\Customer::getCustomerId($pn, $pt);
                $addition = [
                    'intro' => $this->intro,
                    'serie_end' => $this->serie_end,
                    'series' => \App\Models\Media::getListBySerie($this->id, $customer_id, $memory)
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
            'updatetime' => $this->updatetime,
            'publishtime' => $this->publishtime,
            'cp' => $this->cp->name,
            'score' => $this->score,
            'is_adv' => $this->is_adv,
            'class' => Category::getNameById($this->class),
            'class_sub' => Category::getNameById($this->class_sub),
            'url_jump' => $this->url_jump,
            'img' => MediaImg::collection($this->getImg($this->imgs->where('config', $clarity)->wherein('act', [0, $act]), $act))
        ];

        if (isset($this->mode) && $base['url_jump']) {
            if (strstr($this->url_jump, '?')) {
                $base['url_jump'] .= '&metax_mode=' . $this->mode;
            } else {
                $base['url_jump'] .= '?metax_mode=' . $this->mode;
            }
        }

        return array_merge($base, $addition);
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
