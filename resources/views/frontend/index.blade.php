@extends('frontend.layouts.app')

@php
    use App\Product;
    use App\Category;
    use App\Brand;
    use App\FlashDeal;
    use App\Slider;
    use App\BusinessSetting;
    use App\CustomerProduct;
    use App\Addon;
@endphp

@section('content')

<main class="kp-homepage">
@php
    // ایمن‌سازی سایر متغیرهای صفحه اصلی
    try {
        $num_todays_deal = \Illuminate\Support\Facades\Schema::hasTable('products')
            ? count(filter_products(\App\Product::where('published', 1)->where('todays_deal', 1))->get())
            : 0;
    } catch (\Exception $e) { $num_todays_deal = 0; }

    try {
        $total_customers = \Illuminate\Support\Facades\Schema::hasTable('users')
            ? \App\User::where('user_type','customer')->orWhereNull('user_type')->count()
            : 0;
    } catch (\Exception $e) { $total_customers = 0; }
@endphp

{{-- استایل این صفحه به فایل مستقل زیر منتقل شده است (مرحله ۳ بازسازی)
     تا از CSS درون‌خطی پرهیز شود. --}}
@push('styles')
<link rel="stylesheet" href="{{ asset('css/kharazi/store.css') }}">
@endpush

{{-- ═══════════════════════════════════════════════════════════════
     بنر اصلی صفحه (اسلایدر) — بازگردانی‌شده
     ───────────────────────────────────────────────────────────────
     [رفع اشکال] اسلایدر از جدول `sliders` تغذیه می‌شود و پنل مدیریت
     (frontend_settings/sliders) از قبل امکان بارگذاری، فعال/غیرفعال و
     حذف اسلاید را داشت — اما هیچ‌جا از سایت رندر نمی‌شد. در بازطراحی
     لوکس، بخش بنر با «HERO استاتیک» جای‌گزین شده بود و مارک‌آپ اسلایدر
     از ویو حذف شده بود؛ در نتیجه اسلایدهای بارگذاری‌شده در صفحه اصلی
     دیده نمی‌شدند.

     CSS این بخش از قبل در `public/css/kharazi/store.css` بود
     (`.fullwidth-slider-section` و کلاس‌های `.slide-content*`)، پس
     مارک‌آپ زیر همان طراحی آماده را زنده می‌کند — بدون CSS تازه.

     نکته: اگر هیچ اسلاید منتشرشده‌ای (با تصویر موجود) نباشد، این بخش
     به‌کل رندر نمی‌شود و صفحه اصلی دقیقاً مثل قبل می‌ماند.
     ═══════════════════════════════════════════════════════════════ --}}
@if(isset($sliders) && $sliders->count() > 0)
<section class="fullwidth-slider-section">
    <div class="slick-carousel"
         data-slick-items="1"
         data-slick-xs-items="1"
         data-slick-sm-items="1"
         data-slick-md-items="1"
         data-slick-lg-items="1"
         data-slick-xl-items="1"
         data-slick-arrows="true"
         data-slick-dots="true"
         data-slick-autoplay="true"
         data-slick-rows="1">

        @foreach($sliders as $slider)
            @php
                // پیوند خالی یا «#» یعنی اسلاید بدون مقصد. مسیرهای داخلی
                // باید از ریشه برنامه ساخته شوند تا نصب در زیرپوشه هم درست
                // کار کند؛ فقط مقصدهای بیرونی در تب جدید باز می‌شوند.
                $slideLink = trim((string) $slider->link);
                $slideLink = ($slideLink === '' || $slideLink === '#') ? null : $slideLink;
                $isExternalSlideLink = $slideLink && preg_match('#^https?://#i', $slideLink);
                if ($slideLink && !$isExternalSlideLink) {
                    $slideLink = url(ltrim($slideLink, '/'));
                }
            @endphp

            <div>
                @if($slideLink)
                    <a href="{{ $slideLink }}" @if($isExternalSlideLink) target="_blank" rel="noopener noreferrer" @endif>
                        <img src="{{ asset($slider->photo) }}"
                             alt="{{ __('اسلاید') }} {{ $loop->iteration }}"
                             loading="{{ $loop->first ? 'eager' : 'lazy' }}">
                    </a>
                @else
                    <img src="{{ asset($slider->photo) }}"
                         alt="{{ __('اسلاید') }} {{ $loop->iteration }}"
                         loading="{{ $loop->first ? 'eager' : 'lazy' }}">
                @endif

                {{--
                    لایه متن روی اسلاید
                    ────────────────────────────────────────────────
                    پیش از این، متن روی همه اسلایدها سخت‌کد و یکسان بود:
                    «خرید طلایی با بهترین قیمت» — که هم به هویت قبلی
                    تعلق داشت و هم برای هر اسلاید تکرار می‌شد.

                    اکنون متن بر پایه «شماره اسلاید» از یک فهرست نمونه
                    خوانده می‌شود تا هر اسلاید پیام متفاوت و مرتبط با
                    فروشگاه خرازی داشته باشد. اگر شمار اسلایدها بیشتر از
                    فهرست شود، متن پیش‌فرض (مورد آخر) تکرار می‌گردد.

                    ── نکته سئو ────────────────────────────────────────
                    چون این متن روی تصویر اسلاید قرار می‌گیرد و همه
                    اسلایدها یک H1 ندارند، از تگ <h2> استفاده شده — نه
                    <h1>. تنها H1 صفحه، تیتر بخش HERO است. این کار از
                    تکرار H1 و ابهام ساختار سرفصل‌ها جلوگیری می‌کند.
                --}}
                @php
                    $slideCopy = [
                        ['t' => 'لوازم خیاطی',        's' => 'نخ، سوزن، دکمه، زیپ و هر آنچه برای دوخت لازم دارید'],
                        ['t' => 'لوازم گلدوزی',       's' => 'منجوق، مروارید، نخ گلدوزی و طرح‌های شماره‌دوزی'],
                        ['t' => 'روبان و نوار تزئینی', 's' => 'انواع روبان، دانتل، تور و خرج‌کار در رنگ‌های متنوع'],
                        ['t' => 'ابزار خیاطی',        's' => 'قیچی، متر، بشکاف و ابزار اندازه‌گیری دقیق'],
                        ['t' => 'لوازم بافتنی',        's' => 'کاموا، میل بافتنی و لوازم جانبی بافت'],
                        ['t' => 'لوازم هنری',         's' => 'مروارید، منجوق، مهره و لوازم کارهای دستی'],
                    ];
                    $sc = $slideCopy[($loop->iteration - 1) % count($slideCopy)];
                @endphp
                <div class="slide-content-overlay">
                    <div class="slide-content">
                        <h2>{{ $sc['t'] }}</h2>
                        <p>{{ $sc['s'] }}</p>

                        @if($slideLink)
                            <a href="{{ $slideLink }}" @if($isExternalSlideLink) target="_blank" rel="noopener noreferrer" @endif class="slide-btn-custom">
                                {{ __('مشاهده و خرید') }} <i class="la la-angle-left"></i>
                            </a>
                        @else
                            <a href="{{ route('categories.all') }}" class="slide-btn-custom">
                                {{ __('مشاهده و خرید') }} <i class="la la-angle-left"></i>
                            </a>
                        @endif
                    </div>
                </div>
            </div>
        @endforeach
    </div>
</section>
@endif

