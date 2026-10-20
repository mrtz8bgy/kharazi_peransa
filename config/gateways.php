<?php

return [
    'table' => 'gateway_transactions',
    'soap' => [
        'attempts' => 2,
    ],
    'sadad' => [
        'name' => 'بانک ملی',
        'active' => false,
        'order' => 1,
        'merchant' => '',
        'transactionKey' => '',
        'terminalId' => '',
        'callback-url' => '/',
    ],
];
