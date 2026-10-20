<?php

use App\Http\Controllers\ProductController;
use App\Http\Controllers\HomeController;
// ... سایر use ها

// سپس بقیه روت‌های شما
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// ============================================
// بخش دمو (Demo) — حذف شده به دلایل امنیتی
// ============================================
//
// [امنیت - CRITICAL] روترهای قبلی زیر بدون هیچ احراز هویتی قابل فراخوانی بودند
// و DemoController@cron_1 با یک درخواست GET تمام جداول دیتابیس را دراپ می‌کرد:
//
//     Route::get('/demo/cron_1', 'DemoController@cron_1');
//     Route::get('/demo/cron_2', 'DemoController@cron_2');
//
// علت شکست محافظ DEMO_MODE در DemoController نیز آن بود که در سازنده (constructor)
// دستور `return false;` صرفاً از سازنده خارج می‌شد و هیچ‌گاه جلوی اجرای اکشن را
// نمی‌گرفت. علاوه بر آن فایل موردنیاز `demo.sql` در مخزن وجود ندارد؛ لذا اجرای
// cron_1 فقط منجر به «دراپ کامل داده‌ها» و سپس خطا می‌شد.
//
// تصمیم: حذف کامل روترها و حذف فایل DemoController.php.
// برای ریست محیط دمو در آینده باید یک Artisan Command محافظت‌شده (فقط local)
// ساخته شود، نه یک اندپوینت HTTP عمومی.

// ============================================
// احراز هویت و کاربران (Authentication & Users)
// ============================================
// توجه: `Auth::routes()` مسیرهای ثبت‌نام را بدون محدودسازی نرخ ثبت
// می‌کند. چون «ثبت‌نام» در این سامانه یک پیامک تأیید می‌فرستد، بدون
// محدودسازی می‌توان اعتبار پنل پیامک را با اسکریپت ساده سوزاند
// (SMS Bombing). محدودسازی در کنترلر و تنها روی متد `register` اعمال
// شده است تا صفحات GET نمایش فرم، بی‌دلیل محدود نشوند.
Auth::routes(['verify' => true]);
Route::get('/logout', '\App\Http\Controllers\Auth\LoginController@logout');
Route::post('/language', 'LanguageController@changeLanguage')->name('language.change');
Route::post('/currency', 'CurrencyController@changeCurrency')->name('currency.change');

// ورود با شبکه‌های اجتماعی (Social Login)
Route::get('/social-login/redirect/{provider}', 'Auth\LoginController@redirectToProvider')->name('social.login');
Route::get('/social-login/{provider}/callback', 'Auth\LoginController@handleProviderCallback')->name('social.callback');

// صفحات ورود و ثبت‌نام کاربران
Route::get('/users/login', 'HomeController@login')->name('user.login');
Route::get('/users/registration', 'HomeController@registration')->name('user.registration');
// [امنیت — محدودسازی نرخ] این مسیر رمز عبور را با Hash::check بررسی
// می‌کند؛ یعنی یک «مسیر ورود» است، نه فقط نمایش سبد خرید. بدون
// محدودسازی، حمله دیکشنری و شمارش کاربران (اختلاف پاسخ برای ایمیل
// موجود و ناموجود) ممکن بود.
Route::post('/users/login/cart', 'HomeController@cart_login')
     ->name('cart.login.submit')
     ->middleware('throttle:10,1');

// routes/web.php

// برای کاربران احراز هویت شده
Route::middleware(['auth'])->group(function () {
    // نمایش فرم تأیید کد
    Route::get('/verification', 'OTPVerificationController@verification')
         ->name('verification');
    
    // تأیید کد
    // نام این روت‌ها با پیشوند «phone» مشخص شده است.
    //
    // ── چرا؟ (رفع تداخل نام) ───────────────────────────────────────
    // دستور `Auth::routes(['verify' => true])` در همین فایل، روت‌های
    // تأیید ایمیل لاراول را با نام‌های `verification.verify` و
    // `verification.resend` ثبت می‌کند. اگر این دو روت هم همان نام‌ها را
    // داشته باشند، یکی روی دیگری سایه می‌افتد و فراخوانی
    // `route('verification.verify')` می‌تواند به مسیر اشتباه برود.
    // اکنون نام‌ها تفکیک شده‌اند: ایمیل از نام‌های پیش‌فرض لاراول و
    // تلفن از پیشوند phone استفاده می‌کند.
    // [امنیت — محدودسازی نرخ] این دو روت، نسخه «احراز‌شده» همان
    // مسیرهای OTP هستند: POST /verification/verify کد را بررسی می‌کند و
    // POST /verification/resend یک پیامک تازه می‌فرستد. بدون محدودسازی،
    // کد کوتاه با آزمون و خطا حدس‌زدنی است و اعتبار پنل پیامک
    // می‌سوزد. کلید محدودسازی «آی‌پی + نام مسیر» است.
    Route::post('/verification/verify', 'OTPVerificationController@verify_phone')
         ->name('verification.phone.verify')
         ->middleware('throttle:10,1');

    // ارسال مجدد کد
    Route::post('/verification/resend', 'OTPVerificationController@resend_verification_code')
         ->name('verification.phone.code_resend')
         ->middleware('throttle:3,1');
});

