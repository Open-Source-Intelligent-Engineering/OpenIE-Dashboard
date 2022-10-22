<?php

$appid = 'wx8f0cc70eae37d171';
$secret = '382a832a4d337779cec81454680ee2e2';
$userid = 'olkGp6ClgR1Ob72NzYrxQgXTtktY';
$template_id = 'UrBn9INKFm6dqA4ZtTi6RplD9DKIMvFr83Z5FBbxYZo';

$title = '# 基金异动警报';
$management = '[Docker后台] http://198.74.121.61:9000';
$finance    = '[统计账单] http://198.74.121.61:8888';

$message = '接口单元测试，请忽略该消息';

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

                "management": {
                    "value":"' . $management . '"
                },

                "finance": {
                    "value":"' . $finance . '"
                },

                "message": {
                    "value":"' . $message . '",
                    "color":"#173177"
                }

            }
        }'
    )))
);
