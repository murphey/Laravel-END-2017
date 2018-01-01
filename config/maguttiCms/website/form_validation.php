<?php
return [

		'contacts' => [
			'name'	  => 'required',
			'surname' => 'required',
            'subject' => 'required',
			'message' => 'required',
			'privacy' => 'required',
			'email'   => 'required|Between:3,64|Email',
		],

		'newsletter' => [
			'email'   => 'required|Between:3,64|Email|unique:newsletters',
		]

];
