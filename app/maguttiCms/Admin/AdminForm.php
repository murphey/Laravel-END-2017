<?php namespace App\MaguttiCms\Admin;

use Carbon\Carbon;
use Form;
use App;

use App\MaguttiCms\Admin\Facades\AdminFormImageRelation;

/**
 * Class AdminForm
 *
 * @package App\MaguttiCms\Admin
 */
class AdminForm {

    protected  $html;
    protected  $property;
    protected  $showSeo;

    public function get($model)
    {
        $this->showSeo = false;
        $this->initForm($model);
        echo $this->render();
    }

    public function getSeo($model)
    {
        $this->showSeo = true;
        $this->initForm($model);
        echo $this->render();
    }

    public function setProperty($property)
    {
       $this->property = $property;
       return $this;
    }

    public function render()
    {
        return $this->html;
    }

    protected function initForm($model)
    {
        $this->html = "";
        $this->model = $model;
        foreach ($this->model->getFieldSpec() as $key => $property) {
            if ((starts_with($key, 'seo') && $this->showSeo) or (!starts_with($key, 'seo') && !$this->showSeo)) $this->formModelHandler($property, $key, $this->model->$key);
        }

        if (isset($this->model->translatedAttributes) && count($this->model->translatedAttributes) > 0) {
            $this->model->fieldspec = $this->model->getFieldSpec();
            foreach (config('app.locales') as $locale => $value) {
                if (config('app.locale') != $locale) {
                    $target = "language_box_" . str_slug($value) . "_" . str_random(160);
                    $this->html .= $this->containerLanguage($value, $target);
                    $this->html .= "<div class=\"collapse\" id=\"" . $target . "\">";
                    foreach ($this->model->translatedAttributes as $attribute) {
                        $value = (isset($this->model->translate($locale)->$attribute)) ? $this->model->translate($locale)->$attribute : '';
                        $this->property = $this->model->fieldspec[$attribute];
                        if ((starts_with($attribute, 'seo') && $this->showSeo) or (!starts_with($attribute, 'seo') && !$this->showSeo)) $this->formModelHandler($this->model->fieldspec[$attribute], $attribute . '_' . $locale, $value);
                    }
                    $this->html .= "</div>";
                }
            }
        }
    }

