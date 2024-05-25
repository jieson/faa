<?php
namespace addons\ygame\service;

use app\admin\model\ygame\Order;
use app\admin\model\ygame\Record;
use app\admin\model\ygame\Team;
use think\Db;
use think\Validate;

class Project
{
    public $model;
    public $error;

    public function __construct()
    {
        $this->model = new \app\admin\model\ygame\Project();
    }

    /**
     * 获取团队信息
     * @param $project_id
     * @return array|false|\PDOStatement|string|\think\Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getTeamInfo($project_id,$user_id){
        $teamModel = new Team();
        return $teamModel->where(['project_id'=>$project_id,'user_id'=>$user_id])->find();

    }

    /**
     * 获取赛事列表
     * @param $page
     * @param $limit
     * @throws \think\Exception
     */
    public function getProjectList($where,$page,$limit){
        $count = $this->model->where($where)->count();
        if($page){
            $data = $this->model->where($where)->page($page,$limit)->order("id desc")->select();
        }else{
            $data = $this->model->where($where)->order("id desc")->select();
        }

        return ['total'=>$count,'data'=>$data];
    }

    /**
     * 获取赛事详情
     * @param $where
     * @return array|false|\PDOStatement|string|\think\Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getProjectInfo($where){
        return $this->model->where($where)->find();
    }

    /**
     * 获取群组名称
     * @param $project_id
     * @return array
     */
    public function getGroupName($project_id){
        $groupModel = new \app\admin\model\ygame\Group();
        return $groupModel->where(['project_id'=>$project_id])->column("group_name");
    }

    /**
     * 查看是否允许团队报名
     * @param $project_id
     * @return int|string
     * @throws \think\Exception
     */
    public function getAllowTeam($project_id){
        $groupModel = new \app\admin\model\ygame\Group();
        return $groupModel->where(['project_id'=>$project_id,'allow_team'=>1])->count();
    }

    /**
     * 查看当前项目参与人数
     * @param $project_id
     * @return int|string
     * @throws \think\Exception
     */
    public function getRecordMum($project_id)
    {
        $recordModel = new Record();
        return $recordModel->alias("record")
            ->join("ygame_order order", "record.order_id=order.id", "inner")
            ->where(['order.project_id' => $project_id, 'order.pay_status' => 1])
            ->count();
    }


    /**
     * 查看当前项目参与人
     * @param $project_id
     * @return int|string
     * @throws \think\Exception
     */
    public function getOrderMember($project_id,$limit){
        $orderModel = new Order();
        return collection($orderModel
            ->alias("order")
            ->field("distinct wechat.avatar")
            ->join("ygame_wechat wechat","order.user_id=wechat.user_id","inner")
            ->where(['order.project_id'=>$project_id,'order.pay_status'=>1])
            ->limit($limit)
            ->select())->toArray();
    }




    /**
     * 获取赛事报名人员IDcard
     * @param $project_id
     * @return int|string
     * @throws \think\Exception
     */
    public function getTeamMemberIdcards($project_id){

        $orderModel = new Order();
        $idcards = $orderModel
            ->alias("order")
            ->join("ygame_record record","order.id=record.order_id","inner")
            ->where(['order.project_id'=>$project_id,"order.status"=>['in','1,2']])
            ->column("record.idcard");

        return $idcards;
    }