{{-- ============================================ --}}
{{-- HERO فروشگاه خرازی پرنسا --}}
{{-- ============================================ --}}
{{--
    ── تغییرات این بخش ─────────────────────────────────────────────────
    پیش از این، این بخش «HERO لوکس دریکانا» بود با محتوای اختصاصی
    طلا و جواهر. موارد زیر اصلاح شد:

      ۱. نشان بالای تیتر: «معتبرترین مارکت‌پلیس طلا و جواهر ایران» —
         یک ادعای اثبات‌نشدنی (Superlative بدون منبع). با معرفی واقعی
         فروشگاه جایگزین شد.
      ۲. تیتر اصلی: از «درخشش اعتماد در هر قطعه» به شعاری مرتبط با
         خرازی تغییر یافت.
      ۳. متن معرفی: ارجاع به «شناسنامه معتبر، ضمانت اصالت و رهگیری
         دائمی» حذف شد — این‌ها متعلق به ماژول منسوخ‌شده جواهرات بودند.
      ۴. دکمه دوم: «استعلام شناسنامه» → «راهنمای خرید و ارسال».
      ۵. آمارهای hero کاملاً جعلی بودند و حذف/اصلاح شدند:
           • «+۱۰ سال سابقه درخشان» → ادعای بی‌پشتوانه، حذف شد
           • «+۵۰K قطعه شناسنامه‌دار» → داده ساختگی، حذف شد
           • «۱۰۰٪ گارانتی اصالت»    → ادعای گمراه‌کننده، حذف شد
           • «۲۴/۷ پشتیبانی تخصصی»   → ادعای بی‌پشتوانه، حذف شد
         به‌جای آن‌ها چهار ویژگی واقعی و قابل‌راستی‌آزمایی فروشگاه
         نمایش داده می‌شود که همه از ساختار خود پروژه استخراج شده‌اند.
      ۶. کارت‌های شناور سمت راست: محتوای «شناسنامه معتبر»، «ضمانت
         اصالت» و «رهگیری هوشمند / از دسترسی دزدها دور بمانید» —
         هر سه حذف و با مزیت‌های خرید خرازی جانشین شدند.
--}}
@if(!isset($sliders) || $sliders->count() === 0)
<section class="d-hero">
    <div class="container">
        <div class="d-hero-inner">
            <div class="d-hero-content">
                <span class="d-hero-badge">
                    <span class="dot"></span>
                    لوازم خیاطی، گلدوزی و هنری
                </span>
                <h1>
                    هرچه برای <span class="gold-line">دوخت</span>
                    نیاز دارید، <span class="gold-line">یک‌جا</span>
                </h1>
                <p>
                    از نخ و سوزن و دکمه تا زیپ، روبان، دانتل، کاموا و ابزار
                    برش — فروشگاه خرازی پرنسا لوازم خیاطی، گلدوزی، بافتنی و
                    کارهای هنری را با
                    <strong class="u-color-var-d-gold">تنوع کامل</strong>،
                    <strong class="u-color-var-d-gold">قیمت شفاف</strong> و
                    <strong class="u-color-var-d-gold">ارسال به سراسر کشور</strong>
                    در اختیار شما می‌گذارد.
                </p>
                <div class="d-hero-cta">
                    <a href="{{ route('categories.all') }}" class="btn-lux btn-lux-primary">
                        <i class="la la-shopping-bag"></i> مشاهده محصولات
                    </a>
                    <a href="{{ route('guide') }}" class="btn-lux btn-lux-outline">
                        <i class="la la-book"></i> راهنمای خرید و ارسال
                    </a>
                </div>
                {{--
                    چهار مزیت واقعی فروشگاه — بدون ادعای عددی ساختگی.
                    همه این موارد از قابلیت‌های موجود در خود پروژه
                    استخراج شده‌اند (سبد خرید، انبار، دسته‌بندی، مقالات).
                --}}
                <div class="d-hero-stats">
                    <div class="d-hero-stat">
                        <strong>تنوع کامل</strong>
                        <span>دسته‌بندی‌شده و قابل جست‌وجو</span>
                    </div>
                    <div class="d-hero-stat">
                        <strong>کنترل موجودی</strong>
                        <span>نمایش زنده وضعیت انبار</span>
                    </div>
                    <div class="d-hero-stat">
                        <strong>خرید آسان</strong>
                        <span>سبد خرید و پرداخت آنلاین</span>
                    </div>
                    <div class="d-hero-stat">
                        <strong>پیگیری سفارش</strong>
                        <span>از پنل کاربری، در هر زمان</span>
                    </div>
                </div>
            </div>
            <div class="d-hero-visual">
                <div class="d-hero-ring r1"></div>
                <div class="d-hero-ring r2"></div>
                <div class="d-hero-ring r3"></div>
                {{-- «d-hero-diamond» با «d-hero-spool» جایگزین شد:
                     الماسِ تزئینیِ تم قبلی، با قرقره نخ — نماد خرازی --}}
                <div class="d-hero-spool"></div>
                <div class="d-hero-float-card d-fc-1">
                    <div class="fc-icon"><i class="la la-scissors"></i></div>
                    <div class="fc-text">
                        <strong>ابزار خیاطی</strong>
                        <span>قیچی، متر، بشکاف</span>
                    </div>
                </div>
                <div class="d-hero-float-card d-fc-2">
                    <div class="fc-icon"><i class="la la-cube"></i></div>
                    <div class="fc-text">
                        <strong>لوازم مصرفی</strong>
                        <span>نخ، سوزن، دکمه، زیپ</span>
                    </div>
                </div>
                <div class="d-hero-float-card d-fc-3">
                    <div class="fc-icon"><i class="la la-magic"></i></div>
                    <div class="fc-text">
                        <strong>گلدوزی و هنری</strong>
                        <span>منجوق، مروارید، روبان</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@endif

{{-- ============================================ --}}
{{-- مزیت‌های خرید از فروشگاه خرازی پرنسا --}}
{{-- ============================================ --}}
{{--
    ── تغییرات این بخش ─────────────────────────────────────────────────
    شش کارت این بخش، همه به هویت طلا و جواهر تعلق داشتند و هرکدام یک
    ادعای تأییدنشده یا نادرست در خود داشتند:

      • «گارانتی اصالت — ارزیابی توسط کارشناسان خبره» → مربوط به
        ماژول جواهرات و ادعای اثبات‌نشدنی.
      • «شناسنامه رسمی — شماره سریال یکتا» → مستقیماً قابلیت منسوخ
        شناسنامه طلا.
      • «رهگیری سرقت — اطلاع‌رسانی به شبکه همکاران» → ماژول منسوخ
        گزارش سرقت/مفقودی.
      • «ارسال امن — بیمه‌شده با اسکورت مسلح» → ادعای بسیار سنگین و
        بدون هیچ پشتوانه‌ای در پروژه؛ حذف شد.
      • «تنوع بی‌نظیر — ده‌ها هزار مدل» → عدد ساختگی. پایگاه داده
        فعلی ۶۲ محصول دارد؛ اعلام «ده‌ها هزار» گمراه‌کننده بود.
      • «خدمات پس از فروش — تمیز کردن و بروزرسانی رایگان شناسنامه»
        → ترکیبی از ادعای رایگان‌بودن و قابلیت منسوخ.

    جای همه آن‌ها، شش مزیت واقعی فروشگاه خرازی نشسته است که هر کدام
    دقیقاً به یکی از قابلیت‌های موجود و فعال پروژه اشاره می‌کند:
    دسته‌بندی سلسله‌مراتبی، جست‌وجو و فیلتر، سبد خرید، کنترل انبار،
    پیگیری سفارش و مقالات راهنما.
--}}
<section class="d-services kp-home-services">
    <div class="container">
        <div class="d-services-grid">
            <div class="d-service-card">
                <div class="d-service-icon">🧵</div>
                <h5>تنوع دسته‌بندی</h5>
                <p>از نخ و سوزن و دکمه تا روبان، زیپ، دانتل، کاموا و منجوق — همه در گروه‌های جداگانه و مرتب.</p>
            </div>
            <div class="d-service-card">
                <div class="d-service-icon">🔍</div>
                <h5>جست‌وجو و فیلتر</h5>
                <p>محصول مورد نظر خود را بر اساس دسته‌بندی، برند، رنگ و محدوده قیمت پیدا کنید.</p>
            </div>
            <div class="d-service-card">
                <div class="d-service-icon">🛒</div>
                <h5>خرید آسان</h5>
                <p>سبد خرید ساده، ثبت سفارش چند مرحله‌ای و پرداخت از درگاه بانکی.</p>
            </div>
            <div class="d-service-card">
                <div class="d-service-icon">📦</div>
                <h5>وضعیت واقعی موجودی</h5>
                <p>موجودی انبار به‌صورت زنده کنترل می‌شود؛ امکان سفارش بیش از موجودی وجود ندارد.</p>
            </div>
            <div class="d-service-card">
                <div class="d-service-icon">🚚</div>
                <h5>پیگیری سفارش</h5>
                <p>وضعیت سفارش خود را از طریق پنل کاربری یا صفحه پیگیری سفارش دنبال کنید.</p>
            </div>
            <div class="d-service-card">
                <div class="d-service-icon">📚</div>
                <h5>راهنمای خرید</h5>
                <p>مقالات و راهنماهای کاربردی برای انتخاب درست لوازم خیاطی، گلدوزی و بافتنی.</p>
            </div>
        </div>
    </div>