    private function formModelHandler($property, $key, $value = '') {
        $this->property  = $property;
        $cssClass        = (isset( $this->property['cssClass']))?$this->property['cssClass'] :' ';
        $cssClassElement = (isset( $this->property['cssClassElement']))?$this->property['cssClassElement'] :' col-md-10';
        $isLangField     = (isset($this->property['lang']) && $this->property['lang']== 1) ? true: false;
		$intMin				= (isset( $this->property['min']))?$this->property['min'] : '';
		$intMax				= (isset( $this->property['max']))?$this->property['max'] : '';
		$intStep			= (isset( $this->property['step']))?$this->property['step'] : '';
        $formElement     = '';

        /**
         * populate field default value
         * if the model is empty
         */

        if(isset( $this->property['default_value']) && empty($this->model->id)){
            $value  = $this->property['default_value'];
        }

        if( $isLangField  ||  $this->property['display'] != 1 ) { }
        else if (isset($this->property['hidden']) && $this->property['hidden']==1 && $this->property['type'] !='relation') {
            $formElement = Form::hidden($key, $value , array('class' => ' form-control '.$cssClass));
        }
        else if($this->property['type'] =='string' ) {
            $formElement = Form::text($key, $value , array('class' => ' form-control '.$cssClass));
        }
        else if($this->property['type'] =='readonly' ) {
            $formElement = Form::text($key, $value , array('readonly' => 'true','class' => ' form-control '.$cssClass));
        }
        else if($this->property['type'] =='date' || $this->property['type'] =='date-readonly' ) {
            $value = ($value) ? Carbon::parse($value)->format('d-m-Y') :date('d-m-Y');
            $formElement = ($this->property['type'] =='date-readonly')?$formElement = Form::text($key, $value , array('readonly' => 'true','class' => ' form-control '.$cssClass)):Form::text($key, $value , array('class' => ' form-control '.$cssClass));
            $cssClassElement  = (isset($this->property['cssClassElement']))	 ? $this->property['cssClassElement'] : 'col-md-2';
        }
        else if($this->property['type'] =='integer'  && $this->property['display']== 1) {
            $cssClassElement  = (isset( $this->property['cssClassElement']))?$this->property['cssClassElement']:'col-md-2';
            $formElement = Form::number($key, $value , array(
				'class' => ' form-control '.$cssClass,
				'min' => $intMin,
				'max' => $intMax,
				'step' => $intStep
			));
        }
		else if($this->property['type'] =='color' ) {
			$formElement = '<div class="color-picker input-group colorpicker-component">';
	            $formElement .= Form::text($key, $value , array('class' => ' form-control '.$cssClass));
				$formElement .= '<span class="input-group-addon"><i></i></span>';
			$formElement .= '</div>';
        }
        else if($this->property['type'] =='text'  && $this->property['display']== 1) {
            $h =(isset($this->property['h']))?$this->property['h']:300;
            $formElement = Form::textarea($key, $value.'' , array('class' => 'form-control '.$cssClass,'style'=>'height:'.$h.'px'));
        }
        else if($this->property['type'] =='boolean'  && $this->property['display']== 1) {
            //$formElement = Form::checkbox($key, 1 , $this->model->$key );
            $activeNo=($value!='1')?' active':'';
            $activeYes=($value	=='1')?'active':'';
            $formElement.="<div class=\"btn-group\" data-toggle=\"buttons\">\n";
            $formElement.=' <label class="btn btn-default '.$activeYes.'" onclick="$(\'#'.$key.'\').val(1)">
									<input type="radio"  name="options"  autocomplete="off" '.$activeYes.'>'.trans('admin.label.btn_yes').'
								</label>';
            $formElement.=' <label class="btn btn-default '.$activeNo.'" onclick="$(\'#'.$key.'\').val(0)">
									<input type="radio"  name="options"  autocomplete="off" '.$activeNo.'> '.trans('admin.label.btn_no').'
								</label>';
            $formElement.="</div>\n";
            $formElement .= Form::hidden($key, $value , array('id'=> $key,'class' => ' form-control '.$cssClass));

        }
        else if($this->property['type'] =='media'  && $this->property['display']== 1) {
            $formElement = Form::file($key)	;
            $cssClassElement  = 'col-md-10';
        }
        else if($this->property['type'] =='relation'  && $this->property['display']== 1) {
            $objRelation = $this->getRelation();
            $selected = ( isset( $this->property['relation_name'] ) && $this->property['relation_name']!='') ? $this->model->{$this->property['relation_name']}->pluck('id')->toArray():'';
            $formElement   = $this->getComboRelation( $objRelation,$key,$value,$selected);
        }
        else if($this->property['type'] =='relationimage'  && $this->property['display']== 1) {

            $objRelation = $this->getRelation();
            $selected = ( isset( $this->property['relation_name'] ) && $this->property['relation_name']!='') ? $this->model->{$this->property['relation_name']}->pluck('id')->toArray():'';

            $formElement  .= AdminFormImageRelation::setProperty($this->property)->getThumbRelation($objRelation,$key,$value,$selected);
        }
        if ( $formElement  && $this->property['type'] =='media'){
			if (isset($this->property['uploadifive']) && $this->property['uploadifive'])
				$this->html .= $this->containerUploadifive($formElement, $cssClassElement, $key, $value);
			else
				$this->html .= $this->containerMedia($formElement, $cssClassElement, $key);
		}
        elseif ($formElement)
			$this->html .= $this->container($formElement, $cssClassElement);

    }

    function container($formElement, $cssClass = "") {
        // GF_ma gestione campo hidden
        if ( isset($this->property['hidden']) && $this->property['hidden']!=1) {
            $html = "<div class=\"form-group\">";
            $html .= "<label for=\"" . $this->property['label'] . "\" class=\"col-md-2 control-label\">\n";
            $html .= $this->property['label'];
            if (isset($this->property['required']) && $this->property['required'] == '1') $html .= " * ";
            if (isset($this->property['extraMsg'])) {
                if (isset($this->property['extraMsgEnabled'])) {
                    $html .= "<br><span class=\"help-inline small extraMsg\"> (" . $this->extraMsgHandler() . ")</span> ";
                }
            }
            $html .= "</label>\n";
            $html .= "<div class=\"" . $cssClass . "\">\n";
            $html .= $formElement;
            $html .= "</div>";
            $html .= "</div>\n";
            $html .= "<div class=\"clearfix\"></div>\n";
        }
        else   $html = $formElement;
        return $html;
    }

