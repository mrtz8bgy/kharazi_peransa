<header class="d-header">
    <div class="kp-announcement-bar">
        <div class="container">
            <span><i class="la la-scissors" aria-hidden="true"></i> خرازی پرنسا؛ همراه دوخت‌ودوز و هنرهای دستی شما</span>
            <a href="{{ route('guide') }}">راهنمای خرید <i class="la la-angle-left" aria-hidden="true"></i></a>
        </div>
    </div>
    <!-- Top Bar -->
    <div class="d-topbar">
        <div class="container">
            <div class="d-topbar-inner">
                {{--
                    نوار اطلاع‌رسانی بالای سایت
                    ────────────────────────────────────────────────
                    مقادیر تماس از جدول `general_settings` خوانده می‌شوند تا
                    از پنل مدیریت قابل ویرایش باشند. سه مورد اصلاح شد:

                      ۱. طرز نوشتن پشتیبانی: «۲۴ ساعته» یک ادعای تأییدنشده
                         بود؛ به «پشتیبانی فروشگاه» تغییر یافت که صادقانه و
                         خنثی است.
                      ۲. ایمیل پیش‌فرض `info@drikana.com` بود (برند قبلی)
                         و حذف شد؛ اگر ایمیل در تنظیمات ثبت نشده باشد،
                         بخش ایمیل به‌کل نمایش داده نمی‌شود.
                      ۳. نشانی «تهران، بازار بزرگ طلا» سخت‌کد شده بود و با
                         فروشگاه خرازی ارتباطی نداشت؛ اکنون از ستون
                         `address` جدول تنظیمات خوانده می‌شود.
                    --}}
                @php $navGs = \App\GeneralSetting::first(); @endphp
                <div class="d-contact-info">
                    @if($navGs && $navGs->phone)
                        <span><i class="la la-phone"></i> پشتیبانی فروشگاه: {{ $navGs->phone }}</span>
                    @endif
                    @if($navGs && $navGs->email)
                        <span><i class="la la-envelope"></i> {{ $navGs->email }}</span>
                    @endif
                    @if($navGs && $navGs->address)
                        <span><i class="la la-map-marker"></i> {{ $navGs->address }}</span>
                    @endif
                </div>
                <ul class="d-top-links">
                    <li><a href="{{ route('orders.track') }}"><i class="la la-map-pin"></i> رهگیری سفارش</a></li>
                    @auth
                        <li><a href="{{ route('dashboard') }}"><i class="la la-user"></i> پنل من</a></li>
                        <li><a href="{{ route('wishlists.index') }}"><i class="la la-heart-o"></i> علاقه‌مندی‌ها</a></li>
                        <li><a href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();"><i class="la la-sign-out"></i> خروج</a>
                            <form class="u-display-none-2" id="logout-form" action="{{ route('logout') }}" method="POST">@csrf</form>
                        </li>
                    @else
                        <li><a href="{{ route('user.login') }}"><i class="la la-sign-in"></i> ورود</a></li>
                        <li><a href="{{ route('user.registration') }}"><i class="la la-user-plus"></i> ثبت‌نام</a></li>
                    @endauth
                </ul>
            </div>
        </div>
    </div>

    <!-- Main Bar -->
    <div class="d-mainbar">
        <div class="container">
            <div class="d-mainbar-inner">
                <button class="d-mobile-toggle" onclick="document.querySelector('.mobile-side-menu').classList.add('open');" aria-label="منو">
                    <i class="la la-bars"></i>
                </button>

                <!-- Logo -->
                {{--
                    لوگو — با پشتیبان‌گیری چندلایه
                    ────────────────────────────────────────────────
                    ترتیب اولویت:
                      ۱. لوگویی که مدیر در پنل مدیریت بارگذاری کرده
                         (`general_settings.logo`).
                      ۲. لوگوی SVG فروشگاه خرازی پرنسا که در همین پروژه
                         ساخته شد.
                      ۳. نام متنی فروشگاه (اگر هیچ تصویری موجود نبود) —
                         بنابراین در هیچ حالتی تصویر شکسته (آیکون
                         broken-image) نشان داده نمی‌شود.

                    متن جانشین (alt) نیز از نام برنامه خوانده می‌شود تا با
                    تغییر برند در `.env`، هم‌زمان به‌روز شود.
                --}}
                <a href="{{ route('home') }}" class="d-logo">
                    @php
                        $gs = \App\GeneralSetting::first();
                        $brandFallback = 'frontend/images/logo/kharazi-logo.svg';
                        if ($gs && $gs->logo && file_exists(public_path($gs->logo))) {
                            $logoUrl = asset($gs->logo);
                        } elseif (file_exists(public_path($brandFallback))) {
                            $logoUrl = asset($brandFallback);
                        } else {
                            $logoUrl = null;
                        }
                    @endphp
                    @if($logoUrl)
                        <img class="u-height-48px" src="{{ $logoUrl }}"
                             alt="{{ config('app.name', 'خرازی پرنسا') }}">
                    @else
                        <span class="d-logo-fallback">{{ config('app.name', 'خرازی پرنسا') }}</span>
                    @endif
                </a>

                <!-- Search -->
                <div class="d-search">
                    <form action="{{ route('search') }}" method="GET" class="d-search-form">
                        <input type="text" id="search" name="q" placeholder="جستجوی نخ، سوزن، روبان، کاموا، پارچه..." autocomplete="off" required>
                        <button type="submit" aria-label="جستجو"><i class="la la-search la-flip-horizontal"></i></button>
                        <div class="typed-search-box d-none">
                            <div class="search-preloader"><div class="loader"><div></div><div></div><div></div></div></div>
                            <div class="search-nothing d-none"></div>
                            <div id="search-content"></div>
                        </div>
                    </form>
                </div>

                <!-- Header Icons -->
                {{--
                    آیکون‌های سربرگ — فروشگاه خرازی پرنسا
                    ────────────────────────────────────────────────
                    پیش از این دو آیکون نخست به «استعلام شناسنامه طلا» و
                    «اعلام سرقت/مفقودی» اشاره می‌کردند که بخشی از ماژول
                    منسوخ‌شده جواهرات بودند. اکنون جای آن‌ها دو لینک
                    کاربردی فروشگاه خرازی نشسته است:
                      • پیگیری سفارش  → orders.track
                      • راهنمای خرید → articles.index
                    هر دو مسیر عمومی‌اند (بدون نیاز به ورود) و در
                    `php artisan route:list` تأیید شده‌اند.
                --}}
                <div class="d-header-icons">
                    <a href="{{ route('orders.track') }}" class="d-icon-btn u-text-decoration-none" title="پیگیری سفارش">
                        <i class="la la-truck"></i>
                    </a>
                    <a href="{{ route('articles.index') }}" class="d-icon-btn hide-sm u-text-decoration-none" title="راهنمای خرید">
                        <i class="la la-book"></i>
                    </a>
                    <a href="{{ route('compare') }}" class="d-icon-btn hide-sm u-text-decoration-none" title="مقایسه">
                        <i class="la la-refresh"></i>
                        @if(Session::has('compare'))<span class="badge">{{ count((Session::get('compare') ?? [])) }}</span>@else<span class="badge">0</span>@endif
                    </a>
                    <a href="{{ route('wishlists.index') }}" class="d-icon-btn u-text-decoration-none" title="علاقه‌مندی">
                        <i class="la la-heart-o"></i>
                    </a>
                    <div class="d-user-dropdown">
                        <a href="{{ route('cart') }}" class="d-icon-btn u-text-decoration-none" title="سبد خرید" id="cart_items_sidenav_box">
                            <i class="la la-shopping-cart"></i>
                            @if(Session::has('cart'))<span class="badge" id="cart_items_sidenav">{{ count((Session::get('cart') ?? [])) }}</span>@else<span class="badge" id="cart_items_sidenav">0</span>@endif
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Secondary Navigation -->
    <div class="d-nav">
        <div class="container">
            <div class="d-nav-inner">
                <a href="{{ route('categories.all') }}" class="d-cat-btn">
                    <i class="la la-bars"></i>
                    <span>همه دسته‌بندی‌ها</span>
                </a>
                <ul class="d-nav-links">
                    <li class="{{ request()->routeIs('home') ? 'active' : '' }}"><a href="{{ route('home') }}"><i class="la la-home"></i> خانه</a></li>

                    {{--
                        لینک دسته‌بندی‌های اصلی — پویا از پایگاه داده
                        ────────────────────────────────────────────────
                        پیش از این، سه لینک دسته‌بندی به‌صورت «ناموجود سخت‌کد»
                        نوشته شده بودند و slug دسته‌بندی‌های طلا/ساعت/سنگ
                        قیمتی را مستقیماً در ویو نگه می‌داشتند؛ با هر تغییر
                        دسته‌بندی در پنل مدیریت، لینک‌ها می‌شکستند.

                        اکنون فهرست از جدول `categories` خوانده می‌شود، فقط
                        دسته‌بندی‌های سطح یک (`top = 1`) و منتشرشده، و
                        حداکثر ۶ مورد. بنابراین با افزودن دسته‌بندی‌های
                        خرازی از پنل مدیریت، این منو خودکار به‌روز می‌شود و
                        هیچ تغییری در کد لازم نیست.

                        نکته: فیلتر `published` فقط زمانی اعمال می‌شود که
                        این ستون در جدول `categories` واقعاً وجود داشته
                        باشد؛ چون در اسکیمای فعلی این ستون تعریف نشده و
                        فراخوانی کورکورانه آن باعث خطای SQL می‌شد.
                    --}}
                    @php
                        try {
                            $navCategories = \Illuminate\Support\Facades\Schema::hasTable('categories')
                                ? \App\Category::query()
                                    ->when(
                                        \Illuminate\Support\Facades\Schema::hasColumn('categories', 'published'),
                                        function ($q) { $q->where('published', 1); }
                                    )
                                    ->where('top', 1)
                                    ->orderBy('id')
                                    ->limit(6)
                                    ->get()
                                : collect();
                        } catch (\Exception $e) {
                            $navCategories = collect();
                        }
                    @endphp

                    @foreach ($navCategories as $navCat)
                        <li class="{{ request()->routeIs('products.category') && request()->route('category_slug') === $navCat->slug ? 'active' : '' }}">
                            <a href="{{ route('products.category', $navCat->slug) }}">
                                <i class="la la-th-large"></i> {{ __($navCat->name) }}
                            </a>
                        </li>
                    @endforeach

                    <li class="{{ request()->routeIs('products.new') ? 'active' : '' }}">
                        <a href="{{ route('products.new') }}"><i class="la la-star-o"></i> جدیدترین‌ها</a>
                    </li>
                    <li class="{{ request()->routeIs('products.discounted') ? 'active' : '' }}">
                        <a href="{{ route('products.discounted') }}"><i class="la la-tag"></i> تخفیف‌دارها</a>
                    </li>

                    {{-- لینک مقالات برای همه کاربران — صفحه عمومی و بدون نیاز به ورود --}}
                    <li class="{{ request()->routeIs('articles.*') ? 'active' : '' }}">
                        <a href="{{ route('articles.index') }}"><i class="la la-book"></i> مقالات و راهنما</a>
                    </li>

                    <li><a href="{{ route('contact') }}"><i class="la la-phone"></i> تماس با ما</a></li>
                </ul>
                <div class="d-nav-cta">
                    @if (\App\BusinessSetting::where('type', 'vendor_system_activation')->first()->value == 1)
                        <a href="{{ route('shops.create') }}" class="btn-lux btn-lux-primary u-padding-8px-20px-font-size-13px">
                            <i class="la la-plus"></i> فروشنده شوید
                        </a>
                    @endif
                </div>
            </div>
        </div>
    </div>
