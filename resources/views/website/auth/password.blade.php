@extends('website.app')
@section('content')
    <!--=== Content Part ===-->
    <section data-role="info-block">
        <div id="content_section">
            <div class="container pt25">
                <div class="row mv25 pv25">
                   @include('website.auth.form.password')
                </div><!-- /row -->
            </div> <!-- /container -->
        </div>
    </section>
@endsection
