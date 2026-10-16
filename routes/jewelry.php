<?php

/*
|===========================================================================
| مسیرهای ماژول شناسنامه‌دار کردن طلا و جواهرات  (غیرفعال)
|===========================================================================
|
| ── وضعیت این فایل ─────────────────────────────────────────────────────
|
| این فایل حاوی تمام مسیرهای ماژول قبلی «شناسنامه‌دار کردن طلا و جواهرات»
| است: شناسنامه و گواهی اصالت، مالکیت، انتقال مالکیت، سفارش تعمیر و
| گزارش سرقت/مفقودی — هم برای پنل مدیریت، هم پنل مشتری و هم صفحات عمومی.
|
| فروشگاه «خرازی پرنسا» به این ماژول نیازی ندارد؛ بنابراین این فایل از
| فایل `routes/web.php` جدا شد و **فقط زمانی بارگذاری می‌شود که کلید
| پیکربندی زیر مقدار true داشته باشد**:
|
|       config('drikana.modules.jewelry')
|
| مقدار پیش‌فرض این کلید در `config/drikana.php` برابر false است؛ پس در
| حالت عادی هیچ‌کدام از این مسیرها ثبت نمی‌شوند و هیچ صفحه‌ای از ماژول
| جواهرات در دسترس نخواهد بود.
|
| ── چرا جدا شد و حذف نشد؟ ──────────────────────────────────────────────
|
|   ۱. بازگشت‌پذیری: هیچ کد، جدول یا داده‌ای حذف نشده است.
|   ۲. رعایت بند ۶ دستور کار: ماژول قبلی «غیرفعال» می‌شود، نه «حذف».
|   ۳. جلوگیری از خطای RouteNotFound: تمام ارجاع‌های ظاهری
|      (منوی اصلی، فوتر، منوی موبایل، مگامنو و داشبورد مدیریت) از
|      صفحه‌های عمومی پاک‌سازی شده‌اند؛ پس هیچ‌جا `route('jewelry.*')`
|      صدا زده نمی‌شود.
|
| ── پیش‌نیاز جدول‌ها ────────────────────────────────────────────────────
|
| جدول‌های این ماژول در پایگاه داده **دست‌نخورده** باقی مانده‌اند:
|
|   jewelry_certificates, jewelry_owners, jewelry_transfers,
|   missing_reports, repair_orders, repair_status_histories,
|   repair_technicians, ownership_history
|
| ── نحوه فعال‌سازی مجدد ────────────────────────────────────────────────
|
|   ۱. در `.env` بنویسید:   KHARAZI_ENABLE_JEWELRY=true
|   ۲. اجرا کنید:           php artisan config:clear
|   ۳. برای بازگرداندن منوها و لینک‌های ظاهری، از شاخه پشتیبان
|      `backup/pre-kharazi-rebrand` کمک بگیرید.
|
| ── نکته امنیتی (حفظ‌شده از نسخه قبل) ──────────────────────────────────
|
| مسیرهای پنل مدیریت با «auth» + «permission:*» محافظت می‌شوند و سیاست
| Deny-by-Default دارند. مسیرهای پنل مشتری («my-jewelry») با Policy
| به مالکیت رکورد محدود می‌شوند. این محافظت‌ها همان‌طور که بودند حفظ شده
| تا اگر روزی ماژول دوباره فعال شد، دارای همان سطح دسترسی امن باشد.
|
*/

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductController;


// ═══════════════════════════════════════════════════════════════════
// ۱) پنل مدیریت ماژول جواهرات
// ═══════════════════════════════════════════════════════════════════