// ============================================
// دسته‌بندی‌ها و زیردسته‌ها (Categories & Subcategories)
// ============================================
Route::post('/subcategories/get_subcategories_by_category', 'SubCategoryController@get_subcategories_by_category')->name('subcategories.get_subcategories_by_category');
Route::post('/subsubcategories/get_subsubcategories_by_subcategory', 'SubSubCategoryController@get_subsubcategories_by_subcategory')->name('subsubcategories.get_subsubcategories_by_subcategory');
Route::post('/subsubcategories/get_brands_by_subsubcategory', 'SubSubCategoryController@get_brands_by_subsubcategory')->name('subsubcategories.get_brands_by_subsubcategory');
Route::post('/subsubcategories/get_attributes_by_subsubcategory', 'SubSubCategoryController@get_attributes_by_subsubcategory')->name('subsubcategories.get_attributes_by_subsubcategory');

// ============================================
// صفحه اصلی (Home Page)
// ============================================
Route::get('/', 'HomeController@index')->name('home');

// بخش‌های صفحه اصلی (AJAX)
Route::post('/home/section/featured', 'HomeController@load_featured_section')->name('home.section.featured');
Route::post('/home/section/best_selling', 'HomeController@load_best_selling_section')->name('home.section.best_selling');
Route::post('/home/section/home_categories', 'HomeController@load_home_categories_section')->name('home.section.home_categories');
Route::post('/home/section/best_sellers', 'HomeController@load_best_sellers_section')->name('home.section.best_sellers');

// منوی دسته‌بندی (AJAX)
Route::post('/category/nav-element-list', 'HomeController@get_category_items')->name('category.elements');

// صفحه جزئیات پیش‌نهاد شگفت‌انگیز (Flash Deal)
Route::get('/flash-deal/{slug}', 'HomeController@flash_deal_details')->name('flash-deal-details');

// نقشه سایت (Sitemap)
Route::get('/sitemap.xml', function(){
    return base_path('sitemap.xml');
});

// ============================================
// محصولات مشتری (Customer Products)
// ============================================
Route::get('/customer-products', 'CustomerProductController@customer_products_listing')->name('customer.products');
Route::get('/customer-products?subsubcategory={subsubcategory_slug}', 'CustomerProductController@search')->name('customer_products.subsubcategory');
Route::get('/customer-products?subcategory={subcategory_slug}', 'CustomerProductController@search')->name('customer_products.subcategory');
Route::get('/customer-products?category={category_slug}', 'CustomerProductController@search')->name('customer_products.category');
Route::get('/customer-products?city={city_id}', 'CustomerProductController@search')->name('customer_products.city');
Route::get('/customer-products?q={search}', 'CustomerProductController@search')->name('customer_products.search');
Route::get('/customer-product/{slug}', 'CustomerProductController@customer_product')->name('customer.product');
Route::get('/customer-packages', 'HomeController@premium_package_index')->name('customer_packages_list_show');

// ============================================
// محصولات و فروشگاه‌ها (Products & Shops)
// ============================================
Route::get('/product/{slug}', 'HomeController@product')->name('product');
Route::get('/page/{slug}', 'PageController@show_custom_page')->name('custom-pages.show_custom_page');
Route::get('/products', 'HomeController@listing')->name('products');
Route::get('/search?category={category_slug}', 'HomeController@search')->name('products.category');
Route::get('/search?subcategory={subcategory_slug}', 'HomeController@search')->name('products.subcategory');
Route::get('/search?subsubcategory={subsubcategory_slug}', 'HomeController@search')->name('products.subsubcategory');
Route::get('/search?brand={brand_slug}', 'HomeController@search')->name('products.brand');
Route::post('/product/variant_price', 'HomeController@variant_price')->name('products.variant_price');
Route::get('/shops/visit/{slug}', 'HomeController@shop')->name('shop.visit');
Route::get('/shops/visit/{slug}/{type}', 'HomeController@filter_shop')->name('shop.visit.type');

