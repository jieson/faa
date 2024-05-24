<?php

namespace app\admin\controller;

use app\common\controller\Backend;

/**
 * 测试管理
 *
 * @icon fa fa-circle-o
 */
class Test extends Backend
{

    /**
     * Test模型对象
     * @var \app\admin\model\Test
     */
    protected $model = null;

    // mj add
    protected $noNeedLogin = ['work1']; //无需登录的方法,同时也就不需要鉴权了
    protected $noNeedRight = ['test1']; //无需鉴权的方法,但需要登录

    /**
     * 是否开启数据限制
     * 支持auth/personal
     * 表示按权限判断/仅限个人
     * 默认为禁用,若启用请务必保证表中存在admin_id字段
     */
    protected $dataLimit = 'auth';

    /**
     * 数据限制字段
     */
    protected $dataLimitField = 'admin_id';

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\Test;
        $this->view->assign("weekList", $this->model->getWeekList());
        $this->view->assign("flagList", $this->model->getFlagList());
        $this->view->assign("genderdataList", $this->model->getGenderdataList());
        $this->view->assign("hobbydataList", $this->model->getHobbydataList());
        $this->view->assign("statusList", $this->model->getStatusList());
        $this->view->assign("stateList", $this->model->getStateList());


        //渲染站点配置
//        $this->assign('site', $site);
//        //渲染配置信息
//        $this->assign('config', $config);
//        //渲染权限对象
//        $this->assign('auth', $this->auth);
//        //渲染管理员对象
//        $this->assign('admin', Session::get('admin'));
        $this->assign('ceshi123', '测试123');
    }



    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */

    /**
     * work1
     */
    public function work1()
    {
        return '无需登录和鉴权 work1';
    }

    /**
     * test1
     */
    public function test1()
    {
        return '需要登录，不需要鉴权 tstt1';
    }

}
