<?php

namespace App\Models;

class Post {
    private static $blog_posts = [
        [
            "title" => "First Post Title",
            "slug" => "first-post",
            "author" => "Arief Aryudi Syidik",
            "body" => "Lorem ipsum dolor sit amet consectetur adipisicing elit. Impedit, quisquam nesciunt consequatur praesentium, delectus excepturi veniam placeat nam illum inventore, repudiandae sed aspernatur reprehenderit similique neque. Adipisci cum, provident natus distinctio similique dicta explicabo nemo voluptas ducimus commodi dignissimos ipsum mollitia, eligendi tempore minima ipsam fuga dolore eveniet, reprehenderit voluptatibus? Cum velit sit debitis veniam error nihil necessitatibus. Alias voluptatibus labore rerum odio repudiandae! Explicabo, repellendus officia molestias eius soluta nam, qui natus aliquid, facere nemo deleniti nostrum quo omnis!"
        ],
        [
            "title" => "Second Post Title",
            "slug" => "second-post",
            "author" => "Muhammad Imam",
            "body" => "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, doloremque! Deserunt aperiam est, facilis officia ab placeat, minima id reiciendis quidem animi accusantium modi, distinctio exercitationem ea quo eius atque saepe cupiditate minus incidunt qui optio repudiandae sunt fugiat! Voluptatum reprehenderit temporibus quia, earum doloremque molestias numquam voluptatem ea odio veniam sit eius doloribus libero sed quos. Exercitationem pariatur similique accusamus eius amet atque officiis explicabo. Voluptas eum maxime nobis minus autem facere eveniet alias dignissimos. Recusandae dignissimos doloribus maxime sequi eligendi sunt commodi voluptates soluta enim pariatur ea quis rem numquam, eos possimus labore? Ad laborum laudantium vel cupiditate."
        ]
    ];

    public static function all() {
        return collect(self::$blog_posts);
    }

    public static function find($slug) {
        $posts = static::all();
        return $posts->firstWhere('slug', $slug);
    }
}