// ============================================
// سبد خرید (Cart)
// ============================================
Route::get('/cart', 'CartController@index')->name('cart');
Route::post('/cart/nav-cart-items', 'CartController@updateNavCart')->name('cart.nav_cart');
Route::post('/cart/show-cart-modal', 'CartController@showCartModal')->name('cart.showCartModal');
Route::post('/cart/addtocart', 'CartController@addToCart')->name('cart.addToCart');
Route::post('/cart/removeFromCart', 'CartController@removeFromCart')->name('cart.removeFromCart');
Route::post('/cart/updateQuantity', 'CartController@updateQuantity')->name('cart.updateQuantity');

// ============================================
// پرداخت و تسویه‌حساب (Checkout & Payment)
// ============================================
Route::group(['middleware' => ['checkout']], function(){
    Route::get('/checkout', 'CheckoutController@get_shipping_info')->name('checkout.shipping_info');
    Route::any('/checkout/delivery_info', 'CheckoutController@store_shipping_info')->name('checkout.store_shipping_infostore');
    Route::post('/checkout/payment_select', 'CheckoutController@store_delivery_info')->name('checkout.store_delivery_info');
});

Route::get('/checkout/order-confirmed', 'CheckoutController@order_confirmed')->name('order_confirmed');
Route::any('/checkout/payment', 'CheckoutController@checkout')->name('payment.checkout');
Route::post('/get_pick_ip_points', 'HomeController@get_pick_ip_points')->name('shipping_info.get_pick_ip_points');
Route::get('/checkout/payment_select', 'CheckoutController@get_payment_info')->name('checkout.payment_info');
Route::post('/checkout/apply_coupon_code', 'CheckoutController@apply_coupon_code')->name('checkout.apply_coupon_code');
Route::post('/checkout/remove_coupon_code', 'CheckoutController@remove_coupon_code')->name('checkout.remove_coupon_code');

// درگاه پرداخت پی‌پال (PayPal)
Route::get('/paypal/payment/done', 'PaypalController@getDone')->name('payment.done');
Route::get('/paypal/payment/cancel', 'PaypalController@getCancel')->name('payment.cancel');

// درگاه پرداخت زرین‌پال (Zarinpal)
Route::get('/zarinpal/back_url', 'ZarinpalController@back_url')->name('payment.backurl');

// درگاه پرداخت بانک ملی (Sadad)
Route::match(['get', 'post'], '/sadad/callback', 'SadadPaymentController@callback')->name('sadad.callback');

// درگاه پرداخت SSLCOMMERZ
Route::get('/sslcommerz/pay', 'PublicSslCommerzPaymentController@index');
Route::POST('/sslcommerz/success', 'PublicSslCommerzPaymentController@success');
Route::POST('/sslcommerz/fail', 'PublicSslCommerzPaymentController@fail');
Route::POST('/sslcommerz/cancel', 'PublicSslCommerzPaymentController@cancel');
Route::POST('/sslcommerz/ipn', 'PublicSslCommerzPaymentController@ipn');

// درگاه پرداخت استرایپ (Stripe)
Route::get('stripe', 'StripePaymentController@stripe');
Route::post('stripe', 'StripePaymentController@stripePost')->name('stripe.post');

// ============================================
// مقایسه محصولات (Compare)
// ============================================
Route::get('/compare', 'CompareController@index')->name('compare');
Route::get('/compare/reset', 'CompareController@reset')->name('compare.reset');
Route::post('/compare/addToCompare', 'CompareController@addToCompare')->name('compare.addToCompare');

// ============================================
# عضویت در خبرنامه (Subscribers)
// ============================================
Route::resource('subscribers','SubscriberController');

// ============================================
# برندها، دسته‌بندی‌ها و جستجو (Brands, Categories & Search)
// ============================================
Route::get('/brands', 'HomeController@all_brands')->name('brands.all');
Route::get('/categories', 'HomeController@all_categories')->name('categories.all');
Route::get('/search', 'HomeController@search')->name('search');
Route::get('/search?q={search}', 'HomeController@search')->name('suggestion.search');
Route::post('/ajax-search', 'HomeController@ajax_search')->name('search.ajax');
// [حذف امنیتی — C-04] مسیر POST /config_content حذف شد.
// این مسیر بدون احراز هویت و بدون توکن CSRF به تابعی می‌رسید که
// file_put_contents را روی مسیر دلخواه اجرا می‌کرد (نوشتن وب‌شل).
// جزئیات: docs/security-audit.md

