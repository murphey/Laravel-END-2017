<?php namespace App\MaguttiCms\Tools;

 use App\Setting;
/**
 * Class Setting
 * @package App\MaguttiCms\Tools
 */
class SettingHelper {

	/**
	 * @param $key
	 * @return mixed
     */
	static public function getOption($key)
	{

		$settingObj = Setting::where('Key',$key)->first();
		return $settingObj->value;
	}

}	