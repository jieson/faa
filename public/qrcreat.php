<?php

namespace mjqr;


// 获取access_token
function getAccessToken($appid, $appsecret) {
    $url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid={$appid}&secret={$appsecret}";
    $result = file_get_contents($url);
    return json_decode($result, true)['access_token'];
}

// 生成小程序码
function createMiniProgramQRCode($path, $width = 430, $access_token) {
    $url = "https://api.weixin.qq.com/wxa/getwxacode?access_token={$access_token}";
    $data = json_encode(['path' => $path, 'width' => $width]);
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
    curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    $result = curl_exec($ch);
    if (curl_errno($ch)) {
        echo 'Error:' . curl_error($ch);
    }
    curl_close($ch);
    return $result;
}




/*
 * 生成 小程序码 ，来邀请报名，要传赛事id和团队id,并且显示在浏览器上
 */
function makeqr_submit($projectid, $teamid)
{
    //access_token = '你的access_token'; // 如果已经有access_token，可以直接使用，否则需要通过appid和appsecret获取
    $appid = 'wx23096791898f1652';
    $appsecret = 'fa98ded3593567059ec6b9e67c726098';
    $path = 'pages/sign/mjprojectdetail'; // 小程序页面路径
    //$path = 'pages/index/index'; // 小程序页面路径
    $scene = $path.'?team_id='.$teamid.'&project_id='.$projectid; // 渠道参数，可以根据实际需求设
    $width = 430; // 二维码宽度

    $access_token = getAccessToken($appid, $appsecret);
// 生成小程序码
    $code = createMiniProgramQRCode($scene, $width, $access_token);

    // 将二进制图片数据保存为文件
    $filename = 'code.png';
    file_put_contents($filename, $code);
    return $code;
}
// 使用例子
$code = makeqr_submit(2,2);

//// 将二进制图片数据保存为文件
//$filename = 'code.png';
//file_put_contents($filename, $code);

// 输出到浏览器
header('Content-Type: image/png');
echo $code;