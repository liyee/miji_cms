<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;

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

//1.媒资详情
Route::get('/media/{id}', function ($id = 0) {
    return new \App\Http\Resources\Media(\App\Models\Media::getOne($id), 1);
});

//2.更多媒资
Route::get('/medias/{group_id}', function (Request $request, $group_id = 0) {
    $ip = $request->ip();
    $iosCode = \App\Libraries\IpHelp::getCountryCode($ip);
    return \App\Http\Resources\Media::collection(\App\Models\Media::getListByGroup($group_id, $iosCode));
});

//3.媒资分组列表
Route::get('/groups/{nav}/{size?}', function ($nav = 0, $size = 3) {
    return \App\Http\Resources\Group::collection(\App\Models\Group::getList(['parent_id' => $nav])->paginate($size));
});

//4.剧集详情
Route::get('/serie/{id}', function ($id = 0) {
    return new \App\Http\Resources\Media(\App\Models\Media::getOne($id, 1), 2);
});

//5.活动列表
Route::get('/activity/{id}', function (Request $request, $id = 0) {
    $iosCode = \App\Libraries\IpHelp::getCountryCode($request->ip());
    return \App\Http\Resources\Media::collection(\App\Models\Media::getList($id, $iosCode));
});

//6.首屏数据
Route::get('/home/{pn}/{pt}', function ($pn, $pt) {
    $parent_id = \App\Models\Group::getParentId($pn, $pt);
    return \App\Http\Resources\Group::collection(\App\Models\Group::where(['parent_id' => $parent_id])->get(['id', 'title', 'sort', 'parent_id', 'depth']));
});

//1-1.媒资详情-测试
Route::get('/media-test/{id}', function ($id = 0) {
    return new \App\Http\Resources\Media(\App\Models\Media::getOne($id), 2, 1);
});

//Route::get('/group/{id}/pn/{pn}/pt/{pt}/version/{version}/memory/{memory}/clarity/{clarity}', function ($id) {
//    return new \App\Http\Resources\Group(\App\Models\Group::find($id));
//});
