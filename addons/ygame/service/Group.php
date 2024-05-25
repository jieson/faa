<?php
namespace addons\ygame\service;

class Group
{
    public $model;
    public $error;

    public function __construct()
    {
        $this->model = new \app\admin\model\ygame\Group();
    }

    /**
     * 获取组别列表
     * @param $page
     * @param $limit
     * @throws \think\Exception
     */
    public function getGroupList($where,$page=0,$limit=0){
        $count = $this->model->where($where)->count();
        if($page){
            $data = $this->model->where($where)->page($page,$limit)->order("id asc")->select();
        }else{
            $data = $this->model->where($where)->order("id asc")->select();
        }

        return ['total'=>$count,'data'=>$data];
    }

    /**
     * 获取组别
     * @param $where
     * @return array|false|\PDOStatement|string|\think\Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getGroupInfo($where){
        return $this->model->where($where)->find();
    }


    /**
     * 检查报名人数是否已经超额
     * @param $group_id
     * @return bool
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function checkNum($group_id){
        $groupModel = new \app\admin\model\ygame\Group();
        if(!$groupInfo = $groupModel->where(['id'=>$group_id])->find()){
            $this->error = "当前组别不存在";
            return false;
        }

        $recordModel = new \app\admin\model\ygame\Record();
        $count = $recordModel
            ->alias("record")
            ->join("ygame_order order","record.order_id=order.id","inner")
            ->where(['order.status'=>['in','1,2'],'record.group_id'=>$group_id])
            ->count();
        if($count > $groupInfo['num']){
            $this->error = $groupInfo['group_name']."报名人数已满";
            return false;
        }

        return true;
    }

}