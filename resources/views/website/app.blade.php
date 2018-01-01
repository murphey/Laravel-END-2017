@inject('pages','App\Article')
<!DOCTYPE html>
<html  xmlns="http://www.w3.org/1999/xhtml" xml:lang="{!! LaravelLocalization::getCurrentLocale() !!}" lang="{!! LaravelLocalization::getCurrentLocale() !!}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="GFstudio" />
    <meta name="google-site-verification" content="" />
    <!-- Meta SEO -->
    {!! SEO::generate() !!}
    <meta property="og:url" content="{!! rtrim(LaravelLocalization::getLocalizedURL(LaravelLocalization::getCurrentLocale()), '/') !!}" />
    <!-- ./Meta SEO -->
    @foreach(LaravelLocalization::getSupportedLocales() as $localeCode => $properties)
        <link rel="alternate" hreflang="{{$localeCode}}" href="{{ rtrim(LaravelLocalization::getLocalizedURL($localeCode), '/') }}"/>
    @endforeach
    @if(isset($article) && $article->seo_no_index )
        <meta name="robots" content="noindex">
    @endif
    <link href="{!! LaravelLocalization::getLocalizedURL( LaravelLocalization::getCurrentLocale() )!!}/" rel="canonical" />
    <link rel="icon" href="{!! asset('website/images/icon.png') !!}" type="image/PNG">

    <!-- Latest compiled and minified CSS -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700|Raleway:300,400,600" rel="stylesheet">
	
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="{{ mix('website/css/vendor.css') }}">
    <link rel="stylesheet" href="{{ mix('website/css/app.css') }}">

	@include('website.partials.widgets_mobile_app')

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- GA -->
    @include('website.partials.widgets_ga')
</head>
<body>
<div id="app">
    @include('website.partials.navbar')
    @yield('content')
	@include('website.partials.footer')
</div>
{{-- default js to show in all pages --}}
<script type="text/javascript">
    var urlAjaxHandler  = "{{ LaravelLocalization::getLocalizedURL(LaravelLocalization::getCurrentLocale(),URL::to( '' )) }}";
    var _LANG           = "{{ LaravelLocalization::getCurrentLocale()}} ";
    var _WEBSITE_NAME	= "{!! config('maguttiCms.website.option.app.name')!!}";
    var imageScroll     = "{!! asset(config('maguttiCms.admin.path.assets').'website/images/up.png') !!}";
    window.Laravel = <?php echo json_encode(['csrfToken' => csrf_token()]); ?>
</script>

@include('website.partials.js_localization')

<!-- JS Implementing Plugins -->
<script type="text/javascript" src="{{ mix('/website/js/app.js') }}"></script>


<script type="text/javascript">

</script>
<!-- JS Implementing Plugins -->
@yield('footerjs')
@include('website.partials.widgets_cookie')
</body>
</html>
