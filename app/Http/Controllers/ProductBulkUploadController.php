<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use App\Category;
use App\SubCategory;
use App\SubSubCategory;
use App\Brand;
use App\User;
use Auth;
use App\ProductsImport;
use App\ProductsExport;
// نکته: الیاس سراسری `PDF` توسط پکیج niklasravnsborg/laravel-pdf (از طریق
// bootstrap/cache/packages.php) روی mPDF بازنویسی می‌شود و متد
// setOptions ندارد. بنابراین اینجا کلاس dompdf را صریح import می‌کنیم.
use Barryvdh\DomPDF\Facade as PDF;
use Excel;
use App\Http\Controllers\Concerns\BuildsPdfDocuments;
use App\Http\Controllers\Concerns\HandlesCsvDownload;

class ProductBulkUploadController extends Controller
{
    use BuildsPdfDocuments;
    use HandlesCsvDownload;

    public function index()
    {
        if (Auth::user()->user_type == 'seller') {
            return view('frontend.seller.product_bulk_upload.index');
        }
        elseif (Auth::user()->user_type == 'admin' || Auth::user()->user_type == 'staff') {
            return view('admin.bulk_upload.index');
        }
    }

    public function export(){
        return Excel::download(new ProductsExport, 'products.xlsx');
    }

    public function pdf_download_category()
    {
        $categories = Category::all();
        return $this->pdfDownload('downloads.category', compact('categories'), 'category.pdf');
    }

    public function pdf_download_sub_category()
    {
        $sub_categories = Subcategory::all();
        return $this->pdfDownload('downloads.sub_category', compact('sub_categories'), 'sub_category.pdf');
    }

    public function pdf_download_sub_sub_category()
    {
        $sub_sub_categories = SubSubCategory::all();
        return $this->pdfDownload('downloads.sub_sub_category', compact('sub_sub_categories'), 'sub_sub_category.pdf');
    }

    public function pdf_download_brand()
    {
        $brands = Brand::all();
        return $this->pdfDownload('downloads.brand', compact('brands'), 'brands.pdf');
    }

    public function pdf_download_seller()
    {
        $users = User::where('user_type','seller')->get();
        return $this->pdfDownload('downloads.user', compact('users'), 'user.pdf');
    }

    public function bulk_upload(Request $request)
    {
        if($request->hasFile('bulk_file')){
            try {
                Excel::import(new ProductsImport, request()->file('bulk_file'));
            } catch (\Illuminate\Validation\ValidationException $e) {
                // خطای اعتبارسنجی عمداً به لاراول واگذار می‌شود تا با
                // پیام‌های فارسیِ خودِ واردکننده به کاربر نمایش داده شود.
                throw $e;
            } catch (\Throwable $e) {
                // پیش از این هیچ مدیریت خطایی وجود نداشت و هر شکستی به
                // کد ۵۰۰ خام تبدیل می‌شد و کاربر هیچ توضیحی نمی‌دید.
                \Log::error('bulk_product_upload: ' . $e->getMessage());
                flash(__('بارگذاری فایل ناموفق بود: ') . $e->getMessage())->error();
                return back();
            }
        }
        // پیام پیشین «Products exported successfully» بود که نادرست است:
        // این نقطهٔ کد «ورود» محصول است، نه «خروج».
        flash(__('محصولات با موفقیت وارد شدند.'))->success();
        return back();
    }


    /**
     * دانلود فایل الگوی CSV برای بارگذاری گروهی محصولات.
     *
     * [رفع باگ — Stage 2]
     * روت `GET /product-csv-download/{type}` (نام: product_csv.download)
     * به متد `import_product` اشاره می‌کرد اما این متد وجود نداشت و
     * کاربر با خطای 500 مواجه می‌شد.
     *
     * نکته امنیتی:
     *   پارامتر `type` از یک فهرست سفید (allowlist) تأیید می‌شود، نه با
     *   ساختن مستقیم مسیر فایل از ورودی کاربر. بنابراین امکان Path
     *   Traversal یا دسترسی به فایل دلخواه وجود ندارد.
     *
     * @param  string $type نوع الگو
     * @return \Symfony\Component\HttpFoundation\StreamedResponse|\Illuminate\Http\RedirectResponse
     */
    public function import_product($type)
    {
        // فهرست سفید انواع مجاز — هر مقدار دیگری رد می‌شود
        $allowed = ['category', 'subcategory', 'subsubcategory', 'brand', 'seller'];

        if (!in_array($type, $allowed, true)) {
            flash(__('نوع الگوی درخواستی معتبر نیست.'))->error();
            return redirect()->back();
        }

        $columns = $this->csvTemplateColumns();
        $rows    = $this->csvTemplateRows($type);

        return $this->streamCsv('product_template_' . $type . '.csv', $columns, $rows);
    }

