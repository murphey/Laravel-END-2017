<?php
namespace App\MaguttiCms\Website\Decorator;
Use App;
Use App\Social;
use Carbon\Carbon;

/**
 * Class HtmlSocial
 * @package App\MaguttiCms\Website\Decorator
 */
class HtmlSocial extends maguttiCmsDecorator
{

    /**
     * @var
     */
    protected $html;
    /**
     * @var
     */
    protected $model;
    /**
     * @var
     */
    protected $property;

    /**
     * @return $this
     */
    public function get()
    {
        $this->initHtml();
        $this->createSocialBar();
        return $this;
    }

    /**
     * init
     */
    protected function initHtml()
    {
        $this->html = "";
        $this->model = new App\Social;
    }

    /**
     * create Social Html
     */
    function createSocialBar()
    {
        foreach ($this->model->whereIsActive(1)->get() as $item) {
			$this->html .= '<li>';
            $this->html .= '<a href="' . $item->link . '" target="_new">';
            $this->html .= '<i class="fa '.$item->icon.' fa-lg"></i>';
            $this->html .= '</a>';
			$this->html .= '</li>';
        }
    }
}
