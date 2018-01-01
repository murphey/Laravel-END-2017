<?php
namespace App\MaguttiCms\Domain\Product;

use Mcamara\LaravelLocalization\LaravelLocalization;

trait ProductPresenter

{
    /*
    |--------------------------------------------------------------------------
    |  Seo & Meta
    |--------------------------------------------------------------------------
    */
    function getFullSlug($locale=''){
        /** @var  JSP  trick */
        $locale = ($locale)?:app()->getLocale();
        return  str_replace('{product?}',$this->{'slug:'.$locale},trans('routes.products',array(),$locale));
    }

    public function getPermalink($locale='')
    {
        $url =  $this->getFullSlug($locale);
        return ma_fullLocaleUrl($url);
    }

    public function getInfoPermalink() {
        return LaravelLocalization::getLocalizedURL(LaravelLocalization::getCurrentLocale(), URL::to('/contacts/?product_id='.$this->id));
    }

}