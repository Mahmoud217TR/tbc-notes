<?php

namespace App\Models;

use App\Enums\ImageConversion;
use App\Models\Traits\BelongsToUser;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\MorphMany;
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

    public function associateImage(string $image_path): void {
        $this->addMedia($image_path)
            ->toMediaCollection(self::MAIN_IMAGE);
    }

    public function associateImagePreservingOriginal(string $image_path): void {
        $this->addMedia($image_path)
            ->preservingOriginal()
            ->toMediaCollection(self::MAIN_IMAGE);
    }

    public function mainImage(): MorphMany {
        return $this->media()->where('collection_name', self::MAIN_IMAGE);
    }

    public function getImageAttribute(): Media{
        return $this->mainImage()->first();
    }

    public function notes(): HasMany {
        return $this->hasMany(Note::class);
    }

    public function scopeWithKeyword(Builder $query, $keyword){
        $query->whereRaw("LOWER(name) like LOWER('%".$keyword."%')");
    }

}