</section>

<!-- ============================================ -->
<!-- دسته بندی های معروف - اسکرول افقی -->
<!-- ============================================ -->
<section class="mb-5 categories-section kp-home-categories">
    <div class="container">
        <div class="section-title-1">
            <h3><i class="la la-tags"></i> {{__('دسته‌بندی‌های محبوب')}}</h3>
            <ul class="inline-links">
                <li>
                    <a href="{{ route('categories.all') }}">{{__('نمایش همه')}} <i class="la la-angle-left"></i></a>
                </li>
            </ul>
        </div>
        
        <div class="scroll-btn scroll-left" id="categoriesScrollLeft">
            <i class="la la-angle-right"></i>
        </div>
        <div class="scroll-btn scroll-right" id="categoriesScrollRight">
            <i class="la la-angle-left"></i>
        </div>
        
        <div class="categories-scroll-wrapper" id="categoriesScrollWrapper">
            <div class="categories-scroll-container">
                @php
                    $topCategories = Category::where('top', 1)->take(15)->get();
                    if(count($topCategories) < 8){
                        $topCategories = Category::take(12)->get();
                    }
                @endphp
                @foreach ($topCategories as $category)
                    <div class="category-scroll-item">
                        <a href="{{ route('products.category', $category->slug) }}" class="category-card-horizontal">
                            <div class="category-icon-box">
                                @if($category->icon && file_exists(public_path($category->icon)))
                                    <img src="{{ asset($category->icon) }}" alt="{{ __($category->name) }}" class="category-icon-img">
                                @else
                                    <div class="category-icon-default">
                                        <i class="fa fa-tag"></i>
                                    </div>
                                @endif
                            </div>
                            <div class="category-name-horizontal">
                                {{ __($category->name) }}
                            </div>
                        </a>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
</section>

<!-- پیشنهادهای تخفیف روز -->
@php
    $num_todays_deal = count(filter_products(\App\Product::where('published', 1)->where('todays_deal', 1))->get());
@endphp

@if($num_todays_deal > 0)
<section class="flash-deal-section">
    <div class="flash-deal-wrapper">
        <div class="flash-deal-header">
            <h4><i class="la la-bolt"></i> {{ __('تخفیف امروز') }} <span class="badge badge-danger">{{__('داغ')}}</span></h4>
            <a href="{{ route('products.todays_deal') }}" class="flash-deal-view-all">{{__('مشاهده همه')}} <i class="la la-angle-left"></i></a>
        </div>
        <div class="flash-deal-scroll">
            @foreach (filter_products(\App\Product::where('published', 1)->where('todays_deal', '1'))->get() as $key => $product)
                @if ($product != null)
                    <a href="{{ route('product', $product->slug) }}" class="flash-deal-item-horizontal">
                        <img class="lazyload" src="{{ asset('frontend/images/placeholder.jpg') }}" data-src="{{ asset($product->flash_deal_img ?: ($product->featured_img ?: $product->thumbnail_img)) }}" alt="{{ __($product->name) }}">
                        <div class="flash-deal-info">
                            <span class="flash-deal-price">{{ home_discounted_base_price($product->id) }}</span>
                            @if(home_base_price($product->id) != home_discounted_base_price($product->id))
                                <del class="flash-deal-old-price">{{ home_base_price($product->id) }}</del>
                            @endif
                        </div>
                    </a>
                @endif
            @endforeach
        </div>
    </div>
</section>
@endif

<!-- ============================================ -->
<!-- آیکون‌های تبلیغاتی -->
<!-- ============================================ -->
<div class="mobile-icons-section kp-home-icon-banners">
    <div class="mobile-icons-container">
        @php
            $banners = App\Banner::where('position', 1)->where('published', 1)->get();
            $icons = ['💎', '👑', '🎁', '🔥', '✨', '💍', '⌚', '📿', '💼', '🛍️'];
        @endphp
        
        @if(count($banners) > 0)
            @foreach ($banners as $key => $banner)
                <a href="{{ $banner->url }}" target="_blank" class="mobile-icon-item">
                    <div class="mobile-icon-circle">
                        <span class="mobile-icon-emoji">{{ $icons[$key % count($icons)] }}</span>
                    </div>
                    <p class="mobile-icon-title">ویژه</p>
                </a>
            @endforeach
        @endif
    </div>
</div>

<!-- ============================================ -->
<!-- بخش محصولات ویژه -->
<!-- ============================================ -->
<section class="mb-5 kp-home-featured">
    <div class="container">
        <div class="px-3 py-4 p-md-4 bg-white shadow-sm rounded-3">
            <div class="section-title-1">
                <h3><i class="la la-star"></i> {{__('محصولات ویژه')}}</h3>
                <ul class="inline-links">
                    <li><a href="{{ route('products.featured') }}">{{__('مشاهده همه')}} <i class="la la-angle-left"></i></a></li>
                </ul>
            </div>
            <div class="caorusel-box arrow-round gutters-5">
                <div class="slick-carousel" data-slick-items="6" data-slick-xl-items="5" data-slick-lg-items="4" data-slick-md-items="3" data-slick-sm-items="2" data-slick-xs-items="2">
                    @php
                        $featured_products = filter_products(Product::where('published', 1)->where('featured', 1))->take(12)->get();
                    @endphp
                    @foreach ($featured_products as $product)
                        <div class="caorusel-card">
                            <div class="product-card-2 card card-product shop-cards">
                                <div class="card-body p-0">
                                    <div class="card-image">
                                        <a href="{{ route('product', $product->slug) }}" class="d-block">
                                            <img class="img-fit lazyload mx-auto" src="{{ asset('frontend/images/placeholder.jpg') }}" data-src="{{ asset($product->featured_img ?: $product->thumbnail_img) }}" alt="{{ __($product->name) }}">
                                        </a>
                                    </div>
                                    <div class="p-md-3 p-2">
                                        <div class="price-box">
                                            @if(home_base_price($product->id) != home_discounted_base_price($product->id))
                                                <del class="old-product-price strong-400">{{ home_base_price($product->id) }}</del>
                                            @endif
                                            <br>
                                            <span class="product-price strong-600">{{ home_discounted_base_price($product->id) }}</span>
                                        </div>
                                        <div class="star-rating star-rating-sm mt-1">
                                            {{ renderStarRating($product->rating) }}
                                        </div>
                                        <h2 class="product-title p-0">
                                            <a href="{{ route('product', $product->slug) }}">{{ __($product->name) }}</a>
                                        </h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ============================================ -->
