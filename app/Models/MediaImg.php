<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MediaImg extends Model
{
    use HasFactory;

    protected $table = 'm_media_img';
    protected $fillable = ['config', 'act', 'f_16x9', 'b_16x9', 'f_7x10', 'b_7x10', 'f_1x1', 'b_1x1', 'f_4x1', 'b_4x1'];

    public function media()
    {
        return $this->belongsTo(Media::class, 'media_id');
    }
}