    /**
     * 检查允许报名时间
     * @param $id
     * @return bool
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    private function checkAllowTime($id){
        $projectModel = new \app\admin\model\ygame\Project();
        if(!$projectInfo = $projectModel->where(['id'=>$id,'status'=>1])->find()){
            $this->error = "赛事异常，请稍候再试";
            return false;
        }else{
            if($projectInfo['start_time'] > time()){
                $this->error = "报名未开始";
                return false;
            }else if(time() > $projectInfo['end_time']){
                $this->error = "报名已结束";
                return false;
            }else{
                return true;
            }
        }

    }


    /**
     * 个人报名
     * @param $data
     * @return false|int
     */
    public function submit($data){

        $validate = new Validate([
            'type'  => 'require|in:1,2',
            'project_id' => 'require',
            'group_id' => 'require',
            'user_id' => 'require',
            'price' => 'require',
            'name'=>'require',
            'mobile'=>'require',
        ]);
        $msg = [
            'type.require' => '名称必须',
            'project_id.require'     => '请选择报名赛事',
            'group_id.require'   => '请选择报名组别',
            'user_id.require'  => '登录信息异常',
            'price.require'        => '当前组别价格存在异常',
            'name.require'        => '请输入姓名',
            'mobile.require'        => '请输入手机号',
            'idcard.require'        => '请输入身份证号',
        ];
        if (!$validate->check($data,$msg)) {
            $this->error = $validate->getError();
            return false;
        }

        //查看是否在允许报名时间
        if(!$this->checkAllowTime($data['project_id'])){
            return false;
        }

        //单独验证身份证是否已经报名
        $recordModel = new Record();
        if($recordModel
            ->alias("record")
            ->join("ygame_order order","record.order_id=order.id",'inner')
            ->where(['record.idcard'=>$data['idcard'],"order.project_id"=>$data['project_id'],"order.status"=>['in','1,2']])
            ->find())
        {
            $this->error = "当前身份证已经报名或正在报名";
            return false;
        }


        //免费活动直接报名成功
        if($data['price']<=0){
            $order_status = 2;
            $pay_status=1;
            $pay_time = time();
        }else{
            $order_status = 1;
            $pay_status=0;
            $pay_time = null;
        }

        Db::startTrans();
        $orderModel = new Order();
        if($orderModel->save([
            'type'=>$data['type'],
            'project_id'=>$data['project_id'],
            'order_no'=>$data['order_no'],
            'out_trade_id'=>$data['order_no'],
            'user_id'=>$data['user_id'],
            'price'=>$data['price'],
            'status'=>$order_status,
            'pay_status'=>$pay_status,
            'pay_time'=>$pay_time
        ])){
            $recordModel = new Record();
            if(!$recordModel->save([
                'type'=>$data['type'],
                'project_id'=>$data['project_id'],
                'group_id'=>$data['group_id'],
                'order_id'=>$orderModel->id,
                'team_id'=>0,
                'name'=>$data['name'],
                'mobile'=>$data['mobile'],
                'idcard'=>$data['idcard'],
                'price'=>$data['price'],
                'status'=>$data['price']<=0?1:0
            ])){
                Db::rollback();
                $this->error = "提交失败";
            }

            //检查当前group报名人数是否超额
            $group = new Group();
            if(!$group->checkNum($data['group_id'])){
                Db::rollback();
                $this->error = $group->error;
                return false;
            }


        }else{
            Db::rollback();
            $this->error = "提交失败";
        }

        Db::commit();
        return ['need_pay'=>$data['price']<=0?0:1,'id'=>$orderModel->id];
    }


