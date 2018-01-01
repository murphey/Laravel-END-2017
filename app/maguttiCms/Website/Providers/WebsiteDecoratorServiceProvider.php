<?php

namespace App\MaguttiCms\Website\Providers;
Use App;
use Illuminate\Support\ServiceProvider;

class WebsiteDecoratorServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap the application services.
     *
     * @return void
     */
    public function boot()
    {
        //

    }

    /**
     * Register the application services.
     *
     * @return void
     */
    public function register()
    {
      App::bind('HtmlHelper', function() {return new \App\MaguttiCms\Tools\HtmlHelper;});
      App::bind('ImgHelper', function() {return new \App\MaguttiCms\Tools\ImgHelper;});
    }
}
