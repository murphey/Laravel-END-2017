@extends('website.app')
@section('content')
	<!--=== Content Part ===-->
	<section data-role="info-block">
		<div id="content_section">
			<div class="container">
				<div class="row">
					<h1 class="text-center">{{$article->title}}</h1>
					<div class="col-xs-12 col-sm-6 col-sm-push-3 col-md-4 col-md-push-4">
						@include('website.auth.form.login')
					</div>
				</div><!-- /row -->

			</div> <!-- /container -->
		</div>
	</section>
@endsection
