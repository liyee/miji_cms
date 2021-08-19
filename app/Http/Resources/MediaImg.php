<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class MediaImg extends JsonResource
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
            'clarity' => $this->config,
            'f_16x9' => $this->f_16x9,
            'b_16x9' => $this->b_16x9,
            'f_7x10' => $this->f_7x10,
            'b_7x10' => $this->b_7x10,
        ];
    }
}
