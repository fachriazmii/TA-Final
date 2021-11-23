<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ModelMahasiswa extends Model
{
    use HasFactory;

    protected $table = 'mahasiswa';
    public $timestamps = false;
    
    protected $fillable = [
        'nim',
        'nama',
        'email',
        'jenkel',
        'program_studi',
        'fakultas',
        'id_role',
    ];
}
