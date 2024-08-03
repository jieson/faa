define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'mjtest/index' + location.search,
                    add_url: 'mjtest/add',
                    edit_url: 'mjtest/edit',
                    del_url: 'mjtest/del',
                    multi_url: 'mjtest/multi',
                    import_url: 'mjtest/import',
                    table: 'mjtest',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'weigh',
                fixedColumns: true,
                fixedRightNumber: 1,
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {field: 'user_id', title: __('User_id')},
                        {field: 'user_name', title: __('User_name'), operate: 'LIKE'},
                        {field: 'leader_name', title: __('Leader_name'), operate: 'LIKE'},
                        {field: 'title', title: __('Title'), operate: 'LIKE'},
                        {field: 'ygame_group_ids', title: __('Ygame_group_ids'), operate: 'LIKE'},
                        {field: 'image', title: __('Image'), operate: false, events: Table.api.events.image, formatter: Table.api.formatter.image},
                        {field: 'leader_id', title: __('Leader_id')},
                        {field: 'weigh', title: __('Weigh'), operate: false},
                        {field: 'record_ids', title: __('Record_ids'), operate: 'LIKE', table: table, class: 'autocontent', formatter: Table.api.formatter.content},
                        {field: 'record.id', title: __('Record.id')},
                        {field: 'record.project_id', title: __('Record.project_id')},
                        {field: 'record.order_id', title: __('Record.order_id')},
                        {field: 'record.type', title: __('Record.type')},
                        {field: 'record.group_id', title: __('Record.group_id')},
                        {field: 'record.team_id', title: __('Record.team_id')},
                        {field: 'record.name', title: __('Record.name'), operate: 'LIKE'},
                        {field: 'record.mobile', title: __('Record.mobile'), operate: 'LIKE'},
                        {field: 'record.idcard', title: __('Record.idcard'), operate: 'LIKE'},
                        {field: 'record.price', title: __('Record.price'), operate:'BETWEEN'},
                        {field: 'record.status', title: __('Record.status'), formatter: Table.api.formatter.status},
                        {field: 'record.user_id', title: __('Record.user_id')},
                        {field: 'record.admin_id', title: __('Record.admin_id')},
                        {field: 'record.group_ids', title: __('Record.group_ids'), operate: 'LIKE'},
                        {field: 'record.numid', title: __('Record.numid')},
                        {field: 'record.sexdata', title: __('Record.sexdata')},
                        {field: 'record.idcard_image', title: __('Record.idcard_image'), operate: false, events: Table.api.events.image, formatter: Table.api.formatter.image},
                        {field: 'record.baoxian_image', title: __('Record.baoxian_image'), operate: false, events: Table.api.events.image, formatter: Table.api.formatter.image},
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
