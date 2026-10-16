@extends('frontend.layouts.app')

{{--
    صفحه «قوانین و مقررات»
    ════════════════════════════════════════════════════════════════════
    این ویو بازنویسی شد تا از پارشال مشترک
    `frontend.policies._body` استفاده کند. دلیل: پیش از این، دسترسی
    مستقیم `->first()->content` بدون بررسی null بود و چون جدول
    `policies` خالی است، صفحه با خطای ۵۰۰ می‌شکست. توضیح کامل در
    ابتدای همان پارشال آمده است.

    محتوای این صفحه از پنل مدیریت قابل ویرایش است؛ مسیر آن در
    `routes/web.php` با نام `terms_conditions` ثبت شده و کنترلر آن
    `PolicyController` است. اگر مدیری هنوز متنی وارد نکرده باشد،
    پارشال یک پیام دوستانه نمایش می‌دهد — نه خطا.
--}}

@section('meta_title', 'قوانین و مقررات | ' . config('app.name', 'خرازی پرنسا'))
@section('meta_description', 'شرایط استفاده از فروشگاه اینترنتی خرازی پرنسا.')

@section('content')
    @include('frontend.policies._body', [
        'policyName'  => 'terms_conditions',
        'policyTitle' => 'قوانین و مقررات',
        'policyIntro' => 'شرایط استفاده از فروشگاه اینترنتی خرازی پرنسا.',
    ])
@endsection
