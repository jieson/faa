<?php

namespace app\admin\controller\ygame;

use app\common\controller\Backend;
use think\Db;
use think\db\exception\BindParamException;
use think\db\exception\DataNotFoundException;
use think\db\exception\ModelNotFoundException;
use think\Console;

//use app\model\Group;
/**
 * 报名详情管理
 *
 * @icon fa fa-circle-o
 */
class Record extends Backend
{

    /**
     * Record模型对象
     * @var \app\admin\model\ygame\Record
     */
    protected $model = null;


    /**
     * 是否开启数据限制
     * 支持auth/personal
     * 表示按权限判断/仅限个人
     * 默认为禁用,若启用请务必保证表中存在admin_id字段
     */
    protected $dataLimit = 'auth';


    /**
     * 是否是关联查询
     */
    protected $relationSearch = true;
    /**
     * 数据限制字段
     */
    protected $dataLimitField = 'admin_id';
    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\ygame\Record;
        $this->view->assign("statusList", $this->model->getStatusList());
        $this->view->assign("sexdataList", $this->model->getSexdataList());

        $this->assign("mengjie",  ['name'=>'_initialize']);
        $this->assignconfig('mengjie2', ['name'=>'_initialize']);
//        $this->assignconfig('demo12',[
//            'token'=>$this->model,
//            'userid'=>$this->auth->id,
//        ]);
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

            $project_id = $this->request->param('project_id');
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();

            $list = $this->model
                    ->with(['team','group'])
                    ->where($where)
                    ->where(['record.project_id'=>$project_id])
                    ->order($sort, $order)
                    ->paginate($limit);

            foreach ($list as $row) {
//                $row->visible(['id','name','mobile','idcard','status','group_ids','numid','sexdata','grouplist']);
//                $row->visible(['team']);
				$row->getRelation('team')->visible(['team_name']);
//				$row->visible(['group']);
//                $row->getRelation('group')->visible(['group_name']);


//               // 动态绑定属性
//               Request::instance()->bind('user',new User);
//                $row->bind('grouplist',$groupRecords);
//                $row->push(['group1'=>1, 'group2'=>2, 'group3'=>3]);
//                $row->setGrouplist(['group1'=>1, 'group2'=>2, 'group3'=>3]);
//                $row->setGrouplist($groupRecords);
//                $row.data
//                var_dump($row);
                //添加一项
            }
//            $this->assign('groups123', "kljsdkf");
//            $this->assignconfig('demo123',['token'=>$this->auth->token]);
//            $this->assignconfig('groupRecords', ['name'=>'名']);
//            $this->view->assign('mengjie', $groupArray);
            $result = array("total" => $list->total(), "rows" => $list->items() );


            return json($result);
        }
        return $this->view->fetch();
    }

    public function create($ids = '')
    {
        $this->success("模拟启动成功");
    }
    /**
     * 构造 新数据存入
     */
    public function creatNewFenzuModels()
    {
        $fenzus = [];
        $data = $this->request->post('rows');
        $datas = json_decode($data,true);
//        $this->success("请求成功",null,$datas);
//        return json($datas);
//        dump("下面是拿到的");
//        dump($datas.count());
//        dump($datas);


//        return $datas;

        Db::startTrans();
        try {
//            //是否采用模型验证
//            if ($this->modelValidate) {
//                $name = str_replace("\\model\\", "\\validate\\", get_class($this->model));
//                $validate = is_bool($this->modelValidate) ? ($this->modelSceneValidate ? $name . '.add' : $name) : $this->modelValidate;
//                $this->model->validateFailException()->validate($validate);
//            }
            $weigh = 0;
            foreach ($datas as $element) {
                $weigh = $weigh +1;
                $strrecoids = '['.json_encode($element['record_ids']).']';
//                $strrecoids = strval($element['record_ids']);//报错
//                $strrecoids = implode(',', $element['record_ids']);
                $fenzumodel = new \app\admin\model\ygame\Fenzu();
                $fenzumodel->data([
                    'name'=>$element['name'],
                    'project_id'=>$element['project_id'],
                    'record_ids'=> $strrecoids,
                    'zucount'=>'1',
                    'weigh'=>$weigh,
                    'personcount'=>$element['personcount']
                ]);
//                $fenzumodel.record_ids = $element.record_ids;
//                $fenzumodel['record_ids'] = $element.record_ids;
                $fenzus[] = $fenzumodel;
                $result = $fenzumodel->save();
            }
//            $result = $fenzumodel->allowField(true)->save($params);
            Db::commit();
        } catch (ValidateException|PDOException|Exception $e) {
            Db::rollback();
            $this->error($e->getMessage());
            return ;
        }
        if ($result === false) {
            $this->error(__('No rows were inserted'));
            return ;
        }
        $this->success("请求成功",null,$fenzus);
        return json($fenzus);

//        return json($fenzus);
    }
    /**
     * 添加
     *
     * @return string
     * @throws \think\Exception
     */
    public function addall()
    {
        if (false === $this->request->isPost()) {
            return $this->view->fetch();
        }

        $fenzus = $this->request->post('rows');


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
            Db::commit();
        } catch (ValidateException|PDOException|Exception $e) {
            Db::rollback();
            $this->error($e->getMessage());
        }
        if ($result === false) {
            $this->error(__('No rows were inserted'));
        }
        $this->success();
    }

}
