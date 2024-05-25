<?php
namespace addons\ygame\service;

class Ad
{

    public $model;

    public function __construct()
    {
        $this->model = new \app\admin\model\ygame\Ad();
    }

    /**
     * 获取轮播图列表
     * @param $page
     * @param $limit
     * @throws \think\Exception
     */
    public function getAdList($page,$limit){
        $count = $this->model->count();
        if($page){
            $data = $this->model->page($page,$limit)->order("weigh asc")->select();
        }else{
            $data = $this->model->order("weigh asc")->select();
        }

        return ['total'=>$count,'data'=>$data];
    }

}