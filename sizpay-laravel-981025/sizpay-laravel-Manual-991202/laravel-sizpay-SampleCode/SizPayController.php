<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\SizPay;
class SizPayController extends Controller
{
    public function add_order(Request $request)

    {

        $order = new SizPay();
        $token = $order->pay($request->price, uniqid());
        if ($token !==null)
        {
        $html = '<p style="color:#ff0000; font:18px Tahoma; direction:rtl;">در حال اتصال به درگاه بانکی. لطفا صبر کنید ...</p>

            <form name="frmPay" method="post" action="https://rt.sizpay.ir/Route/Payment">

            <input type="hidden" name="MerchantID" value="'.$order->merchant.'" />

            <input type="hidden" name="TerminalID" value="'.$order->terminal.'" />
            
            <input type="hidden" name="Token"      value="'.$token.'" />
            
            <input type="hidden" name="SignData"   value="'.$order->signData.'" />

            <noscript><center><input type="submit" value="پرداخت" /></center></noscript>

            </form><script>document.frmPay.submit();</script>';
        }
        else
        {
            $html = 'خطا در اتصال به وبسرویس سیزپی';
        }
        echo $html;

        exit;

    }
    
public function verify_order(Request $request)
    {
        $order = new sizpay();
        if (isset($request->post('ResCod')) && in_array($request->post('ResCod'), array('0', '00')))
        {
            $client = new \SoapClient('https://rt.sizpay.ir/KimiaIPGRouteService.asmx?WSDL');

            $result = $client->Confirm2($parameters = array(

                    'MerchantID'  => $order->merchant,
                    'TerminalID'  => $order->terminal,
                    'UserName'    => $order->username,
                    'Password'    => $order->password,
                    'Token'       => $request->post('Token'),
                    'SignData'    => ''
                ))->Confirm2Result;

            $result = json_decode($result);
            if (isset($result->ResCod) && in_array($result->ResCod, array('0', '00')))
            {
                    return 'پرداخت با موفقیت انجام شد.';
            }
            else
            {
                    return 'خطا در انجام عملیات';
            }
        }
        else
        {
                return 'پرداخت توسط کاربر لغو شد';
        }
    }
