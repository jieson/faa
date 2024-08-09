define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {
    const urlParams = new URLSearchParams(location.search);
    var projectid = urlParams.get('project_id');


    function hasDuplicates(array) {
        return new Set(array).size !== array.length;
    }
    function isArray(it) {
        if (it instanceof Array){
            return true;
        }
            return false;
    }
    function mj_rowWithid(rows,idd) {
        for (var i=0; i<rows.length; i++){
            var row =rows[i];
            // console.log('row.id:'+row.id+'   idd:'+idd);
            if (row.id==idd){
                // console.log('发现');
                return row;
            }
        }
        // console.log("mj_rowWithid：rows 中未找到idd");
        // console.log('idd:'+idd);
        // console.log('rows:'+JSON.stringify(rows));
        return null;
    }
    function mj_namesWithids(rows,idsarr) {
        if (!isArray(idsarr)){
            console.log("idsarr！！不是数组")
            var row = mj_rowWithid(idsarr);
            if (row == null){
                return  idsarr;
            }else{
                return row.name;
            }
            return arrnames;
        }
        //
        var  arrnames=[];
        idsarr.forEach(function (idd) {
            var row = mj_rowWithid(rows,idd);
            if (row == null){
                arrnames.push(idd);
            }else{
                arrnames.push(row.name);
            }
        });
        return arrnames;
    }
    function mj_teamidsWithids(rows,idsarr) {
        if (!isArray(idsarr)){
            console.log("idsarr！！不是数组")
            var row = mj_rowWithid(idsarr);
            if (row == null){
                return  idsarr;
            }else{
                return row.team_id;
            }
            return "不是数组";
        }
        //
        var  arrteamids=[];
        idsarr.forEach(function (idd) {
            var row = mj_rowWithid(rows,idd);
            if (row == null){
                arrteamids.push(idd);
            }else{
                arrteamids.push(row.team_id);
            }
        });
        return arrteamids;
    }

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
            // 请求groups 设置动态列
            var records;
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "ygame/record/index",
                data: {
                    project_id: 2
                },
                async:false,
                success: function (data) {
                    // console.log('group:::::::')
                    console.log(data)
                    records = data;
                    // records.rows.forEach(function (row) {
                    // });
                },
                error: function (e) {
                    layer.msg(e.error);
                }});
            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'weigh',
                sortOrder: 'asc',
                // fixedColumns: true,
                fixedRightNumber: 1,
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {field: 'date', title: __('Date'), operate:'RANGE', addclass:'datetimerange', autocomplete:false},
                        {field: 'starttime', title: __('Starttime')},
                        {field: 'endtime', title: __('Endtime'), operate: 'LIKE'},
                        {field: 'name', title: __('Name'), operate: 'LIKE'},
                        // {field: 'group_id', title: __('Group_id')},
                        // {field: 'zubie_id', title: __('Zubie_id'), searchList: {"0":__('Zubie_id 0'),"1":__('Zubie_id 1'),"2":__('Zubie_id 2'),"3":__('Zubie_id 3'),"4":__('Zubie_id 4')}, formatter: Table.api.formatter.normal},
                        {field: 'juesai', title: __('Juesai'), searchList: {"1":__('Juesai 1'),"0":__('Juesai 0')}, formatter: Table.api.formatter.normal},
                        {field: 'personcount', title: __('Personcount')},
                        {field: 'zucount', title: __('Zucount')},
                        {field: 'personcountinzu', title: __('Personcountinzu')},
                        {field: 'beizhu', title: __('Beizhu'), operate: 'LIKE', table: table, class: 'autocontent', formatter: Table.api.formatter.content},
                        {field: 'project_id', title: __('Project_id')},
                        {field: 'record_ids', title: __('Record_ids'),align:"left", operate: 'LIKE', table: table, class: 'autocontent', formatter: function (value,row,index) {


                            if (value==null || value == '')
                                return '';
                            // 组次 12  出发顺序1234
                                var str = '';//"顺序：1 ,2 ,3... <br>";
                                var arr= JSON.parse(value);
                                for (var i =0;i<arr.length; i++){
                                    str = str + '组次' + (i+1) +': ';
                                    var names = mj_namesWithids(records.rows,arr[i]);
                                    if (isArray(names)){
                                        names = names.join('    ,');
                                    }
                                    str = str+ names ;
                                    // 检查代表队是否重复
                                    var teamids = mj_teamidsWithids(records.rows,arr[i]);
                                    if (hasDuplicates(teamids)){
                                        str = str+ "（！代表队有重复）" ;
                                    }
                                    str = str +'<br>';
                                }
                                return str;
                            }},
                        {field: 'rule', title: __('Rule'), searchList: {"0":__('Rule 0'),"1":__('Rule 1'),"2":__('Rule 2'),"3":__('Rule 3')}, formatter: Table.api.formatter.normal},
                        {field: 'weigh', title: __('Weigh'), operate: false},
                        //{field: 'group.group_name', title: __('Group.group_name'), operate: 'LIKE', table: table, class: 'autocontent', formatter: Table.api.formatter.content},
                        //{field: 'record.name', title: __('Record.name'), operate: 'LIKE'},
                        {field: 'record.numid', title: __('Record.numid')},
                        {
                            field: 'buttons',
                            width: "120px",
                            title: __('按钮组'),
                            table: table,
                            events: Table.api.events.operate,
                            buttons: [
                                {
                                    name: 'detail',
                                    text: __('转成预赛并增加决赛'),
                                    title: __('决赛内容'),
                                    classname: 'btn btn-xs btn-primary btn-dialog',
                                    icon: 'fa fa-list',
                                    url: 'ygame/fenzu/add',
                                    callback: function (data) {
                                        Layer.alert("接收到回传数据：" + JSON.stringify(data), {title: "回传数据"});
                                    },
                                    visible: function (row) {
                                        if (row.juesai == '0'){
                                            return false;
                                        }
                                        if (row.record_ids==null || row.record_ids==''){
                                            return false;
                                        }
                                        //返回true时按钮显示,返回false隐藏
                                        return true;
                                    }
                                },
                                {
                                    name: 'ajax',
                                    text: __('根据每组人数重新分配选手'),
                                    title: __('根据每组人数重新分配选手'),
                                    classname: 'btn btn-xs btn-success btn-magic btn-ajax',
                                    icon: 'fa fa-magic',
                                    url: 'ygame/fenzu/resetRecordids',
                                    confirm: '确认发送',
                                    success: function (data, ret) {
                                        console.log('success！！！！！')
                                        Layer.alert(ret.msg + ",返回数据：" + JSON.stringify(data));
                                        //如果需要阻止成功提示，则必须使用return false;
                                        //return false;
                                    },
                                    error: function (data, ret) {
                                        console.log('error！！！！！')
                                        console.log(data, ret);
                                        if (ret.code == 200){
                                            var table = $("#table");
                                            table.bootstrapTable('refreshOptions',{pageNumber:1})
                                            Layer.alert("更新数据");
                                        }else {
                                            Layer.alert("还未实现");
                                        }

                                        // Layer.alert(ret.msg);
                                        return false;
                                    }
                                }
                            ],
                            formatter: Table.api.formatter.buttons
                        },
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ]
            });
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

                //添加这两行后，进入编辑页，row的数据取的值偏了2，原因后查
                // $('#table').bootstrapTable('append', {name:"颁奖",
                //     project_id:projectid,
                //     beizhu:'不可删除这条数据！'
                // });
                // $('#table').bootstrapTable('append', {name:"离会",
                //     project_id:projectid,
                //     beizhu:'不可删除这条数据！'
                // });
            });
            // 为表格绑定事件
            Table.api.bindevent(table);

            // 启动按钮
            $(document).on("click", ".btn-start", function () {
                //在table外不可以使用添加.btn-change的方法
                //只能自己调用Table.api.multi实现
                //如果操作全部则ids可以置为空

                layer.confirm('最后确认生成出发顺序！',
                    {btn:['确定','取消']},
                    function (index) {
                        layer.close(index);
                        $('#table').bootstrapTable('append', {name:"颁奖",
                            project_id:projectid,
                            beizhu:''
                        });
                        return;
                        //  构造新数据，存入数据库（数据）
                        /*


                         */
                        newzubies = mj_newzubies(groupsdata.rows);
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
                                            var newzubie = mj_newzubie(rowxxx.idcard,rowy1.group_name)
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
