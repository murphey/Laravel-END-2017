<?php namespace App;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\URL;

use \App\MaguttiCms\Translatable\GFTranslatableHelperTrait;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;

class News extends Model
{

    use GFTranslatableHelperTrait;
    use \Dimsav\Translatable\Translatable;
    use \App\MaguttiCms\Domain\News\NewsPresenter;

	protected  $fillable        = ['title','description','date','sort','pub'];
	protected  $fieldspec       = [];

	/*
    |--------------------------------------------------------------------------
    |  Sluggable & Translateble
    |--------------------------------------------------------------------------
    */
    public $translatedAttributes    = ['title','slug','description','seo_title','seo_keywords','seo_description'];
    public $sluggable               = ['slug'=>['field'=>'title','updatable'=>false]];

    /*
    |--------------------------------------------------------------------------
    |  RELATIONS
    |--------------------------------------------------------------------------
    */
    public function media()
    {
        return $this->morphMany('App\Media', 'model')->orderBy('sort');
    }

    public function tags(){
        return $this->belongsToMany('App\Tag');
    }

    public function saveTags($values)
    {
        if(!empty($values))
        {
            $this->tags()->sync($values);
        } else {
            $this->tags()->detach();
        }
    }

    /*
    |--------------------------------------------------------------------------
    |  DATE ATTRIBUTE
    |--------------------------------------------------------------------------
    */
    public function setDateAttribute($value)
    {
        $this->attributes['date'] = Carbon::parse($value);

    }

    public function getDateAttribute($value)
    {
        //return Carbon::parse($value)->format('d-m-Y');
        return Carbon::parse($value)->format('d-m-Y H:i:s');
    }

    public function getFormattedDate()
    {
        //return Carbon::parse($this->attributes['date'])->formatLocalized('%d %B %Y');
        return Carbon::parse($this->attributes['date'])->format('d-m-Y');
    }



    /*
    |--------------------------------------------------------------------------
    |  Fieldspec
    |--------------------------------------------------------------------------
    */
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
		$this->fieldspec['date'] = [
			'type'      =>'string',
			'required'  => 1,
			'hidden'    => 0,
			'label'     => 'Publish date',
			'extraMsg'  => '',
			'display'   =>  1,
			'cssClass'  => 'datetimepicker',
            //'cssClass'  => 'datepicker',
			'cssClassElement' => 'col-sm-3',
		];
        $this->fieldspec['start_date'] = [
            'type'      =>'date',
            'required'  => 1,
            'hidden'    => 0,
            'label'     => 'Data Ora evento',
            'extraMsg'  => '',
            'display'   =>  1,
            'cssClass'  => 'datetimepicker',
            'cssClassElement' => 'col-sm-2',
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
		$this->fieldspec['description'] = [
			'type'      => 'text',
			'size'      => 600,
			'h'         => 300,
			'required'  => true,
			'hidden'    => 0,
			'label'     => 'Description',
			'extraMsg'  => '',
			'cssClass'  => 'wyswyg',
			'display'   => 1,
		];
		$this->fieldspec['tag'] = [
            'type'       	=> 'relation',
            'model'      	=> 'Tag',
            'relation_name' => 'tags',
            'foreign_key'   => 'id',
			'label_key'     => 'title',
			'label'         => 'Tags',
            'required'      => true,
			'display'       => 1,
            'hidden'        => false,
			'multiple'      => true,
		];
		$this->fieldspec['link'] = [
			'type'      => 'string',
			'size'      => 600,
			'required'  => true,
			'hidden'    => 0,
			'label'     => 'External url',
			'extraMsg'  => '',
			'display'=>0,
		];
		$this->fieldspec['image'] = [
			'type'      =>'media',
			'required'  => false,
			'hidden'    => 0,
			'label'     => 'Image',
			'extraMsg'  => '',
			'extraMsgEnabled'=>'Code',
			'mediaType' => 'Img',
			'display'   => 1,
		];
		$this->fieldspec['doc'] = [
			'type'      =>'media',
			'required'  =>'n',
			'hidden'    => 0,
			'label'     =>'Document',
			'extraMsg'  => '',
			'lang'      => 0,
			'mediaType' => 'Doc',
			'display'   => 0,
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
            'display'  => 0
        ];
	    return $this->fieldspec;
	}


   /*
   |--------------------------------------------------------------------------
   |  Scopes & Mutator
   |--------------------------------------------------------------------------
   */
	public function scopeLatest($query, $limit = 5)    {
		$query->where('pub',1)->translatedContent()->limit($limit)->orderBy('date', 'desc');
	}

}
