<?php

use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
    'as'            => config('admin.route.prefix') . '.',
], function (Router $router) {
    $router->get('/', 'HomeController@index')->name('home');
    $router->get('/clearCache', 'HomeController@clearCache')->name('clearCache');
    $router->get('api/class_sub', 'CategoryController@classSub');
    $router->POST('complete/re_status', 'CompleteController@reStatus');

    $router->resource('users', UserController::class);
    $router->resource('cps', CpController::class);
    $router->resource('medias', MediaController::class);
    $router->resource('groups', GroupController::class);
    $router->resource('configs', ConfigController::class);
    $router->resource('regions', RegionController::class);
    $router->resource('customers', CustomerController::class);
    $router->resource('categories', CategoryController::class);
    $router->resource('activities', ActivityController::class);
    $router->resource('complete', CompleteController::class);
    $router->resource('publish', PublishController::class);
    $router->resource('msgs', MsgController::class);
    $router->resource('recommends', RecommendController::class);
    $router->resource('media-series', MediaSerieController::class);
});
