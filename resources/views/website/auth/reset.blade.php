@extends('website.app')
@section('content')
	<!--=== Content Part ===-->
	<section data-role="info-block">
		<div class="container mv25 pt25">
			<div class="row mv25">
				@include('website.auth.form.reset')
			</div><!-- /row -->
		</div> <!-- /container -->
	</section>
@endsection
