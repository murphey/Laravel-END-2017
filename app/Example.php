<?php namespace App;

use Mcamara\LaravelLocalization\Facades\LaravelLocalization;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\URL;
use Carbon\Carbon;

use \App\MaguttiCms\Translatable\GFTranslatableHelperTrait;

/**
 * Class Article
 * @package App
 */
class Example extends Model
{

    use  GFTranslatableHelperTrait;
    use \Dimsav\Translatable\Translatable;
    use \App\MaguttiCms\Domain\Article\ArticlePresenter;

    protected $fillable = ['title', 'description', 'description_2', 'slug', 'doc', 'color', 'date', 'sort', 'pub', 'article_id', 'article_2_id'];
    protected $fieldspec = [];

    public $ajaxAccessibilityRoles = ['su'];

    /*
    |--------------------------------------------------------------------------
    |  Sluggable & Trnslateble
    |--------------------------------------------------------------------------
    */
    public $translatedAttributes = ['title', 'slug', 'description', 'description_2', 'seo_title', 'seo_keywords', 'seo_description', 'seo_no_index'];

    public $sluggable            =  ['slug'=>['field'=>'title','updatable'=>false,'translatable'=>true]];


    /*
    |--------------------------------------------------------------------------
    |  RELATION
    |--------------------------------------------------------------------------
    */
    public function article() {
        return $this->belongsTo('App\Article', 'article_id', 'id');
    }
    public function article_2() {
        return $this->belongsTo('App\Article', 'article_2_id', 'id');
    }
	public function articles(){
        return $this->belongsToMany('App\Article', 'example_article', 'example_id', 'article_id');
    }
	public function saveArticles($values) {
        if(!empty($values))
            $this->articles()->sync($values);
        else
            $this->articles()->detach();
    }
	public function media() {
        return $this->morphMany('App\Media', 'model');
    }

	/*
	|--------------------------------------------------------------------------
	|  DATE ATTRIBUTE
	|--------------------------------------------------------------------------
	*/
	public function setDateAttribute($value) {
		$this->attributes['date'] = Carbon::parse($value);
	}

	public function getDateAttribute($value) {
		//return Carbon::parse($value)->format('d-m-Y');
		return Carbon::parse($value)->format('d-m-Y');
	}

	public function getFormattedDate() {
		//return Carbon::parse($this->attributes['date'])->formatLocalized('%d %B %Y');
		return Carbon::parse($this->attributes['date'])->format('d-m-Y');
	}

    /*
    |--------------------------------------------------------------------------
    |  Fieldspec
    |--------------------------------------------------------------------------
    */
    function getFieldSpec()
    {
        $this->fieldspec['id'] = [
            'type'      => 'integer',
            'minvalue'  => 0,
            'pkey'      => 'y',
            'required'  => 1,
            'label'     => 'id',
            'hidden'    => 1,
            'display'   => 0,
        ];
        $this->fieldspec['article_id'] = [
            'type'        => 'relation',
            'model'       => 'article',
            'foreign_key' => 'id',
            'label_key'   => 'title',
            'required'    => 0,
            'label'       => 'Relation with another model',
            'hidden'      => 0,
            'display'     => 1,
        ];
        $this->fieldspec['article_2_id'] = [
            'type'        => 'relation',
            'model'       => 'article',
            'foreign_key' => 'id',
            'label_key'   => 'title',
            'required'    => 0,
            'label'       => 'Relation with another model and selectize',
            'hidden'      => 0,
            'display'     => 1,
            'cssClass'    => 'selectize',
        ];
		$this->fieldspec['example_articles'] = [
            'type'       	=> 'relation',
            'model'      	=> 'Article',
            'relation_name' => 'articles',
            'foreign_key'   => 'id',
			'label_key'     => 'title',
			'label'         => 'Multiple relation',
            'required'      => 0,
			'display'       => 1,
            'hidden'        => 0,
			'multiple'      => 1,
		];
        $this->fieldspec['title'] = [
            'type'     => 'string',
            'required' => 1,
            'hidden'   => 0,
            'label'    => 'Text',
            'extraMsg' => '',
            'display'  => 1,
        ];
        $this->fieldspec['slug'] = [
            'type'     => 'string',
            'required' => 0,
            'hidden'   => 0,
            'label'    => 'Sluggable',
            'extraMsg' => '',
            'display'  => 1,
        ];
        $this->fieldspec['description'] = [
            'type'     => 'text',
            'size'     => 600,
            'h'        => 300,
            'required' => 'n',
            'hidden'   => 0,
            'label'    => 'Textarea',
            'extraMsg' => '',
            'display'  => 1,
        ];
        $this->fieldspec['description_2'] = [
            'type'     => 'text',
            'size'     => 600,
            'h'        => 300,
            'required' => 'n',
            'hidden'   => 0,
            'label'    => 'Textarea WYSIWYG',
            'extraMsg' => '',
            'cssClass' => 'wyswyg',
            'display'  => 1,
        ];
        $this->fieldspec['image'] = [
            'type'      => 'media',
            'required'  => 0,
            'hidden'    => 0,
            'label'     => 'File upload',
            'extraMsg'  => '',
            'mediaType' => 'Img',
            'display'   => 1,
        ];
        $this->fieldspec['doc'] = [
            'type'      => 'media',
            'required'  => 0,
            'hidden'    => 0,
            'label'     => 'File upload with ajax',
            'extraMsg'  => '',
            'lang'      => 0,
            'mediaType' => 'Doc',
            'display'   => 1,
			'uploadifive' => 1,
        ];
		$this->fieldspec['color'] = [
            'type'     => 'color',
            'required' => 0,
            'hidden'   => 0,
            'label'    => 'Color picker',
            'extraMsg' => '',
            'display'  => 1,
        ];
		$this->fieldspec['date'] = [
			'type'      =>'string',
			'required'  => 0,
			'hidden'    => 0,
			'label'     => 'Date picker',
			'extraMsg'  => '',
			'display'   =>  1,
			'cssClass'  => 'datepicker',
			//'cssClass'  => 'datepicker',
			'cssClassElement' => 'col-sm-3',
		];
        $this->fieldspec['sort'] = [
            'type'     => 'integer',
            'required' => 0,
            'label'    => 'Number',
            'hidden'   => 0,
            'display'  => 1,
        ];
        $this->fieldspec['pub'] = [
            'type'     => 'boolean',
            'required' => 0,
            'hidden'   => 0,
            'label'    => 'Boolean',
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
            'required' => 0,
            'hidden'   => 0,
            'label'    => trans('admin.seo.no-index'),
            'display'  => 1
        ];

        return $this->fieldspec;
    }
}
