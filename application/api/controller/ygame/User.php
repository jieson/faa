<?php

namespace app\api\controller\ygame;

use addons\ygame\library\Service;
use app\common\controller\Api;
use EasyWeChat\Factory;

/**
 * 用户接口
 */
class User extends Api
{

    // 无需登录的接口,*表示全部
    protected $noNeedLogin = ['appid','authUser','oauthMiniUser'];
    // 无需鉴权的接口,*表示全部
    protected $noNeedRight = ['*'];

    /**
     *获取APPID
     */
    public function appid(){
        $config = get_addon_config('ygame');
        $appid = $config['mp']['app_id'];

        $this->success('请求成功',['appid'=>$appid]);
    }

    /**
     * 微信h5授权登录
     */
    public function authUser(){

        $config = get_addon_config('ygame');
        $options = array(
            'token'   => "", //填写你设定的key
            'aes_key' => "", //填写加密用的EncodingAESKey
            'app_id'  => $config['mp']['app_id'], //填写高级调用功能的app id
            'secret'  => $config['mp']['app_secret'] //填写高级调用功能的密钥
        );

        $app = Factory::officialAccount($options);
        $oauth = $app->oauth;
        $user = $oauth->user();

        if($user){
            $loginret = Service::connect('mp',['openid'=>$user['original']['openid'],'headimgurl'=>$user['avatar'],'nickname'=>$user['nickname']]);
            if ($loginret) {
                $_userinfo = $this->auth->getUserinfo();

                $data = [
                    'user_id'=> $_userinfo['id'],
                    'avatarUrl'=> $user['avatar'],
                    'nickName'=> $user['nickname'],
                    'token'  => $_userinfo['token']
                ];

                $this->success(__('登录成功'), $data);
            }
            $this->error('请求失败');
        }
    }

    /**
     * 微信小程序授权登录
     */
    public function oauthMiniUser(){

        $config = get_addon_config('ygame');

        $code = $this->request->request("code");

        $options = [
            'app_id'   => $config['mini']['app_id'],
            'secret'   => $config['mini']['app_secret'],
        ];

        $app = Factory::miniProgram($options);
        $sns = $app->auth->session($code);

        if(!empty($sns['openid'])){

            $result = [
                'openid'        => $sns['openid'],
                'headimgurl'       => "",
                'nickname'      => "新用户"
            ];

            $loginret = Service::connect('mini', $result);
            if ($loginret) {
                $userinfo = $this->auth->getUserinfo();
                $user = $this->auth->getUser();
                $data = [
                    'user_id'=> $userinfo['user_id'],
                    'group_id'=> $user['group_id'],
                    'token'  => $userinfo['token'],
                ];
                $this->success(__('Logged in successful'), $data);
            }

            $this->error(__('Operation failed'));
        }
        $this->error(__('Operation failed'));
    }

    /**
     * 小程序解码
     */
    public function decryptData(){
        $config = get_addon_config('ygame');

        $encryptedData = $this->request->request('encryptedData');
        $iv = $this->request->request('iv');
        $code = $this->request->request("code");

        $oprions = [
            'app_id'   => $config['mini']['app_id'],
            'secret'   => $config['mini']['app_secret'],
        ];

        $app = Factory::miniProgram($oprions);
        $sns = $app->auth->session($code);

        if(!empty($sns['session_key'])){
            $data = $app->encryptor->decryptData($sns['session_key'],$iv,$encryptedData);
            $this->success("请求成功",$data);
        }else{
            $this->success("请求失败");
        }

    }

    /**
     * 获取用户详情
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getuserinfo()
    {
        $user = $this->auth->getUser();
        $userModel = new \app\admin\model\User();

        if (!$userInfo = $userModel->field("nickname,avatar,prevtime,logintime,jointime")->where(['id'=>$user['id']])->find()) {
            $this->error();
        }
        $userInfo['avatar'] = empty($userInfo['avatar'])?$this->request->domain()."/assets/addons/yexam/images/logo.png":$userInfo['avatar'];
        $userInfo['avatar'] = strpos($userInfo['avatar'],"http") === false?$this->request->domain().$userInfo['avatar']:$userInfo['avatar'];
        $this->success("请求成功",$userInfo);
    }

    /**
     * 修改会员个人信息
     *
     * @param string $avatar   头像地址

     * @param string $nickname 昵称

     */
    public function profile()
    {
        $user = $this->auth->getUser();
        $nickname = $this->request->request('nickname',"");
        $avatar = $this->request->request('avatar', '', 'trim,strip_tags,htmlspecialchars');
        if($nickname){
            $user->nickname = $nickname;
        }
        if($avatar){
            $user->avatar = $avatar;
        }
        $user->save();
        $this->success();
    }


}