// ============================================
# صفحات سیاست‌ها و قوانین (Policy Pages)
// ============================================
Route::get('/sellerpolicy', 'HomeController@sellerpolicy')->name('sellerpolicy');
Route::get('/returnpolicy', 'HomeController@returnpolicy')->name('returnpolicy');
Route::get('/supportpolicy', 'HomeController@supportpolicy')->name('supportpolicy');
Route::get('/terms', 'HomeController@terms')->name('terms');
Route::get('/privacypolicy', 'HomeController@privacypolicy')->name('privacypolicy');
Route::get('/contact-us', 'HomeController@contact')->name('contact');

// ============================================
// راهنمای خرید و ارسال + سؤالات متداول
// ============================================
//
// ── چرا این دو مسیر اضافه شدند؟ ─────────────────────────────────────
//
// دستور کار فروشگاه خرازی، در بخش «هویت جدید فروشگاه»، دو صفحه را
// صراحتاً الزامی کرده است: «صفحات راهنمای خرید و ارسال» و «سؤالات
// متداول». در پروژه قبلی هیچ‌کدام وجود نداشت:
//
//   • `resources/views/frontend/shipping_info.blade.php` وجود دارد، اما
//     این فایل «صفحه تسویه حساب» است (`checkout.shipping_info` با
//     میدل‌ور `checkout`) و به‌عنوان صفحه راهنمای عمومی قابل استفاده
//     نیست — تنها با سبد خرید پر باز می‌شود.
//   • هیچ مسیر عمومی دیگری برای راهنما یا پرسش‌های متداول نبود.
//
// این دو صفحه «محتوای ثابت» هستند (نه CMS و نه وابسته به جدول
// `policies`)، بنابراین بدون هیچ وابستگی پایگاه داده‌ای کار می‌کنند و
// اگر روزی مدیر بخواهد از CMS استفاده کند، جایگزینی آن‌ها ساده است.
//
// آدرس‌ها کوتاه و خوانا انتخاب شده‌اند (`/guide` و `/faq`) تا با
// قواعد سئوی مطرح‌شده در دستور کار (URL قابل خواندن) سازگار باشند.
Route::get('/guide', 'HomeController@guide')->name('guide');
Route::get('/faq', 'HomeController@faq')->name('faq');

// ============================================
# بخش کاربران (User Area)
// ============================================
Route::group(['middleware' => ['user']], function(){
    Route::get('/dashboard', 'HomeController@dashboard')->name('dashboard');
    Route::get('/profile', 'HomeController@profile')->name('profile');
    Route::post('/customer/update-profile', 'HomeController@customer_update_profile')->name('customer.profile.update');
    Route::post('/seller/update-profile', 'HomeController@seller_update_profile')->name('seller.profile.update');

    // تاریخچه خرید (Purchase History)
    Route::resource('purchase_history','PurchaseHistoryController');
    Route::post('/purchase_history/details', 'PurchaseHistoryController@purchase_history_details')->name('purchase_history.details');

    // لیست علاقه‌مندی‌ها (Wishlist)
    Route::resource('wishlists','WishlistController');
    Route::post('/wishlists/remove', 'WishlistController@remove')->name('wishlists.remove');

    // کیف پول (Wallet)
    Route::get('/wallet', 'WalletController@index')->name('wallet.index');
    Route::post('/recharge', 'WalletController@recharge')->name('wallet.recharge');

    // تیکت پشتیبانی (Support Ticket)
    Route::resource('support_ticket','SupportTicketController');
    Route::post('support_ticket/reply','SupportTicketController@seller_store')->name('support_ticket.seller_store');

    // پکیج‌های مشتری (Customer Packages)
    Route::post('/customer_packages/purchase', 'CustomerPackageController@purchase_package')->name('customer_packages.purchase');

    // محصولات مشتری (Customer Products)
    Route::resource('customer_products', 'CustomerProductController');
    Route::post('/customer_products/published', 'CustomerProductController@updatePublished')->name('customer_products.published');
    Route::post('/customer_products/status', 'CustomerProductController@updateStatus')->name('customer_products.update.status');

    // تاریخچه خرید دیجیتال (Digital Purchase History)
    Route::get('digital_purchase_history', 'PurchaseHistoryController@digital_index')->name('digital_purchase_history.index');
});


