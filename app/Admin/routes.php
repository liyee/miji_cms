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
    $router->get('/test', 'HomeController@test')->name('test');
    $router->get('api/class_sub', 'CategoryController@classSub');

    $router->resource('users', UserController::class);
    $router->resource('cps', CpController::class);
    $router->resource('medias', MediaController::class);
    $router->resource('groups', GroupController::class);
    $router->resource('configs', ConfigController::class);
    $router->resource('regions', RegionController::class);
    $router->resource('customers', CustomerController::class);
    $router->resource('categories', CategoryController::class);
    $router->resource('activities', ActivityController::class);
    $router->resource('publish', PublishController::class);
});