    /**
     * 个人通过代表队报名
     * @param $data
     * @return false|int
     */
    public function submit_fromteam($data){

        $validate = new Validate([
            'type'  => 'require|in:1,2',
            'project_id' => 'require',
            'group_id' => 'require',
            'user_id' => 'require',
            'price' => 'require',
            'name'=>'require',
            'mobile'=>'require',
            'team_id'=>'require',
        ]);
        $msg = [
            'type.require' => '名称必须',
            'project_id.require'     => '请选择报名赛事',
            'group_id.require'   => '请选择报名组别',
            'user_id.require'  => '登录信息异常',
            'price.require'        => '当前组别价格存在异常',
            'name.require'        => '请输入姓名',
            'mobile.require'        => '请输入手机号',
            'idcard.require'        => '请输入身份证号',
            'team_id.require'        => '代表队信息异常',
        ];
        if (!$validate->check($data,$msg)) {
            $this->error = $validate->getError();
            return false;
        }

        //查看是否在允许报名时间
        if(!$this->checkAllowTime($data['project_id'])){
            return false;
        }

        //单独验证身份证是否已经报名
        $recordModel = new Record();
        if($recordModel
            ->alias("record")
            ->join("ygame_order order","record.order_id=order.id",'inner')
            ->where(['record.idcard'=>$data['idcard'],"order.project_id"=>$data['project_id'],"order.status"=>['in','1,2']])
            ->find())
        {
            $this->error = "当前身份证已经报名或正在报名";
            return false;
        }


        //免费活动直接报名成功
        if($data['price']<=0){
            $order_status = 2;
            $pay_status=1;
            $pay_time = time();
        }else{
            $order_status = 1;
            $pay_status=0;
            $pay_time = null;
        }

        Db::startTrans();
        $orderModel = new Order();
        if($orderModel->save([
            'type'=>$data['type'],
            'project_id'=>$data['project_id'],
            'order_no'=>$data['order_no'],
            'out_trade_id'=>$data['order_no'],
            'user_id'=>$data['user_id'],
            'price'=>$data['price'],
            'status'=>$order_status,
            'pay_status'=>$pay_status,
            'pay_time'=>$pay_time
        ])){
            $recordModel = new Record();
            if(!$recordModel->save([
                'type'=>$data['type'],
                'project_id'=>$data['project_id'],
                'group_id'=>$data['group_id'],
                'order_id'=>$orderModel->id,
                'team_id'=>$data['team_id'],
                'name'=>$data['name'],
                'mobile'=>$data['mobile'],
                'idcard'=>$data['idcard'],
                'price'=>$data['price'],
                'status'=>$data['price']<=0?1:0
            ])){
                Db::rollback();
                $this->error = "提交失败";
            }

            //检查当前group报名人数是否超额
            $group = new Group();
            if(!$group->checkNum($data['group_id'])){
                Db::rollback();
                $this->error = $group->error;
                return false;
            }


        }else{
            Db::rollback();
            $this->error = "提交失败";
        }

        Db::commit();
        return ['need_pay'=>$data['price']<=0?0:1,'id'=>$orderModel->id];
    }