// ============================================
# بخش فروشندگان (Seller Area)
// ============================================
Route::group(['prefix' =>'seller', 'middleware' => ['seller', 'verified']], function(){
    Route::get('/products', 'HomeController@seller_product_list')->name('seller.products');
    Route::get('/product/upload', 'HomeController@show_product_upload_form')->name('seller.products.upload');
    Route::get('/product/{id}/edit', 'HomeController@show_product_edit_form')->name('seller.products.edit');
    // این منبع صفحهٔ «ایجاد» ندارد (متد create کنترلر خالی است)؛ با
    // except(['create']) به‌جای صفحهٔ خالی، پاسخ ۴۰۴ برگردانده می‌شود.
    Route::resource('payments','PaymentController')->except(['create']);

    // درخواست تایید فروشگاه (Shop Verification)
    Route::get('/shop/apply_for_verification', 'ShopController@verify_form')->name('shop.verify');
    Route::post('/shop/apply_for_verification', 'ShopController@verify_form_store')->name('shop.verify.store');

    // نظرات (Reviews)
    Route::get('/reviews', 'ReviewController@seller_reviews')->name('reviews.seller');

    // محصولات دیجیتال (Digital Products)
    Route::get('/digitalproducts', 'HomeController@seller_digital_product_list')->name('seller.digitalproducts');
    Route::get('/digitalproducts/upload', 'HomeController@show_digital_product_upload_form')->name('seller.digitalproducts.upload');
    Route::get('/digitalproducts/{id}/edit', 'HomeController@show_digital_product_edit_form')->name('seller.digitalproducts.edit');
});

// ============================================
# محصولات، سفارشات و مدیریت (Products, Orders & Management)
// ============================================
Route::group(['middleware' => ['auth']], function(){
    // محصولات (Products)
    Route::post('/products/store/','ProductController@store')->name('products.store');
    Route::post('/products/update/{id}','ProductController@update')->name('products.update');
    Route::get('/products/duplicate/{id}', 'ProductController@duplicate')->name('products.duplicate');
    Route::post('/products/sku_combination', 'ProductController@sku_combination')->name('products.sku_combination');
    Route::post('/products/sku_combination_edit', 'ProductController@sku_combination_edit')->name('products.sku_combination_edit');
    // نام این روت با پیشوند admin. مشخص شده تا با روت عمومی
    // `products.featured` (نمایش محصولات ویژه در فروشگاه) تداخل نداشته باشد.
    Route::post('/products/featured', 'ProductController@updateFeatured')
        ->name('admin.products.featured');
    Route::post('/products/published', 'ProductController@updatePublished')->name('products.published');
    // حذف محصول: این مسیر هم در پنل مدیریت (با مجوز products.delete) و هم در
    // داشبورد فروشنده (فقط محصولات خودِ او) استفاده می‌شود. کنترل دسترسی در
    // ProductController::destroy انجام می‌شود (میدل‌ور permission اینجا
    // نمی‌آید چون فروشندهها مجوز پنل مدیریت ندارند).
    Route::delete('/products/{id}', 'ProductController@destroy')->name('products.destroy');

    // فاکتورها (Invoices)
    Route::get('invoice/customer/{order_id}', 'InvoiceController@customer_invoice_download')->name('customer.invoice.download');
    Route::get('invoice/seller/{order_id}', 'InvoiceController@seller_invoice_download')->name('seller.invoice.download');

    // سفارشات (Orders)
    Route::resource('orders','OrderController');
    Route::post('/orders/details', 'OrderController@order_details')->name('orders.details');
    Route::post('/orders/update_delivery_status', 'OrderController@update_delivery_status')->name('orders.update_delivery_status');
    Route::post('/orders/update_payment_status', 'OrderController@update_payment_status')->name('orders.update_payment_status');

    // نظرات (Reviews)
    Route::resource('/reviews', 'ReviewController');

    // درخواست برداشت وجه (Withdraw Requests)
    Route::resource('/withdraw_requests', 'SellerWithdrawRequestController');
    Route::get('/withdraw_requests_all', 'SellerWithdrawRequestController@request_index')->name('withdraw_requests_all');
    Route::post('/withdraw_request/payment_modal', 'SellerWithdrawRequestController@payment_modal')->name('withdraw_request.payment_modal');
    Route::post('/withdraw_request/message_modal', 'SellerWithdrawRequestController@message_modal')->name('withdraw_request.message_modal');

    // مکالمات و پیام‌ها (Conversations & Messages)
    Route::resource('conversations','ConversationController');
    Route::post('conversations/refresh','ConversationController@refresh')->name('conversations.refresh');
    Route::resource('messages','MessageController');

    // آپلود دسته‌ای محصولات (Bulk Product Upload)
    Route::get('/product-bulk-upload/index', 'ProductBulkUploadController@index')->name('product_bulk_upload.index');
    Route::post('/bulk-product-upload', 'ProductBulkUploadController@bulk_upload')->name('bulk_product_upload');
    Route::get('/product-csv-download/{type}', 'ProductBulkUploadController@import_product')->name('product_csv.download');
    Route::get('/vendor-product-csv-download/{id}', 'ProductBulkUploadController@import_vendor_product')->name('import_vendor_product.download');
    Route::group(['prefix' =>'bulk-upload/download'], function(){
        Route::get('/category', 'ProductBulkUploadController@pdf_download_category')->name('pdf.download_category');
        Route::get('/sub_category', 'ProductBulkUploadController@pdf_download_sub_category')->name('pdf.download_sub_category');
        Route::get('/sub_sub_category', 'ProductBulkUploadController@pdf_download_sub_sub_category')->name('pdf.download_sub_sub_category');
        Route::get('/brand', 'ProductBulkUploadController@pdf_download_brand')->name('pdf.download_brand');
        Route::get('/seller', 'ProductBulkUploadController@pdf_download_seller')->name('pdf.download_seller');
    });

    // خروجی دسته‌ای محصولات (Product Bulk Export)
    Route::get('/product-bulk-export', 'ProductBulkUploadController@export')->name('product_bulk_export.index');

    // محصولات دیجیتال (Digital Products)
    Route::resource('digitalproducts','DigitalProductController');
    Route::get('/digitalproducts/download/{id}', 'DigitalProductController@download')->name('digitalproducts.download');
});

