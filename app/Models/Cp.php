<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cp extends Model
{
    use HasFactory;
    protected $table = 'm_cp';
    public $timestamps = true;

    protected $attributes = [
        'status' => 1,
    ];
}
