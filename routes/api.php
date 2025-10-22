<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\KategoriController;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::get('apikategori', [KategoriController::class, 'index']);
Route::get('apikategori/{id}', [KategoriController::class, 'show']);
Route::post('/kategori-create', [KategoriController::class, 'store']);
Route::post('/kategori/{id}', [KategoriController::class, 'update']);
Route::delete('/kategori/{id}', [KategoriController::class, 'destroy']);