<?php
namespace addons\ygame\service;

class Record
{

    public $model;

    public function __construct()
    {
        $this->model = new \app\admin\model\ygame\Record();
    }

    public function scanRecordList($name,$idcard){
        $count = $this->model
            ->alias("record")
            ->join("ygame_project project","project.id=record.project_id")
            ->join("ygame_group group","group.id=record.group_id")
            ->where(['record.name'=>$name,'record.idcard'=>$idcard,'record.status'=>1])
            ->order("record.id desc")
            ->count();

        $data = $this->model
            ->alias("record")
            ->field("record.group_id,record.type,record.name,record.mobile,record.idcard,group.group_name,project.project_name")
            ->join("ygame_project project","project.id=record.project_id")
            ->join("ygame_group group","group.id=record.group_id")
            ->where(['record.name'=>$name,'record.idcard'=>$idcard,'record.status'=>1])
            ->order("record.id desc")
            ->select();

        return ['total'=>$count,'data'=>$data];
    }

    /**
     * 获取报名信息
     * @param $order_id
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getRecordMembers($order_id,$user_id){
        $data = $this->model
            ->alias("record")
            ->field("record.group_id,record.name,record.mobile,record.idcard,group.group_name")
            ->join("ygame_order order","order.id=record.order_id")
            ->join("ygame_project project","project.id=record.project_id")
            ->join("ygame_group group","group.id=record.group_id")
            ->where(['record.order_id'=>$order_id,'order.user_id'=>$user_id])
            ->order("record.id asc")
            ->select();
        $member = [];

        foreach($data as $k=>$v){
            if(empty($member[$v['group_id']])){
                $member[$v['group_id']] = ['group_name'=>$v['group_name']];
            }
            $member[$v['group_id']]['members'][] = ['name'=>$v['name'],'mobile'=>$v['mobile'],'idcard'=>$v['idcard']];
        }

        return $member;
    }
}