// ============================================
# فروشگاه‌ها و پیگیری سفارش (Shops & Order Tracking)
// ============================================
Route::resource('shops', 'ShopController');
Route::get('/track_your_order', 'HomeController@trackOrder')->name('orders.track');

// ============================================
# سایر درگاه‌های پرداخت (Other Payment Gateways)
// ============================================
Route::get('/instamojo/payment/pay-success', 'InstamojoController@success')->name('instamojo.success');
Route::post('rozer/payment/pay-success', 'RazorpayController@payment')->name('payment.rozer');
Route::get('/paystack/payment/callback', 'PaystackController@handleGatewayCallback');
Route::get('/vogue-pay', 'VoguePayController@showForm');
Route::get('/vogue-pay/success/{id}', 'VoguePayController@paymentSuccess');
Route::get('/vogue-pay/failure/{id}', 'VoguePayController@paymentFailure');

// ============================================
# آدرس‌ها (Addresses)
// ============================================
Route::resource('addresses','AddressController');
Route::get('/addresses/set_default/{id}', 'AddressController@set_default')->name('addresses.set_default');



// ============================================
// ماژول شناسنامه‌دار کردن طلا و جواهرات — غیرفعال
// ============================================
//
// تمام مسیرهای ماژول قبلی (شناسنامه و گواهی اصالت، مالکیت، انتقال
// مالکیت، سفارش تعمیر و گزارش سرقت/مفقودی) از این فایل به
// `routes/jewelry.php` منتقل شده‌اند و **تنها در صورتی بارگذاری
// می‌شوند که کلید پیکربندی `drikana.modules.jewelry` مقدار true
// داشته باشد.**
//
// مقدار پیش‌فرض در `config/drikana.php` برابر false است؛ بنابراین این
// ماژول در فروشگاه خرازی پرنسا غیرفعال است.
//
// ── چرا شرطی و نه حذف‌شده؟ ─────────────────────────────────────────
//   ۱. بازگشت‌پذیری کامل: هیچ کد، جدول یا داده‌ای حذف نشده است.
//   ۲. مطابقت با دستور کار: ماژول قبلی «غیرفعال» می‌شود، نه «حذف».
//   ۳. اگر ماژول لازم شد، فقط کافی است در `.env` مقدار زیر را
//      بگذارید و سپس `php artisan config:clear` را اجرا کنید:
//
//          KHARAZI_ENABLE_JEWELRY=true
//
// جدول‌های ماژول در پایگاه داده دست‌نخورده باقی مانده‌اند. همچنین
// مجوزهای `jewelry.*` نیز عمداً از جدول‌های `permissions` و
// `permission_role` حذف نشده‌اند — ابتدا باید وابستگی‌های کدی بررسی و
// سپس درباره حذف آن‌ها تصمیم گرفته شود.
//
// ── پاک‌سازی ارجاع‌های ظاهری ────────────────────────────────────────
// تمام لینک‌ها و منوهای مربوط به این ماژول از صفحه‌های عمومی حذف
// شده‌اند: منوی اصلی (`frontend/inc/nav`)، فوتر (`frontend/inc/footer`),
// منوی موبایل (`frontend/partials/mobile_menu_lux`)، صفحه اصلی
// (`frontend/index`) و کارت‌های داشبورد مدیریت
// (`admin/dashboard`). لذا هیچ‌جا `route('jewelry.*')` صدا زده نمی‌شود
// و خطای RouteNotFound رخ نمی‌دهد.
//
if (config('drikana.modules.jewelry', false)) {
    require __DIR__ . '/jewelry.php';
}

