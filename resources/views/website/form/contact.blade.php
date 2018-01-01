@include('flash::notification')
<div class="row">
	{{ Form::open(array('action' => '\App\MaguttiCms\Website\Controllers\WebsiteFormController@getContactUsForm')) }}
		{{ Form::hidden('request_product_id', $request_product_id, ['class' => 'form-control']) }}
	    <div class="col-xs-12 mb10">
			<div class="color-3 text-center mb15">{!! trans('website.message.required_field') !!}</div>
	    </div>
		@if ($product)
			<div class="col-xs-12 mb10">
				{!! trans('website.message.product_request') !!} {{$product->title}}.
			</div>
		@endif
		<div class="col-xs-12">
		    <div class="form-group">
		        {{ Form::label('email',trans('website.email'), ['class' => 'required']) }}
		        {{ Form::email('email', null,  ['class' => 'form-control', 'required']) }}
		        {{ $errors->first('email') }}
		    </div>
	    </div>
		<div class="col-xs-12">
		    <div class="form-group">
		        {{ Form::label('name', trans('website.name'), ['class' => 'required']) }}
		        {{ Form::text('name', null,  ['class' => 'form-control', 'required']) }}
		        {{ $errors->first('name') }}
		    </div>
	    </div>
		<div class="col-xs-12">
		    <div class="form-group">
		        {{ Form::label('surname',trans('website.surname'), ['class' => 'required']) }}
		        {{ Form::text('surname', null,  ['class' => 'form-control', 'required']) }}
		        {{ $errors->first('surname') }}
		    </div>
	    </div>
		<div class="col-xs-12">
		    <div class="form-group">
		        {{ Form::label('company',trans('website.company')) }}
		        {{ Form::text('company', null,  ['class' => 'form-control']) }}
		        {{ $errors->first('company') }}
		    </div>
	    </div>
		<div class="col-xs-12">
		    <div class="form-group">
		        {{ Form::label('subject', trans('website.subject'), ['class' => 'required']) }}
		        {{ Form::text('subject', null,  ['class' => 'form-control', 'required']) }}
		        {{ $errors->first('subject') }}
		    </div>
	    </div>
		<div class="col-xs-12">
		    <div class="form-group">
		        {{ Form::label('message', trans('website.message_email'), ['class' => 'required']) }}
		        {{ Form::textarea('message', null,  ['class' => 'form-control', 'rows' => 5, 'required']) }}
		        {{ $errors->first('message') }}
		    </div>
	    </div>
		<div class="col-xs-12">
		    <div class="form-group">
				<div class="checkbox">
					<label for="privacy">
						<input type="checkbox" name="privacy" value="1" id="privacy" required>
						{{trans('website.message.privacy')}}
					</label>
			        {{ $errors->first('privacy') }}
				</div>
		    </div>
	    </div>
		<div class="col-xs-12">
		    <div class="form-group ">
		        {{ Form::submit(trans('website.send'), array('class' => 'btn btn-lg btn-primary btn-block')) }}
	    	</div>
	    </div>
	{{ Form::close() }}
</div>
