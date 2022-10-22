<?php

$appid = 'wx8f0cc70eae37d171';
$secret = '382a832a4d337779cec81454680ee2e2';
$userid = 'olkGp6ClgR1Ob72NzYrxQgXTtktY';
$template_id = 'Kh2r-VRFyzZv7LvcktQBi_4EnA9VIDsxrGeEU0mVCfU';

$title = '# FreeLeek财经消息';
$USDCNY = '7.1140↓';
$EURCNY    = '7.0930↓';
$CNYJPY = '20.2370-';
$EURUSD = '0.9964↓';
$GOLD = '389.50↑ +0.43 +0.11%';
$Gold_stock = '390.82↑ +2.14 +0.55%';
$data = '数据源自新浪财经，点击跳转';

file_get_contents(
    'https://api.weixin.qq.com/cgi-bin/message/template/send?access_token='
        . json_decode(
            file_get_contents('https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=' . $appid . '&secret=' . $secret),
            true
        )['access_token'],
    false,
    stream_context_create(array('http' => array(
        'method' => 'POST',
        'header' => "Content-Type: application/json;charset=utf-8",
        'content' => '{"touser":"' . $userid . '","template_id":"' . $template_id . '",
            "data":{
                
                "title": {
                    "value":"' . $title . '"
                },

                "USDCNY": {
                    "value":"' . $USDCNY . '",
                    "color":"#7CFC00"
                },

                "EURCNY": {
                    "value":"' . $EURCNY . '",
                    "color":"#7CFC00"
                },

                "CNYJPY": {
                    "value":"' . $CNYJPY . '"
                },

                "EURUSD": {
                    "value":"' . $EURUSD . '",
                    "color":"#7CFC00"
                },

                "GOLD": {
                    "value":"' . $GOLD . '",
                    "color":"#EA0000"
                },

                "Gold_stock": {
                    "value":"' . $Gold_stock . '",
                    "color":"#EA0000"
                },
                "data": {
                    "value":"' . $data . '",
                    "color":"#173177"
                }

            }
        }'
    )))
);