// ─────────────────────────────────────────────────────────────────────────
// مسیرهای عمومیِ ماژول جواهرات — هدایت دائمی به صفحهٔ پرسش‌های متداول
// ─────────────────────────────────────────────────────────────────────────
//
// این چهار نشانی در نسخهٔ پیشین، صفحه‌های عمومی زیر را نشان می‌دادند:
//
//     /jewelry/certificate-verify    استعلام عمومی شناسنامهٔ طلا
//     /jewelry/report-stolen         فرم اعلام سرقت / مفقودی
//     /jewelry/track/{serial?}       رهگیری عمومی گواهی
//     /jewelry/certificate-service   معرفی سرویس شناسنامه
//
// همهٔ این صفحه‌ها به ماژول جواهرات تعلق داشتند که به تصمیم کارفرما
// غیرفعال شده است؛ بنابراین دیگر محتوایی برای نمایش ندارند و پیش از این
// تغییر، بازدیدکننده با خطای ۴۰۴ روبه‌رو می‌شد.
//
// ── چرا ریدایرکت و نه ۴۰۴ خالی؟ ──────────────────────────────────────
//   دستور کار می‌گوید برای تغییر نشانی‌ها «Redirect مناسب» در نظر گرفته
//   شود. اگر این نشانی‌ها پیش‌تر در نتایج جست‌وجو یا میان لینک مشتریان
//   ثبت شده باشند، ریدایرکت ۳۰۱ کاربر را به نزدیک‌ترین صفحهٔ راهنما
//   می‌رساند و اعتبار لینک قبلی را منتقل می‌کند؛ در حالی که ۴۰۴ خالی
//   بازدیدکننده را در بن‌بست رها می‌کند.
//
// ── انتخاب مقصد ──────────────────────────────────────────────────────
//   صفحهٔ «پرسش‌های متداول» (`/faq`) نزدیک‌ترین صفحهٔ راهنمای عمومیِ
//   فروشگاه خرازی است. ریدایرکت به صفحهٔ اصلی هم بررسی شد، اما آن صفحه
//   محتوای پاسخ‌دهی ندارد و برای کاربری که دنبال پاسخ است گمراه‌کننده‌تر
//   است. ۳۰۱ (دائمی) انتخاب شد چون این نشانی‌ها هرگز بازنمی‌گردند.
//
// ── نکتهٔ حلقه ───────────────────────────────────────────────────────
//   مقصد `/faq` یک مسیر مستقل است و خودش ریدایرکت نمی‌شود؛ پس زنجیره
//   در همان یک پرش تمام می‌شود و حلقه‌ای شکل نمی‌گیرد. (آزمون‌شده)
//
// ── حفظ نام روت‌ها ───────────────────────────────────────────────────
//   نام روت‌های اصلی عمداً نگه داشته شده‌اند، چون دو ارجاع زنده در کد
//   باقی مانده است و در صورت نبودِ نام، خطای RouteNotFoundException
//   رخ می‌داد:
//       • `FrontendJewelryController` → jewelry.missing_reports.create_public
//       • `admin/jewelry/certificates/public-verify.blade.php` → jewelry.certificates.verify_page
//
//   نکتهٔ آزمون‌شده دربارهٔ POST: `Route::permanentRedirect` در لاراول
//   برای همهٔ متدها ثبت می‌شود، اما در عمل `POST /jewelry/report-stolen`
//   پاسخ **۴۱۹** می‌گیرد و نه ۳۰۱ — چون میان‌افزار `VerifyCsrfToken`
//   پیش از مسیریابی اجرا می‌شود و توکن معتبری وجود ندارد. این نتیجه
//   مطلوب است: برای درخواست POST، ریدایرکت ۳۰۱ (که از نظر پروتکل
//   نادرست شمرده می‌شود) رخ نمی‌دهد. فرم آن صفحه هم دیگر وجود ندارد.
Route::permanentRedirect('/jewelry/certificate-verify', '/faq')
    ->name('jewelry.certificates.verify_page');
