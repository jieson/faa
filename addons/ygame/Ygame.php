<?php

namespace addons\ygame;

use app\common\library\Menu;
use think\Addons;

/**
 * 插件
 */
class Ygame extends Addons
{

    /**
     * 插件安装方法
     * @return bool
     */
    public function install()
    {
        $menu = [
            [
                'name'    => 'ygame',
                'title'   => '报名系统',
                'icon'    => 'fa fa-font-awesome',
                'sublist' => [
                    [
                        "name"    => "ygame/project",
                        "title"   => "赛事管理",
                        'icon'    => 'fa fa-map-marker',
                        'sublist' => [
                            ["name" => "ygame/project/index", "title" => "查看",],
                            ["name" => "ygame/project/add", "title" => "添加"],
                            ["name" => "ygame/project/edit", "title" => "编辑"],
                            ["name" => "ygame/project/del", "title" => "删除"],
                            ["name" => "ygame/project/multi", "title" => "批量更新"],
                        ]
                    ],
                    [
                        "name"    => "ygame/banner",
                        "title"   => "轮播图管理",
                        'icon'    => 'fa fa-photo',
                        'sublist' => [
                            ["name" => "ygame/banner/index", "title" => "查看",],
                            ["name" => "ygame/banner/add", "title" => "添加"],
                            ["name" => "ygame/banner/edit", "title" => "编辑"],
                            ["name" => "ygame/banner/del", "title" => "删除"],
                            ["name" => "ygame/banner/multi", "title" => "批量更新"],
                        ]
                    ],
                    [
                        "name"    => "ygame/article",
                        "title"   => "文章管理",
                        'ismenu'  => 0,
                        'sublist' => [
                            ["name" => "ygame/article/index", "title" => "查看",],
                            ["name" => "ygame/article/add", "title" => "添加"],
                            ["name" => "ygame/article/edit", "title" => "编辑"],
                            ["name" => "ygame/article/del", "title" => "删除"],
                            ["name" => "ygame/article/multi", "title" => "批量更新"],
                        ]
                    ],
                    [
                        "name"    => "ygame/group",
                        "title"   => "组别管理",
                        'ismenu'  => 0,
                        'sublist' => [
                            ["name" => "ygame/group/index", "title" => "查看",],
                            ["name" => "ygame/group/add", "title" => "添加"],
                            ["name" => "ygame/group/edit", "title" => "编辑"],
                            ["name" => "ygame/group/del", "title" => "删除"],
                            ["name" => "ygame/group/multi", "title" => "批量更新"],
                        ]
                    ],
                    [
                        "name"    => "ygame/result",
                        "title"   => "成绩管理",
                        'ismenu'  => 0,
                        'sublist' => [
                            ["name" => "ygame/result/index", "title" => "查看",],
                            ["name" => "ygame/result/add", "title" => "添加"],
                            ["name" => "ygame/result/edit", "title" => "编辑"],
                            ["name" => "ygame/result/del", "title" => "删除"],
                            ["name" => "ygame/result/multi", "title" => "批量更新"],
                            ["name" => "ygame/result/import", "title" => "批量更新"],
                            ["name" => "ygame/result/design", "title" => "设计电子成绩证书"],
                        ]
                    ],
                    [
                        "name"    => "ygame/record",
                        "title"   => "报名记录",
                        'icon'    => 'fa fa-braille',
                        'ismenu'  => 0,
                        'sublist' => [
                            ["name" => "ygame/record/index", "title" => "查看",]
                        ]
                    ],
                ]
            ]
        ];
        Menu::create($menu);
        return true;
    }

    /**
     * 插件卸载方法
     * @return bool
     */
    public function uninstall()
    {
        Menu::delete("ygame");
        return true;
    }

    /**
     * 插件启用方法
     * @return bool
     */
    public function enable()
    {
        Menu::enable("ygame");
        return true;
    }

    /**
     * 插件禁用方法
     * @return bool
     */
    public function disable()
    {
        Menu::disable("ygame");
        return true;
    }


}
