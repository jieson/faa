define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {


    console.log(Config);

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'ygame/record/index' + location.search,
                    add_url: 'ygame/record/add',
                    edit_url: 'ygame/record/edit',
                    del_url: 'ygame/record/del',
                    multi_url: 'ygame/record/multi',
                    import_url: 'ygame/record/import',
                    table: 'ygame_record',
                }
            });

            var table = $("#table");

            // //当表格数据加载完成时
            table.on('load-success.bs.table', function (e, data) {
                //这里可以获取从服务端获取的JSON数据
                console.log("on  table!!!");
                console.log(e);
                console.log(data.groups);
                //这里我们手动设置底部的值
                // $("#money").text(data.extend.money);
                // $("#price").text(data.extend.price);

                console.log(Config);
            });

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
                        {field: 'name', title: __('Name'), operate: 'LIKE'},
                        {field: 'grouplist', title: __('测试'), formatter: function (value, row, index) {
                                // console.log('value:'+value);
                                // console.log(row);
                                // console.log(index);
                            }},
                        {field: 'mobile', title: __('Mobile'), operate: 'LIKE'},
                        {field: 'idcard', title: __('Idcard'), operate: 'LIKE'},
                        {field: 'status', title: __('Status'), searchList: {"0":__('Status 0'),"1":__('Status 1'),"2":__('Status 2'),"3":__('Status 3')}, formatter: Table.api.formatter.status},
                        {field: 'group_ids', title: __('Group_ids'), operate: 'LIKE'},
                        {field: 'numid', title: __('Numid')},
                        {field: 'sexdata', title: __('Sexdata'), searchList: {"male":__('Sexdata male'),"female":__('Sexdata female')}, formatter: Table.api.formatter.normal},
                        {field: 'team.team_name', title: __('Team.team_name'), operate: 'LIKE'},
                        {field: 'group.group_name', title: __('Group.group_name'), operate: 'LIKE', table: table, class: 'autocontent', formatter: Table.api.formatter.content},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
            // $(".nav-tabs a").click(function(){
            //     type = $(this).attr('data-type');
            //
            //     switch($(this).attr('data-type')){
            //         case "1":
            //             $('#table').bootstrapTable('hideColumn', "team_name");
            //             $('#table').bootstrapTable('hideColumn', "leader");
            //             $('#table').bootstrapTable('hideColumn', "team_mobile");
            //             break;
            //         case "2":
            //             $('#table').bootstrapTable('showColumn', "team_name");
            //             $('#table').bootstrapTable('showColumn', "leader");
            //             $('#table').bootstrapTable('showColumn', "team_mobile");
            //             break;
            //     }
            //     table.bootstrapTable('refresh', {url:$.fn.bootstrapTable.defaults.extend.index_url+'&type='+$(this).attr('data-type')});
            // })


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
