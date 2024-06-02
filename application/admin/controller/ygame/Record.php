<?php

namespace app\admin\controller\ygame;

use app\common\controller\Backend;
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

            $params = $this->request->param();
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();

            $list = $this->model
                    ->with(['team','group'])
                    ->where($where)
                    ->order($sort, $order)
                    ->paginate($limit);

            // 获取关联模型 group 的特定记录
            $project_id = $this->request->param('project_id');
            $grmodel = new \app\admin\model\ygame\Group;
            $groupRecords = $grmodel->where('project_id', $project_id)->field('id, group_name')->select();
//            $groupArray = collection($groupRecords)->toArray();

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
                $row->setGrouplist($groupRecords);
//                $row.data
//                var_dump($row);
                //添加一项
            }
//            $this->assign('groups123', "kljsdkf");
//            $this->assignconfig('demo123',['token'=>$this->auth->token]);
//            $this->assignconfig('groupRecords', ['name'=>'名']);
//            $this->view->assign('mengjie', $groupArray);
            $result = array("total" => $list->total(), "rows" => $list->items(), "groups"=>$groupRecords );


            return json($result);
        }
        return $this->view->fetch();
    }

}
