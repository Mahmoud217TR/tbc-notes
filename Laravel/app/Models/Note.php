<?php

namespace App\Models;

use App\Enums\ImageConversion;
use App\Models\Traits\BelongsToUser;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\MorphMany;
use Spatie\Image\Manipulations;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\MediaLibrary\MediaCollections\Models\Collections\MediaCollection;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class Note extends Model implements HasMedia
{
    use HasFactory, BelongsToUser, InteractsWithMedia;

    protected $fillable = [
        'title',
        'content',
        'category_id',
        'user_id',
        'done',
    ];

    public const IMAGES = 'images';

    public function registerMediaCollections(): void
    {
        $this->addMediaCollection(self::IMAGES)
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
            ->toMediaCollection(self::IMAGES);
    }

    public function associateImages(array $images): void {
        foreach($images as $image){
            $this->associateImage($image);
        };
    }

    public function associateImagePreservingOriginal(string $image_path): void {
        $this->addMedia($image_path)
            ->preservingOriginal()
            ->toMediaCollection(self::IMAGES);
    }

    public function associateImagesPreservingOriginals(array $images): void {
        foreach($images as $image){
            $this->associateImagePreservingOriginal($image);
        };
    }

    public function images(): MorphMany {
        return $this->media()->where('collection_name', self::IMAGES);
    }

    public function getImagesAttribute(): MediaCollection {
        return $this->images()->get();
    }

    public function category(): BelongsTo {
        return $this->belongsTo(Category::class);
    }

    public function scopeCategorized(Builder $query){
        $query->whereHas('category');
    }

    public function scopeUncategorized(Builder $query){
        $query->whereDoesntHave('category');
    }

    public function scopeInCategory(Builder $query, $category){
        $query->where('category_id', modelId($category));
    }

    public function scopeWhereDoneIs(Builder $query, bool $done){
        $query->where('done', $done);
    }

    public function scopeWithKeyword(Builder $query, $keyword){
        $query->whereRaw("LOWER(title) like LOWER('%".$keyword."%')")
            ->orWhereRaw("LOWER(content) like LOWER('%".$keyword."%')");
    }

}
