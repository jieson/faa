<?php

namespace app\admin\model\ygame;

use think\Model;


class Record extends Model
{

    

    

    // 表名
    protected $name = 'ygame_record';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    protected $deleteTime = false;

    // 定义虚拟属性
//    public  $grouplist= [];

    // 追加属性
    protected $append = [
        'status_text',
        'sexdata_text',
        'grouplist',
        'refund_time_text'
    ];
    

    
    public function getStatusList()
    {
        return ['0' => __('Status 0'), '1' => __('Status 1'), '2' => __('Status 2'), '3' => __('Status 3')];
    }

    public function getSexdataList()
    {
        return ['male' => __('Sexdata male'), 'female' => __('Sexdata female')];
    }
    public function getGroupistAttr($value)
    {
        return json_decode($value, true);
    }
    // 设置虚拟属性的值
    public function setGroupistAttr($value)
    {
        $this->grouplist = $value;
    }
    // 获取虚拟属性数组
    public function getGrouplist()
    {
        return $this->grouplist;
    }

    // 设置虚拟属性数组
    public function setGrouplist($value)
    {
        $this->grouplist = $value;
    }

    public function getStatusTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['status']) ? $data['status'] : '');
        $list = $this->getStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function getSexdataTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['sexdata']) ? $data['sexdata'] : '');
        $list = $this->getSexdataList();
        return isset($list[$value]) ? $list[$value] : '';
    }




    public function team()
    {
        return $this->belongsTo('Team', 'team_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }


    public function group()
    {
        return $this->belongsTo('Group', 'group_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }

    public function getRefundTimeTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['refund_time']) ? $data['refund_time'] : '');
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }

    protected function setRefundTimeAttr($value)
    {
        return $value === '' ? null : ($value && !is_numeric($value) ? strtotime($value) : $value);
    }

}
