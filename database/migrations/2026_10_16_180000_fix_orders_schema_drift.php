<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

/**
 * رفع ناسازگاری Schema و کد در جدول `orders`
 * ============================================
 *
 * ── چرا این مهاجرت لازم شد؟ ────────────────────────────────────────
 *
 * هنگام آزمون واقعی ثبت سفارش، خطای زیر رخ داد:
 *
 *     SQLSTATE[42S22]: Column not found: 1054 Unknown column 'date'
 *     in 'INSERT INTO' (SQL: insert into `orders` (... `date` ...))
 *
 * بررسی نشان داد کد برنامه چهار خصیصه روی مدل Order تنظیم می‌کند که
 * ستون متناظرشان در جدول `orders` وجود ندارد:
 *
 *   خصیصه                │ محل استفاده                              │ اثر نبودن
 *   ─────────────────────┼──────────────────────────────────────────┼──────────────────────
 *   date                 │ OrderController@store خط ۲۱۴            │ ✖ ثبت سفارش کلاً می‌شکند
 *                        │ InvoiceController (فاکتور PDF)           │
 *                        │ PurchaseHistoryCollection (API)          │
 *                        │ order_details_seller (نمایش تاریخ)       │
 *   guest_id             │ OrderController@store خط ۲۰۳            │ ✖ خرید مهمان می‌شکند
 *                        │ admin/sales/index (نمایش مهمان)          │
 *   manual_payment       │ CheckoutController@checkout              │ ✖ پرداخت دستی می‌شکند
 *                        │ order_details_customer (نمایش)           │
 *   manual_payment_data  │ admin/sales/show (اطلاعات پرداخت دستی)   │ ✖ نمایش جزئیات می‌شکند
 *
 * ── چرا «افزودن ستون» و نه «حذف کد»؟ ──────────────────────────────
 *
 * خصیصهٔ `date` در چهار جای مختلف برنامه خوانده می‌شود و همه‌جا به‌عنوان
 * مهر زمانی یونیکس (عدد صحیح) در نظر گرفته شده است — نه تاریخ متنی.
 * مثال‌ها:
 *
 *     InvoiceController:      date('d-m-Y', $order->date)
 *     PurchaseHistoryCollection: Carbon::createFromTimestamp($data->date)
 *     OrderController:        $order->date = strtotime('now')
 *     order_details_seller:   date('Y-m-d', $order->date)
 *
 * اگر به‌جای افزودن ستون، خط کد را حذف می‌کردیم، هر چهار مصرف‌کنندهٔ
 * بالا با مقدار null کار می‌کردند و تاریخ فاکتور و تاریخچهٔ خرید
 * می‌شکست. بنابراین افزودن ستون کم‌ریسک‌ترین و درست‌ترین راه است.
 *
 * ── ایمنی این مهاجرت ──────────────────────────────────────────────
 *
 * • کاملاً افزایشی است؛ هیچ ستون یا جدولی حذف یا تغییر نوع نمی‌شود.
 * • همهٔ ستون‌های جدید nullable هستند یا مقدار پیش‌فرض دارند، پس
 *   روی ردیف‌های موجود اثری ندارند.
 * • با شرط hasColumn محافظت شده تا اگر به هر دلیلی ستون از قبل
 *   وجود داشته باشد، خطا ندهد (اجرای تکرارپذیر / idempotent).
 * • برای ردیف‌های موجود، ستون `date` از `created_at` مقدار می‌گیرد.
 */
class FixOrdersSchemaDrift extends Migration
{
    public function up()
    {
        Schema::table('orders', function (Blueprint $table) {

            // ── ۱) مهر زمانی ثبت سفارش (یونیکس) ─────────────────────
            // بدون این ستون، درج سفارش با خطای SQL شکست می‌خورد.
            if (!Schema::hasColumn('orders', 'date')) {
                $table->integer('date')->nullable()->after('code');
            }

            // ── ۲) شناسهٔ خرید مهمان ────────────────────────────────
            // وقتی کاربر وارد نشده باشد، OrderController یک شناسهٔ
            // تصادفی شش‌رقمی می‌سازد تا سفارش قابل پیگیری باشد.
            if (!Schema::hasColumn('orders', 'guest_id')) {
                $table->integer('guest_id')->nullable()->after('user_id');
            }

            // ── ۳) پرچم پرداخت دستی ─────────────────────────────────
            // در مسیر «کارت‌به‌کارت / پرداخت دستی» مقدار ۱ می‌گیرد و
            // ویوها بر اساس آن فرم ارسال رسید را نشان می‌دهند.
            if (!Schema::hasColumn('orders', 'manual_payment')) {
                $table->tinyInteger('manual_payment')->default(0)->after('payment_status');
            }

            // ── ۴) جزئیات پرداخت دستی (JSON) ────────────────────────
            if (!Schema::hasColumn('orders', 'manual_payment_data')) {
                $table->text('manual_payment_data')->nullable()->after('manual_payment');
            }
        });

        // ── پرکردن مقدار `date` برای ردیف‌های موجود ─────────────────
        // سفارش‌های قدیمی‌تر تاریخ یونیکس نداشتند؛ از created_at گرفته
        // می‌شود تا فاکتور و تاریخچهٔ خرید آن‌ها هم درست نمایش داده شود.
        if (Schema::hasColumn('orders', 'date')) {
            \DB::table('orders')
                ->whereNull('date')
                ->whereNotNull('created_at')
                ->update(['date' => \DB::raw('UNIX_TIMESTAMP(`created_at`)')]);
        }
    }

    /**
     * بازگشت (Rollback)
     * -----------------
     * این متد عمداً ستون‌ها را حذف نمی‌کند. دلیل: پس از اجرای این
     * مهاجرت، سفارش‌های واقعی ممکن است داده در این ستون‌ها داشته
     * باشند و حذف آن‌ها یعنی از دست رفتن داده. اگر واقعاً لازم شد
     * ستون‌ها برداشته شوند، باید ابتدا از داده‌ها پشتیبان گرفت و
     * سپس دستی اقدام کرد.
     */
    public function down()
    {
        // بدون عملیات — حذف ستون انجام نمی‌شود تا داده از دست نرود.
    }
}
