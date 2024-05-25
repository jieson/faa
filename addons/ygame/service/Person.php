<?php
namespace addons\ygame\service;

use think\Validate;

class Person
{

    public $error;
    public $model;

    public function __construct()
    {
        $this->model = new \app\admin\model\ygame\Person();
    }

    /**
     * 获取成员列表
     * @param $page
     * @param $limit
     * @throws \think\Exception
     */
    public function getPersonList($where,$page,$limit){
        $count = $this->model->where($where)->count();
        if($page){
            $data = $this->model->where($where)->page($page,$limit)->order("id desc")->select();
        }else{
            $data = $this->model->where($where)->order("id desc")->select();
        }
        return ['total'=>$count,'data'=>$data];
    }


    /**
     * 获取详情
     * @param $id
     * @return array|false|\PDOStatement|string|\think\Model
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getPersonInfo($id){
        return $this->model->where(['id'=>$id])->find();
    }



    /**
     * 添加成员
     * @param $data
     * @return false|int
     */
    public function addPerson($data){

        $rule = [
            'person_name'  => 'require',
            'mobile' => 'require',
            'idcard' => 'require|unique:ygame_person,user_id='.$data['user_id']."&idcard=".$data['idcard'],
        ];

        $msg = [
            'person_name.require'  => '请输入姓名',
            'mobile.require'        => '请输入手机号',
            'idcard.require'        => '请输入身份证号',
            'idcard.unique'        => '当前身份证已经添加过了',
        ];

        $validate   = Validate::make($rule,$msg);
        $result = $validate->check($data);

        if(!$result) {
            $this->error = $validate->getError();
            return false;
        }
        
        return $this->model->allowField(true)->save($data);
    }


    /**
     * 编辑成员
     * @param $id
     * @param $data
     * @return bool|false|int
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function editPerson($id,$data){

        $row = $this->model->where(['id'=>$id,'user_id'=>$data['user_id']])->find();
        if(empty($row)){
            $this->error = "当前记录不存在";
            return false;
        }


        $rule = [
            'person_name'  => 'require',
            'mobile' => 'require',
        ];

        $msg = [
            'person_name.require'  => '请输入姓名',
            'mobile.require'        => '请输入手机号',
            'idcard.require'        => '请输入身份证号',
            'idcard.unique'        => '当前身份证已经添加过了',
        ];

        $validate   = Validate::make($rule,$msg);
        $result = $validate->check($data);
        if(!$result) {
            $this->error = $validate->getError();
            return false;
        }

        //验证身份证唯一
        if($this->model->where(['id'=>['neq',$id],'idcard'=>$data['idcard'],'user_id'=>$data['user_id']])->find()){
            $this->error = "当前身份证已经添加过了";
            return false;
        }

        if($row->allowField(true)->save($data)){
            return true;
        }else{
            $this->error = "成员信息未更新";
            return false;
        }
    }


    /**
     * 删除成员
     * @param $id
     * @param $user_id
     * @return bool|int
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function delPerson($id,$user_id){
        $row = $this->model->where(['id'=>$id,'user_id'=>$user_id])->find();
        if(empty($row)){
            $this->error = "当前记录不存在";
            return false;
        }

        return $row->delete();
    }


}