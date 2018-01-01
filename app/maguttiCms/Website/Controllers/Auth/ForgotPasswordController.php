<?php namespace App\MaguttiCms\Website\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\SendsPasswordResetEmails;
use App\MaguttiCms\Website\Repos\Article\ArticleRepositoryInterface;

class ForgotPasswordController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Password Reset Controller
    |--------------------------------------------------------------------------
    |
    | This controller is responsible for handling password reset emails and
    | includes a trait which assists in sending these notifications from
    | your application to your users. Feel free to explore this trait.
    |
    */

    use SendsPasswordResetEmails;



    use \App\MaguttiCms\SeoTools\MaguttiCmsSeoTrait;
    protected  $articleRepo;



    public function __construct(ArticleRepositoryInterface $article)
    {
        $this->middleware('guest');
        $this->articleRepo = $article;
    }

    public function showLinkRequestForm()

    {


        $article = $this->articleRepo->getBySlug('home');
        $this->setSeo($article);
        \SEO::setTitle( trans('message.password_forgot') );
        return view('website.auth.password');
    }
}