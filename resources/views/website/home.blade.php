@extends('website.app')
@section('content')
@include('website.partials.carousel')
<!--=== Content Part infoblock ===-->
<main class="container">
    <h1>{!! $article->title !!}</h1>
    <h2>{!! $article->subtitle !!}</h2>
	{!! $article->description !!}
</main>
@endsection
