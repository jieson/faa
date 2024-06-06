define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {


    console.log(Config);
    //  getBirthdayFromIdCard : function(idCard) {
    //     var birthday = "";
    //     if(idCard != null && idCard != ""){
    //         if(idCard.length == 15){
    //             birthday = "19"+idCard.substr(6,6);
    //         } else if(idCard.length == 18){
    //             birthday = idCard.substr(6,8);
    //         }
    //
    //         birthday = birthday.replace(/(.{4})(.{2})/,"$1-$2-");
    //     }
    //
    //     return birthday;
    // };


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
                        {field: 'idcard', title: __('组别'), formatter: function (value, row, index) {


                                //获取生日
                                var birthday = "";
                                if(value != null && value != ""){
                                    if(value.length == 15){
                                        birthday = "19"+value.substr(6,6);
                                    } else if(value.length == 18){
                                        birthday = value.substr(6,8);
                                    }
                                    // birthday = birthday.replace(/(.{4})(.{2})/,"$1-$2-");
                                }
                                // 获取年龄
                                const today = new  Date();
                                let year =  birthday.substring(0,4);
                                let age= today.getFullYear() - parseInt(year);
                                let birthInt=  parseInt(birthday);
                                //获取性别
                                const sexCode = value.charAt(16);
                                const sex = parseInt(sexCode, 10) % 2 === 0 ? '女' : '男';
                                //根据年龄生成组别
                                if (birthInt >= 20190101){
                                    return '幼儿组';
                                }else if (birthInt >=20170101){
                                    return sex+'少年丁组';
                                }else if (birthInt >=20150101){
                                    return sex+'少年丙组';
                                }else if (birthInt >=20130101){
                                    return sex+'少年乙组';
                                }else {
                                    return sex+'少年甲组';
                                }
                                return birthInt;
                            }},
                        {field: 'group_ids', title: __('比赛项目'), formatter: function (value, row, index) {
                                console.log('value:'+value);

                                //项目数组
                                if (value == null || value == ""){
                                    return"无";
                                }
                                var groupArray = value.split(',');
                                var grouptextArray = [];
                                //
                                console.log(row.grouplist);

                                for (var j = 0; j<groupArray.length; j++){
                                    var valueGroupId = groupArray[j];
                                    for (var i = 0; i < row.grouplist.length; i++) {
                                        // console.log(Object.prototype.toString.call(row.grouplis.[0]).slice(8, -1));
                                        let iddd = row.grouplist[i].id;
                                        console.log(iddd);
                                        if (iddd == valueGroupId){
                                            let grou =  row.grouplist[i].group_name;
                                            grouptextArray.push(grou)
                                        }
                                    }
                                }
                                return grouptextArray;
                            }},
                        {field: 'mobile', title: __('Mobile'), operate: 'LIKE'},
                        {field: 'idcard', title: __('Idcard'), operate: 'LIKE'},
                        {field: 'status', title: __('Status'), searchList: {"0":__('Status 0'),"1":__('Status 1'),"2":__('Status 2'),"3":__('Status 3')}, formatter: Table.api.formatter.status},
                        {field: 'group_ids', title: __('Group_ids'), operate: 'LIKE'},
                        {field: 'numid', title: __('Numid')},
                        {field: 'sexdata', title: __('Sexdata'), searchList: {"male":__('Sexdata male'),"female":__('Sexdata female')}, formatter: Table.api.formatter.normal},
                        {field: 'team.team_name', title: __('Team.team_name'), operate: 'LIKE'},
                        // {field: 'group.group_name', title: __('Group.group_name'), operate: 'LIKE', table: table, class: 'autocontent', formatter: Table.api.formatter.content},
                        // {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
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
