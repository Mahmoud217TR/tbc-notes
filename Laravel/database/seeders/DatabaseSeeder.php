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
        User::factory(2)
            ->create()
            ->each(function($user){
                Category::factory(3)
                    ->forUser($user)
                    ->create()
                    ->each(function($category) use ($user){

                        $category->associateImagePreservingOriginal(samplePath(fake()->numberBetween(1, 10)));

                        Note::factory(2)
                            ->forCategory($category)
                            ->forUser($user)
                            ->create()
                            ->each(function($note){
                                $note->associateImagesPreservingOriginals([
                                    samplePath(fake()->numberBetween(1, 10)),
                                    samplePath(fake()->numberBetween(1, 10)),
                                    samplePath(fake()->numberBetween(1, 10)),
                                ]);
                            });
                        
                        
                    });
                    
                Note::factory(3)
                    ->uncategorized()
                    ->forUser($user)
                    ->create()
                    ->each(function($note){
                        $note->associateImagesPreservingOriginals([
                            samplePath(fake()->numberBetween(1, 10)),
                            samplePath(fake()->numberBetween(1, 10)),
                            samplePath(fake()->numberBetween(1, 10)),
                        ]);
                    });
            });
    }
}
