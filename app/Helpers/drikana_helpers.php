<?php
/**
 * Drikana Safe DB helpers
 * — prevent "Base table or view not found" errors when tables don't exist yet
 */

if (!function_exists('safe_table_exists')) {
    function safe_table_exists($table) {
        try {
            return \Illuminate\Support\Facades\Schema::hasTable($table);
        } catch (\Exception $e) {
            return false;
        }
    }
}

if (!function_exists('safe_column_exists')) {
    /**
     * بررسی وجود یک ستون در جدول — بدون پرتاب استثنا.
     *
     * ── چرا این تابع لازم شد؟ ────────────────────────────────────────────
     *
     * در ویو `frontend/index.blade.php` و همچنین در منوی اصلی و مگامنو،
     * دسته‌بندی‌ها با شرط `where('published', 1)` خوانده می‌شدند. اما در
     * اسکیمای واقعی پایگاه داده هیچ‌کدام از سه جدول زیر ستون `published`
     * ندارند:
     *
     *     categories            → بدون ستون published
     *     sub_categories        → بدون ستون published
     *     sub_sub_categories    → بدون ستون published
     *
     * (ستون `published` فقط در `products`، `banners` و `sliders` وجود دارد
     * و در آن سه جدول استفاده‌اش درست است.)
     *
     * نتیجه این ناسازگاری: کوئری با خطای
     * «Unknown column 'published' in 'where clause'» شکست می‌خورد و چون
     * داخل بلوک try/catch بود، بی‌صدا به `collect()` خالی عقب‌نشینی
     * می‌کرد. یعنی **مگامنوی صفحه اصلی همیشه خالی رندر می‌شد** و هیچ
     * دسته‌بندی‌ای در آن دیده نمی‌شد — بدون هیچ پیام خطایی.
     *
     * ── چرا ستون اضافه نشد؟ ──────────────────────────────────────────────
     *
     * گزینه جایگزین این بود که با یک Migration ستون `published` به این سه
     * جدول اضافه شود. اما بررسی شد که پنل مدیریت هیچ فیلد یا کلید
     * «انتشار» برای دسته‌بندی ندارد (`CategoryController` فقط `name`,
     * `slug`, `meta_*`, `commision_rate`, `banner`, `icon` و `digital` را
     * ذخیره می‌کند و ویو مدیریت تنها `featured` را تغییر می‌دهد). پس
     * افزودن ستون، یک فیلد بی‌استفاده و بدون راه مدیریت ایجاد می‌کرد و
     * هدف «کمترین تغییر» را نقض می‌کرد.
     *
     * تصمیم: شرط ویو با اسکیمای فعلی سازگار شد. اگر در آینده ستون
     * `published` واقعاً اضافه شد، شرط‌ها خودکار فعال می‌شوند و هیچ
     * تغییری در ویو لازم نیست.
     *
     * @param  string $table  نام جدول
     * @param  string $column نام ستون
     * @return bool
     */
    function safe_column_exists($table, $column) {
        try {
            return safe_table_exists($table)
                && \Illuminate\Support\Facades\Schema::hasColumn($table, $column);
        } catch (\Exception $e) {
            return false;
        }
    }
}

if (!function_exists('published_column_filter')) {
    /**
     * اعمال شرط `published = 1` تنها اگر ستون واقعاً وجود داشته باشد.
     *
     * استفاده در کوئری‌های Eloquent:
     *
     *     $query = Category::query();
     *     published_column_filter($query, 'categories');
     *
     * یا روی یک Builder رابطه:
     *
     *     $query->with(['subcategories' => function ($q) {
     *         published_column_filter($q, 'sub_categories');
     *     }]);
     *
     * @param  \Illuminate\Database\Eloquent\Builder|\Illuminate\Database\Query\Builder $query
     * @param  string $table
     * @return void
     */
    function published_column_filter($query, $table) {
        if (safe_column_exists($table, 'published')) {
            $query->where('published', 1);
        }
    }
}

