<?php

namespace App;

use App\Product;
use App\User;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithValidation;
use Auth;

class ProductsImport implements ToModel, WithHeadingRow, WithValidation
{
    /**
     * ساخت اسلاگ یکتا برای محصول.
     *
     * ── چرا این متد اضافه شد؟ (رفع باگ B-1) ─────────────────────────
     *
     * پیش از این، خط ۳۵ مستقیماً `$row['slug']` را می‌خواند. اما الگوی
     * رسمی بارگذاری گروهی که خود برنامه تولید می‌کند
     * (`App\ProductsExport::headings()`) هیچ ستون `slug` ندارد.
     * فهرست ستون‌های آن الگو:
     *
     *     name, added_by, user_id, category_id, subcategory_id,
     *     subsubcategory_id, brand_id, video_provider, video_link,
     *     unit_price, purchase_price, unit, current_stock,
     *     meta_title, meta_description
     *
     * نتیجه: هر بارگذاری گروهی با الگوی رسمی، همیشه با خطای
     * «Undefined index: slug» و کد ۵۰۰ شکست می‌خورد. این باگ در آزمون
     * واقعی مرحله ۴ تأیید شد.
     *
     * ── رفتار جدید ───────────────────────────────────────────────────
     *  ۱. اگر ستون `slug` در فایل بود، از همان استفاده می‌شود (سازگاری
     *     با فایل‌هایی که کاربر خودش ستون slug اضافه کرده).
     *  ۲. اگر نبود، از ستون `name` ساخته می‌شود.
     *  ۳. چون نام محصولات فارسی است و حروف فارسی در اسلاگ لاتین
     *     مجاز نیستند، حاصل ممکن است خالی شود؛ در آن صورت یک اسلاگ
     *     پایهٔ `product` گذاشته می‌شود.
     *  ۴. در پایان یک پسوند تصادفی پنج‌حرفی اضافه می‌شود تا اسلاگ
     *     یکتا بماند (ستون slug از نوع mediumtext است و هنوز ایندکس
     *     یکتا ندارد، بنابراین یکتایی در سطح برنامه تأمین می‌شود).
     *
     * @param  array $row یک ردیف از فایل بارگذاری‌شده
     * @return string
     */
    private function makeSlug(array $row)
    {
        $base = $row['slug'] ?? ($row['name'] ?? '');
        $slug = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '-', (string) $base));
        $slug = trim($slug, '-');

        if ($slug === '') {
            $slug = 'product';
        }

        return $slug . '-' . str_random(5);
    }

    public function model(array $row)
    {
        return new Product([
           'name'     => $row['name'] ?? null,
           'added_by'    => Auth::user()->user_type == 'seller' ? 'seller' : 'admin',
           'user_id'    => Auth::user()->user_type == 'seller' ? Auth::user()->id : User::where('user_type', 'admin')->first()->id,
           'category_id'    => $row['category_id'] ?? null,
           'subcategory_id'    => $row['subcategory_id'] ?? null,
           'subsubcategory_id'    => $row['subsubcategory_id'] ?? null,
           'brand_id'    => $row['brand_id'] ?? null,
           // این دو ستون در الگوی رسمی اختیاری‌اند و ممکن است خالی باشند
           'video_provider'    => $row['video_provider'] ?? null,
           'video_link'    => $row['video_link'] ?? null,
           'unit_price'    => $row['unit_price'] ?? 0,
           'purchase_price'    => $row['purchase_price'] ?? 0,
           'unit'    => $row['unit'] ?? null,
           'current_stock' => $row['current_stock'] ?? 0,
           'meta_title' => $row['meta_title'] ?? null,
           'meta_description' => $row['meta_description'] ?? null,
           'colors' => json_encode(array()),
           'choice_options' => json_encode(array()),
           'variations' => json_encode(array()),
           'slug' => $this->makeSlug($row),
        ]);
    }

    public function rules(): array
    {
        return [
             // Can also use callback validation rules
             'unit_price' => function($attribute, $value, $onFailure) {
                  if (!is_numeric($value)) {
                       $onFailure('Unit price is not numeric');
                  }
              }
        ];
    }
}