<!-- بخش جدیدترین محصولات -->
<!-- ============================================ -->
<section class="mb-5 kp-home-new-products">
    <div class="container">
        <div class="px-3 py-4 p-md-4 bg-white shadow-sm rounded-3">
            <div class="section-title-1">
                <h3><i class="la la-clock-o"></i> {{__('جدیدترین محصولات')}}</h3>
                <ul class="inline-links">
                    <li><a href="{{ route('products.new') }}">{{__('مشاهده همه')}} <i class="la la-angle-left"></i></a></li>
                </ul>
            </div>
            <div class="caorusel-box arrow-round gutters-5">
                <div class="slick-carousel" data-slick-items="6" data-slick-xl-items="6" data-slick-lg-items="6" data-slick-md-items="4" data-slick-sm-items="3" data-slick-xs-items="2">
                    @php
                        $new_products = filter_products(Product::where('published', 1)->orderBy('created_at', 'desc'))->take(12)->get();
                    @endphp
                    @foreach ($new_products as $product)
                        <div class="caorusel-card">
                            <div class="product-card-2 card card-product shop-cards">
                                <div class="card-body p-0">
                                    <div class="card-image">
                                        <a href="{{ route('product', $product->slug) }}" class="d-block">
                                            <img class="img-fit lazyload mx-auto" src="{{ asset('frontend/images/placeholder.jpg') }}" data-src="{{ asset($product->featured_img ?: $product->thumbnail_img) }}" alt="{{ __($product->name) }}">
                                        </a>
                                    </div>
                                    <div class="p-md-3 p-2">
                                        <div class="price-box">
                                            @if(home_base_price($product->id) != home_discounted_base_price($product->id))
                                                <del class="old-product-price strong-400">{{ home_base_price($product->id) }}</del>
                                            @endif
                                            <br>
                                            <span class="product-price strong-600">{{ home_discounted_base_price($product->id) }}</span>
                                        </div>
                                        <div class="star-rating star-rating-sm mt-1">
                                            {{ renderStarRating($product->rating) }}
                                        </div>
                                        <h2 class="product-title p-0">
                                            <a href="{{ route('product', $product->slug) }}">{{ __($product->name) }}</a>
                                        </h2>
                                        <div class="text-muted small mt-1">
                                            <i class="la la-calendar"></i> {{ date('Y/m/d', strtotime($product->created_at)) }}
                                        </div>
                                        <a href="{{ route('product', $product->slug) }}" class="kp-product-cta">
                                            مشاهده و خرید <i class="la la-angle-left" aria-hidden="true"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ============================================ -->
<!-- بخش پرفروش‌ترین محصولات -->
<!-- ============================================ -->
<section class="mb-5 kp-home-best-selling">
    <div class="container">
        <div class="px-3 py-4 p-md-4 bg-white shadow-sm rounded-3">
            <div class="section-title-1">
                <h3><i class="la la-fire"></i> {{__('پرفروش‌ترین محصولات')}}</h3>
                <ul class="inline-links">
                    <li><a href="{{ route('products.best_selling') }}">{{__('مشاهده همه')}} <i class="la la-angle-left"></i></a></li>
                </ul>
            </div>
            <div class="caorusel-box arrow-round gutters-5">
                <div class="slick-carousel" data-slick-items="6" data-slick-xl-items="6" data-slick-lg-items="6" data-slick-md-items="4" data-slick-sm-items="3" data-slick-xs-items="2">
                    @php
                        $best_selling_products = filter_products(Product::where('published', 1)->orderBy('num_of_sale', 'desc'))->take(12)->get();
                    @endphp
                    @foreach ($best_selling_products as $product)
                        <div class="caorusel-card">
                            <div class="product-card-2 card card-product shop-cards">
                                <div class="card-body p-0">
                                    <div class="card-image">
                                        <a href="{{ route('product', $product->slug) }}" class="d-block">
                                            <img class="img-fit lazyload mx-auto" src="{{ asset('frontend/images/placeholder.jpg') }}" data-src="{{ asset($product->featured_img ?: $product->thumbnail_img) }}" alt="{{ __($product->name) }}">
                                        </a>
                                    </div>
                                    <div class="p-md-3 p-2">
                                        <div class="price-box">
                                            @if(home_base_price($product->id) != home_discounted_base_price($product->id))
                                                <del class="old-product-price strong-400">{{ home_base_price($product->id) }}</del>
                                            @endif
                                            <br>
                                            <span class="product-price strong-600">{{ home_discounted_base_price($product->id) }}</span>
                                        </div>
                                        <div class="star-rating star-rating-sm mt-1">
                                            {{ renderStarRating($product->rating) }}
                                        </div>
                                        <h2 class="product-title p-0">
                                            <a href="{{ route('product', $product->slug) }}">{{ __($product->name) }}</a>
                                        </h2>
                                        <div class="text-success small mt-1">
                                            <i class="la la-shopping-cart"></i> {{ $product->num_of_sale }} فروش
                                        </div>
                                        <a href="{{ route('product', $product->slug) }}" class="kp-product-cta">
                                            مشاهده و خرید <i class="la la-angle-left" aria-hidden="true"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</section>


<div class="mb-5 kp-home-promos">
    <div class="container">
        <div class="row gutters-10 kp-promo-grid">
            @foreach (App\Banner::where('position', 2)->where('published', 1)->get() as $key => $banner)
                <div class="col-lg-{{ 12/count(App\Banner::where('position', 2)->where('published', 1)->get()) }}">
                    <div class="media-banner mb-3 mb-lg-0">
                        <a href="{{ $banner->url }}" target="_blank" class="banner-container">
                            <img src="{{ asset('frontend/images/placeholder-rect.jpg') }}" data-src="{{ asset($banner->photo) }}" alt="{{ config('app.name') }} promo" class="img-fluid lazyload">
                        </a>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</div>


<!-- ============================================ -->
<!-- برند های معروف - اسکرول افقی -->
<!-- ============================================ -->
<section class="mb-5 brands-section kp-home-brands">
    <div class="container">
        <div class="section-title-1">
            <h3><i class="la la-building"></i> {{__('برندهای معتبر')}}</h3>
            <ul class="inline-links">
                <li>
                    <a href="{{ route('brands.all') }}">{{__('نمایش همه')}} <i class="la la-angle-left"></i></a>
                </li>
            </ul>
        </div>

        <div class="scroll-btn scroll-left" id="brandsScrollLeft">
            <i class="la la-angle-right"></i>
        </div>
        <div class="scroll-btn scroll-right" id="brandsScrollRight">
            <i class="la la-angle-left"></i>
        </div>

        <div class="brands-scroll-wrapper" id="brandsScrollWrapper">
            <div class="brands-scroll-container">
                @php
                    $topBrands = Brand::where('top', 1)->take(15)->get();
                    if(count($topBrands) < 9){
                        $topBrands = Brand::take(12)->get();
                    }
                @endphp
                @foreach ($topBrands as $brand)
                    <div class="brand-scroll-item">
                        <a href="{{ route('products.brand', $brand->slug) }}" class="brand-card-horizontal">
                            <div class="brand-icon-box">
                                @if($brand->logo && file_exists(public_path($brand->logo)))
                                    <img src="{{ asset($brand->logo) }}" alt="{{ __($brand->name) }}" class="brand-icon-img">
                                @else
                                    <div class="brand-icon-default">
                                        <i class="fa fa-building-o"></i>
                                    </div>
                                @endif
                            </div>
                            <div class="brand-name-horizontal">
                                {{ __($brand->name) }}
                            </div>
                        </a>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
</section>


