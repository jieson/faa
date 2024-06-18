<?php

namespace app\admin\controller\ygame;

use app\common\controller\Backend;
use think\Db;
use think\db\exception\BindParamException;
use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\Console;

/**
 * 
 *
 * @icon fa fa-circle-o
 */
class Fenzu extends Backend
{

    /**
     * Fenzu模型对象
     * @var \app\admin\model\ygame\Fenzu
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\ygame\Fenzu;
        $this->view->assign("zubieIdList", $this->model->getZubieIdList());
        $this->view->assign("juesaiList", $this->model->getJuesaiList());
        $this->view->assign("ruleList", $this->model->getRuleList());
    }



    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */


    /**
     * 查看
     */
    public function index()
    {
        //当前是否为关联查询
        $this->relationSearch = true;
        //设置过滤方法
        $this->request->filter(['strip_tags', 'trim']);
        if ($this->request->isAjax()) {
            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('keyField')) {
                return $this->selectpage();
            }
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();

            $list = $this->model
                    ->with(['group','record'])
                    ->where($where)
                    ->order($sort, $order)
                    ->paginate($limit);

            foreach ($list as $row) {
                
                $row->getRelation('group')->visible(['group_name']);
				$row->getRelation('record')->visible(['name','numid']);
            }

            $result = array("total" => $list->total(), "rows" => $list->items());

            return json($result);
        }
        return $this->view->fetch();
    }
    public function create($ids = '')
    {
        $this->success("模拟创建成功");
    }

    public function add($ids = null)
    {
//        print_r("function add()");
        if (false === $this->request->isPost()) {
//            print_r("is not post");
            $row = $this->model->get($ids);
            if ($row) {
                $preSetData['personcount'] = $row->getData('personcount');
                $preSetData['zucount'] = '1';
                $preSetData['project_id'] = $row->getData('project_id');
                $preSetData['name'] = $row->getData('name');
                $this->view->assign("row", $preSetData);
            }
            return $this->view->fetch();
        }


        $params = $this->request->post('row/a');
        if (empty($params)) {
            $this->error(__('Parameter %s can not be empty', ''));
        }
        $params = $this->preExcludeFields($params);

        if ($this->dataLimit && $this->dataLimitFieldAutoFill) {
            $params[$this->dataLimitField] = $this->auth->id;
        }
        $result = false;
        Db::startTrans();
        try {
            //是否采用模型验证
            if ($this->modelValidate) {
                $name = str_replace("\\model\\", "\\validate\\", get_class($this->model));
                $validate = is_bool($this->modelValidate) ? ($this->modelSceneValidate ? $name . '.add' : $name) : $this->modelValidate;
                $this->model->validateFailException()->validate($validate);
            }
            $result = $this->model->allowField(true)->save($params);

            //修改旧数据
            $f= $this->model->get($ids);
            $f->juesai     = '0';
            $f->save();

            Db::commit();
        } catch (ValidateException|PDOException|Exception $e) {
            Db::rollback();
            $this->error($e->getMessage());
        }
        if ($result === false) {
            $this->error(__('No rows were inserted'));
        }
        $this->success("成功");
    }

    // 在你的控制器中找到或添加 add 方法
//    public function add($ids = null)
//    {
//        $row = $this->model->get($ids);
//        if (!$row) {
//            $this->error(__('No Results were found'));
//        }
//        if ($this->request->isPost()) {
//            $params = $this->request->post("row/a");
//            if ($this->dataModel->insert($params)) {
//                $this->success();
//            } else {
//                $this->error($this->dataModel->getError() ?: '添加失败');
//            }
//        }
//        // 预制数据
////        $fields = $this->getFields(); // 获取当前数据表的字段信息
////        $preSetData = [];
////        foreach ($fields as $field) {
//            // 这里可以根据需要预制不同的字段数据
////            if ($field['name'] == 'name') {
////                $preSetData['name'] = '默认值';
////            }
////        }
//
//        $preSetData['name'] = '预设的数据';//$this->model->toJson();
//        $this->view->assign("row", $preSetData); // 将预制的数据分配到视图
////        if (false === $this->request->isPost()) {
//            return $this->view->fetch();
////        }
////        return parent::add();
//        $this->success();
//    }

}