Route::permanentRedirect('/jewelry/report-stolen', '/faq')
    ->name('jewelry.missing_reports.create_public');
Route::permanentRedirect('/jewelry/track/{serial?}', '/faq')
    ->name('jewelry.track');
Route::permanentRedirect('/jewelry/certificate-service', '/faq')
    ->name('jewelry.service');





// مسیرهای محصولات ویژه برای صفحه اصلی
Route::get('/products/featured', [ProductController::class, 'featured_products'])->name('products.featured');
Route::get('/products/best-selling', [ProductController::class, 'best_selling_products'])->name('products.best_selling');
Route::get('/products/new', [ProductController::class, 'new_products'])->name('products.new');
Route::get('/products/discounted', [ProductController::class, 'discounted_products'])->name('products.discounted');
Route::get('/products/todays-deal', [HomeController::class, 'todays_deal_products'])->name('products.todays_deal');
// ─────────────────────────────────────────────────────────────────────────
// مسیرهای «جواهرات مردانه / زنانه» — به‌صورت امن غیرفعال شدند
// ─────────────────────────────────────────────────────────────────────────
//
// وضعیت پیش از تغییر:
//   این دو مسیر به متدهای `ProductController@mens_jewelry` و
//   `ProductController@womens_jewelry` اشاره می‌کردند. آن متدها
//   محصولاتی را با جست‌وجوی متنی روی slug و tag پیدا می‌کردند:
//
//       Category::where('slug','like','%men%')->orWhere('name','like','%مردانه%')
//       ... tags like '%مردانه%' / '%زنانه%'
//
//   یعنی نتایج بر پایه «جنسیت» فیلتر می‌شد — معیاری که برای محصولات
//   خرازی (نخ، دکمه، زیپ، کاموا) هیچ معنایی ندارد و در فروشگاه خرازی
//   به فهرست بی‌ربط می‌رسید.
//
// بررسی وابستگی‌ها (پیش از تغییر):
//   • جست‌وجو در سراسر پروژه: **هیچ ویو، کنترلر یا اسکریپتی** به نام
//     روت‌های `products.mens` و `products.womens` ارجاع نمی‌داد.
//   • تنها محل تعریف، همین دو خط در `routes/web.php` بود.
//
// تصمیم — چرا حذف کامل نشد؟
//   دستور کار درباره URLها می‌گوید: «URLهای مهم موجود را در صورت
//   امکان حفظ کن یا برای تغییر آن‌ها Redirect مناسب در نظر بگیر.»
//   اگر این دو آدرس را کاملاً حذف می‌کردیم و روزی در نتایج جست‌وجوی
//   گوگل یا لینک قدیمی مشتری ظاهر می‌شدند، کاربر با خطای ۴۰۴ روبه‌رو
//   می‌شد. بنابراین مسیر حفظ شده و با **ریدایرکت دائمی (۳۰۱)** به
//   صفحه «همه دسته‌بندی‌ها» هدایت می‌شود.
//
//   ریدایرکت ۳۰۱ به موتور جست‌وجو می‌گوید آدرس جدید ثابت است و
//   اعتبار لینک قبلی را به مقصد جدید منتقل می‌کند — برخلاف ۳۰۲ که
//   موقتی تلقی می‌شود.
//
// نکته: نام روت‌ها عمداً حفظ شد تا اگر جایی (مثلاً در یک قالب ایمیل یا
// اسکریپت بیرونی متصل به سامانه) به آن‌ها ارجاع باشد، خطای
// RouteNotFoundException رخ ندهد.
Route::permanentRedirect('/products/mens-jewelry', '/categories')->name('products.mens');
Route::permanentRedirect('/products/womens-jewelry', '/categories')->name('products.womens');



// ==========================================================
// روت‌های عمومی مقالات طلا و جواهرات (CMS)
// ==========================================================
// این بخش کاملاً عمومی است و تنها مقاله‌های «منتشرشده» را نشان می‌دهد.
Route::get('/articles', 'ArticleController@index')->name('articles.index');
Route::get('/articles/search', 'ArticleController@search')->name('articles.search');
Route::get('/articles/category/{slug}', 'ArticleController@category')->name('articles.category');
Route::get('/articles/{slug}', 'ArticleController@show')
    ->name('articles.show')
    ->where('slug', '[A-Za-z0-9][A-Za-z0-9-]*');
