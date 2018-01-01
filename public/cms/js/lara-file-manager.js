$( function()
{
    var $fileManagerModal    = $( '#file-manager-modal' ).modal( { show : false } )
      , $queue               = $( '#upload-drop-queue' )
      , isQueueVisible       = false
      , isOver               = false
      , interval             = null
        , isModalVisible       = false
        , $mediaLibraryList    = $( '#tab-images' )
        , $sidebar             = $( '#modal-sidebar' )
        , $medialibraryLink    = $( '#media-library-link' )
        , $itemsList           = $( '#modalGallery' )
        , $footer              = $( '.file-manager-modal-footer' )
        , $fileUpload          = $( '#file_upload_modal' )


    $( '.image-select' ).on( 'click', function( e )
    {
        e && e.preventDefault();
        $fileManagerModal.modal( 'show' );
        $destinationList  = $( this ).parent().next();
        selectedFieldName = $( this ).data( 'name' );
        isMultipleSelect  = $( this ).data( 'multiple' );
        activeElements    = $( this ).attr( 'data-value' );
        $triggeredElement = $( this );
        $footer.show()
        $("#tab-images-gallery").load( urlAjaxHandlerCms + 'updateHtml/media/' + _CURMODEL );





    } );


    $fileUpload.uploadifive({
        'auto'             : true,
        //'checkScript'      : 'check-exists.php',
        'queueID'          : 'queue-modal',
        'uploadScript'     : urlAjaxHandlerCms+'uploadifive',
        'onAddQueueItem' : function(file) {
            this.data('uploadifive').settings.formData = {
                'timestamp' : '1451682058',
                'token'     : '4b9fe8f26d865150e4b26b2a839d4f2b',
                'Id'        :  $('#itemId').val(),
                'myImgType' :  $('#myImgType').val(),
                'model'     :  _CURMODEL,
                "_token" :  $('[name=_token]').val()
            };
        },
        'onUploadComplete' : function(file, data) {
            var responseObj = jQuery.parseJSON(data);
            var mediaType   =  responseObj.data;
            $('#modal-tabs a[href="#tab-images"]').tab('show');
            $("#tab-images-gallery").load( urlAjaxHandlerCms + 'updateHtml/media/' + _CURMODEL );
        }
    });


    $( document ).on( 'dragover', function( e )
    {
        e.stopPropagation();
        e.preventDefault();

        if( !isQueueVisible && isModalVisible )
        {
            isQueueVisible = true;
            $queue.stop().fadeIn( 60 );
        }
    } );

    $queue.on( 'dragover', function( e )
    {
        e.preventDefault();

        clearInterval( interval );

        interval = setInterval( function()
        {
            isOver = false;
            clearInterval( interval );

            if( isQueueVisible )
            {
                isQueueVisible = false;
                $queue.stop().fadeOut( 20 );
            }
        }, 100 );

        if( !isOver )
        {
            isOver = true;
        }
    } );

} );
