<?php

namespace App\Http\Controllers;

use App\BusinessSetting;
use App\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Log;
use Parsisolution\Gateway\Facades\Gateway;
use Parsisolution\Gateway\Transactions\Amount;
use Parsisolution\Gateway\Transactions\RequestTransaction;

class SadadPaymentController extends Controller
{
    public function checkout()
    {
        $order = Order::find(session('order_id'));

        if (!$order || $order->payment_type !== 'sadad') {
            flash('سفارش معتبری برای پرداخت بانک ملی پیدا نشد.')->error();
            return redirect()->route('checkout.payment_info');
        }

        $settings = $this->gatewaySettings();
        if (!$settings['active'] || !$settings['merchant'] || !$settings['terminalId'] || !$settings['transactionKey']) {
            flash('درگاه پرداخت بانک ملی فعال نیست یا تنظیمات اتصال آن کامل نشده است.')->error();
            return redirect()->route('checkout.payment_info');
        }

        if (!class_exists(\SoapClient::class)) {
            Log::error('Sadad payment requires the PHP SOAP extension.');
            flash('افزونه SOAP روی سرور فعال نیست؛ لطفاً با پشتیبانی سایت تماس بگیرید.')->error();
            return redirect()->route('checkout.payment_info');
        }

        try {
            config(['gateways.sadad' => $settings]);

            $transaction = new RequestTransaction(new Amount($order->grand_total));
            $transaction->setExtra([
                'order_id' => $order->id,
            ]);

            $gateway = Gateway::of('sadad')->callbackUrl(route('sadad.callback'));
            $authorized = $gateway->authorize($transaction);

            $order->payment_details = json_encode([
                'provider' => 'sadad',
                'transaction_id' => $authorized->getId(),
            ]);
            $order->save();

            return $gateway->redirect($authorized);
        } catch (\Exception $exception) {
            Log::error('Sadad payment authorization failed.', [
                'order_id' => $order->id,
                'message' => $exception->getMessage(),
            ]);
            flash('اتصال به درگاه بانک ملی ناموفق بود. لطفاً دوباره تلاش کنید.')->error();
            return redirect()->route('checkout.payment_info');
        }
    }

    public function callback(Request $request)
    {
        $transactionId = $request->input('transaction_id', $request->input('iN'));
        if (!is_scalar($transactionId) || !ctype_digit((string) $transactionId)) {
            flash('اطلاعات بازگشت از درگاه بانک ملی معتبر نیست.')->error();
            return redirect()->route('home');
        }

        $gatewayTransaction = \DB::table(config('gateways.table', 'gateway_transactions'))
            ->where('id', $transactionId)
            ->where('provider', 'SADAD')
            ->first();

        if (!$gatewayTransaction) {
            flash('تراکنش متناظر با پرداخت بانک ملی پیدا نشد.')->error();
            return redirect()->route('home');
        }

        $extra = json_decode($gatewayTransaction->extra, true);
        $order = isset($extra['order_id']) ? Order::find($extra['order_id']) : null;
        if (!$order || $order->payment_type !== 'sadad') {
            flash('سفارش متناظر با پرداخت بانک ملی معتبر نیست.')->error();
            return redirect()->route('home');
        }

        if ($gatewayTransaction->status === 'SUCCEEDED') {
            if ($order->payment_status !== 'paid') {
                session(['order_id' => $order->id]);
                $paymentDetails = json_encode([
                    'provider' => 'sadad',
                    'transaction_id' => $gatewayTransaction->id,
                    'tracking_code' => $gatewayTransaction->tracking_code,
                    'card_number' => $gatewayTransaction->card_number,
                ]);

                return app(CheckoutController::class)->checkout_done($order->id, $paymentDetails);
            }

            session(['order_id' => $order->id]);
            return redirect()->route('order_confirmed');
        }

        if ($gatewayTransaction->status !== 'INIT'
            || (float) $gatewayTransaction->amount !== (float) $order->grand_total
            || $gatewayTransaction->currency !== 'IRT') {
            flash('وضعیت یا مبلغ تراکنش بانک ملی با سفارش مطابقت ندارد.')->error();
            return redirect()->route('home');
        }

        if (!class_exists(\SoapClient::class)) {
            Log::error('Sadad callback could not be verified because the PHP SOAP extension is unavailable.', [
                'order_id' => $order->id,
                'transaction_id' => $transactionId,
            ]);
            flash('امکان تأیید پرداخت در حال حاضر وجود ندارد. لطفاً با پشتیبانی سایت تماس بگیرید.')->error();
            return redirect()->route('home');
        }

        try {
            $settings = $this->gatewaySettings();
            config(['gateways.sadad' => $settings]);

            $settled = Gateway::settle(true);
            if ((float) $settled->getAmount()->getTotal() !== (float) $order->grand_total
                || (int) $settled->getExtraField('order_id') !== (int) $order->id) {
                Log::error('Sadad settlement did not match its order.', [
                    'order_id' => $order->id,
                    'transaction_id' => $transactionId,
                ]);
                flash('اطلاعات پرداخت با سفارش مطابقت ندارد. لطفاً با پشتیبانی تماس بگیرید.')->error();
                return redirect()->route('home');
            }

            session(['order_id' => $order->id]);
            $paymentDetails = json_encode([
                'provider' => 'sadad',
                'transaction_id' => $settled->getId(),
                'tracking_code' => $settled->getTrackingCode(),
                'card_number' => $settled->getCardNumber(),
            ]);

            return app(CheckoutController::class)->checkout_done($order->id, $paymentDetails);
        } catch (\Exception $exception) {
            Log::warning('Sadad payment callback was not settled.', [
                'order_id' => $order->id,
                'transaction_id' => $transactionId,
                'message' => $exception->getMessage(),
            ]);
            flash('پرداخت بانک ملی تأیید نشد. در صورت کسر وجه، مبلغ طبق روال بانک به حساب شما بازمی‌گردد.')->error();
            return redirect()->route('checkout.payment_info');
        }
    }

    private function gatewaySettings()
    {
        $values = [];
        foreach ([
            'merchant' => 'sadad_merchant',
            'terminalId' => 'sadad_terminal_id',
            'transactionKey' => 'sadad_transaction_key',
        ] as $configKey => $settingType) {
            $encrypted = BusinessSetting::where('type', $settingType)->value('value');
            try {
                $values[$configKey] = $encrypted ? Crypt::decrypt($encrypted) : '';
            } catch (\Illuminate\Contracts\Encryption\DecryptException $exception) {
                Log::error('Stored Sadad configuration could not be decrypted.', [
                    'setting' => $settingType,
                ]);
                $values[$configKey] = '';
            }
        }

        return array_merge(config('gateways.sadad', []), $values, [
            'active' => BusinessSetting::where('type', 'sadad_payment')->value('value') == 1,
            'callback-url' => route('sadad.callback'),
        ]);
    }
}
