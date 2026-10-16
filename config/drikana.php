<?php

/**
 * پیکربندی یکپارچه‌سازی‌های اختیاری دریکانا
 * ════════════════════════════════════════════════════════════════════
 *
 * ── چرا این فایل وجود دارد؟ (مورد M-09 گزارش امنیتی) ────────────────
 *
 * لاراول توصیه می‌کند `env()` تنها در فایل‌های پوشه `config/` صدا زده
 * شود. دلیلش یک رفتار مشخص در زمان اجراست:
 *
 *     Laravel 5.8 → LoadEnvironmentVariables::bootstrap()
 *         if ($app->configurationIsCached()) { return; }
 *
 * یعنی وقتی `php artisan config:cache` اجرا شده باشد، فایل `.env`
 * **بارگذاری نمی‌شود** و هر فراخوانی `env()` در کد برنامه `null`
 * برمی‌گرداند. نتیجه، شکست بی‌صدای قابلیت‌ها است: پیامک OTP ارسال
 * نمی‌شود، درگاه پرداخت کلید خود را پیدا نمی‌کند و ... بدون هیچ پیام
 * خطایی.
 *
 * پیش از این، ۷۵ فراخوانی `env()` در کد برنامه وجود داشت و به همین
 * دلیل `config:cache` برای این پروژه «ممنوع» بود. اکنون همه آن‌ها به
 * این فایل منتقل شده‌اند و `config:cache` بی‌خطر است.
 *
 * ── قاعده افزودن مقدار تازه ─────────────────────────────────────────
 *
 *   ۱. کلید را اینجا با `env('NAME')` بخوانید.
 *   ۲. کلید را به `.env.example` هم اضافه کنید (با مقدار نمونه
 *      غیرحساس) تا استقرار تازه آن را ببیند.
 *   ۳. در کد، از `config('drikana....')` استفاده کنید — هرگز `env()`.
 *
 * آزمون نگهبان: `tests/Feature/ConfigCacheSafetyTest.php`
 */

