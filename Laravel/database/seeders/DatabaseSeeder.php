<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use App\Models\Category;
use App\Models\Note;
use App\Models\User;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        User::factory(5)
            ->create()
            ->each(function($user){
                Category::factory(3)
                    ->forUser($user)
                    ->create()
                    ->each(function($category) use ($user){
                        Note::factory(2)
                            ->forCategory($category)
                            ->forUser($user)
                            ->create();
                    });
                    
                Note::factory(3)
                    ->uncategorized()
                    ->forUser($user)
                    ->create();
            });
    }
}
