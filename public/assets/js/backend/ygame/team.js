define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'ygame/team/index' + location.search,
                    add_url: 'ygame/team/add',
                    edit_url: 'ygame/team/edit',
                    del_url: 'ygame/team/del',
                    multi_url: 'ygame/team/multi',
                    import_url: 'ygame/team/import',
                    table: 'ygame_team',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                fixedColumns: true,
                fixedRightNumber: 1,
                columns: [
                    [
                        // {checkbox: true},
                        {field: 'team_name', title: __('Team_name'), operate: 'LIKE'},
                        {
                            field: 'buttons',
                            width: "120px",
                            title: __('按钮组'),
                            table: table,
                            events: Table.api.events.operate,
                            buttons: [
                                {
                                    name: 'detail',
                                    text: __('邀请码'),
                                    title: 'team_name',
                                    extend:'data-area=\'["500px","500px"]\'',
                                    classname: 'btn btn-xs btn-primary btn-dialog',
                                    icon: 'fa fa-list',
                                    url: 'http://47.98.190.29/qrcreat.php?project_id={project_id}&team_id={id}',
                                    callback: function (data) {
                                        // Layer.alert(data, {title: "回传数据"});
                                    },
                                    visible: function (row) {
                                        //返回true时按钮显示,返回false隐藏
                                        return true;
                                    }
                                },
                                // {
                                //     name: 'ajax',
                                //     text: __('发送Ajax'),
                                //     title: __('发送Ajax'),
                                //     classname: 'btn btn-xs btn-success btn-magic btn-ajax',
                                //     icon: 'fa fa-magic',
                                //     url: 'example/bootstraptable/detail',
                                //     confirm: '确认发送',
                                //     success: function (data, ret) {
                                //         Layer.alert(ret.msg + ",返回数据：" + JSON.stringify(data));
                                //         //如果需要阻止成功提示，则必须使用return false;
                                //         //return false;
                                //     },
                                //     error: function (data, ret) {
                                //         console.log(data, ret);
                                //         Layer.alert(ret.msg);
                                //         return false;
                                //     }
                                // },
                            ],
                            formatter: Table.api.formatter.buttons
                        },
                        {field: 'id', title: __('Id')},
                        {field: 'user_id', title: __('User_id')},
                        {field: 'project_id', title: __('Project_id')},

                        {field: 'leader', title: __('Leader'), operate: 'LIKE'},
                        {field: 'mobile', title: __('Mobile'), operate: 'LIKE'},
                        {field: 'createtime', title: __('Createtime'), operate:'RANGE', addclass:'datetimerange', autocomplete:false, formatter: Table.api.formatter.datetime},
                        {field: 'updatetime', title: __('Updatetime'), operate:'RANGE', addclass:'datetimerange', autocomplete:false, formatter: Table.api.formatter.datetime},
                        {field: 'trainer_id', title: __('Trainer_id')},
                        {field: 'admin_id', title: __('Admin_id')},
                        {field: 'project.project_name', title: __('Project.project_name'), operate: 'LIKE', table: table, class: 'autocontent', formatter: Table.api.formatter.content},
                        {field: 'user.nickname', title: __('User.nickname'), operate: 'LIKE'},
                        {field: 'admin.nickname', title: __('Admin.nickname'), operate: 'LIKE'},

                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
        edit: function () {
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});
