<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class MediaImg extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param \Illuminate\Http\Request $request
     * @return array
     */
    public function toArray($request)
    {
        $domain = env('APP_URL') . '/uploads/';
        return [
            'f_16x9' => $this->f_16x9 ? $domain . $this->f_16x9 : '',
            'b_16x9' => $this->b_16x9 ? $domain . $this->b_16x9 : '',
            'f_7x10' => $this->f_7x10 ? $domain . $this->f_7x10 : '',
            'b_7x10' => $this->b_7x10 ? $domain . $this->b_7x10 : '',
            'f_1x1' => $this->f_1x1 ? $domain . $this->f_1x1 : '',
            'b_1x1' => $this->b_1x1 ? $domain . $this->b_1x1 : '',
            'f_4x1' => $this->f_4x1 ? $domain . $this->f_4x1 : '',
            'b_4x1' => $this->b_4x1 ? $domain . $this->b_4x1 : '',
        ];
    }
}