// ============================================
// مدیریت جواهرات (Jewelry Management) — پنل مدیریت
// ============================================
//
// [امنیت - H-01] پیش از این اصلاح، تمام روت‌های زیر در سه گروه جداگانه با
// میدل‌ور «auth» تنها ثبت شده بودند. نتیجه آن بود که:
//
//   1) هیچ بررسی مجوزی انجام نمی‌شد؛ هر کاربر لاگین‌شده (حتی یک مشتری عادی)
//      می‌توانست به /admin/jewelry/repair-orders و سایر مسیرها دسترسی بگیرد.
//   2) گروه `admin/jewelry/repair-orders` و `admin/jewelry/reports/certificates`
//      دو بار تعریف شده بودند و تعریف دوم (بدون میدل‌ور admin) روی اولی سایه
//      می‌انداخت.
//
// اصلاح: یک گروه واحد با میدل‌ور «auth» + میدل‌ور مجوزمحور «permission:*».
// سیاست Deny-by-Default است: کاربری که مجوز لازم را نداشته باشد، رد می‌شود.
// مدیر کل سیستم (user_type=admin) از طریق Gate::before دسترسی کامل دارد.
//
Route::prefix('admin/jewelry')
    ->name('admin.jewelry.')
    ->middleware(['auth'])
    ->group(function () {

        // -------------------------------------------
        // داشبورد ماژول
        // -------------------------------------------
        Route::get('/dashboard', 'Jewelry\DashboardController@index')
            ->name('dashboard')
            ->middleware('permission:jewelry.dashboard.view');

        // -------------------------------------------
        // مالکان جواهرات (Owners)
        // -------------------------------------------
        Route::get('owners/search', 'Jewelry\JewelryOwnerController@search')
            ->name('owners.search')
            ->middleware('permission:jewelry.owners.view');
        Route::get('owners/select-list', 'Jewelry\JewelryOwnerController@getOwnersForSelect')
            ->name('owners.select_list')
            ->middleware('permission:jewelry.owners.view');

        Route::get('owners', 'Jewelry\JewelryOwnerController@index')
            ->name('owners.index')
            ->middleware('permission:jewelry.owners.view');
        Route::get('owners/create', 'Jewelry\JewelryOwnerController@create')
            ->name('owners.create')
            ->middleware('permission:jewelry.owners.create');
        Route::post('owners', 'Jewelry\JewelryOwnerController@store')
            ->name('owners.store')
            ->middleware('permission:jewelry.owners.create');
        Route::get('owners/{owner}', 'Jewelry\JewelryOwnerController@show')
            ->name('owners.show')
            ->middleware('permission:jewelry.owners.view');
        Route::get('owners/{owner}/edit', 'Jewelry\JewelryOwnerController@edit')
            ->name('owners.edit')
            ->middleware('permission:jewelry.owners.update');
        Route::match(['put', 'patch'], 'owners/{owner}', 'Jewelry\JewelryOwnerController@update')
            ->name('owners.update')
            ->middleware('permission:jewelry.owners.update');
        Route::delete('owners/{owner}', 'Jewelry\JewelryOwnerController@destroy')
            ->name('owners.destroy')
            ->middleware('permission:jewelry.owners.delete');

        // -------------------------------------------
        // شناسنامه‌ها (Certificates)
        // -------------------------------------------
        Route::get('certificates', 'Jewelry\JewelryCertificateController@index')
            ->name('certificates.index')
            ->middleware('permission:jewelry.certificates.view');
        Route::get('certificates/create', 'Jewelry\JewelryCertificateController@create')
            ->name('certificates.create')
            ->middleware('permission:jewelry.certificates.create');
        Route::post('certificates', 'Jewelry\JewelryCertificateController@store')
            ->name('certificates.store')
            ->middleware('permission:jewelry.certificates.create');
        Route::get('certificates/{certificate}', 'Jewelry\JewelryCertificateController@show')
            ->name('certificates.show')
            ->middleware('permission:jewelry.certificates.view');
        Route::get('certificates/{certificate}/edit', 'Jewelry\JewelryCertificateController@edit')
            ->name('certificates.edit')
            ->middleware('permission:jewelry.certificates.update');
        Route::match(['put', 'patch'], 'certificates/{certificate}', 'Jewelry\JewelryCertificateController@update')
            ->name('certificates.update')
            ->middleware('permission:jewelry.certificates.update');
        Route::delete('certificates/{certificate}', 'Jewelry\JewelryCertificateController@destroy')
            ->name('certificates.destroy')
            ->middleware('permission:jewelry.certificates.delete');

        Route::get('certificates/{certificate}/download', 'Jewelry\JewelryCertificateController@downloadFile')
            ->name('certificates.download')
            ->middleware('permission:jewelry.certificates.download');
        Route::get('certificates/{certificate}/print', 'Jewelry\JewelryCertificateController@print')
            ->name('certificates.print')
            ->middleware('permission:jewelry.certificates.print');

        // تاریخچه انتقالات یک شناسنامه
        // ── رفع باگ ────────────────────────────────────────────────────
        // متد `transferHistory` در کنترلر وجود داشت و ویو آن هم ساخته شده
        // بود، اما هیچ روتی به آن اشاره نمی‌کرد؛ یعنی صفحه تاریخچه
        // انتقالات یک شناسنامه کاملاً غیرقابل دسترس بود.
        // ── عملیات مدیریتی شناسنامه ────────────────────────────────
        // ── رفع باگ (Stage 2) ─────────────────────────────────────────
        // کلاس `Jewelry\Admin\JewelryCertificateController` پنج متد
        // مدیریتی داشت (verify، reject، destroy، transferHistory و
        // quickVerify) اما «هیچ روتی» به آن اشاره نمی‌کرد؛ یعنی ۲۴۲ خط
        // کد تأیید/رد شناسنامه کاملاً غیرقابل دسترس بود.
        //
        // نکته: متدهای index/show/destroy آن کلاس عمداً روت نمی‌گیرند،
        // زیرا کنترلر `Jewelry\JewelryCertificateController` همین
        // قابلیت‌ها را با مجوزهای مشخص پوشش می‌دهد و ثبت روت تکراری
        // باعث سایه‌افتادن و ابهام می‌شود.

        // تاریخچه انتقالات یک شناسنامه
        Route::get('certificates/{certificate}/transfer-history', 'Jewelry\Admin\JewelryCertificateController@transferHistory')
            ->name('certificates.transfer_history')
            ->middleware('permission:jewelry.certificates.view');

        // تأیید شناسنامه — عملیات حساس، مجوز جداگانه
        Route::post('certificates/{certificate}/verify', 'Jewelry\Admin\JewelryCertificateController@verify')
            ->name('certificates.verify')
            ->middleware('permission:jewelry.certificates.verify');

        // رد شناسنامه — دلیل رد الزامی است و در audit_logs ثبت می‌شود
        Route::post('certificates/{certificate}/reject', 'Jewelry\Admin\JewelryCertificateController@reject')
            ->name('certificates.reject')
            ->middleware('permission:jewelry.certificates.verify');

        // بررسی سریع شناسنامه (AJAX) از پنل مدیریت
        Route::post('certificates/quick-verify', 'Jewelry\Admin\JewelryCertificateController@quickVerify')
            ->name('certificates.quick_verify')
            ->middleware('permission:jewelry.certificates.verify');

        // -------------------------------------------
        // سفارشات تعمیر (Repair Orders)
        // — تکنسین تعمیرات به این بخش دسترسی دارد
        // -------------------------------------------
        Route::get('repair-orders', 'Jewelry\Admin\RepairOrderController@index')
            ->name('repair-orders.index')
            ->middleware('permission:jewelry.repairs.view');
        Route::get('repair-orders/create', 'Jewelry\Admin\RepairOrderController@create')
            ->name('repair-orders.create')
            ->middleware('permission:jewelry.repairs.create');
        Route::post('repair-orders', 'Jewelry\Admin\RepairOrderController@store')
            ->name('repair-orders.store')
            ->middleware('permission:jewelry.repairs.create');
        Route::get('repair-orders/jewelry/{jewelryId}/history', 'Jewelry\Admin\RepairOrderController@jewelryHistory')
            ->name('repair-orders.jewelry_history')
            ->middleware('permission:jewelry.repairs.view');
        Route::get('repair-orders/{repair_order}', 'Jewelry\Admin\RepairOrderController@show')
            ->name('repair-orders.show')
            ->middleware('permission:jewelry.repairs.view');
        Route::get('repair-orders/{repair_order}/edit', 'Jewelry\Admin\RepairOrderController@edit')
            ->name('repair-orders.edit')
            ->middleware('permission:jewelry.repairs.update');
        Route::match(['put', 'patch'], 'repair-orders/{repair_order}', 'Jewelry\Admin\RepairOrderController@update')
            ->name('repair-orders.update')
            ->middleware('permission:jewelry.repairs.update');
        Route::get('repair-orders/{id}/status-history', 'Jewelry\Admin\RepairOrderController@statusHistory')
            ->name('repair-orders.status_history')
            ->middleware('permission:jewelry.repairs.view');

        // ثبت عیب، شرح تعمیر، هزینه و قطعات مصرفی
        Route::post('repair-orders/{id}/status', 'Jewelry\Admin\RepairOrderController@updateStatus')
            ->name('repair-orders.update_status')
            ->middleware('permission:jewelry.repairs.update_status');

        // تخصیص تکنسین
        Route::get('repair-orders/{id}/assign', 'Jewelry\Admin\RepairOrderController@assignForm')
            ->name('repair-orders.assign_form')
            ->middleware('permission:jewelry.repairs.assign');
        Route::post('repair-orders/{id}/assign', 'Jewelry\Admin\RepairOrderController@assign')
            ->name('repair-orders.assign')
            ->middleware('permission:jewelry.repairs.assign');

        // بارگذاری تصویر/مدرک توسط تکنسین
        Route::post('repair-orders/{id}/photo', 'Jewelry\Admin\RepairOrderController@uploadAdminPhoto')
            ->name('repair-orders.upload_photo')
            ->middleware('permission:jewelry.repairs.update_status');

        Route::delete('repair-orders/{repair_order}', 'Jewelry\Admin\RepairOrderController@destroy')
            ->name('repair-orders.destroy')
            ->middleware('permission:jewelry.repairs.delete');

        // -------------------------------------------
        // گزارش سرقت و مفقودی (Missing Reports)
        // -------------------------------------------
        Route::get('missing_reports', 'MissingReportController@index')
            ->name('missing_reports.index')
            ->middleware('permission:jewelry.missing_reports.view');
        Route::get('missing_reports/create', 'MissingReportController@create')
            ->name('missing_reports.create')
            ->middleware('permission:jewelry.missing_reports.create');
        Route::post('missing_reports', 'MissingReportController@store')
            ->name('missing_reports.store')
            ->middleware('permission:jewelry.missing_reports.create');
        Route::get('missing_reports/get-jewelry-info/{id}', 'MissingReportController@getJewelryInfo')
            ->name('missing_reports.get_info')
            ->middleware('permission:jewelry.missing_reports.view');
        Route::get('missing_reports/{missing_report}', 'MissingReportController@show')
            ->name('missing_reports.show')
            ->middleware('permission:jewelry.missing_reports.view');
        Route::post('missing_reports/{id}/status', 'MissingReportController@updateStatus')
            ->name('missing_reports.update_status')
            ->middleware('permission:jewelry.missing_reports.update_status');
        Route::get('missing_reports/{id}/print', 'MissingReportController@print')
            ->name('missing_reports.print')
            ->middleware('permission:jewelry.missing_reports.print');
        // سند کلانتری/مدرک مفقودی؛ فقط دارنده مجوز دانلود
        Route::get('missing_reports/{id}/document', 'MissingReportController@downloadDocument')
            ->name('missing_reports.document')
            ->middleware('permission:jewelry.missing_reports.view');

        // -------------------------------------------
        // انتقال مالکیت (Ownership Transfers)
        // — گردش‌کار کامل در OwnershipTransferController و سرویس مربوطه
        // -------------------------------------------
        Route::get('transfers', 'Jewelry\OwnershipTransferController@index')
            ->name('transfers.index')
            ->middleware('permission:jewelry.transfers.view');
        Route::get('transfers/create', 'Jewelry\OwnershipTransferController@create')
            ->name('transfers.create')
            ->middleware('permission:jewelry.transfers.create');
        Route::get('transfers/create/certificate/{certificate}', 'Jewelry\OwnershipTransferController@createForCertificate')
            ->name('transfers.createForCertificate')
            ->middleware('permission:jewelry.transfers.create');
        Route::post('transfers', 'Jewelry\OwnershipTransferController@store')
            ->name('transfers.store')
            ->middleware('permission:jewelry.transfers.create');
        Route::get('transfers/{transfer}', 'Jewelry\OwnershipTransferController@show')
            ->name('transfers.show')
            ->middleware('permission:jewelry.transfers.view');
        Route::post('transfers/{transfer}/approve', 'Jewelry\OwnershipTransferController@approve')
            ->name('transfers.approve')
            ->middleware('permission:jewelry.transfers.approve');
        Route::post('transfers/{transfer}/reject', 'Jewelry\OwnershipTransferController@reject')
            ->name('transfers.reject')
            ->middleware('permission:jewelry.transfers.reject');
        Route::post('transfers/{transfer}/cancel', 'Jewelry\OwnershipTransferController@cancel')
            ->name('transfers.cancel')
            ->middleware('permission:jewelry.transfers.cancel');

        // -------------------------------------------
        // گزارش‌ها
        // -------------------------------------------
        // -------------------------------------------
        // گزارش‌های مدیریتی (سراسری)
        //
        // [اصلاح طراحی — Stage 2]
        // پیش‌تر این روت‌ها به Jewelry\ReportController اشاره می‌کردند؛
        // اما آن کنترلر گزارش‌ها را به مالکیت کاربر جاری (Auth::id())
        // محدود می‌کند. یعنی مدیر سیستم در پنل مدیریت عملاً گزارش خالی
        // می‌دید.
        //
        // اکنون این روت‌ها به Jewelry\Admin\ReportController متصل
        // شده‌اند که گزارش سراسری می‌سازد. آن کنترلر (۴۴۲ خط) پیش‌تر
        // هیچ روتی نداشت و کاملاً غیرقابل دسترس بود.
        //
        // کنترلر گزارش مالک‌محور حذف نشده و در بخش «جواهرات من» باقی است.
        // -------------------------------------------
        Route::get('reports', 'Jewelry\Admin\ReportController@summary')
            ->name('reports.summary')
            ->middleware('permission:jewelry.reports.view');

        Route::get('reports/certificates', 'Jewelry\Admin\ReportController@certificates')
            ->name('reports.certificates')
            ->middleware('permission:jewelry.reports.view');

        Route::get('reports/repairs', 'Jewelry\Admin\ReportController@repairs')
            ->name('reports.repairs')
            ->middleware('permission:jewelry.reports.view');

        Route::get('reports/transfers', 'Jewelry\Admin\ReportController@transfers')
            ->name('reports.transfers')
            ->middleware('permission:jewelry.reports.view');

        Route::get('reports/live-stats', 'Jewelry\Admin\ReportController@liveStats')
            ->name('reports.live_stats')
            ->middleware('permission:jewelry.reports.view');

        Route::get('reports/charts', 'Jewelry\Admin\ReportController@charts')
            ->name('reports.charts')
            ->middleware('permission:jewelry.reports.view');

        Route::post('reports/export', 'Jewelry\Admin\ReportController@export')
            ->name('reports.export')
            ->middleware('permission:jewelry.reports.export');
    });


