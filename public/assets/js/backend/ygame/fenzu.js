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
                        {field: 'endtime', title: __('Endtime'), operate:'RANGE', addclass:'datetimerange', autocomplete:false},
                        {field: 'group_id', title: __('Group_id')},
                        {field: 'zubie_id', title: __('Zubie_id'), searchList: {"0":__('Zubie_id 0'),"1":__('Zubie_id 1'),"2":__('Zubie_id 2'),"3":__('Zubie_id 3'),"4":__('Zubie_id 4')}, formatter: Table.api.formatter.normal},
                        {field: 'juesai', title: __('Juesai'), searchList: {"1":__('Juesai 1'),"0":__('Juesai 0')}, formatter: Table.api.formatter.normal},
                        {field: 'personcount', title: __('Personcount')},
                        {field: 'zucount', title: __('Zucount')},
                        {field: 'beizhu', title: __('Beizhu'), operate: 'LIKE', table: table, class: 'autocontent', formatter: Table.api.formatter.content},
                        {field: 'project_id', title: __('Project_id')},
                        {field: 'name', title: __('Name'), operate: 'LIKE'},
                        {field: 'record_ids', title: __('Record_ids'), operate: 'LIKE', table: table, class: 'autocontent', formatter: Table.api.formatter.content},
                        {field: 'rule', title: __('Rule'), searchList: {"0":__('Rule 0'),"1":__('Rule 1'),"2":__('Rule 2'),"3":__('Rule 3')}, formatter: Table.api.formatter.normal},
                        {field: 'group.name', title: __('Group.name'), operate: 'LIKE'},
                        // {field: 'record.id', title: __('Record.id')},
                        // {field: 'record.project_id', title: __('Record.project_id')},
                        // {field: 'record.order_id', title: __('Record.order_id')},
                        // {field: 'record.type', title: __('Record.type')},
                        // {field: 'record.group_id', title: __('Record.group_id')},
                        // {field: 'record.team_id', title: __('Record.team_id')},
                        // {field: 'record.name', title: __('Record.name'), operate: 'LIKE'},
                        // {field: 'record.mobile', title: __('Record.mobile'), operate: 'LIKE'},
                        // {field: 'record.idcard', title: __('Record.idcard'), operate: 'LIKE'},
                        // {field: 'record.price', title: __('Record.price'), operate:'BETWEEN'},
                        // {field: 'record.status', title: __('Record.status'), formatter: Table.api.formatter.status},
                        // {field: 'record.user_id', title: __('Record.user_id')},
                        // {field: 'record.admin_id', title: __('Record.admin_id')},
                        // {field: 'record.group_ids', title: __('Record.group_ids'), operate: 'LIKE'},
                        // {field: 'record.numid', title: __('Record.numid')},
                        // {field: 'record.sexdata', title: __('Record.sexdata')},
                        // {field: 'record.idcard_image', title: __('Record.idcard_image'), operate: false, events: Table.api.events.image, formatter: Table.api.formatter.image},
                        // {field: 'record.baoxian_image', title: __('Record.baoxian_image'), operate: false, events: Table.api.events.image, formatter: Table.api.formatter.image},
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
