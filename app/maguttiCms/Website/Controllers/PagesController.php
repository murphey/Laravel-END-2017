<?php

namespace App\MaguttiCms\Website\Controllers;
use App\FaqCategory;
use App\MaguttiCms\Website\Repos\Article\ArticleRepositoryInterface;
use App\MaguttiCms\Website\Repos\News\NewsRepositoryInterface;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redirect;
use Input;
use Validator;
use App\Article;
use App\News;
use App\Product;
use Domain;


class PagesController extends Controller

{
	use \App\MaguttiCms\SeoTools\MaguttiCmsSeoTrait;
    /**
     * @var
     */
    protected  $template;
    /**
     * @var ArticleRepositoryInterface
     */
    protected  $articleRepo;
    /**
     * @var NewsRepositoryInterface
     */
    protected  $newsRepo;
    /**
     * @var NewsRepositoryInterface
     *
     *
     */
    private $news;

    /**
     * @param ArticleRepositoryInterface $article
     * @param PostRepositoryInterface $news
     */

    public function __construct(ArticleRepositoryInterface $article,NewsRepositoryInterface $news )
    {
        $this->articleRepo = $article;
        $this->newsRepo    = $news;
    }

    /**
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function home()
    {
        $article = $this->articleRepo->getBySlug('home');
        $this->setSeo($article);
        return view('website.home',compact('article'));
    }

    /**
     * @param $slug
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function pages($parent, $child='') {

        if(!$child) {
            $article = $this->articleRepo->getBySlug($parent,app()->getLocale());
            $template = $parent;
        }
        else {

            $article = $this->articleRepo->getSubPage($parent, $child);
            $template = $child;
        }

        if($article && $article->slug != 'home' && $article->pub==1){
            $this->setSeo($article);
            $this->template = ( $article->template_id ) ?  $article->template->value : $template;
            if (view()->exists('website.'. $this->template)) {
                return view('website.'.$this->template,compact('article'));
            }
            return view('website.normal',compact('article'));
        }
        else {
            return Redirect::to('/');
        }

    }

    public function test() {
        phpinfo();
        die();
    }

	/**
	 * @param int $parameter
	 * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
	 */
	public function contacts() {
		$article = $this->articleRepo->getBySlug('contatti');
		$parameter = Input::get('product_id');

		if ($parameter) {
			$product = Product::findOrFail($parameter);
			$info_request = 'Buongiorno, vorrei ricevere maggiori informazioni riguardo al prodotto "'.$product->title.'" del '.$product->year.'.';
			return view('website.contacts', ['request_product_id' => $parameter, 'product' => $product, 'article' => $article]);
		}
		else {
			$info_request = '';
			return view('website.contacts', ['request_product_id' => 0, 'product' => '', 'article' => $article]);
		}
	}

    /**
     * @param string $slug
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function news($slug='') {
        $article = $this->articleRepo->getBySlug('news');

        if($slug=='') {
        	$this->setSeo($article);
            $news = $this->newsRepo->getPublished();
            return view('website.news.home',compact('article','news'));
        }
        else {
            $news = $this->newsRepo->getBySlug($slug);
            if($news){
                $this->setSeo($news);
                $locale_article = $news;
                return view('website.news.single',compact('article','news','locale_article'));
            }
            return Redirect::to('/');
        }
    }



}