<!-- ============================================ -->
<!-- بخش محصولات با تخفیف ویژه -->
<!-- ============================================ -->
<section class="mb-5 kp-home-discounted">
    <div class="container">
        <div class="px-3 py-4 p-md-4 bg-white shadow-sm rounded-3">
            <div class="section-title-1">
                <h3><i class="la la-gift"></i> {{__('تخفیف ویژه')}}</h3>
                <ul class="inline-links">
                    <li><a href="{{ route('products.discounted') }}">{{__('مشاهده همه')}} <i class="la la-angle-left"></i></a></li>
                </ul>
            </div>
            <div class="caorusel-box arrow-round gutters-5">
                <div class="slick-carousel" data-slick-items="6" data-slick-xl-items="5" data-slick-lg-items="4" data-slick-md-items="3" data-slick-sm-items="2" data-slick-xs-items="2">
                    @php
                        $discounted_products = filter_products(Product::where('published', 1)->where('discount', '>', 0))->take(12)->get();
                    @endphp
                    @foreach ($discounted_products as $product)
                        <div class="caorusel-card">
                            <div class="product-card-2 card card-product shop-cards">
                                <div class="card-body p-0">
                                    <div class="card-image">
                                        <span class="discount-badge">
                                            -{{ $product->discount }}%
                                        </span>
                                        <a href="{{ route('product', $product->slug) }}" class="d-block">
                                            <img class="img-fit lazyload mx-auto" src="{{ asset('frontend/images/placeholder.jpg') }}" data-src="{{ asset($product->featured_img ?: $product->thumbnail_img) }}" alt="{{ __($product->name) }}">
                                        </a>
                                    </div>
                                    <div class="p-md-3 p-2">
                                        <div class="price-box">
                                            <del class="old-product-price strong-400">{{ home_base_price($product->id) }}</del>
                                            <br>
                                            <span class="product-price strong-600 text-danger">{{ home_discounted_base_price($product->id) }}</span>
                                        </div>
                                        <div class="star-rating star-rating-sm mt-1">
                                            {{ renderStarRating($product->rating) }}
                                        </div>
                                        <h2 class="product-title p-0">
                                            <a href="{{ route('product', $product->slug) }}">{{ __($product->name) }}</a>
                                        </h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</section>

<div id="section_featured"></div>
<div id="section_best_selling"></div>
<div id="section_home_categories"></div>

@php
    $classified_product_enabled = false;
    try {
        $classified_product_enabled = \Illuminate\Support\Facades\Schema::hasTable('business_settings')
            && \App\BusinessSetting::where('type', 'classified_product')->first()
            && \App\BusinessSetting::where('type', 'classified_product')->first()->value == 1;
    } catch (\Exception $e) {
        $classified_product_enabled = false;
    }
@endphp

@if($classified_product_enabled)
    @php
        $customer_products = CustomerProduct::where('status', '1')->where('published', '1')->take(16)->get();
    @endphp
   @if (count($customer_products) > 0)
       <section class="mb-5 kp-home-classified">
           <div class="container">
               <div class="px-3 py-4 p-md-4 bg-white shadow-sm rounded-3">
                   <div class="section-title-1">
                       <h3><i class="la la-bullhorn"></i> {{__('تبلیغات')}}</h3>
                       <ul class="inline-links">
                           <li><a href="{{ route('customer.products') }}">{{__('مشاهده همه')}} <i class="la la-angle-left"></i></a></li>
                       </ul>
                   </div>
                   <div class="caorusel-box arrow-round">
                       <div class="slick-carousel" data-slick-items="6" data-slick-xl-items="5" data-slick-lg-items="4" data-slick-md-items="3" data-slick-sm-items="2" data-slick-xs-items="2">
                           @foreach ($customer_products as $key => $customer_product)
                               <div class="product-card-2 card card-product my-2 mx-1 mx-sm-2 shop-cards shop-tech">
                                   <div class="card-body p-0">
                                       <div class="card-image">
                                           <a href="{{ route('customer.product', $customer_product->slug) }}" class="d-block">
                                               <img class="img-fit lazyload mx-auto" src="{{ asset('frontend/images/placeholder.jpg') }}" data-src="{{ asset($customer_product->thumbnail_img) }}" alt="{{ __($customer_product->name) }}">
                                           </a>
                                       </div>
                                       <div class="p-sm-3 p-2">
                                           <div class="price-box">
                                               <span class="product-price strong-600">{{ single_price($customer_product->unit_price) }}</span>
                                           </div>
                                           <h2 class="product-title p-0 text-truncate-1">
                                               <a href="{{ route('customer.product', $customer_product->slug) }}">{{ __($customer_product->name) }}</a>
                                           </h2>
                                           <div>
                                               @if($customer_product->conditon == 'new')
                                                   <span class="product-label label-hot">{{__('جدید')}}</span>
                                               @elseif($customer_product->conditon == 'used')
                                                   <span class="product-label label-hot">{{__('دست دوم')}}</span>
                                               @endif
                                           </div>
                                       </div>
                                   </div>
                               </div>
                           @endforeach
                       </div>
                   </div>
               </div>
           </div>
       </section>
   @endif
@endif

<div id="section_best_sellers"></div>

{{-- ============================================ --}}
{{-- دسته‌بندی‌های اصلی فروشگاه (پویا) --}}
{{-- ============================================ --}}
{{--
    ── تغییرات این بخش ─────────────────────────────────────────────────
    این بخش پیش از آن، هشت کارت «دسته‌بندی طلا و جواهر» بود که همه با
    slug سخت‌کد نوشته شده بودند و تصویرشان از پوشه `frontend/images/drikana/`
    می‌آمد (ring.svg، necklace.svg، watch.svg، diamond.svg، crown.svg،
    coin.svg، gift.svg، antique.svg).

    مشکل‌های آن نسخه:
      ۱. هشت slug سخت‌کد → با حذف یا تغییر دسته‌بندی در پنل مدیریت،
         لینک‌ها می‌شکستند و به صفحه ۴۰۴ می‌رسیدند.
      ۲. شمارش‌های ساختگی: «۲,۴۰۰+ مدل»، «رولکس، پتک و…»،
         «قیمتی و نیمه‌قیمتی»، «کلکسیون ویژه» — هیچ‌کدام از پایگاه
         داده نمی‌آمدند و نادرست بودند.
      ۳. آیکون‌های طلا و جواهر که برای فروشگاه خرازی معنا ندارند.

    نسخه جدید کاملاً «پویا» است: دسته‌بندی‌های سطح یک را از جدول
    `categories` می‌خواند (همان منبعی که مگامنو استفاده می‌کند) و
    تنها تا ۸ کارت نمایش می‌دهد. بنابراین:
      • با افزودن دسته‌بندی خرازی از پنل مدیریت، این بخش خودکار به‌روز
        می‌شود و هیچ تغییری در کد لازم نیست.
      • تعداد واقعی محصولات هر دسته از پایگاه داده شمرده می‌شود
        (`withCount('products')`) — نه یک عدد ساختگی.
      • آیکون‌ها از همان نگاشت کلیدواژه‌ای می‌آیند که در منوی اصلی
        استفاده شده؛ اما نخست به تصویر واقعی دسته (`icon`) نگاه
        می‌شود اگر مدیر یکی بارگذاری کرده باشد.

    اگر هنوز هیچ دسته‌بندی‌ای تعریف نشده باشد، بخش نمایش داده نمی‌شود
    (به‌جای آنکه کارت‌های خالی یا لینک شکسته بسازد).
--}}
@php
    $showcaseCategories = collect();
    try {
        if (safe_table_exists('categories')) {
            $scq = \App\Category::withCount('products')->where('top', 1);
            published_column_filter($scq, 'categories');
            $showcaseCategories = $scq->orderBy('id')->limit(8)->get();
        }
    } catch (\Exception $e) { $showcaseCategories = collect(); }

    // نگاشت کلیدواژه → آیکون (همان منطق منوی اصلی؛ آیکون پیش‌فرض عمومی)
    $showcaseIconMap = [
        'نخ' => 'la-leaf', 'کاموا' => 'la-random', 'بافت' => 'la-random',
        'گلدوزی' => 'la-magic', 'شماره' => 'la-magic', 'هنری' => 'la-paint-brush',
        'تزئین' => 'la-star-o', 'دکمه' => 'la-circle-o', 'قزن' => 'la-circle-o',
        'مروارید' => 'la-circle', 'منجوق' => 'la-circle', 'مهره' => 'la-circle',
        'زیپ' => 'la-ellipsis-h', 'روبان' => 'la-minus', 'نوار' => 'la-minus',
        'تور' => 'la-th', 'دانتل' => 'la-th', 'خرج' => 'la-th',
        'کش' => 'la-arrows-h', 'قیچی' => 'la-scissors', 'ابزار' => 'la-wrench',
        'متر' => 'la-arrows-h', 'اندازه' => 'la-arrows-h', 'بشکاف' => 'la-cut',
        'سوزن' => 'la-map-pin', 'مصرفی' => 'la-cube', 'بسته' => 'la-gift',
        'ویژه' => 'la-star',
    ];
