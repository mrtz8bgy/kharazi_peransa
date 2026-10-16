{{--
    ═══════════════════════════════════════════════════════════════════════
    قالب مشترک صفحات سیاست‌ها و قوانین
    ═══════════════════════════════════════════════════════════════════════

    ── چرا این پارشال ساخته شد؟ ─────────────────────────────────────────

    پنج صفحه سیاست (`terms`, `privacypolicy`, `sellerpolicy`,
    `returnpolicy`, `supportpolicy`) پیش از این هرکدام کد جداگانه و
    تکراری داشتند و **چهار مورد از آن‌ها با خطای ۵۰۰ می‌شکستند**:

        echo \App\Policy::where('name','return_policy')->first()->content;

    اگر ردیف متناظر در جدول `policies` وجود نداشت، `->first()` مقدار
    `null` برمی‌گرداند و `->content` روی `null` خطای
    «Trying to get property 'content' of non-object» می‌داد. چون جدول
    `policies` در این پروژه **خالی** است، عملاً هر چهار صفحه همیشه ۵۰۰
    بودند. تنها `terms.blade.php` از قبل این حالت را مدیریت می‌کرد.

    این پارشال مشکلات را یک‌جا حل می‌کند:
      ۱. دسترسی `null`-امن به محتوا (با `optional()`).
      ۲. نمایش پیام دوستانه به‌جای صفحه خالی، اگر مدیر هنوز متنی وارد
         نکرده باشد — همراه با ارجاع به صفحه تماس.
      ۳. سربرگ، مسیر راهنما (breadcrumb)، عنوان صفحه و توضیح متا به‌صورت
         یکنواخت برای هر پنج صفحه.
      ۴. حذف کد تکراری از پنج فایل.

    ── نحوه استفاده ────────────────────────────────────────────────────

        @include('frontend.policies._body', [
            'policyName'  => 'return_policy',                       // نام ردیف در جدول policies
            'policyTitle' => 'شرایط مرجوعی و بازگشت کالا',          // عنوان نمایشی
            'policyIntro' => 'توضیح کوتاه زیر عنوان.',              // اختیاری
        ])

    ── نکته امنیتی ─────────────────────────────────────────────────────

    محتوای سیاست‌ها توسط مدیر از پنل مدیریت وارد می‌شود و با
    `{!! !!}` نمایش داده می‌شود (زیرا ممکن است HTML ساده داشته باشد).
    این رفتار از قبل در پروژه وجود داشت و **تغییر نکرده** است. ورودی
    این فیلد فقط در دسترس کاربران با نقش مدیر است و اعتبارسنجی آن در
    `PolicyController` انجام می‌شود؛ بنابراین یک بردار XSS عمومی نیست.
--}}
@php
    $policy = null;
    try {
        if (safe_table_exists('policies')) {
            $policy = \App\Policy::where('name', $policyName)->first();
        }
    } catch (\Exception $e) {
        $policy = null;
    }
    $policyContent = $policy && trim((string) $policy->content) !== ''
        ? $policy->content
        : null;
@endphp

<section class="gry-bg py-4">
    <div class="container">

        {{-- مسیر راهنما (Breadcrumb) — کمک به سئو و جهت‌یابی کاربر --}}
        <nav class="kp-crumb" aria-label="مسیر صفحه">
            <a href="{{ route('home') }}">صفحه اصلی</a>
            <span aria-hidden="true">›</span>
            <span class="kp-crumb-current">{{ $policyTitle }}</span>
        </nav>

        <div class="row">
            <div class="col-lg-9">
                <div class="p-4 bg-white kp-page">
                    <h1 class="kp-page-title">{{ $policyTitle }}</h1>

                    @if(!empty($policyIntro))
                        <p class="kp-lead">{{ $policyIntro }}</p>
                    @endif

                    @if($policyContent)
                        {!! $policyContent !!}
                    @else
                        {{--
                            حالت «محتوای ثبت‌نشده» — به‌جای صفحه سفید یا خطای
                            ۵۰۰، پیام صریح و راه ارتباطی نمایش داده می‌شود.
                        --}}
                        <div class="kp-empty-state">
                            <i class="la la-file-text-o" aria-hidden="true"></i>
                            <h3>متن این صفحه هنوز منتشر نشده است</h3>
                            <p>
                                متن «{{ $policyTitle }}» در حال آماده‌سازی است.
                                برای اطلاع از جزئیات، از طریق صفحه
                                <a href="{{ route('contact') }}">تماس با ما</a>
                                با پشتیبانی فروشگاه در ارتباط باشید.
                            </p>
                        </div>
                    @endif
                </div>
            </div>

            <div class="col-lg-3">
                <div class="p-4 bg-white kp-side">
                    <h3 class="kp-side-title">صفحات مرتبط</h3>
                    <ul class="kp-side-links">
                        <li><a href="{{ route('guide') }}">راهنمای خرید و ارسال</a></li>
                        <li><a href="{{ route('faq') }}">سؤالات متداول</a></li>
                        <li><a href="{{ route('orders.track') }}">پیگیری سفارش</a></li>
                        <li><a href="{{ route('returnpolicy') }}">شرایط مرجوعی</a></li>
                        <li><a href="{{ route('terms') }}">قوانین و مقررات</a></li>
                        <li><a href="{{ route('privacypolicy') }}">حریم خصوصی</a></li>
                        <li><a href="{{ route('supportpolicy') }}">پشتیبانی</a></li>
                        <li><a href="{{ route('contact') }}">تماس با ما</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
