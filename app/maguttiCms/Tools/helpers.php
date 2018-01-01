<?php

use App\MaguttiCms\Tools\HtmlHelper;

function icon($icons, $classes = '', $forceicon = false, $echo = true) {
	return Htmlhelper::createFAIcon($icons, $classes, $forceicon, $echo);
}
