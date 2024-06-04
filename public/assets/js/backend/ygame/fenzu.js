define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'ygame/fenzu/index' + location.search,
                    add_url: 'ygame/fenzu/add',
                    edit_url: 'ygame/fenzu/edit',
                    del_url: 'ygame/fenzu/del',
                    multi_url: 'ygame/fenzu/multi',
                    import_url: 'ygame/fenzu/import',
                    table: 'ygame_fenzu',
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
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {field: 'date', title: __('Date'), operate:'RANGE', addclass:'datetimerange', autocomplete:false},
                        {field: 'starttime', title: __('Starttime'), operate:'RANGE', addclass:'datetimerange', autocomplete:false},
                        {field: 'group_id', title: __('Group_id')},
                        {field: 'zubie_id', title: __('Zubie_id')},
                        {field: 'juesai', title: __('Juesai'), searchList: {"1":__('Juesai 1'),"0":__('Juesai 0')}, formatter: Table.api.formatter.normal},
                        {field: 'personcount', title: __('Personcount')},
                        {field: 'zucount', title: __('Zucount')},
                        {field: 'beizhu', title: __('Beizhu'), operate: 'LIKE', table: table, class: 'autocontent', formatter: Table.api.formatter.content},
                        {field: 'project_id', title: __('Project_id')},
                        {field: 'endtime', title: __('Endtime'), operate:'RANGE', addclass:'datetimerange', autocomplete:false},
                        {field: 'group.group_name', title: __('Group.group_name'), operate: 'LIKE', table: table, class: 'autocontent', formatter: Table.api.formatter.content},
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
