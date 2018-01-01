<!DOCTYPE html>
<html>
<head lang="{!! LaravelLocalization::getCurrentLocale() !!}">
	<title>{!! config('maguttiCms.admin.option.title') !!}</title>
	<!-- Latest compiled and minified CSS -->


	<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Open+Sans:400,300"/>
	<link rel="stylesheet" href="{!! asset(config('maguttiCms.admin.path.plugins').'uploadifive/uploadifive.css')!!}">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" href="{!! asset(config('maguttiCms.admin.path.plugins').'selectize/selectize.bootstrap3.css') !!}">
	<link rel="stylesheet" href="{!! asset(config('maguttiCms.admin.path.plugins').'custom-scrollbar/jquery.mCustomScrollbar.min.css')!!}" />
	<link rel="stylesheet" href="{!! asset(config('maguttiCms.admin.path.plugins').'colorpicker/css/bootstrap-colorpicker.min.css')!!}" />
	<link rel="stylesheet" href="{!! asset(config('maguttiCms.admin.path.common_css').'ma_helper.css')!!}">
	<link rel="stylesheet" href="{!! asset(config('maguttiCms.admin.path.cms_css').'bootstrap-theme.css')!!}">
	<link rel="stylesheet" href="{{ mix('cms/css/admin.css') }}">
	<script>
        // init  some   global  variable
        var    _SERVER_PATH  = "{!! url('') !!}";
        var    _LOCALE 		 = "{!! LaravelLocalization::getCurrentLocale() !!}";
        var    _CURMODEL 	 = "{!! ( isset($pageConfig['model']) ? $pageConfig['model'] : "" ) !!}";
	</script>
</head>
<body class="{{(in_array($view_name, ['admin-login', 'auth-password']))? 'no-margin': ''}}">
@include('admin.common.navbar')

@yield('content')
</body>
<!-- Latest compiled and minified JavaScript -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="{!! asset(config('maguttiCms.admin.path.plugins').'custom-scrollbar/jquery.mCustomScrollbar.concat.min.js')!!}"></script>
<script src="{!! asset(config('maguttiCms.admin.path.cms_js').'cms.js')!!}"></script>
<script src="{!! asset(config('maguttiCms.admin.path.plugins').'notify.min.js')!!}"></script>
<script src="{!! asset(config('maguttiCms.admin.path.plugins').'tinymce/tinymce.min.js')!!}"></script>
<script src="{!! asset(config('maguttiCms.admin.path.plugins').'colorpicker/js/bootstrap-colorpicker.min.js')!!}"></script>
<script src="{!! asset(config('maguttiCms.admin.path.plugins').'bootbox.js') !!}"></script>
<script>
    $(document).ready(function() {
        // This command is used to initialize some elements and make them work properly
        Cms.init();
    });
</script>
@yield('footerjs')
</html>
