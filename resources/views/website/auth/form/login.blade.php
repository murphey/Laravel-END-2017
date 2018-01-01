<form method="post">
    <div class="form-group mt25">
        @foreach ($errors->all() as $error)
            <p class="alert alert-danger">{{ $error }}</p>
        @endforeach
    </div>
    {!! csrf_field() !!}
    <div class="form-group">
        <label class="control-label">E-Mail </label>
        <input type="email" class="form-control" name="email" value="" required>
    </div>
    <div class="form-group">
        <label class="control-label">Password </label>
        <input type="password"  class="form-control" name="password" value="" autocomplete="off" required>
    </div>
    <div class="form-group">
        <div class="checkbox">
            <label>
                <input type="checkbox" name="remember">
                {{ trans('message.remember_me') }}
            </label>
        </div>
    </div>
    <div class="form-group">
        <button type="submit" class="btn btn-primary btn-block mb15" style="margin-right: 15px;">
            Login
        </button>
        <p>
			<a href="{{ LaravelLocalization::getLocalizedURL(LaravelLocalization::getCurrentLocale(),URL::to( '/register' ) ) }}">{{ trans('message.new_user') }} </a>
        </p>
		<p>
			<a href="{{ LaravelLocalization::getLocalizedURL(LaravelLocalization::getCurrentLocale(),URL::to( '/password/reset' ) ) }}">{{ trans('message.password_forgot_your') }} </a>
		</p>
    </div>
</form>
