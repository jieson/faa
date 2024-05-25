<?php
namespace addons\ygame\service;


use app\admin\model\ygame\Record;

class Order
{
    public $model;
    public $error;

    public function __construct()
    {
        $this->model = new \app\admin\model\ygame\Order();
    }

    /**
     * 按条件返回model
     * @param $status
     * @return \app\admin\model\ygame\order
     */
    private function getModelByWhere($status){

        $model = $this->model->alias("order");
        switch ($status){
            case "1":       //待付款
                $model = $model->where(['order.status'=>1]);
                break;
            case "2":       //已报名
                $model = $model->where(['order.status'=>2]);
                break;
            case "-1":       //交易关闭
                $model = $model->where(['order.status'=>-1]);
                break;
        }

        return $model;
    }

    /**
     * 完善订单详情
     * @param $order
     * @return mixed
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    private function tidyOrder($order){
        $project = new Project();
        $projectInfo = $project->getProjectInfo(['id'=>$order['project_id']]);
        if($projectInfo){
            $order['project_name'] = $projectInfo['project_name'];
            $order['project_image'] = $projectInfo['image'];
        }
        $recordModel = new Record();
        $order['count'] = $recordModel->where(['order_id'=>$order['id']])->count();

        switch ($order['status']){
            case "-1":
                $order['status_name'] = "已关闭";
                break;
            case "1":
                $order['status_name'] = "待支付";
                break;
            case "2":
                $order['status_name'] = "已报名";
                break;
        }
        if($order['status'] == 1){
            $config = get_addon_config('ygame');
            $order_expire = $config['order_expire'];
            if($order_expire){
                $order['cancel_time'] = date("m-d H:i",strtotime("+".$order_expire." minutes",$order['createtime']));
            }else{
                $order['cancel_time'] = "";
            }

        }
        return $order;
    }

    /**
     * 获取订单列表
     * @param $status
     * @param int $page
     * @param int $limit
     * @return array
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getOrderList($status,$where,$page=0,$limit=0){
        $model = $this->getModelByWhere($status);
        $total = $model->where($where)->count();

        $model = $this->getModelByWhere($status);
        $data = collection($model
            ->join("ygame_project project","order.project_id=project.id")
            ->field("order.id,order.project_id,order.type,order.order_no,order.price,order.status,order.pay_time,order.createtime")->where($where)->page($page,$limit)->order('id desc')->select())->toArray();
        foreach($data as &$v){
            $v = self::tidyOrder($v);
        }
        return ['total'=>$total,'data'=>$data];
    }


    /**
     * 获取订单详情
     * @param $id
     * @param $user_id
     * @return array|false|\PDOStatement|string|\think\Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getOrderInfo($id,$user_id){
        return $this->model->where(['id'=>$id,'user_id'=>$user_id])->find();
    }


    /**
     * 获取订单数量
     * @param $status
     * @param $user_id
     * @return array|false|\PDOStatement|string|\think\Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getOrderNum($status,$user_id){
        return $this->model
            ->alias("order")
            ->join("ygame_project project","order.project_id=project.id")
            ->where(['order.status'=>$status,'order.user_id'=>$user_id])->count();
    }

    /**
     * 取消订单
     * @param $id
     * @param $user_id
     */
    public function cancelOrder($id,$user_id){
        $orderInfo = self::getOrderInfo($id,$user_id);
        if(empty($orderInfo)){
            $this->error = "当前订单不存在";
            return false;
        }

        if($orderInfo['status'] != 1){
            $this->error = "当前订单状态异常";
            return false;
        }

        if($orderInfo->save(['status'=>'-1'])){
            return true;
        }else{
            $this->error = "提交失败";
            return false;
        }
    }

    /**
     * 取消超时订单
     */
    public static function cancel_order(){
        $config = get_addon_config('ygame');
        $order_expire = $config['order_expire'];
        if($order_expire){
            $orderModel = new \app\admin\model\ygame\Order();
            $orderModel->save(['status'=>'-1'],['status'=>1,'createtime'=>['lt',time()-$order_expire*60]]);
        }
    }


}