<?php

use Illuminate\Support\Facades\Route;
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
    
});