if (!function_exists('safe_business_setting')) {
    function safe_business_setting($key, $default = null) {
        try {
            if (!safe_table_exists('business_settings')) return $default;
            $row = \Illuminate\Support\Facades\DB::table('business_settings')->where('type', $key)->first();
            return $row ? $row->value : $default;
        } catch (\Exception $e) {
            return $default;
        }
    }
}

if (!function_exists('drikana_setting')) {
    function drikana_setting($key, $default = null) {
        return safe_business_setting($key, $default);
    }
}

// =========================================================================
// دسترسی منوی مدیریت (سازگار با سیستم قدیمی «staff»)
// =========================================================================

if (!function_exists('drikana_admin_staff_permissions')) {
    /**
     * شناسه‌های مجوز منوی مدیریت برای کاربر جاری — بر اساس سیستم قدیمی
     * «staff → role → permissions» پروژه.
     *
     * ── چرا این تابع لازم است؟ (رفع باگ) ─────────────────────────────
     * در فایل `inc/admin_sidenav.blade.php` پانزده بار عبارت زیر تکرار
     * شده بود:
     *
     *     Auth::user()->user_type == 'admin'
     *     || in_array('5', json_decode(Auth::user()->staff->role->permissions))
     *
     * این عبارت دو اشکال جدی داشت:
     *   ۱) برای کاربری که رکورد `staff` ندارد (مثلاً مدیر سیستمی که با
     *      نقش جدید RBAC وارد شده، یا مشتری‌ای که به صفحه‌ای با ویوی
     *      ادمین می‌رسد) مقدار `->staff` برابر null است و
     *      `null->role` خطای Fatal از نوع «Trying to get property of
     *      non-object» می‌دهد → صفحه با ۵۰۰ از کار می‌افتاد.
     *   ۲) `json_decode()` بدون آرگومان دوم یک stdClass برمی‌گرداند و
     *      `in_array()` روی آن در PHP 7.4 هشدار می‌داد (و در PHP 8
     *      خطای TypeError می‌شد).
     *
     * این تابع هر دو مشکل را برطرف می‌کند و همیشه آرایه برمی‌گرداند.
     *
     * @return array<int,string>
     */
    function drikana_admin_staff_permissions()
    {
        try {
            $user = \Illuminate\Support\Facades\Auth::user();

            if ($user === null) {
                return [];
            }

            // مدیر کل سیستم همیشه همه منوها را می‌بیند
            if (isset($user->user_type) && $user->user_type === 'admin') {
                return ['*'];
            }

            $staff = isset($user->staff) ? $user->staff : null;
            $role  = $staff ? $staff->role : null;
            $json  = $role ? $role->permissions : null;

            if (empty($json)) {
                return [];
            }

            $decoded = json_decode($json, true);

            return is_array($decoded) ? array_map('strval', $decoded) : [];
        } catch (\Exception $e) {
            // هر خطای غیرمنتظره → بدون دسترسی منو (Fail-safe)
            return [];
        }
    }
}

if (!function_exists('drikana_admin_menu_allowed')) {
    /**
     * آیا کاربر جاری به آیتم‌های منوی مدیریت با شناسه‌های داده‌شده دسترسی دارد؟
     *
     * جایگزین امن عبارت قدیمی در `inc/admin_sidenav.blade.php`.
     *
     * @param  string|array $legacyIds  شناسه‌های عددی مجوز منو (مثلاً '5' یا ['5','6'])
     * @return bool
     */
    function drikana_admin_menu_allowed($legacyIds = [])
    {
        $owned = drikana_admin_staff_permissions();

        if (in_array('*', $owned, true)) {
            return true;
        }

        $legacyIds = is_array($legacyIds) ? $legacyIds : [$legacyIds];

        foreach ($legacyIds as $id) {
            if (in_array((string) $id, $owned, true)) {
                return true;
            }
        }

        return false;
    }
}

