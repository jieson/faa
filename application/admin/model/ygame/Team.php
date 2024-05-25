<?php

namespace app\admin\model\ygame;

use think\Model;


class Team extends Model
{

    

    

    // 表名
    protected $name = 'ygame_team';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'integer';

    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';
    protected $deleteTime = false;

    // 追加属性
    protected $append = [

    ];
    

    







    public function project()
    {
        return $this->belongsTo('Project', 'project_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }


    public function user()
    {
        return $this->belongsTo('app\admin\model\User', 'trainer_id', 'id', [], 'LEFT')->setEagerlyType(0);
    }
}
