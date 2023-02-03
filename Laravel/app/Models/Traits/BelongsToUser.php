<?php

namespace App\Models\Traits;

use App\Models\User;

trait BelongsToUser {

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function doesBelongTo(User $user): bool {
        return $this->user_id == $user->id;
    }
}