<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MediaImg extends Model
{
    use HasFactory;
    protected $table = 'm_media_img';
    protected $fillable = ['f_16x9'];

    public function media(){
        return $this->belongsTo(Media::class, 'media_id');
    }
}
