<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class Group extends JsonResource
{
    public $preserveKeys = true;

    /**
     * Transform the resource into an array.
     *
     * @param \Illuminate\Http\Request $request
     * @return array
     */
    public function toArray($request)
    {
        $group_num = $request->input('group_num', 5);
        $media_num = $request->input('media_num', 10);

        $id = $this->id;
        $data = [
            'id' => $id,
            'title' => $this->title,
            'img' => $this->img,
            'sort' => $this->sort,
        ];

        if ($this->img) $data['img'] = $this->img;
        if ($this->component) $data['component'] = $this->component;
        if ($this->more) $data['more'] = $this->more;
        if ($this->title_show) $data['title_show'] = $this->title_show;
        if ($this->img) $data['img'] = $this->img;
        if ($this->depth == 1) {
            $data['groups'] = Group::collection(\App\Models\Group::where(['parent_id' => $id])->limit($group_num)->get());
        } else {
            $iosCode = \App\Libraries\IpHelp::getCountryCode($request->ip());
            $data['medias'] = Media::collection(\App\Models\Media::getListByGroup($id, $iosCode, $media_num));
        }

        return $data;
    }
}
