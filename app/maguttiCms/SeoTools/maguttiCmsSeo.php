<?php namespace App\MaguttiCms\SeoTools;
use SEO;
use SEOMeta;
use Request;
use App\MaguttiCms\Website\Facades\ImgHelper;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;

/**
 * Class maguttiCmsSeoTrait
 *
 *
 */
trait MaguttiCmsSeoTrait
{
    protected $title;
    protected $image;
    protected $model;
    protected $url;

    public static function bootMaguttiCmsSeoTrait()
    {
        static::created(function($item){
            // Index the itemcompo
        });
    }

    public function setSeo($model)
    {
        $this->model = $model;
        $this->setTitle();
        $this->setDescription();
        $this->setOpenGraphImages();
        $this->setCanonical();
        $this->addAlternate();
        return  $this;
    }

    public function setTitle()
    {
        $this->title = $this->tagHandler('title');
        if($this->title=='') $this->title  = $this->tagHandler('name');
        SEO::setTitle($this->title);
    }

    public function setDescription()
    {
        SEO::setDescription( str_limit( $this->tagHandler('description'), 150 ) );

    }

    public function setCanonical()
    {
        $this->url = Request::url();
        SEO::setCanonical($this->url);
    }

    public function setOpenGraphImages()
    {
        $image_conf  = config('maguttiCms.image.social');
        $this->image = ($this->model->image!='')?url(ImgHelper::get_cached($this->model->image,$image_conf)):asset('/website/images/logo.jpg');
        $attributes  = ['width'=>$image_conf['w'],'height'=>$image_conf['h']];

        SEO::opengraph()->addImage($this->image,$attributes);
        SEO::twitter()->addValue('image',$this->image);
    }

    public function addOpenGraphProperty($property,$value)
    {
        SEO::opengraph()->addProperty($property,$value);
    }


    public function addAlternate(){

        // Is page slug translation is not ignored
        if(!$this->model->ignore_slug_translation) {
           foreach(LaravelLocalization::getSupportedLocales() as $localeCode => $properties) {
                $url = LaravelLocalization::getLocalizedURL($localeCode, $this->model->getPermalink($localeCode));
                SEOMeta::addAlternateLanguage($localeCode, $url);
            }
        }
        else {
            foreach(LaravelLocalization::getSupportedLocales() as $localeCode => $properties) {
                $url = LaravelLocalization::getLocalizedURL($localeCode);
                SEOMeta::addAlternateLanguage($localeCode, $url);
            }
        }
        return $this;

    }
    protected function tagHandler($tag)
    {
        return ($this->model->{'seo_'.$tag}!='')?$this->model->{'seo_'.$tag}:$this->model->{$tag};
    }
}
