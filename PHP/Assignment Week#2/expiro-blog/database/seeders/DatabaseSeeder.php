<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\Post;
use App\Models\User;
use App\Models\Category;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);

        User::create([
            'name' => 'Arief Aryudi Syidik',
            'username' => 'ariefaryudisyidik',
            'email' => 'ariefaryudisyidik@gmail.com',
            'password' => bcrypt('password')
        ]);

        // User::create([
        //     'name' => 'Muhammad Imam',
        //     'email' => 'muhammadimam@gmail.com',
        //     'password' => bcrypt('12345')
        // ]);

        User::factory(3)->create();

        Category::create([
            'name' => 'Web Programming',
            'slug' => 'web-programming'
        ]);

        Category::create([
            'name' => 'Web Design',
            'slug' => 'web-design'
        ]);

        Category::create([
            'name' => 'Personal',
            'slug' => 'personal'
        ]);

        Post::factory(20)->create();

        //     Post::create([
        //         'title' => 'First Title',
        //         'slug' => 'first-title',
        //         'excerpt' => 'Lorem ipsum dolor sit amet consectetur adipisicing elit.',
        //         'body' => 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Cum aut consectetur aperiam inventore, dolorum possimus amet ut distinctio labore nam sed ex illum aspernatur eum iure minus quo assumenda praesentium.',
        //         'category_id' => 1,
        //         'user_id' => 1
        //     ]);

        //     Post::create([
        //         'title' => 'Second Title',
        //         'slug' => 'second-title',
        //         'excerpt' => 'Lorem ipsum dolor sit amet consectetur adipisicing elit.',
        //         'body' => 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Cum aut consectetur aperiam inventore, dolorum possimus amet ut distinctio labore nam sed ex illum aspernatur eum iure minus quo assumenda praesentium.',
        //         'category_id' => 1,
        //         'user_id' => 1
        //     ]);

        //     Post::create([
        //         'title' => 'Third Title',
        //         'slug' => 'third-title',
        //         'excerpt' => 'Lorem ipsum dolor sit amet consectetur adipisicing elit.',
        //         'body' => 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Cum aut consectetur aperiam inventore, dolorum possimus amet ut distinctio labore nam sed ex illum aspernatur eum iure minus quo assumenda praesentium.',
        //         'category_id' => 2,
        //         'user_id' => 1
        //     ]);

        //     Post::create([
        //         'title' => 'Fourth Title',
        //         'slug' => 'fourth-title',
        //         'excerpt' => 'Lorem ipsum dolor sit amet consectetur adipisicing elit.',
        //         'body' => 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Cum aut consectetur aperiam inventore, dolorum possimus amet ut distinctio labore nam sed ex illum aspernatur eum iure minus quo assumenda praesentium.',
        //         'category_id' => 2,
        //         'user_id' => 2
        //     ]);
    }
}