</header>

@php
    try {
        $luxMegaCategories = \Illuminate\Support\Facades\Schema::hasTable('categories')
            ? \App\Category::with(['subcategories' => function($q){
                $q->orderBy('name')->with(['subsubcategories' => function($sq){ $sq->orderBy('name')->take(8); }]);
            }])->whereHas('subcategories')->orderBy('name')->take(11)->get()
            : collect();
    } catch (\Exception $e) { $luxMegaCategories = collect(); }
    /*
    |-------------------------------------------------------------------
    | آیکون دسته‌بندی‌ها — فروشگاه خرازی پرنسا
    |-------------------------------------------------------------------
    |
    | ── چرا این ساختار عوض شد؟ ─────────────────────────────────────
    | پیش از این، کلیدواژه‌های فهرست به فایل‌های SVG اختصاصی طلا و
    | جواهر اشاره می‌کردند (ring.svg، necklace.svg، diamond.svg،
    | crown.svg، coin.svg، watch.svg، antique.svg). این تصاویر متعلق به
    | هویت قبلی سامانه بودند و در فروشگاه خرازی معنا ندارند؛ بنابراین
    | جایگزین شدند.
    |
    | جای فایل تصویر، اکنون «کلاس آیکون Line Awesome» برگردانده می‌شود.
    | مزیت‌ها:
    |   ۱. هیچ فایل تصویری تازه‌ای لازم نیست و امکان تصویر شکسته
    |      (404) از بین می‌رود.
    |   ۲. آیکون با رنگ و اندازه متن هماهنگ می‌شود (CSS، نه تصویر).
    |   ۳. افزودن دسته‌بندی تازه از پنل مدیریت، هیچ تغییر کدی لازم ندارد؛
    |      اگر کلیدواژه‌ای تطبیق پیدا نکند، آیکون پیش‌فرض نمایش می‌یابد.
    |
    | تمام کلاس‌های زیر در `public/frontend/css/line-awesome.min.css`
    | موجود بودنشان بررسی شده است.
    */
    $luxCatIcons = [
        // نخ، کاموا و بافتنی
        'نخ'      => 'la-leaf',
        'کاموا'   => 'la-random',
        'بافت'    => 'la-random',
        // گلدوزی، شماره‌دوزی و هنری
        'گلدوزی'  => 'la-magic',
        'شماره'   => 'la-magic',
        'هنری'    => 'la-paint-brush',
        'تزئین'   => 'la-star-o',
        // دکمه، قزن، مروارید، منجوق و مهره
        'دکمه'    => 'la-circle-o',
        'قزن'     => 'la-circle-o',
        'مروارید' => 'la-circle',
        'منجوق'   => 'la-circle',
        'مهره'    => 'la-circle',
        // زیپ و روبان و نوار
        'زیپ'     => 'la-ellipsis-h',
        'روبان'   => 'la-minus',
        'نوار'    => 'la-minus',
        // تور، دانتل و خرج‌کار
        'تور'     => 'la-th',
        'دانتل'   => 'la-th',
        'خرج'     => 'la-th',
        // کش
        'کش'      => 'la-arrows-h',
        // ابزار خیاطی و اندازه‌گیری
        'قیچی'    => 'la-scissors',
        'ابزار'   => 'la-wrench',
        'متر'     => 'la-arrows-h',
        'اندازه'  => 'la-arrows-h',
        'بشکاف'   => 'la-cut',
        'سوزن'    => 'la-map-pin',
        // لوازم مصرفی، بسته‌های ترکیبی و ویژه
        'مصرفی'   => 'la-cube',
        'بسته'    => 'la-gift',
        'ویژه'    => 'la-star',
    ];

    /*
     آیکون پیش‌فرض: وقتی نام دسته‌بندی با هیچ کلیدواژه‌ای تطبیق نکند.
     عمداً یک آیکون عمومی است، نه آیکون طلا/جواهر.
    */
    $luxDefaultIcon = 'la-th-large';
