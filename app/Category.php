<?php namespace App;

use Illuminate\Database\Eloquent\Model;
use \App\MaguttiCms\Translatable\GFTranslatableHelperTrait;


class Category extends Model
{
    use \Dimsav\Translatable\Translatable;
    use GFTranslatableHelperTrait;
    use \App\MaguttiCms\Domain\Category\CategoryPresenter;



    protected $fillable  = ['title','description','abstract', 'slug','sort','pub','id_parent'];
    protected $fieldspec = [];

    /*
    |--------------------------------------------------------------------------
    |  Sluggable & Trnslateble
    |--------------------------------------------------------------------------
    */
    public $translatedAttributes = ['title','slug','description','seo_title','seo_keywords','seo_description'];
    public $sluggable            = ['slug'=>['field'=>'title','updatable'=>false,'translatable'=>true]];

    /*
    |--------------------------------------------------------------------------
    |  RELATION
    |--------------------------------------------------------------------------
    */

    public function media()
    {
        return $this->morphMany('App\Media', 'model');
    }

    public function product(){
        return $this->hasMany('App\Product');
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
        $this->fieldspec['id_parent'] = [
            'type'          => 'relation',
            'model'         => 'category',
            'foreign_key'   => 'id',
            'label_key'     => 'title',
            'required'      => false,
            'label'         => 'Category',
            'hidden'        => 0,
            'display'       => 1,
        ];

        $this->fieldspec['title'] = [
            'type'      => 'string',
            'pkey'      => 'n',
            'required'  => true,
            'hidden'    => 0,
            'label'     => 'Title',
            'extraMsg'  => '',
            'display'   => 1,
        ];
        $this->fieldspec['slug'] = [
            'type'      => 'string',
            'pkey'      => 'n',
            'required'  => false,
            'hidden'    => 0,
            'label'     => 'Slug',
            'extraMsg'  => '',
            'display'   => 1,
        ];

        $this->fieldspec['description'] = [
            'type'      => 'text',
            'size'      => 600,
            'h'         => 300,
            'required'  => false,
            'hidden'    => 1,
            'label'     => 'Description',
            'extraMsg'  => '',
            'cssClass'  => 'wyswyg',
            'display'   => 0,
        ];

        $this->fieldspec['image'] = [
            'type'      => 'media',
            'pkey'      => 'n',
            'required'  => true,
            'hidden'    => 0,
            'label'     => 'Image',
            'extraMsg'  => '',
            'mediaType' => 'Img',
            'display'   => 1,
        ];
        $this->fieldspec['banner'] = [
            'type'      => 'media',
            'pkey'      => 'n',
            'required'  =>  true,
            'hidden'    => 0,
            'label'     => 'Image For menu (390x210px)',
            'extraMsg'  => '',
            'mediaType' => 'Img',
            'display'   => 0,
        ];
        
        $this->fieldspec['sort'] = [
            'type'      => 'integer',
            'required'  => false,
            'label'     => 'Order',
            'hidden'    => 0,
            'display'   => 1,
        ];
        $this->fieldspec['pub'] = [
            'type'      => 'boolean',
            'required'  => false,
            'hidden'    => 0,
            'label'     => trans('admin.label.active'),
            'display'   => 1
        ];
        $this->fieldspec['seo_title'] = [
            'type'      => 'string',
            'required'  => 'n',
            'hidden'    => 0,
            'label'     => trans('admin.seo.title'),
            'extraMsg'  => '',
            'display'   => 1,
        ];
        $this->fieldspec['seo_keywords'] = [
            'type'      => 'string',
            'hidden'    => 0,
            'label'     => trans('admin.seo.keywords').'<br>'.trans('admin.seo.keywords_eg_list'),
            'extraMsg'  => '',
            'cssClass'  => '',
            'display'   => 1,
        ];
        $this->fieldspec['seo_description'] = [
            'type'      => 'text',
            'size'      => 600,
            'h'         => 300,
            'hidden'    => 0,
            'label'     => trans('admin.seo.description'),
            'extraMsg'  => '',
            'cssClass'  => 'no',
            'display'   => 1,
        ];
        $this->fieldspec['seo_no_index'] = [
            'type'      => 'boolean',
            'required'  => false,
            'hidden'    => 0,
            'label'     => trans('admin.seo.no-index'),
            'display'   => 1
        ];
        return $this->fieldspec;
    }


    /*
    |--------------------------------------------------------------------------
    |  Scopes & Mutator
    |--------------------------------------------------------------------------
    */

    public function scopePublished($query)    {

        $query->where('pub', '=',1 )->orderBy('sort','ASC');
    }
}
