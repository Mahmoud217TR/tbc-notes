<?php

namespace App\Models;

use App\Enums\ImageConversion;
use App\Models\Traits\BelongsToUser;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Image\Manipulations;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class Note extends Model implements HasMedia
{
    use HasFactory, BelongsToUser, InteractsWithMedia;

    protected $fillable = [
        'title',
        'content',
        'category_id',
        'user_id',
    ];

    public function category(){
        return $this->belongsTo(Category::class);
    }

    public function scopeCategorized(Builder $query){
        $query->whereHas('category');
    }

    public function scopeUncategorized(Builder $query){
        $query->whereDoesntHave('category');
    }


}
