define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {


    //console.log(Config);
    // console.log(site);
    // console.log(location);
    // //获取请求中的参数
    const urlParams = new URLSearchParams(location.search);
    var projectid = urlParams.get('project_id');
    console.log(projectid);

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
    // 动态添加列
    // function addColumn(field, title) {
    //     columns.push({
    //         field: field,
    //         title: title,
    //         sortable: true
    //     });
    //     $table.bootstrapTable('destroy').bootstrapTable({
    //         columns: columns
    //     });
    // }
    function isArray(it) {
        return ostring.call(it) === '[object Array]';
    }
    function mj_zubie(idcard){
        //获取生日
        var birthday = "";
        if(idcard != null && idcard != ""){
            if(idcard.length == 15){
                birthday = "19"+idcard.substr(6,6);
            } else if(idcard.length == 18){
                birthday = idcard.substr(6,8);
            }
            // birthday = birthday.replace(/(.{4})(.{2})/,"$1-$2-");
        }
        // // 获取年龄
        // const today = new  Date();
        // let year =  birthday.substring(0,4);
        // let age= today.getFullYear() - parseInt(year);


        //获取性别

        const sexCode = idcard.charAt(16);
        const sex = parseInt(sexCode, 10) % 2 === 0 ? '女' : '男';

        //根据年龄生成组别
        let birthInt=  parseInt(birthday);
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
        return "超出规则";
    }
    function mj_zubies() {
        return ['幼儿组',
            '男少年丁组',
            '女少年丁组',
            '男少年丙组',
            '女少年丙组',
            '男少年乙组',
            '女少年乙组',
            '男少年甲组',
            '女少年甲组'];
    }
    
    function mj_newzubies(groups) {
        var newdics= {};
        var oldzubies = mj_zubies();
        groups.forEach(function (rowxxx) {
            oldzubies.forEach(function (rowyyy) {
                var itemm = rowxxx.group_name + rowyyy;
                newdics[itemm] = [];
            });
        });
        return newdics;
    }
    function mj_newzubie(idcarc,groupname) {
        return  groupname+mj_zubie(idcarc);
    }
    

    //查询Url参数
    // zubie: function (name, url) {
    //     if (!url) {
    //         url = window.location.href;
    //     }
    //     if (!name)
    //         return '';
    //     name = name.replace(/[\[\]]/g, "\\$&");
    //     var regex = new RegExp("[?&/]" + name + "([=/]([^&#/?]*)|&|#|$)"),
    //         results = regex.exec(url);
    //     if (!results)
    //         return null;
    //     if (!results[2])
    //         return '';
    //     return decodeURIComponent(results[2].replace(/\+/g, " "));
    // },
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
                // console.log("on  table!!!");
                // console.log(e);
                // console.log(data.groups);

                //这里我们手动设置底部的值
                // $("#money").text(data.extend.money);
                // $("#price").text(data.extend.price);

                // $('#table').bootstrapTable('hideColumn', "id");


                // $('#table').bootstrapTable('destroy').bootstrapTable;
            });



            columns = [
                {checkbox: true},
                // {field: 'id', title: __('Id')},
                {field: 'name', title: __('Name'), operate: 'LIKE'},
                {field: 'idcard', title: __('组别'), formatter: function (value, row, index) {
                    return mj_zubie(value);
                    }},
                {field: 'mobile', title: __('Mobile'), operate: 'LIKE'},
                {field: 'idcard', title: __('Idcard'), operate: 'LIKE'},
                {field: 'status', title: __('Status'), searchList: {"0":__('Status 0'),"1":__('Status 1'),"2":__('Status 2'),"3":__('Status 3')}, formatter: Table.api.formatter.status},
                // {field: 'group_ids', title: __('Group_ids'), operate: 'LIKE'},
                {field: 'numid', title: __('Numid')},
                {field: 'sexdata', title: __('Sexdata'), searchList: {"male":__('Sexdata male'),"female":__('Sexdata female')}, formatter: Table.api.formatter.normal},
                {field: 'idcard_image', title: __('Idcard_image'), operate: false, events: Table.api.events.image, formatter: Table.api.formatter.image},
                {field: 'baoxian_image', title: __('Baoxian_image'), operate: false, events: Table.api.events.image, formatter: Table.api.formatter.image},
                {field: 'team.team_name', title: __('Team.team_name'), operate: 'LIKE'},
                // {field: 'group.group_name', title: __('Group.group_name'), operate: 'LIKE', table: table, class: 'autocontent', formatter: Table.api.formatter.content},
                // {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
            ];

            // 请求groups 设置动态列
            var groupsdata;
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "ygame/group/index",
                data: {
                    project_id: projectid
                },
                async:false,
                success: function (data) {
                    // console.log('group:::::::')
                    console.log(data)
                    groupsdata = data;
                    data.rows.forEach(function (rowww) {
                        columns.push({field: 'group_ids', title: rowww.group_name, formatter: function (value, row, index) {
                                // console.log('value:'+value);
                                // console.log('row22:'+rowww.id);
                                //项目数组
                                if (value == null || value == ""){
                                    return"";
                                }
                                // console.log(value);
                                // console.log(value.indexOf(rowww.id));
                                if (value.indexOf(rowww.id)== -1) {
                                    return '';
                                }else {
                                    return '已选';
                                }
                            }});
                        // console.log(rowww.group_name)
                    });
                },
                error: function (e) {
                    layer.msg(e.error);
                }});
            columns.splice(3,0,{field: 'group_ids', title: __('比赛项目'), formatter: function (value, row, index) {
                    // console.log('value:'+value);

                    //项目数组
                    if (value == null || value == ""){
                        return"无";
                    }
                    var groupArray = value.split(',');
                    var grouptextArray = [];
                    //
                    // console.log(row.grouplist);

                    for (var j = 0; j<groupArray.length; j++){
                        var valueGroupId = groupArray[j];
                        for (var i = 0; i < groupsdata.rows.length; i++) {
                            // console.log(Object.prototype.toString.call(row.grouplis.[0]).slice(8, -1));
                            let iddd = groupsdata.rows[i].id;
                            // console.log(iddd);
                            if (iddd == valueGroupId){
                                let grou =  groupsdata.rows[i].group_name;
                                grouptextArray.push(grou)
                            }
                        }
                    }
                    return grouptextArray;
                }});
            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                fixedColumns: true,
                fixedNumber: 2,
                columns: [
                    columns
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

            // 启动按钮
            $(document).on("click", ".btn-start", function () {
                //在table外不可以使用添加.btn-change的方法
                //只能自己调用Table.api.multi实现
                //如果操作全部则ids可以置为空

                layer.confirm('生成新的日程表数据，会覆盖之后的所有流程操作！',
                    {btn:['确定','取消']},
                    function (index) {
                        layer.close(index);


                        //  构造新数据，存入数据库（数据）
                        /*


                         */
                        newzubies = mj_newzubies(groupsdata.rows);//新组别字典
                        // Toastr.success(newzubies.toString());

                        var dataa = table.bootstrapTable('getData');
                        var oldzubies = mj_zubies();
                        dataa.forEach(function (rowxxx) {
                            rowxxx.idcard;
                            rowxxx.group_ids;
                            var rowgroupname = '';
                            if (rowxxx.group_ids != null && rowxxx.group_ids != ''){
                                console.log(rowxxx.group_ids);
                                var groupids = rowxxx.group_ids.split(',');
                                groupids.forEach(function (rowxid) {
                                    groupsdata.rows.forEach(function (rowy1) {
                                        if (rowy1.id == rowxid){
                                            var newzubie = mj_newzubie(rowxxx.idcard,rowy1.group_name)  //新组别名
                                            var arr= newzubies[newzubie];
                                            arr.push(rowxxx.id)
                                        }
                                    });
                                    // rowx1==
                                });
                            }


                        });
                        console.log('##########');
                        console.log(newzubies)

                        //生成报文格式 用于存入数据库
                        var fenzus = [];
                        Object.keys(newzubies).forEach(function(key){
                            var arr = newzubies[key];
                            if (arr.length>0){
                                var fenzu = {};
                                fenzu['name'] = key;
                                fenzu['record_ids'] = arr;
                                fenzu['personcount'] = arr.length;
                                fenzu['project_id'] = projectid;
                                // fenzu['group_id'] = ;
                                // fenzu['zubie_id'] = ;
                                fenzus.push(fenzu);
                            }
                        });
                        var str = JSON.stringify(fenzus);
                        console.log(str)

                        // 请求 创建 fenzu表 日程表
                        $.ajax({
                            type: "POST",
                            dataType: "json",
                            url: "ygame/record/creatNewFenzuModels",
                            data: {
                                project_id: projectid,
                                rows:str
                            },
                            async:false,
                            success: function (data) {
                                layer.msg('成功');
                                console.log('group！！！！！')
                                console.log(data)
                                // data.rows.forEach(function (rowww) {
                                //     // console.log(rowww.group_name)
                                // });
                                // location.href = 'ygame/fenzu/index?project_id='+projectid;

                                Fast.api.open('ygame/fenzu/index?project_id='+projectid, '日程表', {
                                    callback: function (data) {
                                        // 回调函数，可以在此处理返回的数据
                                    }
                                });
                            },
                            error: function (e) {
                                console.log('group???????')
                                Toastr.error(e.error);
                            }});
                        // window.location.href = 'ygame/fenzu/index';

                        // Fast.api.open('ygame/fenzu/index', '跳转到其他控制器', {
                        //     callback: function (data) {
                        //         // 回调函数，可以在此处理返回的数据
                        //     }
                        // });
                    },
                    function (index) {
                        layer.close(index);
                        Toastr.error('取消');
                    })

                // Toastr.success("dfsdfdfsdfsdfs");
                var ids = Table.api.selectedids(table);
                Toastr.success(ids);
                Table.api.multi("changestatus", ids.join(","), table, this);
            });

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
