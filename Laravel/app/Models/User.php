<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;

use App\Enums\ImageConversion;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\MorphMany;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Image\Manipulations;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public const AVATAR = 'avatar';

    public function registerMediaCollections(): void
    {
        $this->addMediaCollection(self::AVATAR)
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

    public function associateAvatar(string $avatar_path): void {
        $this->addMedia($avatar_path)
            ->toMediaCollection(self::AVATAR);
    }

    public function associateAvatarPreservingOriginal(string $avatar_path): void {
        $this->addMedia($avatar_path)
            ->preservingOriginal()
            ->toMediaCollection(self::AVATAR);
    }

    public function avatarImage(): MorphMany {
        return $this->media()->where('collection_name', self::AVATAR);
    }

    public function getAvatarAttribute(): Media{
        return $this->avatarImage()->first();
    }

    public function categories(){
        return $this->hasMany(Category::class);
    }

    public function notes(){
        return $this->hasMany(Note::class);
    }
}
