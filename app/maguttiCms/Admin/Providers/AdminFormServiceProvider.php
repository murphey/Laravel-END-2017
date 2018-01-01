<?php

namespace App\MaguttiCms\Admin\Providers;
Use App;
use App\MaguttiCms\Admin\AdminFormImageRelation;
use Illuminate\Support\ServiceProvider;

class AdminFormServiceProvider extends ServiceProvider
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
        App::bind('AdminForm', function()
        {
            return new \App\MaguttiCms\Admin\AdminForm;
        });

        App::bind('AdminFormImageRelation', function()
        {
            return new AdminFormImageRelation;
        });


    }
}
