<?php namespace App\MaguttiCms\Website\Controllers\Auth;

use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\ResetsPasswords;

class ResetPasswordController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Override Password Reset Controller
    |--------------------------------------------------------------------------
    |
    | This controller is responsible for handling password reset requests
    | and uses a simple trait to include this behavior. You're free to
    | explore this trait and override any methods you wish to tweak.
    |
    */

    use ResetsPasswords;
    protected $redirectTo   = '/users/dashboard';
    protected $redirectPath = '/users/dashboard';
    var $localePrefix;
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
        $this->localePrefix    = ma_getRealLocale();
        $this->redirectTo      = $this->localePrefix.'/users/dashboard';
        $this->redirectPath    = $this->localePrefix.'/users/dashboard';

    }

    public function showResetForm(Request $request, $token = null)
    {

        \SEO::setTitle( trans(trans('message.password_reset')) );

        return view('website.auth.reset')->with(
            ['token' => $token, 'email' => $request->email]
        );
    }

    protected function sendResetResponse($response)
    {
        $this->redirectPath  = $this->localePrefix.'/users/dashboard';
        return redirect($this->redirectPath)->with('status', trans($response));
    }

    protected function resetPassword($user, $password)
    {
        $user->forceFill([
            'password' => $password,
            'remember_token' => Str::random(60),
        ])->save();

        $this->guard()->login($user);
    }
}
