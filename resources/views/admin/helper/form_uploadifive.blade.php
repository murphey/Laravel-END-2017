@if ( config('maguttiCms.admin.list.section.'.strtolower(str_plural($pageConfig['model'])).'.showMediaCategory')  == 1 && $article->id!='')
@inject('domain','App\Domain')
<div class="col-md-12">
    <div class="form-group">
        <h5>{!! trans('admin.message.media_max_file') !!}</h5>
        <label>{!!trans('admin.message.media_doc_type') !!}</label>
        <select id="myImgType" name="myImgType" class="form-control mid-input full-xs">
            <option value=''>{!! trans('admin.label.please_select')!!}</option>
            @foreach ( $domain->byDomain('imagetype')->get() as  $index => $item )
                <option value="{!! $item->id !!}">{!! $item->title !!}</option>
            @endforeach
        </select>

    </div>
</div>
<hr/>
@endif
<input id="itemId" name="itemId" type="hidden" value="{!! $article->id!!}">
<fieldset class="alert alert-info">
    <input id="file_upload_media" name="file_upload" type="file" multiple="true" class="btn btn-primary file_upload_media">
    <div>
        <div id="queue_media" class="queue">{!!trans('admin.message.media_drag') !!}</div>
    </div>
</fieldset>
<a href="javascript:$('#file_upload_media').uploadifive('upload')" class="btn btn-primary hidden">
    <i class="fa fa-download"></i> {!! trans('admin.label.upload_file')!!}
</a>

@if ( config('maguttiCms.admin.list.section.'.strtolower(str_plural($pageConfig['model'])).'.showMediaImages')  == 1)
    <hr/>
    <h3 class="separatore"></h3>
    <div id="imagesList">
        <h3>{!!trans('admin.message.media_image_gallery') !!}</h3>
        <div id="imagesListBody" class="pf0 mf0">
            @include('admin.helper.images_list_gallery')
        </div>
    </div>
@endif
@if ( config('maguttiCms.admin.list.section.'.strtolower(str_plural($pageConfig['model'])).'.showMediaDoc')  == 1)
    <div id="docsList">
        <h3>{!!trans('admin.message.media_doc_gallery') !!}</h3>
        <div id="docsListBody" class="pf0 mf0">
            @include('admin.helper.docs_list')
        </div>
    </div>
@endif
<hr/>