@endphp
<section class="lux-mega-section">
    <div class="lux-mega-container">
        <div class="lux-mega-trigger" id="luxMegaTrigger">
            <a href="#" class="lux-cat-btn" aria-expanded="false">
                <i class="la la-bars"></i>
                <span>همه دسته‌بندی‌های محصولات</span>
                <i class="la la-angle-down"></i>
            </a>
            <ul class="lux-mega-list" id="luxMegaList">
                @foreach($luxMegaCategories as $cat)
                    @php
                        /*
                         انتخاب آیکون بر پایه کلیدواژه نام دسته‌بندی.
                         ترتیب کلیدواژه‌های فهرست مهم است؛ نخستین تطبیق
                         برنده می‌شود. اگر هیچ تطبیقی پیدا نشد، آیکون
                         پیش‌فرض عمومی جایگزین می‌گردد (نه آیکون طلا/جواهر).
                        */
                        $catIcon = $luxDefaultIcon;
                        foreach($luxCatIcons as $key => $icon) {
                            if(mb_strpos($cat->name, $key) !== false) { $catIcon = $icon; break; }
                        }
                    @endphp
                    <li class="lux-mega-item">
                        <a href="{{ route('products.category', $cat->slug) }}" class="lux-mega-link">
                            <span class="lux-mega-ico">
                                @if($cat->icon && file_exists(public_path($cat->icon)))
                                    <img src="{{ asset($cat->icon) }}" alt="{{ $cat->name }}">
                                @else
                                    <i class="la {{ $catIcon }}"></i>
                                @endif
                            </span>
                            <span class="lux-mega-name">{{ __($cat->name) }}</span>
                            @if($cat->subcategories->isNotEmpty())
                                <i class="la la-angle-left lux-mega-arrow"></i>
                            @endif
                        </a>
                        @if($cat->subcategories->isNotEmpty())
                            <div class="lux-mega-sub">
                                <div class="row u-margin-0-2">
                                    @foreach($cat->subcategories->take(9) as $sub)
                                        <div class="col-lg-4 col-md-6 u-padding-6px">
                                            <a href="{{ route('products.subcategory', $sub->slug) }}" class="lux-sub-cat-title">
                                                @if($sub->icon && file_exists(public_path($sub->icon)))
                                                    <img class="u-width-18px-height-18px-object-fit-contain" src="{{ asset($sub->icon) }}" alt="">
                                                @else
                                                    <i class="la la-folder-o u-font-size-14px-2"></i>
                                                @endif
                                                <span>{{ $sub->name }}</span>
                                            </a>
                                            @if($sub->subsubcategories->isNotEmpty())
                                                <ul class="lux-sub-cat-list">
                                                    @foreach($sub->subsubcategories as $subsub)
                                                        <li><a href="{{ route('products.subsubcategory', $subsub->slug) }}">{{ $subsub->name }}</a></li>
                                                    @endforeach
                                                </ul>
                                            @endif
                                        </div>
                                    @endforeach
                                </div>
                                <a href="{{ route('products.category', $cat->slug) }}" class="lux-mega-banner u-text-decoration-none">
                                    {{-- آیکون جایگزین شد: پیش‌تر فایل SVG الماسِ برند قبلی بود --}}
                                    <span class="lux-mega-banner-ico"><i class="la {{ $catIcon }}"></i></span>
                                    <div class="lux-mega-banner-text">
                                        <strong>مشاهده همه {{ __($cat->name) }}</strong>
                                        <span>تنوع کامل محصولات، قیمت مناسب و ارسال سریع به سراسر کشور</span>
                                    </div>
                                </a>
                            </div>
                        @endif
                    </li>
                @endforeach
                <li class="lux-mega-item lux-mega-viewall">
                    <a href="{{ route('categories.all') }}" class="lux-mega-link">
                        <i class="la la-th-large u-font-size-18px-2"></i>
                        <span>مشاهده همه دسته‌بندی‌ها</span>
                        <i class="la la-arrow-left"></i>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</section>

