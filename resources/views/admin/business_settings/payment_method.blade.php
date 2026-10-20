@extends('layouts.app')

@section('content')

<div class="row">
    <div class="col-lg-6">
        <div class="panel">
            <div class="panel-heading">
                <h3 class="panel-title text-center">{{__('تنظیمات درگاه پرداخت زرین پال')}}</h3>
            </div>
            <div class="panel-body text-center">
                <form class="form-horizontal" action="{{ route('env_key_update.update') }}" method="POST">
                    @csrf
                    <div class="form-group">
                        <input type="hidden" name="types[]" value="ZARINPAL_MERCHANT_CODE">
                        <div class="col-lg-3">
                            <label class="control-label">کد درگاه پرداخت</label>
                        </div>
                        <div class="col-lg-6">
                            <input type="text" class="form-control" name="ZARINPAL_MERCHANT_CODE" value="{{  config('drikana.payments.zarinpal.merchant_code') }}" placeholder="کد درگاه پرداخت" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-12 text-center">
                            <button class="btn btn-purple" type="submit">ذخیره</button>
                        </div>
                    </div>
                </form>    
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="panel">
            <div class="panel-heading">
                <h3 class="panel-title text-center">تنظیمات درگاه پرداخت بانک ملی (سداد)</h3>
            </div>
            <div class="panel-body">
                <p class="text-muted text-center">
                    مقادیر اتصال به‌صورت رمزگذاری‌شده ذخیره می‌شوند. برای تغییر هر مقدار، فیلد مربوطه را پر کنید.
                </p>
                <form class="form-horizontal" action="{{ route('payment_method.sadad.update') }}" method="POST">
                    @csrf
                    <div class="form-group">
                        <label class="col-lg-4 control-label">شناسه پذیرنده</label>
                        <div class="col-lg-8">
                            <input type="password" class="form-control" name="merchant" maxlength="100" autocomplete="new-password">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">شماره پایانه</label>
                        <div class="col-lg-8">
                            <input type="password" class="form-control" name="terminal_id" maxlength="100" autocomplete="new-password">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">کلید تراکنش</label>
                        <div class="col-lg-8">
                            <input type="password" class="form-control" name="transaction_key" maxlength="255" autocomplete="new-password">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">فعال‌سازی درگاه</label>
                        <div class="col-lg-8">
                            <label class="checkbox-inline">
                                <input type="checkbox" name="active" value="1"
                                    {{ \App\BusinessSetting::where('type', 'sadad_payment')->value('value') == 1 ? 'checked' : '' }}>
                                نمایش درگاه بانک ملی در مرحله پرداخت
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-12 text-center">
                            <button class="btn btn-purple" type="submit">ذخیره تنظیمات بانک ملی</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>    

@endsection
