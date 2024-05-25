<?php

return [
    [
        'name' => 'mp',
        'title' => '微信公众号',
        'type' => 'array',
        'content' => [],
        'value' => [
            'app_id' => '',
            'app_secret' => '',
        ],
        'rule' => '',
        'msg' => '',
        'tip' => '微信公众号参数配置',
        'ok' => '',
        'extend' => '',
    ],
    [
        'name' => 'mini',
        'title' => '微信小程序',
        'type' => 'array',
        'content' => [],
        'value' => [
            'app_id' => 'wx23096791898f1652',
            'app_secret' => 'fa98ded3593567059ec6b9e67c726098',
        ],
        'rule' => '',
        'msg' => '',
        'tip' => '微信小程序参数配置',
        'ok' => '',
        'extend' => '',
    ],
    [
        'name' => 'order_expire',
        'title' => '订单自动取消',
        'type' => 'string',
        'content' => [],
        'value' => '10',
        'rule' => 'required',
        'msg' => '',
        'tip' => '订单超过X分钟未支付自动取消',
        'ok' => '',
        'extend' => '',
    ],
];
