<?php

/*
|--------------------------------------------------------------------------
| ADMIN Routes
|--------------------------------------------------------------------------
|
| This file is where you may define all of the routes that are handled
| by your application. Just tell Laravel the URIs it should respond
| to using a Closure or controller method. Build something great!
|
*/
Route::group(array('prefix' => 'admin', 'namespace' => 'Admin', 'middleware' => ['adminauth']), function () {

    Route::get('/',                         '\App\MaguttiCms\Admin\Controllers\AdminPagesController@home');
    Route::get('/list/{section?}/{sub?}',   '\App\MaguttiCms\Admin\Controllers\AdminPagesController@lista');
    Route::get('/create/{section}',         '\App\MaguttiCms\Admin\Controllers\AdminPagesController@create');
    Route::post('/create/{section}',        '\App\MaguttiCms\Admin\Controllers\AdminPagesController@store');


    Route::get('/edit/{section}/{id?}/{type?}', '\App\MaguttiCms\Admin\Controllers\AdminPagesController@edit');
    Route::post('/edit/{section}/{id?}',        '\App\MaguttiCms\Admin\Controllers\AdminPagesController@update');

	Route::get('/file_view/{section}/{id}/{key}', '\App\MaguttiCms\Admin\Controllers\AdminPagesController@file_view');

    Route::get('/editmodal/{section}/{id?}/{type?}','\App\MaguttiCms\Admin\Controllers\AdminPagesController@editmodal');
    Route::post('/editmodal/{section}/{id?}',       '\App\MaguttiCms\Admin\Controllers\AdminPagesController@updatemodal');
    Route::get('/delete/{section}/{id?}',           '\App\MaguttiCms\Admin\Controllers\AdminPagesController@destroy');

    Route::get('/duplicate/{section}/{id?}/{type?}', '\App\MaguttiCms\Admin\Controllers\AdminPagesController@duplicate');

    /*
    |--------------------------------------------------------------------------
    | API
    |--------------------------------------------------------------------------
    */
    Route::group(array('prefix' => 'api'), function () {

        Route::get('update/{method}/{model?}/{id?}',        '\App\MaguttiCms\Admin\Controllers\AjaxController@update');
        Route::get('delete/{model?}/{id?}',                 '\App\MaguttiCms\Admin\Controllers\AjaxController@delete');

        /*
        |--------------------------------------------------------------------------
        | MEDIA LIBRARY
        |--------------------------------------------------------------------------
        */
        Route::post('uploadifiveSingle/',                    '\App\MaguttiCms\Admin\Controllers\AjaxController@uploadifiveSingle');
        Route::post('uploadifiveMedia/',                    '\App\MaguttiCms\Admin\Controllers\AjaxController@uploadifiveMedia');
        Route::get('updateHtml/media/{model?}','\App\MaguttiCms\Admin\Controllers\AjaxController@updateModelMediaList');
        Route::get('updateHtml/{mediaType?}/{model?}/{id?}','\App\MaguttiCms\Admin\Controllers\AjaxController@updateMediaList');
        Route::get('updateMediaSortList/',                  '\App\MaguttiCms\Admin\Controllers\AjaxController@updateMediaSortList');

        Route::get('api/suggest', ['as' => 'api.suggest', 'uses' => '\App\MaguttiCms\Admin\Controllers\AjaxController@suggest']);
    });
    Route::get('export/{model?}',               '\App\MaguttiCms\Admin\Controllers\ExportController@model');
    Route::get('/exportlist/{section?}/{sub?}', '\App\MaguttiCms\Admin\Controllers\AdminExportController@lista');

});

/*
|--------------------------------------------------------------------------
| ADMIN AUTH
|--------------------------------------------------------------------------
*/
Route::group(array('prefix' => 'admin'), function () {

    // Admin Auth and Password routes...
    Route::get('login',  '\App\MaguttiCms\Admin\Controllers\Auth\LoginController@showLoginForm');
    Route::post('login', '\App\MaguttiCms\Admin\Controllers\Auth\LoginController@login');
    Route::get('logout', '\App\MaguttiCms\Admin\Controllers\Auth\LoginController@logout');


    // Password Reset Routes...
    Route::get('password/reset',         '\App\MaguttiCms\Admin\Controllers\Auth\ForgotPasswordController@showLinkRequestForm');
    Route::post('password/email',        '\App\MaguttiCms\Admin\Controllers\Auth\ForgotPasswordController@sendResetLinkEmail');
    Route::get('password/reset/{token}', '\App\MaguttiCms\Admin\Controllers\Auth\ResetPasswordController@showResetForm');
    Route::post('password/reset',        '\App\MaguttiCms\Admin\Controllers\Auth\ResetPasswordController@reset');
});

/*
|--------------------------------------------------------------------------
| FRONT END
|--------------------------------------------------------------------------
*/

Route::group(['prefix' => LaravelLocalization::setLocale(), 'middleware' => ['shield']], function () {

    // Authentication routes...
    Route::get('users/login', '\App\MaguttiCms\Website\Controllers\Auth\LoginController@showLoginForm')->name('users/login');
    Route::post('users/login','\App\MaguttiCms\Website\Controllers\Auth\LoginController@login');
    Route::get('users/logout','\App\MaguttiCms\Website\Controllers\Auth\LoginController@logout');

    // Registration routes...
    Route::get('/register', '\App\MaguttiCms\Website\Controllers\Auth\RegisterController@showRegistrationForm');
    Route::post('/register','\App\MaguttiCms\Website\Controllers\Auth\RegisterController@register');

    // Password Reset Routes...
    Route::get('password/reset',        '\App\MaguttiCms\Website\Controllers\Auth\ForgotPasswordController@showLinkRequestForm');
    Route::post('password/email',       '\App\MaguttiCms\Website\Controllers\Auth\ForgotPasswordController@sendResetLinkEmail');
    Route::get('password/reset/{token}','\App\MaguttiCms\Website\Controllers\Auth\ResetPasswordController@showResetForm');
    Route::post('password/reset',       '\App\MaguttiCms\Website\Controllers\Auth\ResetPasswordController@reset');


    // Pages routes...
    Route::get('/',                     '\App\MaguttiCms\Website\Controllers\PagesController@home');
    Route::get('/news/',                '\App\MaguttiCms\Website\Controllers\PagesController@news');
    Route::get('/news/{slug}',          '\App\MaguttiCms\Website\Controllers\PagesController@news');
    Route::get(LaravelLocalization::transRoute("routes.products"),	'\App\MaguttiCms\Website\Controllers\ProductsController@products');
    Route::get('/contacts/',		    '\App\MaguttiCms\Website\Controllers\PagesController@contacts');
    Route::post('/contacts/',		    '\App\MaguttiCms\Website\Controllers\WebsiteFormController@getContactUsForm');

    Route::get('/{parent}/{child}', '\App\MaguttiCms\Website\Controllers\PagesController@pages');
    Route::get('/{parent?}/', '\App\MaguttiCms\Website\Controllers\PagesController@pages');


    // Api
    /* TODO   fix */
    Route::post('/api/newsletter',      '\App\MaguttiCms\Website\Controllers\APIController@subscribeNewsletter');

});

/*
|--------------------------------------------------------------------------
|   RESERVED AREA USER ROUTES
|--------------------------------------------------------------------------
*/
Route::group(['prefix' => LaravelLocalization::setLocale(),'middleware' => ['auth']], function () {
    Route::get('users/dashboard',    '\App\MaguttiCms\Website\Controllers\ReservedAreaController@dashboard');
    Route::get('users/profile','\App\MaguttiCms\Website\Controllers\ReservedAreaController@profile');
});
