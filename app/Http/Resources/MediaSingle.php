<?php

namespace App\Http\Resources;

use App\Models\Category;
use App\Models\Cp;
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
        $pn = $request->input('pn', 0);
        $pt = $request->input('pt', 0);
        $memory = $request->input('memory', 1);

        $cp = '';
        if (!$this->cp){
            $cp = Cp::select($this->cp_id);
        }else{
            $cp = $this->cp->name;
        }

        $data = [
            'id' => $this->id,
            'title' => $this->title,
            'title_sub' => $this->title_sub,
            'is_direction' => $this->is_direction,
            'duration' => $this->duration,
            'type' => $this->type,
            'updatetime' => $this->updatetime,
            'publishtime' => $this->publishtime,
            'cp' => $cp,
            'score' => $this->score,
            'is_adv' => $this->is_adv,
            'class' => Category::getNameById($this->class),
            'class_sub' => Category::getNameById($this->class_sub),
            'url_jump' => $this->url_jump,
            'img' => MediaImg::collection($this->getImg($this->imgs->where('config', $clarity)->wherein('act', [0, $act]), $act))
        ];

        if (in_array($this->type, [1, 2])) {
            $customer_id = \App\Models\Customer::getCustomerId($pn, $pt);
            $data['serie_end'] = $this->serie_end;
            $data['series'] = \App\Models\Media::getListBySerie($this->id, $customer_id, $memory);
        }

        if (isset($this->mode) && $data['url_jump']) {
            if (strstr($data['url_jump'], '?')) {
                $data['url_jump'] .= '&metax_mode=' . $this->mode;
            } else {
                $data['url_jump'] .= '?metax_mode=' . $this->mode;
            }
        }

        return $data;
    }

    /**
     * @param $imgs
     * @param int $act
     * @return mixed
     * ????????????
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