    function containerMedia($formElement, $cssClass = "", $key) {
        $html = '';
        $html .= "<div class=\"form-group mf0\">";
        	$html .= '<label for="'.$this->property['label'].'" class="col-md-2 control-label">'.$this->property['label']."</label>\n";
	        if (isset($this->property['requiredField']))
				$html .= $this->property['requiredField']." ";
	        if (isset($this->property['extraMsg']) && isset($this->property['extraMsgEnabled'])) {
				$this->extraMsgHandler();
	            //$html.= "<span id=\"".$this->formElement."_extraMsg\" class=\"help-inline small\"> (".$this->extraMsg.")</span> ";
	        }
	        $html .= "<div class=\" mediaContent ".$cssClass."\">\n";
			$html .= '<div class="row">';
				$html .= '<div class="col-xs-6">';
			        $html .= $formElement;
				$html .= '</div>';
				$html .= '<div class="col-xs-6">';
			        if( $this->model->$key!='') {
			            if( $this->property['mediaType']=='Img') $html.="<div class=\"mt10 mr10 mediaBox\"  id=\"box_".$key."_".$this->model->id."\">
			                                <img class=\"img-responsive imgEditThumb\" src=\"".ma_get_image_from_repository($this->model->$key)."\">
			                                ".$this->createMediaDeleteBtn( $key,$this->model->id)."</div>\n";
			            else  $html.="<div class=\"mt10 mr10\" id=\"box_".$key."_".$this->model->id."\">
			                            <div class=\"btn-group\" role=\"group\" aria-label=\"...\">
			                              <a href=\"".ma_get_doc_from_repository($this->model->$key)."\" target=\"_blank\" class=\"btn btn-primary\">".__('admin.label.view')."</a>
			                              ".$this->createMediaDeleteBtn( $key,$this->model->id)."</div>
			                            </div>\n";
			        }
					$html .= '</div>';
				$html .= '</div>';
				$html.= '<hr/>';
	        $html.="</div>";
        $html.="</div>";
        return $html;
    }

	public function containerUploadifive($formElement, $cssClass = "", $key, $value) {
		$html = '';
		$html .= '<div class="form-group mf0">';
	        $html .= '<label for="'.$this->property['label'].'" class="col-md-2 control-label">'.$this->property['label']."</label>\n";
				if (isset($this->property['requiredField']))
					$html .= $this->property['requiredField']." ";
				if (isset($this->property['extraMsg']) && isset($this->property['extraMsgEnabled']))
					$this->extraMsgHandler();

			$html .= Form::hidden($key, $value , array('class' => ' form-control '.$cssClass));
			$html .= "<div class=\" mediaContent ".$cssClass."\">\n";
				$html .= '<div class="row">';
					$html .= '<div class="col-xs-6">';
						$html .= '<fieldset class="alert alert-info">';
						    $html .= '<input id="file_upload_'.$key.'" type="file" class="btn btn-primary file_upload_single" data-key="'.$key.'">';
						    $html .= '<div>';
						        $html .= '<div id="queue_'.$key.'" class="queue">'.trans('admin.message.media_drag').'</div>';
						    $html .= '</div>';
						$html .= '</fieldset>';
						$html .= '<a href="javascript:$(\'#file_upload_'.$key.'\').uploadifive(\'upload\')" class="btn btn-primary hidden">';
						    $html .= '<i class="fa fa-download"></i>'.trans('admin.label.upload_file');
						$html .= '</a>';
					$html .= '</div>';
					$html .= '<div class="col-xs-6">';
						if( $this->model->$key!='') {
							if( $this->property['mediaType']=='Img') $html.="<div class=\"mt10 mr10 mediaBox\"  id=\"box_".$key."_".$this->model->id."\">
							<img class=\"img-responsive imgEditThumb\" src=\"".ma_get_image_from_repository($this->model->$key)."\">
							".$this->createMediaDeleteBtn( $key,$this->model->id)."</div>\n";
							else  $html.="<div class=\"mt10 mr10\" id=\"box_".$key."_".$this->model->id."\">
							<div class=\"btn-group\" role=\"group\" aria-label=\"...\">
							<a href=\"/admin/file_view/".strtolower(str_plural(class_basename($this->model)))."/".$this->model->id."/".$key."\" target=\"_blank\" class=\"btn btn-primary\">".__('admin.label.view')."</a>
							".$this->createMediaDeleteBtn( $key,$this->model->id)."</div>
							</div>\n";
						}
						$html .= '</div>';
					$html.="</div>";
				$html.= '</div>';
			$html.= '<hr/>';
		$html.="</div>";
		return $html;
	}