    /**
     * دانلود فایل الگوی CSV برای محصولات یک فروشنده مشخص.
     *
     * [رفع باگ — Stage 2]
     * روت `GET /vendor-product-csv-download/{id}` به متد
     * `import_vendor_product` اشاره می‌کرد که وجود نداشت.
     *
     * @param  int $id شناسه فروشنده
     * @return \Symfony\Component\HttpFoundation\StreamedResponse
     */
    public function import_vendor_product($id)
    {
        $seller = User::findOrFail($id);

        $rows = $this->csvTemplateRows('seller');

        // درج نام فروشنده تنها در سطر نمونه
        if (!empty($rows) && isset($rows[0][0])) {
            $rows[0][0] = $seller->name;
        }

        return $this->streamCsv('vendor_product_template_' . (int) $seller->id . '.csv',
            $this->csvTemplateColumns(), $rows);
    }

    /**
     * سرستون‌های استاندارد فایل CSV محصولات.
     *
     * @return array
     */
    protected function csvTemplateColumns()
    {
        // ── رفع باگ B-2: هم‌خوانی الگو با واردکننده ──────────────────
        // پیش از این، این متد ستون‌های «نام‌محور» تولید می‌کرد:
        //
        //     name, category, subcategory, subsubcategory, brand,
        //     unit, unit_price, purchase_price, current_stock, description
        //
        // اما واردکننده (`App\ProductsImport`) فقط ستون‌های شناسه‌محور
        // `category_id`، `subcategory_id`، `subsubcategory_id` و
        // `brand_id` را می‌خواند. نتیجه: هر کاربری که الگوی CSV تولیدی
        // خودِ پنل را دانلود و بارگذاری می‌کرد، با خطای
        // «Column 'category_id' cannot be null» و کد ۵۰۰ روبه‌رو می‌شد —
        // یعنی ابزار بارگذاری گروهی، فایل خودش را نمی‌توانست بخواند.
        // این باگ در آزمون واقعی مرحله ۴ تأیید شد.
        //
        // اکنون ستون‌ها دقیقاً همان چیزی هستند که واردکننده می‌خواند.
        // این با الگوی فایل نمونهٔ `public/download/product_bulk_demo.xlsx`
        // و با دستورالعمل صفحهٔ بارگذاری («شناسه‌ها باید عددی باشند»)
        // هم‌خوان است.
        return [
            'name',
            'category_id',
            'subcategory_id',
            'subsubcategory_id',
            'brand_id',
            'unit_price',
            'purchase_price',
            'unit',
            'current_stock',
            'meta_title',
            'meta_description',
        ];
    }

    /**
     * سطرهای نمونه فایل CSV بر اساس نوع الگو.
     *
     * @param  string $type
     * @return array
     */
    protected function csvTemplateRows($type)
    {
        // ── رفع باگ B-2 (ادامه) ──────────────────────────────────────
        // سطر نمونه باید با ساختار ستون‌ها هم‌خوان باشد. همچنین شناسه‌ها
        // به‌صورت **پویا از پایگاه دادهٔ همین نصب** خوانده می‌شوند تا
        // نمونه‌ای که کاربر می‌بیند واقعاً در فروشگاه او وجود داشته باشد
        // و همان فایل بدون تغییر قابل بارگذاری باشد.
        //
        // اگر فروشگاه هنوز دسته‌بندی نداشته باشد، مقدار صفر گذاشته
        // می‌شود و `ProductsImport` خطای اعتبارسنجی شفاف برمی‌گرداند.
        $category      = \App\Category::orderBy('id')->first();
        $subcategory   = $category ? \App\SubCategory::where('category_id', $category->id)->orderBy('id')->first() : null;
        $subsubcategory = $subcategory ? \App\SubSubCategory::where('sub_category_id', $subcategory->id)->orderBy('id')->first() : null;
        $brand         = \App\Brand::orderBy('id')->first();

        $sample = [
            'نام کالای نمونه',                                  // name
            $category ? $category->id : 0,                       // category_id
            $subcategory ? $subcategory->id : 0,                 // subcategory_id
            $subsubcategory ? $subsubcategory->id : 0,           // subsubcategory_id
            $brand ? $brand->id : 0,                             // brand_id
            '52000',                                             // unit_price
            '38000',                                             // purchase_price
            'عدد',                                               // unit
            '120',                                               // current_stock
            '',                                                  // meta_title
            '',                                                  // meta_description
        ];

        return [$sample];
    }
}


