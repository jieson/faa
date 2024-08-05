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

    public function resetRecordids($ids = null)
    {
        $row = $this->model->get($ids);
        if (!$row) {
            $this->error(__('No Results were found'));
            return;
        }
        $adminIds = $this->getDataLimitAdminIds();
        if (is_array($adminIds) && !in_array($row[$this->dataLimitField], $adminIds)) {
            $this->error(__('You have no permission'));
            return;
        }




/*
 * 先分，找出重复，跟其余的换
 */
        // 改造record_ids
        $ids = $row->pgrecord_ids;
        $idssarr =  json_decode('['.$ids.']',true);
        $recordRows = \app\admin\model\ygame\Record::all($idssarr);
        $teamids= array_map(function ($record){
            return $record->team_id;
        },$recordRows);
        $personcountinzu = $row->personcountinzu;

        $newteamids= [];
        for ($i=0; $i<count($teamids) ; $i++) {

            if ($i%$personcountinzu == 0){
                $newteamids= [];
            }

            //$id = $idssarr[$i];
            $teamid=$teamids[$i];
            $newteamids[$i%$personcountinzu] = $teamid;



            if ( count($newteamids) != count(array_unique($newteamids)) ){//有重复
                //找下一个不重复的，交换。
                for ($j=$i+1; $j<count($teamids); $j++){
                    $newteamids[$i%$personcountinzu] = $teamids[$j];
                    if ( count($newteamids) == count(array_unique($newteamids)) ){//无重复
                        //交换i 和 j
                        $temp = $teamids[$i];
                        $teamids[$i] = $teamids[$j];
                        $teamids[$j] = $temp;

                        $temp2 = $idssarr[$i];
                        $idssarr[$i] = $idssarr[$j];
                        $idssarr[$j] =$temp2;
                    }
                }
            }else{
                //替换往后找， 找不到就结束
            }
        }


        //一维数组变成二维数组
        $newidss = [];
        $count = count($idssarr);
        $zucount =  intval($count/$personcountinzu) + ($count%$personcountinzu==0?0:1);
        var_dump($count,$zucount,$personcountinzu);
        for ($i=0; $i<$zucount ; $i++) {
            $newidss[$i] = [];
            $yuxiacount = $count-$personcountinzu*$i;//余下的数量
            for ($j=0; $j<($personcountinzu<$yuxiacount?$personcountinzu:$yuxiacount) ; $j++) {
                $newidss[$i][$j] = $idssarr[$personcountinzu*$i+$j];
            }
        }

        $params['record_ids'] = json_encode($newidss) ;
        $params['zucount'] = $zucount;


//        var_dump($oldids);

        $result = false;
        Db::startTrans();
        try {
            //是否采用模型验证
            if ($this->modelValidate) {
                $name = str_replace("\\model\\", "\\validate\\", get_class($this->model));
                $validate = is_bool($this->modelValidate) ? ($this->modelSceneValidate ? $name . '.edit' : $name) : $this->modelValidate;
                $row->validateFailException()->validate($validate);
            }
            $result = $row->allowField(true)->save($params);
            Db::commit();
        } catch (ValidateException|PDOException|Exception $e) {
            Db::rollback();
            $this->error($e->getMessage());
            return;
        }
        if (false === $result) {
            $this->error(__('No rows were updated'));
            return;
        }
        $this->success();
//        $this->success();
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
    /**
     * 编辑
     *
     * @param $ids
     * @return string
     * @throws DbException
     * @throws \think\Exception
     */
    public function edit($ids = null)
    {
        $row = $this->model->get($ids);
        if (!$row) {
            $this->error(__('No Results were found'));
        }
        $adminIds = $this->getDataLimitAdminIds();
        if (is_array($adminIds) && !in_array($row[$this->dataLimitField], $adminIds)) {
            $this->error(__('You have no permission'));
        }
        if (false === $this->request->isPost()) {// 第一次进入页面

            $arr = $row->record_ids;
            $oldids = json_decode($arr,true);
            $namess = [];
            $teamidss= [];
            $findrepeat = false;
//            var_dump($oldids);
            if ($oldids != null && $oldids != ''){
                for($i = 0; $i<count($oldids); $i++){
                    $recordRows = \app\admin\model\ygame\Record::all($oldids[$i]);
                    $names= array_map(function ($record){
                        return $record->name;
                    },$recordRows);
//                var_dump($names);

                    $recordRowss[$i] = $recordRows;
                    $namess[$i] = $names;

                    //team_id
                    $teamids= array_map(function ($record){
                        return $record->team_id;
                    },$recordRows);
                    $teamidss[$i] = $teamids;
                    if ( count($teamids) !== count(array_unique($teamids)) ){//有重复数据
                        $findrepeat = true;
                    }
                }

                if ($findrepeat){
                    var_dump('有多个同一代表队成员分配在一组');
                    var_dump($namess);
                    var_dump($teamidss);
                }
//            $recordRows = \app\admin\model\ygame\Record::all($arr);

                //姓名

                //
//            $obj = $recordRows.find(obj => obj.id === 5);
////            $obj =
//            var_dump($obj);
//            var_dump($recordRows);
                $arrrrr = $row->record_ids;
                $pgrecordRows = \app\admin\model\ygame\Record::all($arrrrr);

                $this->view->assign('pgrecordRows',$pgrecordRows );
            }

            $this->view->assign('row', $row);
            return $this->view->fetch();
        }
        $params = $this->request->post('row/a');
        if (empty($pams)) {
            $this->error(__('Parameter %s can not be empty', ''));
        }
        $params = $this->preExcludeFields($params);

        // 改造record_ids
        $idss = $params['record_ids'];
        $idssarr =  json_decode('['.$params['record_ids'].']',true);
//        $params['record_ids'] = '[['.$idss.']]';

        $oldidsstir = $row->record_ids;
        $oldids = json_decode($oldidsstir,true);
//        var_dump($oldids);
        $index = 0;
        for ($i=0; $i<count($oldids) ; $i++) {
            $oneArr = $oldids[$i];
            var_dump($oneArr);
            for ($j=0; $j<count($oneArr) ; $j++) {
//        var_dump($oneArr[$j]);
//        $oneArr[$j] = 22;//更改了 oneArr， 但是oldids没变？
                $oldids[$i][$j] = $idssarr[$index];
//        var_dump($oneArr[$j]);
                $index++;
            }
        }
//        var_dump($oldids);
        $params['record_ids'] = json_encode($oldids) ;


//        var_dump($oldids);

        $result = false;
        Db::startTrans();
        try {
            //是否采用模型验证
            if ($this->modelValidate) {
                $name = str_replace("\\model\\", "\\validate\\", get_class($this->model));
                $validate = is_bool($this->modelValidate) ? ($this->modelSceneValidate ? $name . '.edit' : $name) : $this->modelValidate;
                $row->validateFailException()->validate($validate);
            }
            $result = $row->allowField(true)->save($params);
            Db::commit();
        } catch (ValidateException|PDOException|Exception $e) {
            Db::rollback();
            $this->error($e->getMessage());
        }
        if (false === $result) {
            $this->error(__('No rows were updated'));
        }
        $this->success();
    }

}