// ═══════════════════════════════════════════════════════════════════
// ۲) پنل کاربری مالک قطعه (سمت مشتری)
// ═══════════════════════════════════════════════════════════════════

// ============================================
// پنل کاربری اشیاء قیمتی (سمت مشتری)
// ============================================
// این بخش برای «مالک» قطعه است؛ بنابراین به مالکیت رکورد محدود می‌شود
// و در کنترلرها با Policy بررسی می‌گردد (نه با permission سراسری).
Route::middleware(['auth'])->prefix('my-jewelry')->name('my-jewelry.')->group(function () {
    Route::get('/', 'Jewelry\JewelryOwnerController@myDashboard')->name('dashboard');

    // انتقال مالکیت توسط مالک فعلی (ایجاد درخواست)
    Route::get('transfers', 'Jewelry\OwnershipTransferController@myIndex')->name('transfers.index');
    Route::get('transfers/create/{certificate}', 'Jewelry\OwnershipTransferController@myCreate')
        ->name('transfers.create');
    Route::post('transfers', 'Jewelry\OwnershipTransferController@myStore')->name('transfers.store');
    Route::get('transfers/{transfer}', 'Jewelry\OwnershipTransferController@myShow')->name('transfers.show');
    Route::post('transfers/{transfer}/cancel', 'Jewelry\OwnershipTransferController@cancel')
        ->name('transfers.cancel');

    // سوابق مالکیت قطعات کاربر
    Route::get('certificates/{certificate}/history', 'Jewelry\OwnershipTransferController@history')
        ->name('certificates.history');

    // -------------------------------------------
    // گزارش‌های مالک‌محور
    //
    // این گزارش‌ها تنها داده‌های خود کاربر را نشان می‌دهند؛
    // محدودسازی در خود کنترلر با Auth::id() اعمال می‌شود.
    // -------------------------------------------
    Route::get('reports/certificates', 'Jewelry\ReportController@certificateReport')
        ->name('reports.certificates');

    Route::get('reports/repairs', 'Jewelry\ReportController@repairReport')
        ->name('reports.repairs');

    Route::get('reports/transfers', 'Jewelry\ReportController@transferReport')
        ->name('reports.transfers');

    Route::get('reports/financial', 'Jewelry\ReportController@financialReport')
        ->name('reports.financial');

    Route::post('reports/export', 'Jewelry\ReportController@export')
        ->name('reports.export');
});