    public function team_submit($data){

        $validate = new Validate([
            'project_id' => 'require',
            'group' => 'require',
            'user_id' => 'require',
            'price' => 'require',
            'team_name'=>'require',
            'team_leader'=>'require',
            'team_mobile'=>'require',
        ]);
        $msg = [
            'project_id.require'     => '请选择报名赛事',
            'group_id.require'   => '请选择报名组别',
            'user_id.require'  => '登录信息异常',
            'price.require'        => '当前组别价格存在异常',
            'name.require'        => '请输入姓名',
            'mobile.require'        => '请输入手机号',
            'idcard.require'        => '请输入身份证号',
        ];
        if (!$validate->check($data,$msg)) {
            $this->error = $validate->getError();
            return false;
        }

        $member_id = [];

        //查看是否在允许报名时间
        if(!$this->checkAllowTime($data['project_id'])){
            return false;
        }

        //循环遍历报名人员
        foreach($data['group'] as $k=>$v){
            if(!empty($v['member_id'])){
                $member_id = array_merge($member_id,$v['member_id']);
            }
        }

        //检查重复项
        if (count($member_id) != count(array_unique($member_id))){
            $this->error = "当前存在重复报名人员，请确认后重新提交";
            return false;
        }

        //获取报名人员身份证号
        $personModel = new \app\admin\model\ygame\Person();
        $personList = collection($personModel->where(['id'=>['in',$member_id],'user_id'=>$data['user_id']])->select())->toArray();
        if(empty($personList)){
            $this->error = "请选择报名人员";
            return false;
        }

        $idcard = [];
        foreach($personList as $v){
            $idcard[] = $v['idcard'];
        }

        //检查当前身份证号是否存在正在报名或者已经报名的情况
        $orderModel = new Order();
        $ing = $orderModel
            ->alias("order")
            ->field("record.idcard")
            ->join("ygame_record record","order.id=record.order_id","inner")
            ->where(['order.project_id'=>$data['project_id'],'record.idcard'=>['in',$idcard],"order.status"=>['in','1,2']])
            ->find();

        if($ing){
            $this->error = "身份证号：".$ing["idcard"]."的选手已经报名或者正在报名中";
            return false;
        }

        $price = 0;
        $groupPrice = [];
        //计算报名价格
        foreach($data['group'] as $k=>$v){
            if(!empty($v['member_id'])){
                $groupModel = new \app\admin\model\ygame\Group();
                $groupInfo = $groupModel->where(['id'=>$v['group_id'],'allow_team'=>1])->find();
                if(empty($groupInfo)){
                    $this->error = "请确认报名组别";
                    return false;
                }
                $groupPrice[$v['group_id']] = $groupInfo['team_price'];
                $price = bcadd($price,$groupInfo['team_price']*count($v['member_id']),2) ;
            }
        }
        $data['price'] = $price;

        //免费活动直接报名成功
        if($data['price']<=0){
            $order_status = 2;
            $pay_status=1;
            $pay_time = time();
        }else{
            $order_status = 1;
            $pay_status=0;
            $pay_time = null;
        }

        //开始报名
        Db::startTrans();

        //1.写入团队信息
        $teamModel = new Team();
        if(!$teamInfo = $teamModel->where(['project_id'=>$data['project_id'],'user_id'=>$data['user_id']])->find()){
            $teamModel = new Team();
            $teamModel->save(['project_id'=>$data['project_id'],'user_id'=>$data['user_id'],'team_name'=>$data['team_name'],'leader'=>$data['team_leader'],'mobile'=>$data['team_mobile']]);
            $team_id = $teamModel->id;
        }else{
            $teamInfo->save(['team_name'=>$data['team_name'],'leader'=>$data['team_leader'],'mobile'=>$data['team_mobile']]);
            $team_id = $teamInfo['id'];
        }
        $orderModel = new Order();
        if($orderModel->save([
            'type'=>2,
            'project_id'=>$data['project_id'],
            'order_no'=>$data['order_no'],
            'out_trade_id'=>$data['order_no'],
            'user_id'=>$data['user_id'],
            'price'=>$data['price'],
            'status'=>$order_status,
            'pay_status'=>$pay_status,
            'pay_time'=>$pay_time
        ])){
            foreach($data['group'] as $v){
                if(!empty($v['member_id'])){
                    foreach($v['member_id'] as $vv){
                        foreach($personList as $person){
                            if($person['id'] == $vv){
                                $recordModel = new Record();
                                if(!$recordModel->save([
                                    'type'=>2,
                                    'project_id'=>$data['project_id'],
                                    'group_id'=>$v['group_id'],
                                    'order_id'=>$orderModel->id,
                                    'team_id'=>$team_id,
                                    'name'=>$person['person_name'],
                                    'mobile'=>$person['mobile'],
                                    'idcard'=>$person['idcard'],
                                    'price'=>$groupPrice[$v['group_id']],
                                    'status'=>$data['price']<=0?1:0
                                ])){
                                    Db::rollback();
                                    $this->error = "提交失败";
                                    return false;
                                }
                            }
                        }
                    }

                    //检查当前group报名人数是否超额
                    $group = new Group();
                    if(!$group->checkNum($v['group_id'])){
                        Db::rollback();
                        $this->error = $group->error;
                        return false;
                    }
                }
            }

            //检查报名人数

        }else{
            Db::rollback();
            $this->error = "提交失败";
            return false;
        }

        Db::commit();
        return ['need_pay'=>$data['price']<=0?0:1,'id'=>$orderModel->id];
    }

}