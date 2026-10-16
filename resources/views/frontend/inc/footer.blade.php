{{--
    ═══════════════════════════════════════════════════════════════════════
    فوتر فروشگاه — «خرازی پرنسا»
    ═══════════════════════════════════════════════════════════════════════

    ── تغییرات این بازنویسی ─────────────────────────────────────────────

    این فایل پیش از این، فوتر «مارکت‌پلیس لوکس طلا و جواهر دریکانا» بود.
    موارد زیر اصلاح شد:

      ۱. نام برند: «DRIKANA / DRIKANA Luxury Marketplace» حذف و
         «خرازی پرنسا» جای آن نشست. نام از `config('app.name')` خوانده
         می‌شود تا یک منبع حقیقت داشته باشد.
      ۲. توضیح برند: متن «طلا، جواهرات، ساعت‌های لوکس، سنگ‌های قیمتی…
         با ارائه شناسنامه معتبر، رهگیری امن و گارانتی اصالت کالا» که
         یک ادعای مربوط به ماژول منسوخ‌شده بود، با معرفی واقعی فروشگاه
         خرازی جایگزین شد.
      ۳. لینک‌های خدمات مشتریان: «استعلام شناسنامه طلا» و «اعلام سرقت /
         مفقودی» حذف شدند (ماژول جواهرات غیرفعال است و این لینک‌ها
         باعث خطای RouteNotFound می‌شدند).
      ۴. ستون چهارم: نشانی و تلفن سخت‌کد («تهران، خیابان فردوسی، بازار
         بزرگ طلا») اکنون از جدول `general_settings` خوانده می‌شود.
      ۵. بخش جدید: «راهنمای خرید و ارسال» طبق ساختار خواسته‌شده برای
         فروشگاه خرازی (گام‌های خرید، شیوه‌های ارسال، شرایط مرجوعی).
      ۶. نمادهای پرداخت: نشان «Visa» و «MasterCard» با نمادهای واقعی
         پرداخت ایرانی («شتاب» و «زرین‌پال») جایگزین شد، چون درگاه
         فعال پروژه ایرانی است و نمایش برندهای خارجی گمراه‌کننده بود.

    ── نکته فنی ────────────────────────────────────────────────────────

    فوتر موبایلی جداگانه در `frontend/inc/mobile_footer.blade.php` قرار
    دارد و از چیدمان اصلی در `frontend/layouts/app.blade.php` فراخوانی
    می‌شود. آن فوتر در دسکتاپ پنهان است و فقط زیر ۷۶۸ پیکسل نمایش
    می‌یابد.

--}}
@php $gs = \App\GeneralSetting::first(); @endphp

