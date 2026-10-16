{{--
    ═══════════════════════════════════════════════════════════════════════
    فوتر موبایلی (نوار ناوبری چسبان پایین صفحه)
    ═══════════════════════════════════════════════════════════════════════

    ── چرا ساخته شد؟ ────────────────────────────────────────────────────
    طبق درخواست، فروشگاه به یک فوتر موبایلی نیاز داشت. در قالب قبلی
    تنها یک فوتر چهارستونه وجود داشت که در موبایل طولانی و
    پیمایش‌ناپذیر می‌شد و دسترسی سریع به سبد خرید و پیگیری سفارش را
    دشوار می‌کرد.

    ── رفتار ────────────────────────────────────────────────────────────
      • فقط زیر ۷۶۸ پیکسل نمایش داده می‌شود (در دسکتاپ `display:none`).
      • به‌صورت `position: fixed` در پایین صفحه می‌ماند.
      • مقدار `padding-bottom` به body اضافه می‌شود تا انتهای محتوا
        زیر آن پنهان نشود (در `kharazi-theme.css` بخش ۱۱).
      • در چاپ کاغذی پنهان می‌شود.

    ── هم‌راستایی با ساختار پروژه ───────────────────────────────────────
    پنج مقصد این نوار، همه مسیرهای موجود و فعال پروژه‌اند:
      home، categories.all، cart، purchase_history.index، profile

    نکته: `purchase_history.index` و `profile` نیازمند ورود‌اند
    (میدل‌ور `user`). برای کاربر مهمان، به‌جای آن‌ها به صفحه ورود
    هدایت می‌شود تا کلیک روی دکمه به صفحه ۴۰۳ یا خطا منتهی نشود.
--}}
@php
    $kpAuthed = Auth::check();
    $kpCartCount = Session::has('cart') ? count((Session::get('cart') ?? [])) : 0;
    $kpRoute = request()->route() ? request()->route()->getName() : '';
    $kpIs = function ($names) use ($kpRoute) {
        foreach ((array) $names as $n) {
            if ($kpRoute === $n || ($n !== '' && strpos($kpRoute, $n . '.') === 0)) return true;
        }
        return false;
    };
@endphp

<nav class="kp-mobile-footer" aria-label="ناوبری سریع موبایل">
    <div class="kp-mobile-footer-inner">

        {{-- ۱) خانه --}}
        <a href="{{ route('home') }}" class="kp-mf-item {{ $kpRoute === 'home' ? 'active' : '' }}">
            <i class="la la-home" aria-hidden="true"></i>
            <span>خانه</span>
        </a>

        {{-- ۲) دسته‌بندی‌ها --}}
        <a href="{{ route('categories.all') }}" class="kp-mf-item {{ $kpIs(['categories', 'products.category', 'products.subcategory', 'products.subsubcategory', 'products.new', 'products.featured', 'products.best_selling', 'products.discounted']) ? 'active' : '' }}">
            <i class="la la-th-large" aria-hidden="true"></i>
            <span>دسته‌بندی</span>
        </a>

        {{-- ۳) سبد خرید — با نشان تعداد کالا --}}
        <a href="{{ route('cart') }}" class="kp-mf-item {{ $kpRoute === 'cart' ? 'active' : '' }}">
            <i class="la la-shopping-cart" aria-hidden="true"></i>
            <span>سبد خرید</span>
            @if($kpCartCount > 0)
                <span class="kp-mf-badge">{{ $kpCartCount }}</span>
            @endif
        </a>

        {{-- ۴) سفارش‌های من --}}
        @if($kpAuthed)
            <a href="{{ route('purchase_history.index') }}" class="kp-mf-item {{ $kpIs(['purchase_history']) ? 'active' : '' }}">
                <i class="la la-file-text-o" aria-hidden="true"></i>
                <span>سفارش‌ها</span>
            </a>
        @else
            <a href="{{ route('user.login') }}" class="kp-mf-item">
                <i class="la la-file-text-o" aria-hidden="true"></i>
                <span>سفارش‌ها</span>
            </a>
        @endif

        {{-- ۵) حساب کاربری --}}
        @if($kpAuthed)
            <a href="{{ route('profile') }}" class="kp-mf-item {{ $kpIs(['profile', 'dashboard']) ? 'active' : '' }}">
                <i class="la la-user" aria-hidden="true"></i>
                <span>حساب من</span>
            </a>
        @else
            <a href="{{ route('user.login') }}" class="kp-mf-item {{ $kpIs(['user.login', 'user.registration']) ? 'active' : '' }}">
                <i class="la la-sign-in" aria-hidden="true"></i>
                <span>ورود</span>
            </a>
        @endif

    </div>
</nav>