@endphp

@if($showcaseCategories->isNotEmpty())
<section class="d-categories kp-home-showcase-categories">
    <div class="container">
        <div class="section-heading">
            <span class="kicker">CATEGORIES</span>
            <h2>خرید بر اساس <span class="gold">دسته‌بندی</span></h2>
            <p>لوازم خیاطی، گلدوزی، بافتنی و هنری — دسته‌بندی‌شده تا سریع‌تر به آنچه می‌خواهید برسید.</p>
            <span class="divider-gold"></span>
        </div>
        <div class="d-cat-grid">
            @foreach($showcaseCategories as $sc)
                @php
                    $scIcon = 'la-th-large';
                    foreach($showcaseIconMap as $kw => $ic) {
                        if(mb_strpos($sc->name, $kw) !== false) { $scIcon = $ic; break; }
                    }
                @endphp
                <a href="{{ route('products.category', $sc->slug) }}" class="d-cat-card">
                    @if($sc->icon && file_exists(public_path($sc->icon)))
                        <img src="{{ asset($sc->icon) }}" alt="{{ $sc->name }}"
                             class="cat-ico u-width-90px-height-90px-object-fit-contain">
                    @else
                        {{-- بدون تصویر: آیکون برداری درون‌خطی — هیچ فایل ۴۰۴ تولید نمی‌شود --}}
                        <span class="cat-ico cat-ico-vector" aria-hidden="true"><i class="la {{ $scIcon }}"></i></span>
                    @endif
                    <h4>{{ __($sc->name) }}</h4>
                    <span class="cat-count">
                        @if($sc->products_count > 0)
                            {{ number_format($sc->products_count) }} کالا
                        @else
                            مشاهده محصولات
                        @endif
                    </span>
                </a>
            @endforeach

            <a href="{{ route('categories.all') }}" class="d-cat-card d-cat-card-all">
                <span class="cat-ico cat-ico-vector" aria-hidden="true"><i class="la la-th-large"></i></span>
                <h4>همه دسته‌بندی‌ها</h4>
                <span class="cat-count">مشاهده فهرست کامل</span>
            </a>
        </div>
    </div>
</section>
@endif
<!-- بخش مقالات و راهنما (برای همه کاربران سایت) -->
<!-- ============================================ -->
{{--
    مقالات عمومی: تنها مقالات «منتشرشده» نمایش داده می‌شوند.
    کوئری در HomeController@index اجرا شده و اینجا فقط نمایش داده می‌شود.
    اگر مقاله‌ای منتشر نشده باشد، کل بخش نمایش داده نمی‌شود تا صفحه
    اصلی با یک بخش خالی زشت نشود.
--}}
@if(isset($latestArticles) && count($latestArticles) > 0)
<section class="d-articles kp-home-articles">
    <div class="container">
        <div class="section-heading">
            <span class="kicker">MAGAZINE &amp; GUIDE</span>
            <h2>مجله <span class="gold">پرنسا</span> — راهنمای خیاطی و هنرهای دستی</h2>
            <p>راهنمای انتخاب نخ و پارچه، تکنیک‌های گلدوزی و بافتنی و هر آنچه پیش از خرید باید بدانید.</p>
            <span class="divider-gold"></span>
        </div>

        <div class="d-art-grid">
            @foreach($latestArticles as $article)
                <article class="d-art-card">
                    <a href="{{ route('articles.show', $article->slug) }}" class="d-art-thumb">
                        @if($article->featured_image_url)
                            <img src="{{ $article->featured_image_url }}"
                                 alt="{{ $article->featured_image_alt ?: $article->title }}"
                                 loading="lazy">
                        @else
                            <img src="{{ asset('frontend/images/placeholder-rect.jpg') }}"
                                 alt="{{ $article->title }}"
                                 loading="lazy">
                        @endif

                        @if($article->category)
                            <span class="d-art-badge">{{ $article->category->name }}</span>
                        @endif
                    </a>

                    <div class="d-art-body">
                        <h3 class="d-art-title">
                            <a href="{{ route('articles.show', $article->slug) }}">{{ $article->title }}</a>
                        </h3>

                        @if($article->excerpt)
                            <p class="d-art-excerpt">{{ \Illuminate\Support\Str::limit($article->excerpt, 110) }}</p>
                        @endif

                        <div class="d-art-meta">
                            <span>
                                📅
                                {{ ($article->published_at ?: $article->created_at)->format('Y/m/d') }}
                            </span>
                            @if($article->views_count)
                                <span>👁 {{ number_format($article->views_count) }}</span>
                            @endif
                        </div>
                    </div>
                </article>
            @endforeach
        </div>

        @if(isset($articleCategories) && count($articleCategories) > 0)
            <div class="d-art-topics">
                @foreach($articleCategories as $category)
                    <a href="{{ route('articles.category', $category->slug) }}" class="d-art-topic">
                        {{ $category->name }}
                        <span>{{ $category->published_articles_count }}</span>
                    </a>
                @endforeach
            </div>
        @endif

        <div class="d-art-actions">
            <a href="{{ route('articles.index') }}" class="btn-lux btn-lux-primary">
                📖 مشاهده همه مقالات
            </a>
            <a href="{{ route('articles.search') }}" class="btn-lux btn-lux-outline">
                🔍 جست‌وجو در مقالات
            </a>
        </div>
    </div>
</section>
@endif

