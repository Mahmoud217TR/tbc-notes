<?php

use App\Http\Controllers\API\Auth\UserController;
use App\Http\Controllers\API\CategoryController;
use App\Http\Controllers\API\NoteController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('login', [UserController::class,'login']);
Route::post('register', [UserController::class,'register']);

Route::middleware('auth:sanctum')->group(function(){
    Route::get('/user', function () {
        return user();
    });
    Route::post('logout', [UserController::class,'logout']);
    Route::post('logout-from-all', [UserController::class,'logoutFromAll']);

    Route::apiResource('category',CategoryController::class)->except('create','edit');
    Route::apiResource('note',NoteController::class)->except('create','edit');
});

