<?php

return [
    'autoload' => false,
    'hooks' => [
        'user_sidenav_after' => [
            'invite',
        ],
        'user_register_successed' => [
            'invite',
        ],
        'app_init' => [
            'qrcode',
        ],
    ],
    'route' => [
        '/invite/[:id]$' => 'invite/index/index',
        '/qrcode$' => 'qrcode/index/index',
        '/qrcode/build$' => 'qrcode/index/build',
    ],
    'priority' => [],
    'domain' => '',
];
