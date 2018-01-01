<?php namespace App;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\URL;
use \App\MaguttiCms\Translatable\GFTranslatableHelperTrait;

class Product extends Model
{

    use GFTranslatableHelperTrait;
    use \Dimsav\Translatable\Translatable;
    use \App\MaguttiCms\Domain\Product\ProductPresenter;

    protected $fillable  = ['category_id','title','subtitle','description','video','slug','sort','pub'];
    protected $fieldspec = [];

    /*
    |--------------------------------------------------------------------------
    |  Sluggable & Trnslateble
    |--------------------------------------------------------------------------
    */
    public $translatedAttributes = ['title','slug','subtitle','description',
                                    'seo_title','seo_keywords','seo_description'];
    public $sluggable            =  ['slug'=>['field'=>'title','updatable'=>false,'translatable'=>true]];

    /*
    |--------------------------------------------------------------------------
    |  RELATION
    |--------------------------------------------------------------------------
    */

    public function category() {
        return $this->belongsTo('App\Category','category_id','id');
    }

	public function getAllCategories() {
		return $this->hasMany('App\Category');
	}

    public function models() {
        return $this->hasMany('App\ProductModel');
    }

    public function media() {
        return $this->morphMany('App\Media', 'model');
    }

    function getFieldSpec ()
    {
        $this->fieldspec['id'] = [
            'type'     => 'integer',
            'minvalue' => 0,
            'pkey'     => 'y',
            'required' =>true,
            'label'    => 'id',
            'hidden'   => 1,
            'display'  => 0,
        ];
        $this->fieldspec['category_id'] = [
            'type'      => 'relationimage',
            'model'     => 'Category',
            'foreign_key' => 'id',
            'label_key' => 'title',
            'label'     => 'Category',
            'hidden'    => 0,
            'required'  =>  true,
            'display'   => 1,
        ];
        $this->fieldspec['title'] = [
            'type'      =>'string',
            'required'  => true,
            'hidden'    => 0,
            'label'     => 'Title',
            'extraMsg'  => '',
            'display'   => 1,
        ];
        $this->fieldspec['slug'] = [
            'type'      => 'string',
            'required'  => true,
            'hidden'    => 0,
            'label'     => 'Slug',
            'extraMsg'  => '',
            'display'   =>  1,
        ];
        $this->fieldspec['subtitle'] = [
            'type'      =>'string',
            'required'  => false,
            'hidden'    => 0,
            'label'     => 'Subtitle',
            'extraMsg'  => '',
            'display'   => 1,
        ];
        $this->fieldspec['description'] = [
            'type'      => 'text',
            'size'      => 600,
            'h'         => 300,
            'required'  => false,
            'hidden'    => 0,
            'label'     => 'Description',
            'extraMsg'  => '',
            'cssClass'  => 'wyswyg',
            'display'   => 1,
        ];
        $this->fieldspec['image'] = [
            'type'      => 'media',
            'required'  => false,
            'hidden'    => 0,
            'label'     => 'Image*',
            'extraMsg'  => '',
            'mediaType' => 'Img',
            'display'   => 1
        ];
		$this->fieldspec['doc'] = [
			'type'      => 'media',
			'required'  => false,
			'hidden'    => 0,
			'label'     => 'Document',
			'extraMsg'  => '',
			'mediaType' => 'Doc',
			'display'   => 1
		];
        $this->fieldspec['video'] = [
            'type'      => 'string',
            'required'  => false,
            'hidden'    => 1,
            'label'     => 'Video Code YouTube',
            'extraMsg'  => '',
            'lang'      => 0,
            'display'   => 1,
        ];
        $this->fieldspec['sort'] = [
            'type'     => 'integer',
            'required' => false,
            'label'    => 'Order',
            'hidden'   => 0,
            'display'  => 1,
        ];
        $this->fieldspec['pub'] = [
            'type'     => 'boolean',
            'required' => false,
            'hidden'   => 0,
            'label'    => trans('admin.label.active'),
            'display'  => 1
        ];
        $this->fieldspec['seo_title'] = [
            'type'     => 'string',
            'required' => 'n',
            'hidden'   => 0,
            'label'    => trans('admin.seo.title'),
            'extraMsg' => '',
            'display'  => 1,
        ];
        $this->fieldspec['seo_keywords'] = [
            'type'     => 'string',
            'hidden'   => 0,
            'label'    => trans('admin.seo.keywords').'<br>'.trans('admin.seo.keywords_eg_list'),
            'extraMsg' => '',
            'cssClass' => '',
            'display'  => 1,
        ];
        $this->fieldspec['seo_description'] = [
            'type'     => 'text',
            'size'     => 600,
            'h'        => 300,
            'hidden'   => 0,
            'label'    => trans('admin.seo.description'),
            'extraMsg' => '',
            'cssClass' => 'no',
            'display'  => 1,
        ];
        $this->fieldspec['seo_no_index'] = [
            'type'     => 'boolean',
            'required' => false,
            'hidden'   => 0,
            'label'    => trans('admin.seo.no-index'),
            'display'  => 1
        ];
        return $this->fieldspec;
    }


}
