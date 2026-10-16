<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateArticleContentTables extends Migration
{
    public function up()
    {
        if (!Schema::hasTable('article_categories')) {
            Schema::create('article_categories', function (Blueprint $table) {
                $table->increments('id');
                $table->string('name', 191);
                $table->string('slug', 191)->unique();
                $table->string('description', 500)->nullable();
                $table->string('image', 191)->nullable();
                $table->unsignedInteger('parent_id')->nullable()->index();
                $table->unsignedInteger('sort_order')->default(0);
                $table->boolean('is_active')->default(true)->index();
                $table->timestamps();
            });
        }

        if (!Schema::hasTable('articles')) {
            Schema::create('articles', function (Blueprint $table) {
                $table->increments('id');
                $table->string('title', 191);
                $table->string('slug', 191)->unique();
                $table->string('excerpt', 500)->nullable();
                $table->longText('content')->nullable();
                $table->string('featured_image', 191)->nullable();
                $table->string('featured_image_alt', 191)->nullable();
                $table->unsignedInteger('category_id')->nullable()->index();
                $table->unsignedInteger('user_id')->nullable()->index();
                $table->string('author_name', 191)->nullable();
                $table->text('keywords')->nullable();
                $table->string('meta_title', 191)->nullable();
                $table->string('meta_description', 500)->nullable();
                $table->string('canonical_url', 500)->nullable();
                $table->string('status', 30)->default('draft')->index();
                $table->boolean('is_featured')->default(false)->index();
                $table->unsignedBigInteger('views_count')->default(0);
                $table->unsignedInteger('sort_order')->default(0);
                $table->unsignedInteger('submitted_by')->nullable();
                $table->timestamp('submitted_at')->nullable();
                $table->unsignedInteger('published_by')->nullable();
                $table->timestamp('published_at')->nullable()->index();
                $table->timestamps();
                $table->softDeletes();

                $table->foreign('category_id')
                    ->references('id')
                    ->on('article_categories')
                    ->onDelete('set null')
                    ->onUpdate('cascade');
            });
        }

        if (!Schema::hasTable('article_images')) {
            Schema::create('article_images', function (Blueprint $table) {
                $table->increments('id');
                $table->unsignedInteger('article_id')->index();
                $table->string('path', 191);
                $table->string('original_name', 191)->nullable();
                $table->string('alt', 191)->nullable();
                $table->string('caption', 500)->nullable();
                $table->unsignedInteger('file_size')->nullable();
                $table->string('mime_type', 100)->nullable();
                $table->unsignedInteger('sort_order')->default(0);
                $table->timestamps();

                $table->foreign('article_id')
                    ->references('id')
                    ->on('articles')
                    ->onDelete('cascade')
                    ->onUpdate('cascade');
            });
        }
    }

    public function down()
    {
        // Keep article content intact when migrations are rolled back.
    }
}