{{-- ============================================ --}}
{{-- راهنمای خرید و چرا از ما بخرید --}}
{{-- ============================================ --}}
{{--
    ── تغییرات این بخش ─────────────────────────────────────────────────
    این بخش پیش از این دو بلوک جدا بود:
      (۱) «بخش شناسنامه و امنیت» با عنوان CERTIFICATE & SECURITY
      (۲) «استعلام شناسنامه CTA» با فرم ورود شماره سریال

    هر دو کاملاً به ماژول منسوخ‌شده شناسنامه طلا تعلق داشتند و حذف
    شدند. ادعاهای موجود در آن‌ها نه فقط بی‌ربط، بلکه نادرست بودند:

      • «بلوک‌زنجیره اختصاصی» — پروژه هیچ بلاک‌چینی ندارد.
      • «سند غیرقابل جعل»     — ادعای امنیتی بدون پشتوانه فنی.
      • «هشدار سرقت لحظه‌ای به شبکه همکاران» — شبکه‌ای وجود ندارد؛
        ماژول فقط یک فرم ثبت داخلی بود.
      • «احراز هویت رسمی مالک» — چنین فرایندی پیاده‌سازی نشده بود.
      • کارت ماکت «گواهی اصالت — انگشتر الماس، طلای ۱۸ عیار،
        الماس ۱.۲ قیراط» — یک تصویر ساختگی از محصولی که فروشگاه
        نمی‌فروشد؛ طبق بند «تصویر نامرتبط را به‌عنوان تصویر واقعی
        محصول نمایش نده» حذف شد.

    جای آن‌ها، یک بخش واقعی «چرا از خرازی پرنسا بخرید؟» نشسته است که
    چهار مزیت آن دقیقاً به قابلیت‌های فعال پروژه نگاشت دارد، به‌همراه
    دو دکمه‌ای که به صفحه‌های موجود و کارساز اشاره می‌کنند:
    `/guide` (راهنمای خرید و ارسال) و `/faq` (سؤالات متداول).

    ── نکته فنی ────────────────────────────────────────────────────────
    ساختار HTML و کلاس‌های قالب (`d-trust`, `d-trust-inner`,
    `d-trust-content`, `d-trust-features`, `d-trust-feature`,
    `d-trust-visual`) عیناً حفظ شده‌اند تا CSS موجود
    (`frontend/css/kharazi-store.css`) بدون هیچ تغییری کار کند.
    فقط در ستون تصویری، ماکتِ «گواهی اصالت» با یک کارتِ
    «سبد خرید نمونه» جانشین شده که محتوایش برگرفته از دسته‌بندی‌های
    واقعی خرازی است. کلاس `d-cert-mockup` حفظ شده تا چیدمان نشکند.
--}}
<section class="d-trust">
    <div class="container">
        <div class="d-trust-inner">
            <div class="d-trust-content">
                <span class="kicker u-color-var-d-gold-font-weight-700-letter-spacing-3px-fon-f179e3">
                    SHOPPING GUIDE
                </span>
                <h2 class="u-font-size-clamp-24px-3vw-38px-font-weight-800-margin-10-372c2c">
                    خرید لوازم خرازی، <span class="u-background-var-grad-gold-webkit-background-clip-text-ba-1929d0">ساده و مطمئن</span>
                </h2>
                <p class="u-color-var-d-gray-300-font-size-15px-line-height-2-1-mar-8d9f21">
                    فروشگاه خرازی پرنسا همه لوازم مورد نیاز خیاطی، گلدوزی، بافتنی و
                    کارهای هنری را در دسته‌بندی‌های مشخص و قابل جست‌وجو عرضه می‌کند.
                    برای هر محصول، مشخصاتی مانند جنس، رنگ، اندازه و تعداد در بسته
                    نوشته شده تا پیش از خرید بدانید دقیقاً چه چیزی دریافت می‌کنید.
                </p>
                <div class="d-trust-features">
                    <div class="d-trust-feature">
                        <div class="tf-icon"><i class="la la-list-ul"></i></div>
                        <div>
                            <h5>مشخصات کامل هر کالا</h5>
                            <p>جنس، رنگ، اندازه، تعداد در بسته و واحد فروش، همه در صفحه محصول نوشته شده است.</p>
                        </div>
                    </div>
                    <div class="d-trust-feature">
                        <div class="tf-icon"><i class="la la-tag"></i></div>
                        <div>
                            <h5>قیمت شفاف و تخفیف واقعی</h5>
                            <p>قیمت نهایی و تخفیف‌ها پیش از پرداخت به شما نمایش داده می‌شود؛ محاسبه مبلغ در سرور انجام می‌گیرد.</p>
                        </div>
                    </div>
                    <div class="d-trust-feature">
                        <div class="tf-icon"><i class="la la-cubes"></i></div>
                        <div>
                            <h5>کنترل لحظه‌ای موجودی</h5>
                            <p>موجودی انبار به‌صورت زنده بررسی می‌شود و امکان سفارش بیش از موجودی وجود ندارد.</p>
                        </div>
                    </div>
                    <div class="d-trust-feature">
                        <div class="tf-icon"><i class="la la-history"></i></div>
                        <div>
                            <h5>پیگیری در هر مرحله</h5>
                            <p>وضعیت سفارش را از پنل کاربری و صفحه پیگیری سفارش دنبال کنید.</p>
                        </div>
                    </div>
                </div>
                <div class="u-margin-top-30px-display-flex-gap-12px-flex-wrap-wrap">
                    <a href="{{ route('guide') }}" class="btn-lux btn-lux-primary">
                        <i class="la la-book"></i> راهنمای خرید و ارسال
                    </a>
                    <a href="{{ route('faq') }}" class="btn-lux btn-lux-outline">
                        <i class="la la-question"></i> سؤالات متداول
                    </a>
                </div>
            </div>
            <div class="d-trust-visual">
                {{-- جایگزین ماکت «گواهی اصالت» — همان کلاس ظاهری حفظ شد --}}
                <div class="d-cert-mockup">
                    <div class="cert-head">
                        <h6>Kharazi Peransa</h6>
                        <h3>نمونه دسته‌بندی‌ها</h3>
                    </div>
                    <div class="cert-row"><span>نخ و کاموا</span><span>قرقره / کلاف</span></div>
                    <div class="cert-row"><span>سوزن و قیچی</span><span>بسته / عدد</span></div>
                    <div class="cert-row"><span>دکمه و قزن</span><span>بسته‌ای</span></div>
                    <div class="cert-row"><span>زیپ و روبان</span><span>متر / عدد</span></div>
                    <div class="cert-row"><span>منجوق و مروارید</span><span>بسته‌ای</span></div>
                    <div class="cert-row"><span>تور و دانتل</span><span>متر</span></div>
                    <div class="cert-seal">خرازی<br>پرنسا</div>
                    <div class="cert-qr"></div>
                </div>
            </div>
        </div>
    </div>
