<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Dosen\InputJudulController;
use App\Http\Controllers\Dosen\StatusJudulController;
use App\Http\Controllers\Dosen\RevisiController;
use App\Http\Controllers\Mahasiswa\PilihJudulController;
use App\Http\Controllers\Mahasiswa\StatusController;

use App\Http\Controllers\HomeController;
use App\Http\Controllers\DosenController;
use App\Http\Controllers\MahasiswaController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Auth::routes();
Route::get('/', [App\Http\Controllers\Auth\LoginController::class,'showLoginForm'])->name('login');
Route::post('/', [App\Http\Controllers\Auth\LoginController::class,'login'])->name('login');
Route::post('/logout', [App\Http\Controllers\Auth\LoginController::class,'logout'])->name('logout');
Route::get('/register', [App\Http\Controllers\Auth\RegisterController::class,'showRegisterForm'])->name('register');
Route::post('/register/store', [App\Http\Controllers\Auth\RegisterController::class,'store'])->name('register/store');

Route::middleware(['auth','ceklevel:admin'])->group(function () {
    Route::get('/dashboard', [HomeController::class,'index'])->name('/dashboard');
    Route::get('/dosen', [DosenController::class,'index'])->name('/dosen');
    Route::get('/dosen/create', [DosenController::class,'create'])->name('/dosen/create');
    Route::post('/dosen/store', [DosenController::class,'store'])->name('/dosen/store');
    Route::get('/dosen/edit/{id}', [DosenController::class,'edit']);
    Route::get('/dosen/update/{id}', [DosenController::class,'update']);
    Route::delete('/dosen/delete/{id}', [DosenController::class,'delete']);

    Route::get('/mahasiswa', [MahasiswaController::class,'index'])->name('/mahasiswa');
    Route::get('/mahasiswa/create', [MahasiswaController::class,'create'])->name('/mahasiswa/create');
    Route::post('/mahasiswa/store', [MahasiswaController::class,'store'])->name('/mahasiswa/store');
    Route::get('/mahasiswa/edit/{id}', [MahasiswaController::class,'edit']);
    Route::get('/mahasiswa/update/{id}', [MahasiswaController::class,'update']);
    Route::delete('/mahasiswa/delete/{id}', [MahasiswaController::class,'delete']);
    Route::get('/mahasiswa/judul', [App\Http\Controllers\Admin\MahasiswaController::class,'index'])->name('mahasiswa/judul');
});

Route::middleware(['auth','ceklevel:dosen'])->group(function () {
    Route::get('/dashboard', [HomeController::class,'index'])->name('/dashboard');
    
    Route::get('/input-judul', [InputJudulController::class,'index'])->name('input-judul');
    Route::get('/input-judul/create', [InputJudulController::class,'create'])->name('input-judul/create');
    Route::post('/input-judul/store', [InputJudulController::class,'store'])->name('input-judul/store');
    Route::get('/input-judul/edit/{id}', [InputJudulController::class,'edit']);
    Route::post('/input-judul/update/{id}', [InputJudulController::class,'update']);
    Route::delete('/input-judul/delete/{id}', [InputJudulController::class,'delete']);
    
    Route::post('/status-judul/approve', [StatusJudulController::class,'approve_judul'])->name('status-judul/approve');
    Route::post('/status-judul/decline', [StatusJudulController::class,'unapprove_judul'])->name('status-judul/decline');

    Route::get('/status-judul', [StatusJudulController::class,'index'])->name('status-judul');
    Route::get('/status-judul/create', [StatusJudulController::class,'create'])->name('status-judul/create');
    Route::post('/status-judul/store', [StatusJudulController::class,'store'])->name('status-judul/store');
    Route::get('/status-judul/edit/{id}', [StatusJudulController::class,'edit']);
    Route::post('/status-judul/update/{id}', [StatusJudulController::class,'update']);
    Route::delete('/status-judul/delete/{id}', [StatusJudulController::class,'delete']);
    
    Route::get('/revisi', [RevisiController::class,'index'])->name('revisi');
    Route::get('/revisi/lihat-file/{id}', [RevisiController::class,'lihat_revisi']);
    Route::post('/revisi/lihat-file/store', [RevisiController::class,'store'])->name('revisi/lihat-file/store');
    Route::post('/revisi/lihat-file/setuju-revisi', [RevisiController::class,'setuju_revisi'])->name('revisi/lihat-file/setuju-revisi');
});

Route::middleware(['auth','ceklevel:mahasiswa'])->group(function () {
    Route::get('/dashboard', [HomeController::class,'index'])->name('/dashboard');

    Route::get('/pilih-judul', [PilihJudulController::class,'index'])->name('pilih-judul');
    Route::post('/pilih-judul/pilih', [PilihJudulController::class,'pilih_judul'])->name('pilih-judul/pilih');
    
    Route::get('/status', [StatusController::class,'index'])->name('status');
    Route::get('/status/create', [StatusController::class,'create'])->name('status/create');
    Route::post('/status/store', [StatusController::class,'store'])->name('status/store');
    Route::get('/status/revisi/{id}', [StatusController::class,'revisi']);
    Route::post('/status/revisi/save', [StatusController::class,'save'])->name('status/revisi/save');
});
