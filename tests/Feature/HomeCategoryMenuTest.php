<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\DatabaseTransactions;
use Illuminate\Support\Facades\DB;
use Tests\TestCase;

class HomeCategoryMenuTest extends TestCase
{
    use DatabaseTransactions;

    public function test_homepage_renders_category_and_subcategory_in_the_mega_menu()
    {
        $suffix = uniqid();
        $now = now();

        $categoryId = DB::table('categories')->insertGetId([
            'name' => 'دسته آزمایشی ' . $suffix,
            'top' => 1,
            'slug' => 'test-category-' . $suffix,
            'created_at' => $now,
            'updated_at' => $now,
        ]);

        DB::table('sub_categories')->insert([
            'name' => 'زیردسته آزمایشی ' . $suffix,
            'category_id' => $categoryId,
            'slug' => 'test-subcategory-' . $suffix,
            'created_at' => $now,
            'updated_at' => $now,
        ]);

        $response = $this->get('/');

        $response->assertStatus(200);
        $response->assertSee('lux-mega-section');
        $response->assertSee('دسته آزمایشی ' . $suffix);
        $response->assertSee('زیردسته آزمایشی ' . $suffix);
        $response->assertDontSee('mega-menu-section');
    }

    public function test_category_index_uses_the_storefront_theme_without_the_legacy_navy_background()
    {
        $response = $this->get('/categories');

        $response->assertStatus(200);
        $response->assertSee('kharazi-reference.css');
        $response->assertSee('all-category-wrap py-5');
        $response->assertDontSee('u-background-1a1a4a');
    }
}