return [

    /*
    |-------------------------------------------------------------------
    | پیامک — پنل‌های ایرانی
    |-------------------------------------------------------------------
    |
    | هر پنل فقط زمانی استفاده می‌شود که در پنل مدیریت
    | (`/admin/otp_systems`) فعال شده باشد.
    |
    */

    'sms' => [

        // ملی‌پیامک — درگاه الگو (Pattern)
        'melipayamak' => [
            'username'   => env('MELIPAYAMAK_USERNAME'),
            'password'   => env('MELIPAYAMAK_PASSWORD'),
            'pattern_id' => env('MELIPAYAMAK_PATTERN_ID'),
        ],

        // فراز اس‌ام‌اس — درگاه الگو
        'farazsms' => [
            'username'   => env('FARAZSMS_USERNAME'),
            'password'   => env('FARAZSMS_PASSWORD'),
            'from'       => env('FARAZSMS_FROM'),
            'pattern_id' => env('FARAZSMS_PATTERN_ID'),
        ],

        // کاوه‌نگار — درگاه پیامک خدماتی
        'kavenegar' => [
            'api_key' => env('KAVENEGAR_API_KEY'),
        ],

        // Twilio — پیامک بین‌المللی
        'twilio' => [
            'sid'        => env('TWILIO_SID'),
            'auth_token' => env('TWILIO_AUTH_TOKEN'),
            'from'       => env('VALID_TWILLO_NUMBER'),
        ],

        // درگاه عمومی «SSL Sms» (سرویس سمت ارائه‌دهنده، نه SSL/TLS)
        'ssl_sms' => [
            'user'     => env('SSL_SMS_USER'),
            'password' => env('SSL_SMS_PASSWORD'),
            'sid'      => env('SSL_SMS_SID'),
            'url'      => env('SSL_SMS_URL'),
        ],

        // درگاه پیامکسازی محلی (bulk) — تنظیمات عمومی
        'local' => [
            'sender_id' => env('SENDER_ID'),
            'language'  => env('LANGUAGE'),
            'route'     => env('ROUTE'),
            'auth_key'  => env('AUTH_KEY'),
        ],
    ],

    /*
    |-------------------------------------------------------------------
    | درگاه‌های پرداخت
    |-------------------------------------------------------------------
    |
    | هر درگاه فقط وقتی فعال می‌شود که در
    | `/admin/payment-method` روشن شده باشد. کلیدها اینجا فقط
    | «خوانده» می‌شوند و هیچ‌کدام مقدار پیش‌فرض حساسی ندارند.
    |
    */

    'payments' => [

        'paypal' => [
            'client_id'     => env('PAYPAL_CLIENT_ID'),
            'client_secret' => env('PAYPAL_CLIENT_SECRET'),
            'mode'          => env('PAYPAL_MODE', 'sandbox'),
        ],

        'braintree' => [
            'environment' => env('BRAINTREE_ENVIRONMENT', 'sandbox'),
            'merchant_id' => env('BRAINTREE_MERCHANT_ID'),
            'public_key'  => env('BRAINTREE_PUBLIC_KEY'),
            'private_key' => env('BRAINTREE_PRIVATE_KEY'),
        ],

        'paystack' => [
            'secret_key' => env('PAYSTACK_SECRET_KEY'),
            'public_key' => env('PAYSTACK_PUBLIC_KEY'),
        ],

        'instamojo' => [
            'api_key'    => env('IM_API_KEY'),
            'auth_token' => env('IM_AUTH_TOKEN'),
        ],

        'zarinpal' => [
            'merchant_code' => env('ZARINPAL_MERCHANT_CODE'),
        ],

        'stripe' => [
            'secret'      => env('STRIPE_SECRET'),
            'secret_key'  => env('STRIPE_SECRET_KEY'),
            'public_key'  => env('STRIPE_KEY'),
        ],

        'sslcommerz' => [
            'store_id'     => env('SSLCZ_STORE_ID'),
            'store_passwd' => env('SSLCZ_STORE_PASSWD'),
        ],

        'razorpay' => [
            'key'    => env('RAZOR_KEY'),
            'secret' => env('RAZOR_SECRET'),
        ],

        'paytm' => [
            'environment'   => env('PAYTM_ENVIRONMENT'),
            'merchant_id'   => env('PAYTM_MERCHANT_ID'),
            'merchant_key'  => env('PAYTM_MERCHANT_KEY'),
            'merchant_web'  => env('PAYTM_MERCHANT_WEBSITE'),
            'industry_type' => env('PAYTM_INDUSTRY_TYPE'),
            'channel'       => env('PAYTM_CHANNEL'),
        ],

        // درگاه‌های دیگر موجود در نسخه اصلی فروشنده
        'voguepay' => [
            'merchant_id' => env('VOGUE_MERCHANT_ID'),
        ],

        'payhere' => [
            'merchant_id' => env('PAYHERE_MERCHANT_ID'),
            'secret'      => env('PAYHERE_SECRET'),
        ],
    ],

    /*
    |-------------------------------------------------------------------
    | شناسه‌های رهگیری، پیکسل و کپچا
    |-------------------------------------------------------------------
    |
    | این مقادیر از پنل مدیریت هم قابل ویرایش‌اند
    | (`/admin/google-analytics`, `/admin/facebook-chat`,
    | `/admin/business_settings/social_login`). پنل، مقدار را در `.env`
    | می‌نویسد و اینجا خوانده می‌شود.
    |
    | ⚠ نکته عملیاتی: اگر `php artisan config:cache` اجرا شده باشد،
    |   مقدار تازه پس از پاک‌کردن کش پیکربندی اثر می‌کند:
    |       php artisan config:clear && php artisan config:cache
    |
    */

    'tracking' => [
        'google_analytics_id' => env('TRACKING_ID'),
        'facebook_page_id'    => env('FACEBOOK_PAGE_ID'),
        'facebook_pixel_id'   => env('FACEBOOK_PIXEL_ID'),
        'captcha_key'         => env('CAPTCHA_KEY'),
    ],

    /*
    |-------------------------------------------------------------------
    | زبان پیش‌فرض سایت
    |-------------------------------------------------------------------
    |
    | اگر `DEFAULT_LANGUAGE` خالی باشد، میدل‌ور `Language` روی `en`
    | عقب‌نشینی می‌کند (رفتار پیشین حفظ شده است).
    |
    */

    'default_language' => env('DEFAULT_LANGUAGE'),

    /*
    |-------------------------------------------------------------------
    | ماژول‌های اختیاری فروشگاه
    |-------------------------------------------------------------------
    |
    | ── چرا این بلوک وجود دارد؟ ────────────────────────────────────────
    |
    | پروژه در ابتدا یک پلتفرم «شناسنامه‌دار کردن طلا و جواهرات» بود و
    | سپس به فروشگاه اینترنتی خرازی تبدیل شد. ماژول جواهرات (شناسنامه،
    | مالکیت، انتقال، تعمیر، گزارش سرقت/مفقودی) دیگر بخشی از هویت فروشگاه
    | خرازی نیست، اما **کد و جدول‌های آن دست‌نخورده باقی مانده‌اند** تا:
    |
    |   ۱. بازگشت‌پذیری کامل تضمین شود (بدون حذف داده یا کد).
    |   ۲. وابستگی‌های فنی مشترک (مجوزها، روابط مدل کاربر، جدول‌ها)
    |      بی‌دلیل تخریب نشوند.
    |
    | با مقدار `false` هیچ روتی از ماژول جواهرات ثبت نمی‌شود؛ بنابراین
    | هیچ صفحه‌ای از آن در دسترس کاربر نخواهد بود و هیچ خطای
    | RouteNotFoundException هم رخ نمی‌دهد (زیرا ارجاع‌ها از ویوها
    | پاک‌سازی شده‌اند).
    |
    | ── نحوه فعال‌سازی مجدد (در صورت نیاز) ──────────────────────────────
    |
    |   ۱. در فایل `.env` مقدار زیر را تنظیم کنید:
    |          KHARAZI_ENABLE_JEWELRY=true
    |   ۲. کش پیکربندی را پاک کنید:
    |          php artisan config:clear
    |
    | توجه: ویوهای ظاهری (منو، فوتر، داشبورد) در جریان تبدیل به خرازی
    | پاک‌سازی شده‌اند؛ برای فعال‌سازی کامل، آن ارجاع‌ها نیز باید از
    | تاریخچه Git بازیابی شوند (شاخه backup/pre-kharazi-rebrand).
    |
    */

    'modules' => [
        'jewelry' => env('KHARAZI_ENABLE_JEWELRY', false),
    ],

    /*
    |-------------------------------------------------------------------
    | کد تأیید در محیط توسعه
    |-------------------------------------------------------------------
    |
    | `debug_otp_code`: یک کد ثابت برای آزمون محلی، تا نیازی به
    | خواندن پیامک واقعی نباشد. هرگز روی سرور واقعی تنظیم نکنید.
    |
    | `show_debug_otp`: نمایش کد روی صفحه — میدل‌ور کنترل می‌کند که
    | تنها وقتی `APP_ENV` مخالف production باشد نمایش داده شود.
    |
    */

    'debug' => [
        'otp_code'      => env('DEBUG_OTP_CODE'),
        'show_otp'      => env('SHOW_DEBUG_OTP', true),
    ],

    /*
    |-------------------------------------------------------------------
    | نصب‌کننده
    |-------------------------------------------------------------------
    |
    | روی سامانه نصب‌شده، میدل‌ور `not_installed` همه مسیرهای
    | `/install/*` و `/update/*` را با ۴۰۴ می‌بندد. این کلید فقط برای
    | بازکردن موقت آن محافظ است و **نباید** روی سرور واقعی تنظیم شود.
    |
    */

    'installer' => [
        'allow' => env('DRIKANA_ALLOW_INSTALLER', false),
    ],

    /*
    |-------------------------------------------------------------------
    | داده نمونه محیط نمایشی
    |-------------------------------------------------------------------
    |
    | کنترل می‌کند که سیدرهای نمایشی (محصول و مقاله نمونه) اجرا شوند
    | یا نه. روی سامانه واقعی خالی بگذارید.
    |
    */

    'seed_demo_data' => env('DRIKANA_SEED_DEMO_DATA', false),

];
