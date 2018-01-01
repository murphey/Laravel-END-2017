<?php namespace App\MaguttiCms\Domain\Article;

trait ArticlePresenter
{


    /*
    |--------------------------------------------------------------------------
    |  Seo & Meta
    |--------------------------------------------------------------------------
    */

    function getFullSlug($locale=''){
        $locale = ($locale)?:app()->getLocale();

        if($this->parentPage && $this->parentPage->{'slug:it'}!='home') return $this->parentPage->{'slug:'.$locale}.'/'.$this->{'slug:'.$locale};

        if($this->{'slug:'.$locale}=='home') return "";

        return $this->{'slug:'.$locale};
    }

    public function getPermalink($locale='')
    {
        $url =  $this->getFullSlug($locale);
        return ma_fullLocaleUrl($url);
    }

    /**
     * GESTIONE OPZIONALE META
     * PER I SOCIALS
     */
    function  metaTagGinius(){

        $description = "";
        $title =  "";
        \SEO::opengraph()->addProperty('title',$title);
        \SEO::opengraph()->addProperty('description',$description);
        \SEO::twitter()->addValue('title',$title);
        \SEO::twitter()->addValue('description',$description);
    }
}