</section>
{{-- ============================================ --}}
{{-- سؤالات متداول (نمای کوتاه) --}}
{{-- ============================================ --}}
{{--
    ── تغییرات این بخش ─────────────────────────────────────────────────
    این بخش پیش از آن، شش پرسش کاملاً اختصاصی «شناسنامه طلا» بود:

      ۱. «شناسنامه طلا چیست و چرا اهمیت دارد؟»
      ۲. «چگونه از اصالت کالایی که می‌خرم مطمئن شوم؟»
      ۳. «در صورت سرقت یا مفقودی طلا چه کار باید بکنم؟»
      ۴. «آیا امکان فروش طلای کارکرده وجود دارد؟»
      ۵. «شیوه ارسال قطعات گران‌بها چگونه است؟» — ادعای «اسکورت
         امنیتی مسلحانه» که هیچ پشتوانه‌ای در پروژه نداشت و گمراه‌کننده بود.
      ۶. «هزینه صدور شناسنامه جدید چقدر است؟»

    هر شش مورد حذف شدند، چون به ماژول منسوخ‌شده تعلق داشتند یا ادعای
    تأییدنشده بودند.

    ── نکته: چرا این بخش حذف کامل نشد؟ ────────────────────────────────
    یک صفحه کامل «سؤالات متداول» در مسیر `/faq` ساخته شده است
    (`resources/views/frontend/faq.blade.php`) که پاسخ‌های کامل و
    لینک‌سازی داخلی دارد و برای سئو مفیدتر است. بنابراین این بخش
    صفحه اصلی به چند پرسش کوتاه بسنده می‌کند و در پایان، کاربر را به
    صفحه اصلی سؤالات متداول هدایت می‌نماید. این کار از «محتوای تکراری»
    بین دو صفحه هم جلوگیری می‌کند.

    آکاردئون از کلاس‌های موجود قالب (`d-faq-item`, `d-faq-q`,
    `d-faq-a`) استفاده می‌کند که جاوااسکریپت انتهای همین صفحه و
    `frontend/layouts/app.blade.php` آن را مدیریت می‌کنند.
--}}
<section class="d-faq">
    <div class="container">
        <div class="section-heading">
            <span class="kicker">FAQ</span>
            <h2>سؤالات <span class="gold">متداول</span></h2>
            <p>پاسخ کوتاه به پرتکرارترین پرسش‌ها درباره خرید، ارسال و مرجوعی محصولات خرازی.</p>
            <span class="divider-gold"></span>
        </div>
        <div class="kp-faq-layout">
            <aside class="kp-faq-visual" aria-label="راهنمای خرازی پرنسا">
                <div class="kp-faq-illustration" aria-hidden="true">
                    <span class="kp-faq-thread thread-one"></span>
                    <span class="kp-faq-thread thread-two"></span>
                    <span class="kp-faq-thread thread-three"></span>
                    <span class="kp-faq-hoop"></span>
                    <i class="la la-scissors"></i>
                    <i class="la la-leaf"></i>
                </div>
                <h3>همراه هنر دست شما</h3>
                <p>از انتخاب لوازم تا پیگیری سفارش، راهنمایی‌های لازم همیشه در دسترس شماست.</p>
                <a href="{{ route('guide') }}">راهنمای خرید و ارسال <i class="la la-angle-left"></i></a>
            </aside>
            <div class="d-faq-list">
                <div class="d-faq-item open">
                    <div class="d-faq-q">
                        <span>برای خرید باید ثبت‌نام کنم؟</span>
                        <i class="la la-angle-down"></i>
                    </div>
                    <div class="d-faq-a"><p>برای دیدن محصولات و جست‌وجو نیازی به ثبت‌نام نیست. اما برای ثبت سفارش و پیگیری آن در پنل کاربری، باید وارد حساب کاربری شوید یا در همان مرحله ثبت‌نام کنید.</p></div>
                </div>
                <div class="d-faq-item">
                    <div class="d-faq-q">
                        <span>محصولات در چه واحدهایی فروخته می‌شوند؟</span>
                        <i class="la la-angle-down"></i>
                    </div>
                    <div class="d-faq-a"><p>واحد فروش هر کالا در صفحه همان محصول نوشته شده است؛ نخ اغلب قرقره‌ای، روبان و دانتل متری، و سوزن، دکمه و زیپ بسته‌ای عرضه می‌شوند. تعداد موجود در هر بسته هم همان‌جا ذکر شده است.</p></div>
                </div>
                <div class="d-faq-item">
                    <div class="d-faq-q">
                        <span>هزینه و زمان ارسال چقدر است؟</span>
                        <i class="la la-angle-down"></i>
                    </div>
                    <div class="d-faq-a"><p>هزینه ارسال بر اساس شیوه انتخابی و تنظیمات فروشگاه محاسبه می‌شود و پیش از پرداخت به شما نمایش داده می‌شود. شرح مراحل خرید در <a href="{{ route('guide') }}">راهنمای خرید و ارسال</a> آمده است.</p></div>
                </div>
                <div class="d-faq-item">
                    <div class="d-faq-q">
                        <span>سفارشم را چطور پیگیری کنم؟</span>
                        <i class="la la-angle-down"></i>
                    </div>
                    <div class="d-faq-a"><p>از صفحه <a href="{{ route('orders.track') }}">پیگیری سفارش</a>، یا پس از ورود به حساب کاربری از بخش تاریخچه خرید در پنل کاربری.</p></div>
                </div>
                <div class="d-faq-item">
                    <div class="d-faq-q">
                        <span>اگر کالا را نپسندم، می‌توانم مرجوع کنم؟</span>
                        <i class="la la-angle-down"></i>
                    </div>
                    <div class="d-faq-a"><p>شرایط و مهلت بازگشت کالا در صفحه <a href="{{ route('returnpolicy') }}">شرایط مرجوعی و بازگشت کالا</a> توضیح داده شده است. پیش از ارسال کالای مرجوعی، مطالعه آن صفحه را توصیه می‌کنیم.</p></div>
                </div>
            </div>
        </div>
        <div class="kp-faq-more">
            <a href="{{ route('faq') }}" class="btn-lux btn-lux-outline">
                <i class="la la-question"></i> مشاهده همه سؤالات متداول
            </a>
        </div>
    </div>
</section>

<section class="kp-newsletter" aria-labelledby="kp-newsletter-title">
    <div class="container">
        <div class="kp-newsletter-card">
            <div class="kp-newsletter-copy">
                <span class="kp-newsletter-icon" aria-hidden="true"><i class="la la-envelope-o"></i></span>
                <div>
                    <span class="kp-newsletter-kicker">خبرنامه پرنسا</span>
                    <h2 id="kp-newsletter-title">تازه‌های خرازی را از دست ندهید</h2>
                    <p>برای دریافت خبر محصولات تازه و پیشنهادهای فروشگاه، عضو خبرنامه شوید.</p>
                </div>
            </div>
            <form method="POST" action="{{ route('subscribers.store') }}" class="kp-newsletter-form">
                @csrf
                <label class="sr-only" for="kp-newsletter-email">ایمیل شما</label>
                <input id="kp-newsletter-email" type="email" name="email" placeholder="ایمیل خود را وارد کنید" required>
                <button type="submit">عضویت <i class="la la-angle-left"></i></button>
            </form>
        </div>
    </div>
</section>

<div id="section_best_sellers"></div>
</main>

<!-- ============================================ -->
<!-- اسکریپت‌های جاوااسکریپت -->
<!-- ============================================ -->
<script>
    // ===== اسکرول دسته‌بندی‌ها و برندها =====
    function setupScrollButtons(wrapperId, leftBtnId, rightBtnId) {
        const wrapper = document.getElementById(wrapperId);
        const leftBtn = document.getElementById(leftBtnId);
        const rightBtn = document.getElementById(rightBtnId);
        
        if (!wrapper) return;
        
        const scrollAmount = 280;
        
        if (leftBtn) {
            leftBtn.addEventListener('click', function() {
                wrapper.scrollBy({
                    left: -scrollAmount,
                    behavior: 'smooth'
                });
            });
        }
        
        if (rightBtn) {
            rightBtn.addEventListener('click', function() {
                wrapper.scrollBy({
                    left: scrollAmount,
                    behavior: 'smooth'
                });
            });
        }
    }
    
    setupScrollButtons('categoriesScrollWrapper', 'categoriesScrollLeft', 'categoriesScrollRight');
    setupScrollButtons('brandsScrollWrapper', 'brandsScrollLeft', 'brandsScrollRight');
    
    // ===== بارگذاری بخش‌های داینامیک =====
    $(document).ready(function(){
        $.post('{{ route('home.section.featured') }}', {_token:'{{ csrf_token() }}'}, function(data){
            $('#section_featured').html(data);
            if(typeof slickInit === 'function') slickInit();
        });

        $.post('{{ route('home.section.best_selling') }}', {_token:'{{ csrf_token() }}'}, function(data){
            $('#section_best_selling').html(data);
            if(typeof slickInit === 'function') slickInit();
        });

        $.post('{{ route('home.section.home_categories') }}', {_token:'{{ csrf_token() }}'}, function(data){
            $('#section_home_categories').html(data);
            if(typeof slickInit === 'function') slickInit();
        });

        $.post('{{ route('home.section.best_sellers') }}', {_token:'{{ csrf_token() }}'}, function(data){
            $('#section_best_sellers').html(data);
            if(typeof slickInit === 'function') slickInit();
        });
    });
</script>

@endsection