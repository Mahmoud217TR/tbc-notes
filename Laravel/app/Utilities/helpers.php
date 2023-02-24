<?php

use App\Enums\ImageConversion;
use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

if (!function_exists('media')) {
	function media(Media $media, ImageConversion $conversion = null){ 
		if(!is_null($conversion)){
			return $media->getUrl($conversion->value);
		}
		return $media->getUrl();
	} 
}

if (!function_exists('conversions')) {
	function conversions(Media $media){
		$conversions = [];
		foreach(ImageConversion::getInstances() as $conversion){
			$conversions[$conversion->value] = media($media, $conversion);
		}
		return $conversions;
	} 
}

if (!function_exists('user')) {
	function user(){
		return request()->user();
	} 
}

if (!function_exists('modelId')) {
	function modelId(Model|int $model){
		if($model instanceof Model){
			return $model->id;
		}else{
			return $model;
		}
	} 
}

if (!function_exists('samplePath')) {
	function samplePath(int $number): string{
		return public_path('images\\samples\\'.$number.'.png');
	} 
}