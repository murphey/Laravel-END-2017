@extends('admin.master')
@section('title', 'Admin Control Panel'.$pageConfig['title'])
@section('content')

@include('admin.helper.toolbar_top')

<div class="container-fluid mv25">
	@include('admin.helper.search_list')
	<div class="panel panel-default">
		<div class="panel-heading pf5">
			<h2 class="mf5 pf0"> <i class="fa fa-{!! $pageConfig['icon']!!}"></i> {!! $pageConfig['title']!!}  List </h2>
		</div>
		@include('shared.notification')
		@if ($articles->isEmpty())
		<h3 class="pf15">
			There is no item.
		</h3>
		@else
		<form>
		<input type="hidden" name="_token" value="<?php echo csrf_token(); ?>">
		<div id="page-list" class="table-responsive">
			<table id="table-list" class="table table-striped table-bordered table-condensed table-hover table-shadow">
				<thead>
					<tr>
						{{ AdminList::initList($pageConfig)->getListHeader() }}
						@if ($pageConfig['edit']==1)
							<th class="middle-vertical-align">{!! trans('admin.label.edit')!!}</th>
						@endif
						@if ($pageConfig['copy']==1)
							<th class="middle-vertical-align">{!! trans('admin.label.copy')!!}</th>
						@endif
						@if ($pageConfig['view']==1)
							<th class="middle-vertical-align">{!! trans('admin.label.view')!!}</th>
						@endif
						@if ($pageConfig['delete']==1)
							<th class="middle-vertical-align">{!! trans('admin.label.delete')!!}</th>
						@endif
					</tr>
				</thead>
				<tbody>
					@foreach($articles as $article)


					<tr id="row_{!! $article->id !!}">
						@if ($pageConfig['selectable']==1)
							<td>
								<input type="checkbox" value="{!! $article->id !!}" id="list_{!! $article->id !!}" name="list[{!! $article->id !!}]" class="checkbox"/>
              				</td>
						@endif
						@foreach($labels=$pageConfig['field'] as $label)
						<td class="{{ isset($label['class']) ? $label['class'] : 'text-center' }}">

							@if (is_array($label))

								@if ( $label['type'] == 'date' )
									{!! $article->{$label['field']}->format('d-m-Y') !!}

								@elseif ( $label['type'] == 'upload' )
									<a href=" {!! ma_get_upload_from_repository($article->{$label['field']}) !!}"  target="_new">
										{!! trans('admin.label.download')!!}
									</a>

								@elseif ( $label['type'] == 'media' && $article->{$label['field']}!='' && $article->collection_name=='images' )
									<img src="{!! ma_get_image_from_repository($article->{$label['field']},120,90,'png') !!}"  class="img-responsive imgEditThumb">

								@elseif ( $label['type'] == 'media' && $article->{$label['field']}!='' && $article->collection_name!='images' )
									<a href=" {!!   ma_get_image_from_repository($article->{$label['field']}) !!}" class="red" target="_new">
										{!! $article->{$label['field']}!!}
									</a>

								@elseif ( $label['type'] == 'image' && $article->{$label['field']}!='' )
									<a href=" {!!   ma_get_image_from_repository($article->{$label['field']}) !!}" class="red" target="_new">
										<img src="{!! ma_get_image_from_repository($article->{$label['field']},120,90,'png') !!}"  class="img-responsive imgEditThumb">
									</a>

								@elseif ( $label['type'] == 'boolean' )
									<div class="togglebutton"  data-list-boolean ="{!! $pageConfig['model'].'_'.$article->id !!}" data-list-name ="{!! $label['field']!!}" >
											<i class=" transitioned fa fa-2x fa-check text-success pointer {{ ($article->{$label['field']}==1) ? '' : 'hidden' }} "></i>
											<i class="transitioned fa fa-2x fa-close text-error  pointer {{ ($article->{$label['field']}==1) ? 'hidden' : '' }}"></i>
									</div>

								@elseif ( $label['type'] == 'editable' )
									<input
										id="{!! $pageConfig['model'].'_'.$label['field'].'_'.$article->id !!}"
										name="{!! $label['field'] !!}[]"
										type="text" value="{{ $article->{$label['field']}  }}"
										data-list-value ="{!! $pageConfig['model'].'_'.$article->id !!}"
										data-list-name ="{!! $label['field']!!}"
										/>
								@elseif ( $label['type'] == 'relation'  )

									@if ( $article->{$label['relation']})  {!! $article->{$label['relation']}->{$label['field']} !!} @endif
								@elseif ( $label['type'] == 'color'  )

									<div style="width:40px; height: 40px; border-radius: 5px !important; background-color: {{ $article->{$label['field']}  }}">

									</div>
								@else
									{{ $article->{$label['field']} }}
								@endif
							@else
								{{ $article->$label }}
							@endif
						</td>
						@endforeach
						@if ($pageConfig['edit']==1)
						<td class="text-center">
							<a href="{{  ma_get_admin_edit_url($article) }}" class="btn btn-primary btn-small "   data-role ="edit-item"> <i class="fa fa-edit"></i> {!! trans('admin.label.edit')!!}</a>
						</td>
						@endif
						@if ($pageConfig['copy']==1)
							<td class="text-center">
								<a href="{{  ma_get_admin_copy_url($article) }}" class="btn btn-warning btn-small "   data-role ="edit-item"> <i class="fa fa-copy"></i> {!! trans('admin.label.copy')!!}</a>
							</td>
						@endif
						@if ($pageConfig['view']==1)
							<td class="text-center">
								<a href="{{  ma_get_admin_view_url($article) }}" class="btn btn-primary btn-small "   data-role ="edit-item"> <i class="fa fa-eye"></i> {!! trans('admin.label.view')!!}</a>
							</td>
						@endif
						@if ($pageConfig['delete']==1)
							<td class="text-center">
								<a href="{{  ma_get_admin_delete_url($article) }}" class="btn btn-danger btn-small" data-role="delete-item">
									<i class="fa fa-trash"></i> {!! trans('admin.label.delete')!!}
								</a>
							</td>
						@endif
					</tr>
					@endforeach
				</tbody>
			</table>
		</div>
		</form>

		@endif
		@if ($articles->render())
		<div class="panel-heading">
			<div class="pagination"> {!! $articles->render() !!} </div>
		</div>
		@endif
	</div>

</div>

@endsection

@section('footerjs')
	<script src="{!! asset(config('maguttiCms.admin.path.plugins').'selectize/selectize.min.js')!!}" type="text/javascript"></script>
	<script type="text/javascript">
        $(function() {
            $('.selectize').selectize({
                sortField: 'text'
            });
            $('.suggest-remote').selectize({
                valueField: 'id',
                labelField: 'value',
                searchField: 'value',
                sortField: 'text',
                load: function(query, callback) {
                    var obj = $(this)[0];
                    var cur_item = $('#'+obj.$input["0"].id)

                    if (!query.length) return callback();
                    $.ajax({
                        url: '{!! route('api.suggest') !!}',
                        type: 'GET',
                        dataType: 'json',
                        data: {
                            q: query,
                            model: cur_item.data('model'),
                            value: cur_item.data('value'),
                            caption: cur_item.data('caption'),
                            searchFields: cur_item.data('fields'),
                            accessor: cur_item.data('accessor'),
                            where: cur_item.data('where')
                        },
                        error: function() {
                            callback();
                        },
                        success: function(res) {

                            callback(res);
                        }
                    });
                }
            });


        });
	</script>
@endsection