    function extraMsgHandler() {
        return ( isset($this->property['extraMsg'] )) ? $this->property['extraMsg'] :'';
    }

    /**
     * GET RELATION DATA
     * CAN BE FILTERED
     * @return mixed
     */
    public function getRelation() {
        $relationModel = "App\\".$this->property['model'] ;
        $model         =  new  $relationModel;
        $orderField    =  (isset($this->property['order_field']) )? $this->property['order_field']: $this->property['label_key'];
        $order         =  'ASC';
        $query         =  $model::select(); //$relationModel;
        ;
        if(isset($model->translatedAttributes )  && in_array($this->property['label_key'],$model->translatedAttributes ) )   return  $this->getTranslatableRelation();
        else {
            /**  filter  condition */
            if(isset($this->property['filter'] )){
                foreach($this->property['filter'] as $column => $value)
                {
                    $query->where($column, '=', $value);
                }
            }
            $relationObj = $query->orderBy($orderField,$order)->get();
            return   $relationObj ;
        }

    }

    /**
     * GET RELATION DATA
     * FOR TRANSLATABLE TABLE
     * CAN BE FILTERED AN ORDERED
     * @return mixed
     */
    function getTranslatableRelation(){
        $relationModel    = "App\\".$this->property['model'] ;
        $orderField       = (isset($this->property['order_field']) )? $this->property['order_field']: $this->property['label_key'];
        $order            = 'ASC';
        $table            = with(new $relationModel )->getTable();
        $translationTable = strtolower(snake_case( $this->property['model'] ));
        $a                = ( isset( $this->property['foreign_key'] ) ) ? $this->property['foreign_key'] : 'id';
        $query            = $relationModel::join($translationTable.'_translations as t', 't.'.$translationTable.'_id', '=', $table.'.id')
                                ->where('locale', app()->getLocale())
                                ->groupBy($table.'.id')
                                ->with('translations');

        if($a!='id') $query->select($table.'.'.$a, $table.'.id', 't.'.$this->property['label_key'].' as '.$this->property['label_key'] );
        else $query->select($table.'.id', 't.'.$this->property['label_key'].' as '.$this->property['label_key'] );

        if(isset($this->property['filter'] )){
            foreach($this->property['filter'] as $column => $value)
            {
                $query->where($column, '=', $value);
            }
        }
        $relationObj = $query->orderBy($orderField,$order)->get();
        return   $relationObj ;
    }