<footer class="d-footer">
    <div class="container">

        {{-- ═══ نوار مزایای خرید ═══ --}}
        <div class="d-footer-perks">
            <div class="d-perk">
                <span class="d-perk-ico"><i class="la la-truck"></i></span>
                <div class="d-perk-txt">
                    <strong>ارسال سریع</strong>
                    <span>به سراسر ایران</span>
                </div>
            </div>
            <div class="d-perk">
                <span class="d-perk-ico"><i class="la la-shield"></i></span>
                <div class="d-perk-txt">
                    <strong>خرید امن</strong>
                    <span>پرداخت از درگاه معتبر</span>
                </div>
            </div>
            <div class="d-perk">
                <span class="d-perk-ico"><i class="la la-refresh"></i></span>
                <div class="d-perk-txt">
                    <strong>بازگشت کالا</strong>
                    <span>مطابق شرایط فروشگاه</span>
                </div>
            </div>
            <div class="d-perk">
                <span class="d-perk-ico"><i class="la la-headphones"></i></span>
                <div class="d-perk-txt">
                    <strong>پشتیبانی</strong>
                    <span>پاسخ‌گویی به سؤالات</span>
                </div>
            </div>
        </div>

        <div class="d-footer-grid">

            {{-- ═══ ستون ۱: معرفی فروشگاه ═══ --}}
            <div class="d-footer-col d-footer-brand">
                <a href="{{ route('home') }}" class="d-logo u-text-decoration-none">
                    <div class="d-logo-mark">
                        @php
                            $fLogo = ($gs && $gs->logo && file_exists(public_path($gs->logo)))
                                ? asset($gs->logo)
                                : (file_exists(public_path('frontend/images/logo/kharazi-logo.svg'))
                                    ? asset('frontend/images/logo/kharazi-logo.svg')
                                    : null);
                        @endphp
                        @if($fLogo)
                            <img class="u-width-100-height-100-border-radius-50-object-fit-cover"
                                 src="{{ $fLogo }}" alt="{{ config('app.name') }}">
                        @else
                            خ
                        @endif
                    </div>
                    <div class="d-logo-text">
                        <span class="brand-name">{{ config('app.name', 'خرازی پرنسا') }}</span>
                        <span class="brand-tag">لوازم خیاطی، گلدوزی و هنری</span>
                    </div>
                </a>

                <p class="d-footer-about">
                    فروشگاه اینترنتی خرازی پرنسا؛ عرضه‌کننده لوازم خیاطی، گلدوزی،
                    بافتنی و لوازم هنری. از نخ و سوزن و دکمه تا روبان، زیپ،
                    منجوق و ابزار برش — همه آنچه برای دوخت‌ودوز خانگی،
                    گلدوزی و کارهای هنری نیاز دارید، در یک‌جا و با ارسال به
                    سراسر کشور.
                </p>

                <div class="d-footer-social">
                    @if($gs && $gs->instagram)<a href="{{ $gs->instagram }}" target="_blank" rel="noopener" aria-label="اینستاگرام"><i class="fa fa-instagram"></i></a>@endif
                    @if($gs && $gs->facebook)<a href="{{ $gs->facebook }}" target="_blank" rel="noopener" aria-label="فیسبوک"><i class="fa fa-facebook"></i></a>@endif
                    @if($gs && $gs->twitter)<a href="{{ $gs->twitter }}" target="_blank" rel="noopener" aria-label="توییتر"><i class="fa fa-twitter"></i></a>@endif
                    @if($gs && $gs->youtube)<a href="{{ $gs->youtube }}" target="_blank" rel="noopener" aria-label="یوتیوب"><i class="fa fa-youtube-play"></i></a>@endif
                    @if($gs && $gs->google_plus)<a href="{{ $gs->google_plus }}" target="_blank" rel="noopener" aria-label="گوگل پلاس"><i class="fa fa-google-plus"></i></a>@endif
                </div>
            </div>

            {{-- ═══ ستون ۲: دسترسی سریع ═══ --}}
            <div class="d-footer-col">
                <h5>دسترسی سریع</h5>
                <ul class="d-footer-links">
                    <li><a href="{{ route('home') }}">صفحه اصلی</a></li>
                    <li><a href="{{ route('categories.all') }}">همه دسته‌بندی‌ها</a></li>
                    <li><a href="{{ route('products.new') }}">جدیدترین محصولات</a></li>
                    <li><a href="{{ route('products.best_selling') }}">پرفروش‌ترین‌ها</a></li>
                    <li><a href="{{ route('products.discounted') }}">محصولات تخفیف‌دار</a></li>
                    <li><a href="{{ route('products.featured') }}">محصولات ویژه</a></li>
                    <li><a href="{{ route('brands.all') }}">برندها</a></li>
                    <li><a href="{{ route('articles.index') }}">مقالات و راهنما</a></li>
                </ul>
            </div>

            {{-- ═══ ستون ۳: خدمات مشتریان ═══ --}}
            <div class="d-footer-col">
                <h5>خدمات مشتریان</h5>
                <ul class="d-footer-links">
                    <li><a href="{{ route('orders.track') }}">پیگیری سفارش</a></li>
                    {{-- صفحه راهنمای خرید و ارسال — مسیر عمومی `/guide` --}}
                    <li><a href="{{ route('guide') }}">راهنمای خرید و ارسال</a></li>
                    <li><a href="{{ route('faq') }}">سؤالات متداول</a></li>
                    <li><a href="{{ route('returnpolicy') }}">شرایط مرجوعی و بازگشت کالا</a></li>
                    <li><a href="{{ route('privacypolicy') }}">حریم خصوصی</a></li>
                    <li><a href="{{ route('terms') }}">قوانین و مقررات</a></li>
                    <li><a href="{{ route('supportpolicy') }}">پشتیبانی</a></li>
                    <li><a href="{{ route('contact') }}">تماس با ما</a></li>
                </ul>
            </div>

            {{-- ═══ ستون ۴: ارتباط و خبرنامه ═══ --}}
            <div class="d-footer-col">
                <h5>ارتباط با ما</h5>
                <ul class="d-footer-contact">
                    @if($gs && $gs->address)
                        <li><i class="la la-map-marker"></i> <span>{{ $gs->address }}</span></li>
                    @endif
                    @if($gs && $gs->phone)
                        <li><i class="la la-phone"></i> <span>{{ $gs->phone }}</span></li>
                    @endif
                    @if($gs && $gs->email)
                        <li><i class="la la-envelope"></i> <span>{{ $gs->email }}</span></li>
                    @endif
                    <li><i class="la la-clock-o"></i> <span>شنبه تا پنجشنبه، ۹ تا ۱۸</span></li>
                </ul>

                <div class="u-margin-top-18px kp-footer-newsletter">
                    <div class="u-color-var-d-gold-font-size-13px-font-weight-600-margin--dc2d32">
                        <i class="la la-bullhorn"></i> عضویت در خبرنامه
                    </div>
                    <p class="d-newsletter-note">از تخفیف‌ها و محصولات تازه باخبر شوید.</p>
                    <form method="POST" action="{{ route('subscribers.store') }}" class="d-newsletter-form">
                        @csrf
                        <input type="email" name="email" placeholder="ایمیل شما..." required>
                        <button type="submit" aria-label="عضویت"><i class="la la-paper-plane la-flip-horizontal"></i></button>
                    </form>
                </div>
            </div>
        </div>

        {{-- ═══ نوار پایانی ═══ --}}
        <div class="d-footer-bottom">
            <div>
                © {{ date('Y') }} {{ $gs->site_name ?? config('app.name', 'خرازی پرنسا') }} — تمامی حقوق محفوظ است.
            </div>
            <div class="pay-methods" aria-label="روش‌های پرداخت">
                {{-- نماد «شتاب» — شبکه پرداخت ایران --}}
                <img src="data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' width='44' height='26' viewBox='0 0 44 26'><rect width='44' height='26' fill='%23f4f7f9' rx='4' stroke='%23d8e2e8'/><text x='50%25' y='58%25' font-family='sans-serif' font-size='9' fill='%231f6f6b' text-anchor='middle' font-weight='700'>SHETAB</text></svg>" alt="شتاب">
                {{-- نماد درگاه زرین‌پال --}}
                <img src="data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' width='44' height='26' viewBox='0 0 44 26'><rect width='44' height='26' fill='%23f4f7f9' rx='4' stroke='%23d8e2e8'/><text x='50%25' y='58%25' font-family='sans-serif' font-size='7.5' fill='%231f6f6b' text-anchor='middle' font-weight='700'>ZARINPAL</text></svg>" alt="زرین‌پال">
                @if(\App\BusinessSetting::where('type','cash_payment')->first()->value == 1)
                    <img src="data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' width='44' height='26' viewBox='0 0 44 26'><rect width='44' height='26' fill='%23f4f7f9' rx='4' stroke='%23d8e2e8'/><text x='50%25' y='58%25' font-family='sans-serif' font-size='7' fill='%231f6f6b' text-anchor='middle' font-weight='700'>CASH</text></svg>" alt="پرداخت در محل">
                @endif
            </div>
        </div>
    </div>
</footer>
