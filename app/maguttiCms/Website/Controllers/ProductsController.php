<?php

namespace App\MaguttiCms\Website\Controllers;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\MaguttiCms\Website\Repos\Article\ArticleRepositoryInterface;
use App\MaguttiCms\Website\Repos\Product\ProductRepositoryInterface;
use Input;
use Validator;
use App\Product;
use App\Domain;

/**
 * Class ProductsController
 * @package App\MaguttiCms\Website\Controllers
 */
class ProductsController extends Controller
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
     * @var ProductRepositoryInterface
     */
    protected  $productRepo;

    /**
     * ProductsController constructor.
     * @param ArticleRepositoryInterface $article
     * @param ProductRepositoryInterface $product
     */
    public function __construct(ArticleRepositoryInterface $article, ProductRepositoryInterface $product )
    {
        $this->articleRepo = $article;
        $this->productRepo = $product;
    }

    /**
     * @param string $product_slug
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function products($product_slug='' ) {
          $article = $this->articleRepo->getBySlug('products');
         if( $product_slug == '' ) {

            $product  = $this->productRepo->getPublished();

            $this->setSeo($article);
            return view('website.products', ['article' => $article, 'products' => $product]); //LISTA PRODOTTI

        }else{


            $product = $this->productRepo->getBySlug($product_slug);

           	if ($product) {

                $locale_article = $product;
				$this->setSeo($product);
             	return view('website.product_single', compact('article','product','locale_article')); //SINGOLO PRODOTTO
			}
    		else return redirect('/');
        }


    }
}
