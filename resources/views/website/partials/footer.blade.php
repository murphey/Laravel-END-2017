<div id="social-newsletter" class="container">
	<div class="row">
		<div class="col-xs-12 col-sm-6 mb10">
			<newsletter></newsletter>
		</div>
		<div class="col-xs-12 col-sm-6 mb10">
			@include('website.partials.social')
		</div>
	</div>
</div>
<footer>
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-md-8">
				<h6>{!! config('maguttiCms.website.option.app.name')!!}</h6>
				<p>
					Copyright © <?php echo date('Y'); ?> {!! config('maguttiCms.website.option.app.name')!!}<br>
					{!! config('maguttiCms.website.option.app.address')!!} - {!! config('maguttiCms.website.option.app.locality')!!} - P.IVA {!! config('maguttiCms.website.option.app.vat')!!}<br>
					Tel: {!! config('maguttiCms.website.option.app.phone')!!} - Fax: {!! config('maguttiCms.website.option.app.fax') !!} - <a href="mailto:{!! config('maguttiCms.website.option.app.email') !!}">{!! config('maguttiCms.website.option.app.email') !!}</a><br>
				</p>
			</div>
			<div class="col-xs-12 col-md-4 text-right">
				<p>
					<a href="{{ LaravelLocalization::getLocalizedURL(LaravelLocalization::getCurrentLocale(),URL::to( 'privacy' )) }}">{{ trans('website.privacy')}}</a> |
					<a href="{{ Setting::getOption('credits_url') }}" target="_blank">Credits</a>
				</p>
			</div>
		</div>
	</div>

</footer>
<flash message=""></flash>

