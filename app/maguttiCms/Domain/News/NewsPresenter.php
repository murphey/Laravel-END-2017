<?php
namespace App\MaguttiCms\Domain\News;

trait NewsPresenter

{
    /*
    |--------------------------------------------------------------------------
    |  Seo & Meta
    |--------------------------------------------------------------------------
    */
    function getFullSlug($locale=''){
        $locale = ($locale)?:app()->getLocale();
        return  'news/'.$this->{'slug:'.$locale};
    }


    public function getPermalink($locale='')
    {
        $url =  $this->getFullSlug($locale);
        return ma_fullLocaleUrl($url);
    }

}