<!-- Mobile side menu (kept from original with dark theme adjustments) -->
@include('frontend.partials.mobile_menu_lux')

<script>
(function(){
    var trigger = document.getElementById('luxMegaTrigger');
    var list = document.getElementById('luxMegaList');
    var btn = trigger ? trigger.querySelector('.lux-cat-btn') : null;
    var items = trigger ? trigger.querySelectorAll('.lux-mega-item') : [];
    function isMobile(){ return window.innerWidth <= 992; }

    // Toggle root list on mobile
    if(btn) btn.addEventListener('click', function(e){
        e.preventDefault();
        if(isMobile()) {
            trigger.classList.toggle('open');
        } else {
            trigger.classList.toggle('force-open');
        }
        btn.setAttribute('aria-expanded', trigger.classList.contains('open') || trigger.classList.contains('force-open') ? 'true' : 'false');
    });

    items.forEach(function(item){
        var link = item.querySelector('.lux-mega-link');
        link.addEventListener('click', function(e){
            if(!isMobile()) return;
            var hasSub = item.querySelector('.lux-mega-sub');
            if(hasSub){
                e.preventDefault();
                items.forEach(function(i){ if(i!==item) i.classList.remove('open'); });
                item.classList.toggle('open');
            }
        });
        // Desktop hover
        item.addEventListener('mouseenter', function(){
            if(!isMobile()) return;
        });
    });

    // Close on outside click (mobile)
    document.addEventListener('click', function(e){
        if(!trigger) return;
        if(!trigger.contains(e.target)){
            trigger.classList.remove('open');
            trigger.classList.remove('force-open');
            items.forEach(function(i){ i.classList.remove('open'); });
            if(btn) btn.setAttribute('aria-expanded', 'false');
        }
    });

    // Also wire up the "همه دسته‌بندی‌ها" button in nav to toggle
    var catBtn = document.querySelector('.d-cat-btn');
    if(catBtn && trigger && catBtn !== btn){
        catBtn.addEventListener('click', function(e){
            e.preventDefault();
            if(isMobile()){
                trigger.classList.toggle('open');
                trigger.scrollIntoView({behavior:'smooth', block:'start'});
            } else {
                // simulate hover
                trigger.classList.toggle('force-open');
            }
        });
    }
})();
</script>
