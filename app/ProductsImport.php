<?php

namespace App;

use App\Product;
use App\User;
use App\Category;
use App\SubCategory;
use App\SubSubCategory;
use App\Brand;
use Illuminate\Validation\ValidationException;
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

    /**
     * تبدیل نام‌های دسته/زیردسته/زیرزیردسته/برند به شناسه.
     * (رفع باگ B-2)
     *
     * ── چرا این متد لازم شد؟ ─────────────────────────────────────────
     * الگوی CSV تولیدی پنل (`ProductBulkUploadController@csvTemplateColumns`)
     * ستون‌های نام‌محور داشت: `category`, `subcategory`, `subsubcategory`,
     * `brand` — در حالی که واردکننده تنها ستون‌های `*_id` را می‌خواند.
     * بنابراین الگوی خودِ برنامه قابل بارگذاری نبود و خطای
     * «Column 'category_id' cannot be null» می‌داد.
     *
     * الگوی CSV اکنون به فرم شناسه‌محور اصلاح شد، اما این متد برای
     * این موارد نگه داشته می‌شود:
     *   ۱. فایل‌های قدیمی که کاربران پیش‌تر با ستون نام ساخته‌اند.
     *   ۲. فایلی که کاربر دستی آماده کرده و نام‌ها را نوشته است
     *      (خواناتر و کم‌خطاتر از واردکردن شناسهٔ عددی).
     *
     * در حالت نام‌محور، جست‌وجو زنجیره‌ای است تا نام‌های تکراری در
     * شاخه‌های مختلف اشتباه نگاشت نشوند: زیردسته محدود به دستهٔ
     * به‌دست‌آمده و زیرزیردسته محدود به همان زیردسته جست‌وجو می‌شود.
     *
     * @param  array $row
     * @return array [category_id, subcategory_id, subsubcategory_id, brand_id, errors[]]
     */
    private function resolveRelations(array $row)
    {
        $errors = [];

        $num = function ($value) {
            return (is_numeric($value) && (int) $value > 0) ? (int) $value : null;
        };

        $clean = function ($value) {
            return trim((string) $value);
        };

        // ── دسته ─────────────────────────────────────────────────────
        $categoryId = $num($row['category_id'] ?? null);
        if ($categoryId === null && $clean($row['category'] ?? '') !== '') {
            $name = $clean($row['category']);
            $found = Category::where('name', $name)->first();
            if ($found) {
                $categoryId = $found->id;
            } else {
                $errors[] = "دستهٔ «{$name}» در فروشگاه یافت نشد.";
            }
        }

        // ── زیردسته (محدود به دستهٔ بالا) ────────────────────────────
        $subcategoryId = $num($row['subcategory_id'] ?? null);
        if ($subcategoryId === null && $clean($row['subcategory'] ?? '') !== '') {
            $name = $clean($row['subcategory']);
            $query = SubCategory::where('name', $name);
            if ($categoryId !== null) {
                $query->where('category_id', $categoryId);
            }
            $found = $query->first();
            if ($found) {
                $subcategoryId = $found->id;
            } else {
                $errors[] = "زیردستهٔ «{$name}» در دستهٔ انتخاب‌شده یافت نشد.";
            }
        }

        // ── زیرزیردسته (محدود به زیردستهٔ بالا) ──────────────────────
        $subsubcategoryId = $num($row['subsubcategory_id'] ?? null);
        if ($subsubcategoryId === null && $clean($row['subsubcategory'] ?? '') !== '') {
            $name = $clean($row['subsubcategory']);
            $query = SubSubCategory::where('name', $name);
            if ($subcategoryId !== null) {
                $query->where('sub_category_id', $subcategoryId);
            }
            $found = $query->first();
            if ($found) {
                $subsubcategoryId = $found->id;
            } else {
                $errors[] = "زیرزیردستهٔ «{$name}» در زیردستهٔ انتخاب‌شده یافت نشد.";
            }
        }

        // ── برند ─────────────────────────────────────────────────────
        $brandId = $num($row['brand_id'] ?? null);
        if ($brandId === null && $clean($row['brand'] ?? '') !== '') {
            $name = $clean($row['brand']);
            $found = Brand::where('name', $name)->first();
            if ($found) {
                $brandId = $found->id;
            } else {
                $errors[] = "برند «{$name}» در فروشگاه یافت نشد.";
            }
        }

        return [$categoryId, $subcategoryId, $subsubcategoryId, $brandId, $errors];
    }

    public function model(array $row)
    {
        // رفع باگ B-2: نام‌ها در صورت نبودِ ستون شناسه، به شناسه تبدیل می‌شوند
        list($categoryId, $subcategoryId, $subsubcategoryId, $brandId, $errors)
            = $this->resolveRelations($row);

        if (!empty($errors)) {
            // پیش از این، نبودِ شناسه به خطای پایگاه داده
            // («Column 'category_id' cannot be null») و کد ۵۰۰ تبدیل
            // می‌شد و کاربر هیچ توضیحی نمی‌دید. اکنون پیام شفاف فارسی
            // به کاربر نشان داده می‌شود.
            throw ValidationException::withMessages(['bulk_file' => $errors]);
        }

        return new Product([
           'name'     => $row['name'] ?? null,
           'added_by'    => Auth::user()->user_type == 'seller' ? 'seller' : 'admin',
           'user_id'    => Auth::user()->user_type == 'seller' ? Auth::user()->id : User::where('user_type', 'admin')->first()->id,
           'category_id'    => $categoryId,
           'subcategory_id'    => $subcategoryId,
           'subsubcategory_id'    => $subsubcategoryId,
           'brand_id'    => $brandId,
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
