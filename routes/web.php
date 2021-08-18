<?php

use Illuminate\Support\Facades\Route;

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

Route::get('/', function () {
    return view('welcome');
});

Route::get('/users/test', [\App\Http\Controllers\UsersController::class, 'test']);
Route::get('/users/index', [\App\Http\Controllers\UsersController::class, 'index']);

Route::get('/nav1', function () {
    return new \App\Http\Resources\GroupCollection(\App\Models\Group::all());
});

Route::get('/group/{id}//item/{item}/version/{version}/memory/{memory}', function ($id) {
    return new \App\Http\Resources\Group(\App\Models\Group::find($id));
});
Route::get('/groups', function () {
    $filds = ['id', 'title', 'component', 'more', 'title_show', 'img', 'sort'];
    return \App\Http\Resources\Group::collection(\App\Models\Group::getList($filds)->keyBy->id);
});

Route::get('/media/{id}', function ($id = 0) {
    return new \App\Http\Resources\Media(\App\Models\Media::getOne($id));
});

Route::get('/medias', function () {
    return new \App\Http\Resources\MediaCollection(\App\Models\Media::paginate());
});

Route::get('/category', function () {
    return new \App\Http\Resources\Category(\App\Models\Category::find(7));
});
