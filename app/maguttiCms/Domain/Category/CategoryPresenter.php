<?php
namespace App\MaguttiCms\Domain\Category;

trait CategoryPresenter

{
    /*
    |--------------------------------------------------------------------------
    |  Seo & Meta
    |--------------------------------------------------------------------------
    */
    function getFullSlug($locale=''){
        $locale = ($locale)?:app()->getLocale();
        return  'category/'.$this->{'slug:'.$locale};
    }


    public function getPermalink($locale='')
    {
        $url =  $this->getFullSlug($locale);
        return ma_fullLocaleUrl($url);
    }

}