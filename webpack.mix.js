const { mix } = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Fo development Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.sass('resources/assets/sass/vendor.scss',  			'public/website/css/');
mix.sass('resources/assets/sass/app.scss', 			'public/website/css/');
mix.sass('resources/assets/sass/admin.scss',			'public/cms/css/');

mix.js('resources/assets/js/magutti.js',        		'public/website/js');
mix.js('resources/assets/js/app.js',        		    'public/website/js');

if (mix.config.inProduction) {
    mix.version();
}

mix.browserSync('framework_base.dev');
