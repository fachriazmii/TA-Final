<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ModelDosen extends Model
{
    use HasFactory;

    protected $table = 'dosen';
    public $timestamps = false;
    
    protected $fillable = [
        'nama_dosen',
        'no_hp',
        'email',
        'id_role',
    ];
}
