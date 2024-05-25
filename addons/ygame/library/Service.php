<?php

namespace addons\ygame\library;

use app\common\model\User;
use fast\Random;
use think\Db;
use think\exception\PDOException;
use think\Log;

/**
 *
 */
class Service
{
    public static function connect($type,$params = [])
    {
        $data = [
            'type'   => $type,
            'openid'   => $params['openid'],
            'avatar'   => $params['headimgurl'],
            'nickname' => isset($params['nickname']) ? $params['nickname'] : '',
        ];
        $auth = \app\common\library\Auth::instance();

        $need_register = false;
        $wechatUser = \app\admin\model\ygame\Wechat::get(['type'=>$type,'openid' => $params['openid']]);


        if ($wechatUser) {
            $user = User::get($wechatUser['user_id']);
            if (empty($user)) {
                $wechatUser->delete();
                $need_register = true;
            }
        } else {
            $need_register = true;
        }

        if($need_register){
            // 先随机一个用户名,随后再变更为u+数字id
            $username = Random::alnum(20);
            $password = Random::alnum(6);
            $domain = request()->host();

            Db::startTrans();
            try {
                $result = $auth->register($username, $password, $username . '@' . $domain, '');
                if (!$result) {
                    return false;
                }
                $user = $auth->getUser();
                $fields = [
                    'username' => 'wx' . $user->id,
                    'email' => 'wx' . $user->id . '@' . $domain,
                    'nickname'=>$data['nickname'],
                    'avatar'=>$data['avatar']
                ];

                // 更新会员资料
                $user = User::get($user->id);
                $user->save($fields);

                $data['user_id'] = $user->id;
                \app\admin\model\ygame\Wechat::create($data);
                Db::commit();
            } catch (PDOException $e) {
                Db::rollback();
                Log::error($e->getMessage());
                return false;
            }
        }
        return $auth->direct($user->id);
    }
}