// ═══════════════════════════════════════════════════════════════════
// ۳) اندپوینت داخلی اطلاعات قطعه
// ═══════════════════════════════════════════════════════════════════

// روت API داخلی برای دریافت اطلاعات قطعه (فقط کاربران احراز هویت‌شده)
Route::middleware(['auth'])->get('/api/jewelry/{id}/info', 'MissingReportController@getJewelryInfo')
    ->name('api.jewelry.info');


// ═══════════════════════════════════════════════════════════════════
// ۴) صفحات عمومی ماژول جواهرات
// ═══════════════════════════════════════════════════════════════════

// ==========================================
// روت‌های عمومی مارکت‌پلیس طلا و جواهر دریکانا
// ==========================================

// استعلام عمومی شناسنامه طلا (بدون نیاز به ورود)
Route::get('/jewelry/certificate-verify', 'Jewelry\\JewelryCertificateController@verifyPage')
    ->name('jewelry.certificates.verify_page');

// صفحه اعلام سرقت/مفقودی عمومی (نمایش فرم)
Route::get('/jewelry/report-stolen', 'FrontendJewelryController@reportStolenForm')
    ->name('jewelry.missing_reports.create_public');
Route::post('/jewelry/report-stolen', 'FrontendJewelryController@reportStolenStore')
    ->name('jewelry.missing_reports.store_public');

// صفحه رهگیری عمومی گواهی
Route::get('/jewelry/track/{serial?}', 'FrontendJewelryController@track')
    ->name('jewelry.track');

// صفحه درباره سرویس شناسنامه
Route::get('/jewelry/certificate-service', function () {
    return view('frontend.jewelry.service');
})->name('jewelry.service');
