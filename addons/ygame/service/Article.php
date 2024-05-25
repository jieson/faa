<?php
namespace addons\ygame\service;

class Article
{

    public $model;

    public function __construct()
    {
        $this->model = new \app\admin\model\ygame\Article();
    }

    /**
     * 获取文章列表
     * @param $page
     * @param $limit
     * @throws \think\Exception
     */
    public function getArticleList($where,$page,$limit){
        $count = $this->model->where($where)->count();
        if($page){
            $data = $this->model->where($where)->page($page,$limit)->order("id desc")->select();
        }else{
            $data = $this->model->where($where)->order("id desc")->select();
        }

        return ['total'=>$count,'data'=>$data];
    }


    /**
     * 获取文章详情
     * @param $id
     * @return false|\PDOStatement|string|\think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getArticleInfo($id){
        return $this->model->where(['id'=>$id])->order("id desc")->find();
    }

}