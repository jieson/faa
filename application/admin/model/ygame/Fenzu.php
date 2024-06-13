<?php

namespace app\admin\model\ygame;

use think\Model;


class Fenzu extends Model
{

    

    

    // 表名
    protected $name = 'ygame_fenzu';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    protected $deleteTime = false;

    // 追加属性
    protected $append = [
        'juesai_text',
        'rule_text'
    ];
    

    
    public function getJuesaiList()
    {
        return ['1' => __('Juesai 1'), '0' => __('Juesai 0')];
    }

    public function getRuleList()
    {
        return ['0' => __('Rule 0'), '1' => __('Rule 1'), '2' => __('Rule 2'), '3' => __('Rule 3')];
    }


    public function getJuesaiTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['juesai']) ? $data['juesai'] : '');
        $list = $this->getJuesaiList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function getRuleTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['rule']) ? $data['rule'] : '');
        $list = $this->getRuleList();
        return isset($list[$value]) ? $list[$value] : '';
    }




    public function group()
    {
        return $this->belongsTo('app\admin\model\auth\Group', 'group_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }


    public function record()
    {
        return $this->belongsTo('Record', 'record_ids', 'id', [], 'LEFT')->setEagerlyType(0);
    }
}
