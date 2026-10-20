<?php

namespace App;

use DB;

class SizPay

{

    public $merchant;

    public $terminal;

    public $username;

    public $password;
    
    public $signData;

    public function __construct()

    {

        $this->merchant = "500118991000038";

        $this->terminal = "18000382";

        $this->username = "FfSHNqZPb6OnWrCMrPBi6CbEDZLlrvNeEX6Ik+SJuOI=";

        $this->password = "HgRK1Sy+Ue+rEms/698vdUO6GUpx4WiWtgvajA31mGM=";
        
        $this->signData = "D6OrSviObIJuWr6rCquS";

    }

    public function pay($Amount,$OrderId = '')

    {

        $client = new \SoapClient('https://rt.sizpay.ir/KimiaIPGRouteService.asmx?WSDL');

        $result = $client->GetToken2($parameters = array(

                'MerchantID'  => $this->merchant,

                'TerminalID'  => $this->terminal,

                'UserName'    => $this->username,

                'Password'    => $this->password,

                'Amount'      => $Amount,

                'OrderID'     => time(),

                'ReturnURL'   => 'https://arqavan-tehran.com/verify',

                'InvoiceNo'   => time(),

                'DocDate'     => '',

                'ExtraInf'    => $OrderId,

                'AppExtraInf' => '',

                'SignData'    => $this->signData

            ))->GetToken2Result;

        $result = json_decode($result);

        if (isset($result->ResCod) && in_array($result->ResCod, array('0', '00')))

        {

            return $result->Token;

        }

        else

        {

            return false;

        }

    }

}