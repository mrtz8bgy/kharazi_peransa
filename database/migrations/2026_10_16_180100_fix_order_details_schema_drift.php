<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

/**
 * رفع ناسازگاری Schema و کد — بخش دوم
 * =====================================
 *
 * این مهاجرت مکمل `2026_10_16_180000_fix_orders_schema_drift` است و
 * دو ستون باقی‌مانده را اضافه می‌کند که کد برنامه به آن‌ها نیاز دارد:
 *
 * ── ۱) orders.payment_details ──────────────────────────────────────
 *
 *   محل استفاده:
 *     CheckoutController@checkout_done   خط ۹۱ → $order->payment_details = $payment;
 *     ZarinpalController                 خط ۴۳ → $order->payment_details = $result["Authority"];
 *
 *   بدون این ستون، هر بار که پرداخت تکمیل شود (تأیید تراکنش زرین‌پال
 *   یا تسویهٔ کیف پول) برنامه با خطای SQL شکست می‌خورد.
 *
 *   نکته: خود مدل `App\Models\Order` در بلوک docblock خط ۱۷ این خصیصه
 *   را مستند کرده است:
 *
 *       @property string|null $payment_details
 *
 *   یعنی انتظار مدل و واقعیت جدول با هم نمی‌خواندند.
 *
 * ── ۲) order_details.product_referral_code ─────────────────────────
 *
 *   محل استفاده:
 *     OrderController@store خط ۲۸۰ → $order_detail->product_referral_code = ...
 *
 *   این ستون کد معرف محصول را نگه می‌دارد (سیستم بازاریابی معرف).
 *   بدون آن، ذخیرهٔ هر قلم سفارش با خطای SQL شکست می‌خورد — دقیقاً
 *   همان خطایی که در آزمون واقعی ثبت سفارش مشاهده شد:
 *
 *       SQLSTATE[42S22]: Column not found: 1054 Unknown column
 *       'product_referral_code' in 'INSERT INTO'
 *
 * ── دو خصیصه‌ای که عمداً اضافه نشدند ───────────────────────────────
 *
 *   `assigned_to` و `final_cost` روی مدل Order تنظیم می‌شوند، اما
 *   بررسی نشان داد هر دو متعلق به جدول `repair_orders` (ماژول سفارش
 *   تعمیر) هستند، نه جدول `orders`:
 *
 *       RepairOrderController    خط ۲۶۹ و ۳۰۹
 *       RepairOrderPolicy        خط ۳۲
 *
 *   جدول `repair_orders` این دو ستون را از قبل دارد. پس در جدول
 *   `orders` هیچ اقدامی لازم نیست.
 *
 * ── ایمنی ──────────────────────────────────────────────────────────
 *
 * • کاملاً افزایشی، بدون حذف یا تغییر نوع ستون.
 * • با hasColumn محافظت شده (اجرای تکرارپذیر).
 * • هر دو ستون nullable هستند، پس روی ردیف‌های موجود اثری ندارند.
 */
class FixOrderDetailsSchemaDrift extends Migration
{
    public function up()
    {
        // ── ۱) جزئیات پرداخت سفارش
        if (!Schema::hasColumn('orders', 'payment_details')) {
            Schema::table('orders', function (Blueprint $table) {
                $table->text('payment_details')->nullable()->after('payment_type');
            });
        }

        // ── ۲) کد معرف محصول در اقلام سفارش
        if (!Schema::hasColumn('order_details', 'product_referral_code')) {
            Schema::table('order_details', function (Blueprint $table) {
                $table->string('product_referral_code', 255)->nullable()->after('shipping_type');
            });
        }
    }

    /**
     * بازگشت — عمداً بدون عملیات.
     * حذف ستون ممکن است دادهٔ سفارش‌های واقعی را از بین ببرد.
     */
    public function down()
    {
        // بدون عملیات
    }
}
