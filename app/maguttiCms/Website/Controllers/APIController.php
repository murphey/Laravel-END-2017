<?php

namespace App\MaguttiCms\Website\Controllers;

use App\Http\Controllers\Controller;
use App\MaguttiCms\Website\Requests\AjaxFormRequest;
use Input;
use Validator;
use App\Newsletter;

class APIController extends Controller
{

    protected $articleRepo;


    /**
     * @return mixed
     */


    public function subscribeNewsletter( AjaxFormRequest $request  ) {

        $validator = Validator::make($request->all(), $request->rules());

        if ($validator->fails()) {
            return response()->json(array(
                'success' => false,
                'errors' => $validator->getMessageBag()->toArray()
            ));

        }else {

          // INSERT RECORD IN DATABASE
          $newsletter = new Newsletter;
          $newsletter->email = sanitizeParameter( $request->email );
          $saved = $newsletter->save();

          return response()->json(array(
            'status'=>'ok',
            'msg'   =>  trans('website.mail_message.subscribe_newsletter_feedback')
          ));

        }

    }

}
