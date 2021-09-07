<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MediaAttr extends Model
{
    use HasFactory;
    protected $table = 'm_media_attr';
    protected $fillable = ['customer_id'];

    public function media(){
        return $this->belongsTo(Media::class, 'media_id');
    }
}