if (!function_exists('drikana_safe_redirect_url')) {
    /**
     * برگرداندن یک آدرس «امن برای هدایت» یا آدرس پیش‌فرض.
     *
     * ── مشکل امنیتی که برطرف می‌کند (Open Redirect) ──────────────────
     * در این پروژه، میدل‌ورهای دسترسی هنگام روبه‌رو شدن با کاربر
     * وارد‌نشده، آدرس صفحه فعلی را در نشست ذخیره می‌کنند:
     *
     *     session(['link' => url()->current()]);
     *
     * و کنترلر ورود پس از موفقیت، کاربر را به همان آدرس می‌فرستد:
     *
     *     return redirect(session('link'));
     *
     * اگر مقدار این نشست هرگونه دستکاری شود (مثلاً از طریق پارامتر
     * بازگشت یا هر مسیر دیگری که بعداً اضافه شود)، کاربر می‌تواند پس از
     * ورود موفق، به یک سایت بیرونی هدایت شود. این الگو «Open Redirect»
     * نام دارد و مهاجم از آن برای فیشینگ استفاده می‌کند: کاربر آدرس
     * سایت معتبر را می‌بیند، اما پس از ورود به سایت جعلی می‌رسد.
     *
     * این تابع تنها آدرس‌هایی را می‌پذیرد که:
     *   • مسیر نسبی باشند (بدون دامنه)، یا
     *   • میزبانشان دقیقاً با دامنه همین سایت یکسان باشد.
     *
     * در غیر این صورت، آدرس پیش‌فرض بازگردانده می‌شود.
     *
     * @param  string|null $url     آدرس ذخیره‌شده
     * @param  string|null $default آدرس جایگزین (پیش‌فرض: صفحه اصلی پنل)
     * @return string
     */
    function drikana_safe_redirect_url($url, $default = null)
    {
        if ($default === null) {
            $default = '/';
            try {
                $default = url('/');
            } catch (\Exception $e) {
                // در محیط‌های خاص ممکن است مولّد آدرس آماده نباشد
            }
        }

        if (empty($url) || !is_string($url)) {
            return $default;
        }

        // رد کردن اسکیماهای خطرناک مانند javascript:، data:، vbscript:
        // این بررسی پیش از تشخیص «مسیر نسبی» انجام می‌شود، چون رشته‌ای مثل
        // «javascript:alert(1)» اسلش ابتدایی ندارد و در غیر این صورت
        // به‌اشتباه یک مسیر داخلی تلقی می‌شد.
        if (preg_match('#^[a-zA-Z][a-zA-Z0-9+.\-]*:#', $url)
            && !preg_match('#^https?://#i', $url)) {
            return $default;
        }

        // فقط اسکیمای http و https پذیرفته می‌شود
        if (!preg_match('#^https?://#i', $url)) {
            // مسیر نسبی: نباید با «//» شروع شود (پروتکل-نسبی، که به دامنه
            // بیرونی اشاره می‌کند) و نباید کاراکتر کنترلی داشته باشد.
            if (strpos($url, '//') === 0 || preg_match('/[\x00-\x1F]/', $url)) {
                return $default;
            }

            return $url;
        }

        $parts = parse_url($url);

        if ($parts === false || empty($parts['host'])) {
            return $default;
        }

        $host   = strtolower($parts['host']);
        $scheme = isset($parts['scheme']) ? strtolower($parts['scheme']) : 'http';

        // مقایسه با دامنه همین سایت (هم با و هم بدون www)
        $allowedHosts = [];
        try {
            $appHost = strtolower(parse_url(config('app.url'), PHP_URL_HOST));
            if ($appHost) {
                $allowedHosts[] = $appHost;
                $allowedHosts[] = preg_replace('/^www\./', '', $appHost);
            }
        } catch (\Exception $e) {
            // نادیده — فهرست خالی می‌ماند و در نتیجه آدرس رد می‌شود
        }

        try {
            $requestHost = strtolower(request()->getHost());
            if ($requestHost) {
                $allowedHosts[] = $requestHost;
                $allowedHosts[] = preg_replace('/^www\./', '', $requestHost);
            }
        } catch (\Exception $e) {
            // نادیده
        }

        if (!in_array(strtolower(preg_replace('/^www\./', '', $host)), array_map(function ($h) {
            return preg_replace('/^www\./', '', $h);
        }, $allowedHosts), true)) {
            return $default;
        }

        return $url;
    }
}
