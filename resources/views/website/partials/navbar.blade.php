<!-- header -->
<nav class="navbar navbar-fixed-top compensate-for-scrollbar" role="navigation">
	<!-- Topbar -->
	<!-- End Topbar -->
	<div  class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
				<span class="sr-only">Toggle navigation</span>
				<span class="fa fa-bars fa-lg"></span>
			</button>
			<a class="call-action hidden-lg hidden-md hidden-sm" href="tel:{{ config('maguttiCms.website.option.app.phone') }}">
				<i class="fa fa-phone fa-lg"></i>
			</a>
			<a class="navbar-brand" href="{{ LaravelLocalization::getLocalizedURL(LaravelLocalization::getCurrentLocale(),URL::to( '' )) }}">
				<img src="{{asset('website/images/logo.png')}}" alt="{{ config('maguttiCms.website.option.app.name') }}">
			</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->

		<div class="collapse navbar-collapse navbar-responsive-collapse">
			<ul class="nav navbar-nav navbar-right">
				{{-- pages --}}
				@foreach($pages->menu()->get() as $index => $page)
					<?php
					$page_title = ($page->menu_title) ? $page->menu_title : $page->title;
					$children = $page->childrenMenu($page->id)->get();
					?>
					@if($children->count()>0)
						<li class="dropdown {{ (!empty($article) && ($article->id == $page->id || $article->id_parent == $page->id)) ? 'active' : '' }}">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">{{ $page_title }}</a>
							<ul class="dropdown-menu">
								@foreach ($children as $index => $child)
									<?php
										$child_link = ($child->slug == 'home') ? '/' : $child->getPermalink();
										$child_title = ( $child->menu_title ) ? $child->menu_title : $child->title;
									?>
									<li class="{{ (!empty($article) && $child->id == $article->id) ? 'active' : '' }}">
										<a href="{{ $child_link }}">{{ $child_title }}</a>
									</li>
								@endforeach
							</ul>
						</li>
					@else
						<li class="{{ (!empty($article) && $article->id == $page->id) ? 'active' : '' }}">
							<a href="{{ $page->getPermalink() }}">{{ $page_title }}</a>
						</li>
					@endif
				@endforeach

				{{-- login --}}
				@guest
					<li><a href="{{ LaravelLocalization::getLocalizedURL(LaravelLocalization::getCurrentLocale(),URL::to( 'users/login' ) ) }}">Login</a></li>
				@else
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
							{{Auth::guard()->user()->name}}
							{{HtmlHelper::createFAIcon('caret-down', 'ml5')}}
						</a>
						<ul class="dropdown-menu" role="menu">
							<li>
								<a href="{{ LaravelLocalization::getLocalizedURL(LaravelLocalization::getCurrentLocale(),URL::to( 'users/dashboard' ) ) }}"><i class="fa fa-list"></i> Dashboard</a>
							</li>

							<li class="divider"></li>
							<li class="dropdown">
								<a href="{{ LaravelLocalization::getLocalizedURL(LaravelLocalization::getCurrentLocale(),URL::to( 'users/profile' ) ) }}"><i class="fa fa-user"></i> Profile</a>
							</li>
							<li>
								<a href="{{ LaravelLocalization::getLocalizedURL(LaravelLocalization::getCurrentLocale(),URL::to( 'users/logout' ) ) }}"> <i class="fa fa-sign-out"></i> Logout</a>
							</li>
						</ul>
					</li>
				@endauth

				{{-- languages --}}
				@if (sizeOf(LaravelLocalization::getSupportedLocales()) > 1)
					<li class="dropdown">
						<a href="{{url('')}} " class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
							<img class="flag" src="{{asset('website/images/flags/'.LaravelLocalization::getCurrentLocale().'.png')}}" alt="{{LaravelLocalization::getCurrentLocale()}} language"> {{HtmlHelper::createFAIcon('caret-down', 'ml5')}}</span>
						</a>
						<ul class="dropdown-menu" role="menu">

							@foreach(LaravelLocalization::getSupportedLocales() as $localeCode => $properties)

									@if(LaravelLocalization::getCurrentLocale() != $localeCode)
										<li>
											@if(isset($article) && !$article->ignore_slug_translation)
												@php $article_locale = (isset($locale_article)) ? $locale_article : $article @endphp
												<a href="{{LaravelLocalization::getLocalizedURL($localeCode, $article_locale->getPermalink($localeCode)) }}">
													<img class="flag mr10" src="{{asset('website/images/flags/'.$localeCode.'.png')}}" alt="{{LaravelLocalization::getCurrentLocale()}} language"> {{ $properties['native'] }}
												</a>
											@else
												<a href="{{LaravelLocalization::getLocalizedURL($localeCode) }}">
													<img class="flag mr10" src="{{asset('website/images/flags/'.$localeCode.'.png')}}" alt="{{LaravelLocalization::getCurrentLocale()}} language"> {{ $properties['native'] }}
												</a>
											@endif
										</li>
									@endif

							@endforeach
						</ul>
					</li>
				@endif
			</ul>
		</div><!--/navbar-collapse-->
	</div>
</nav>