    public function getComboRelation($obj, $field, $selItem = '', $selectedArray = '') {

        $a          = ( isset( $this->property['foreign_key'] ) ) ? $this->property['foreign_key'] : 'id';
        $b          = ( isset( $this->property['label_key']  )  ) ? $this->property['label_key'] : 'name';
        $isRequired = ( isset( $this->property['required']  )  ) ? $this->property['required'] : false;
        $nullLabel  = ( isset( $this->property['nullLabel']  )  ) ? $this->property['nullLabel'] : 'Select '.$this->property['label'];
        $multiple   = ( isset( $this->property['multiple']  )  ) ? 'multiple' : '';
        $cssClass   = (isset( $this->property['cssClass']))?$this->property['cssClass'] :' ';

        // GF_ma gestione campo hidden
        if (isset($this->property['hidden']) && $this->property['hidden']==1 ) {
            if( $multiple ) $html ="<select class=\"form-control hidden\" id=\"".$field."\" name=\"".$field."[]\"  ".$multiple." >\n";
            else  $html ="<select class=\"form-control hidden\" id=\"".$field."\" name=\"".$field."\" >\n";
        }
        else
            if( $multiple )$html ="<select data-placeholder=\"Select an option\"  class=\"form-control selectizemulti\" id=\"".$field."\" name=\"".$field."[]\" ".$multiple.">\n";
            else $html ="<select class=\"form-control ".$cssClass." \" id=\"".$field."\" name=\"".$field."\" >\n";

        if($isRequired==false) $html .="<option value=\"\">".$nullLabel."</option>";

        foreach( $obj as $item ) {
            $selected = ($item->$a == $selItem || (is_array($selectedArray) && in_array($item->$a,$selectedArray))) ? 'selected':'';
            $html .="<option value=\"".$item->$a."\" ".$selected.">".$item->$b."</option>\n";

        }
        $html .="</select>\n";
        return    $html ;
    }

    public  function createMediaDeleteBtn( $key,$id) {
        $html="<a href=\"#\" rel=\"tooltip\" class=\"color-3 ph5\"
				   data-original-title=\"".trans('admin.message.delete_item')."\"
				   onclick=\"deleteImages(this)\" id=\"delete-".$key."-".$id."\"><i class=\"fa fa-trash big\"></i></a>";

        return    $html ;
    }

    /*********************************  LANGUAGE SECTION HELPER ***************************/
    function containerLanguage($label, $target, $cssClass = "") {

        $html = "<div class=\"form-group\">";
        $html.="<h2 class=\"bck-color-2 color-2 pv5 pl15 mf10 pointer\" data-toggle=\"collapse\" href=\"#".$target."\" aria-expanded=\"false\" aria-controls=\"collapseExample\"> + ".$label."</h2>\n";
        $html.="</div>\n";
        $html.="<div class=\"clearfix\"></div>\n";
        return $html;
    }

    /**
     * This method is used to build a dropdown input for the search section of 'model list'.
     *
     * @param $key: The name of the input field.
     * @param $field: The array of specifications (from config/maguttiCms/admin/list.php)
     *
     * @return string: The generated html string.
     */
    public function buildSearchableField($key, $field) {

        // Pull the model instance out of the ioc container.
        $model = getModelFromString($field['model']);

        // $value is the 'value' of <option>.
        $value          = isset($field['value']) ? $field['value'] : 'id';
        $caption        = $field['field'];
        $orderField     = (isset($field['order_field']) )? $field['order_field']: $caption;
        $order          = (isset($field['order']) )? $field['order']: 'ASC';
        $cssClass       = (isset($field['cssClass']) )? $field['cssClass']: ' ';

        // Fetch all model records.
        $obj = (new  $model)->newQuery();
        $obj->orderby($orderField,$order);
        if (isset($field['where']))
            $records = $obj->whereRaw($field['where'])->get();
        else
            $records =$obj->get();

        $html = "<select class='form-control  ".$cssClass." ' id='{$key}' name='{$key}'><option value='' selected>Select an option</option>\n";
        foreach ($records as $record) {
            $html .= "<option value='{$record->$value}'>{$record->$caption}</option>\n";
        }
        $html .= "</select>";

        return $html;
    }

    /**
     * This method is used to build a suggestable field (it uses select 2).
     *
     * @param $key: The name of the input field.
     * @param $field: The array of specifications (from config/maguttiCms/admin/list.php)
     *
     * @return string: The generated html string.
     */
    public function buildSuggestableField($key, $field){

        // Set convenience variables.
        $value = isset($field['value']) ? $field['value'] : 'id';
        $caption = $field['caption'];
        $additionalWhereClause = isset($field['where']) ? $field['where'] : '';
        $searchFields   = isset($field['searchFields']) ? $field['searchFields'] : '';
        return "<select class='form-control suggest-remote' id='{$key}' name='{$key}'
                        data-model='{$field['model']}'
                        data-value='$value'
                        data-caption='$caption'
                        data-fields='$searchFields'
                        data-where='{$additionalWhereClause}'></select>";
    }
}
