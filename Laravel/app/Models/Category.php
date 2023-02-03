<?php

namespace App\Models;

use App\Enums\ImageConversion;
use App\Models\Traits\BelongsToUser;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Image\Manipulations;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class Category extends Model implements HasMedia
{
    use HasFactory, BelongsToUser, InteractsWithMedia;

    protected $fillable = [
        'name',
        'user_id',
    ];

    public const MAIN_IMAGE = 'main_image';

    public function registerMediaCollections(): void
    {
        $this->addMediaCollection(self::MAIN_IMAGE)
            ->singleFile()
            ->registerMediaConversions(function (Media $media) {
                $this->addMediaConversion(ImageConversion::Small)
                    ->fit(Manipulations::FIT_CONTAIN, ImageConversion::Small()->width(), ImageConversion::Small()->height())
                    ->keepOriginalImageFormat();
                $this->addMediaConversion(ImageConversion::Medium)
                    ->fit(Manipulations::FIT_CONTAIN, ImageConversion::Medium()->width(), ImageConversion::Medium()->height())
                    ->keepOriginalImageFormat();
                $this->addMediaConversion(ImageConversion::Large)
                    ->fit(Manipulations::FIT_CONTAIN, ImageConversion::Large()->width(), ImageConversion::Large()->height())
                    ->keepOriginalImageFormat();
                $this->addMediaConversion(ImageConversion::Default)
                    ->keepOriginalImageFormat()
                    ->nonQueued();
            });
    }

    public function associateImage($image_path){
        $this->addMedia($image_path)
            ->toMediaCollection(self::MAIN_IMAGE);
    }

    public function associateImagePreservingOriginal($image_path){
        $this->addMedia($image_path)
            ->preservingOriginal()
            ->toMediaCollection(self::MAIN_IMAGE);
    }

    public function mainImage(){
        return $this->media()->where('collection_name', self::MAIN_IMAGE);
    }

    public function getImageAttribute(){
        return $this->mainImage()->first();
    }

    public function notes(){
        return $this->hasMany(Note::class);
    }

}
