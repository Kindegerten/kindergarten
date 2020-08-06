
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    System.out.println(path);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>satetyEdu</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=path%>/static/X-admin/lib/layuimini/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=path%>/static/X-admin/lib/layuimini/css/public.css" media="all">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">

        <div style="margin-left:45%;"><h2>班级通知</h2></div>
        <%--        搜索框--%>
        <fieldset class="table-search-fieldset">
            <legend>搜索信息</legend>
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">创建时间</label>
                            <div class="layui-input-inline">
                                <input type="text" name="startTime" id="startTime" lay-verify="date"
                                       placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">至</label>
                            <div class="layui-input-inline">
                                <input type="text" name="endTime" id="endTime" lay-verify="date"
                                       placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <div class="layui-input-inline">
                            </div>
                        </div>
                        <div class="layui-inline">
                        </div>
                        <div class="layui-inline">
                            <button type="submit" class="layui-btn layui-btn-primary" lay-submit
                                    lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>
        <%--        头部工具--%>
        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add"> 新增</button>
            </div>
        </script>

        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>
        <%--        行标签--%>
        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="edit">修改</a>
            <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>

        </script>
    </div>
</div>

<div id="classNotice" style="display:none;">
    <form class="layui-form" action="" id="add">
        <div class="layui-inline">
            <label class="layui-form-label">标题：</label>
            <div class="layui-input-block">
                <input type="text" name="taskName" id="taskName" placeholder="" class="layui-input">
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="sendmsgTime" id="sendmsgTime" lay-verify="date"
                           placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input" disabled="disabled">
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">内容：</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入内容" id="noticeInf" class="layui-textarea"></textarea>
                </div>
            </div>

        </div>
    </form>
</div>
<script src="<%=path%>/static/X-admin/lib/layuimini/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'table', 'jquery', 'layedit', 'laydate', 'upload'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table,
            layer = layui.layer,
            upload = layui.upload,
            layedit = layui.layedit,
            laydate = layui.laydate;
        table.render({
            elem: '#currentTableId',
            url: '<%=path%>/tc/clamsgSelectList',
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                {type: "checkbox", width: 50},
                {field: 'clamsgId', width: 100, title: '通知编号', sort: true},
                {field: 'clamsgName', width: 100, title: '通知名称'},
                {field: 'clamsgDetail', width: 180, title: '通知内容'},
                {field: 'sendmsgTime', width: 180, title: '发布时间', sort: true},
                {title: '操作', minWidth: 150, toolbar: '#currentTableBar', align: "center"},
            ]],
            limits: [2, 5, 10, 15, 20, 25, 50, 100],
            limit: 5,
            page: true,
            skin: 'line'
        });


        /**
         * toolbar监听事件
         */
        table.on('toolbar(currentTableFilter)', function (obj) {
            if (obj.event === 'add') {  // 监听添加操作
                $('#taskName').val(null);
                $('#noticeInf').val(null);

                var index = layer.open({
                    title: '添加信息',
                    type: 1,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    offset: ['50px','35%'],
                    area: ['500px', '600px'],
                    closeBtn: false,
                    id: 'LAY_layuipro',
                    btn: ['确定', '返回'],
                    btnAlign: 'c',
                    moveType: 1,
                    content: $('#classNotice'), //内容
                    success: function (layero, index) {
                        var btn = layero.find('.layui-layer-btn');
                        btn.find('.layui-layer-btn0').click(function () {
                            // var body = layer.getChildFrame('body', index);
                            var taskName = $('#taskName').val();
                            var noticeInf = $('#noticeInf').val();
                            var sendmsgTime = $('#sendmsgTime').val();

                            $.ajax({
                                type: "post",
                                url: "<%=path%>/tc/clamsgAdd",
                                async: true,
                                data: {
                                    // type:"taskAdd",
                                    clamsgName: taskName,
                                    clamsgDetail: noticeInf,
                                    sendmsgTime: sendmsgTime,
                                },
                                dataType: "text",
                                success: function (data) {
                                    if (data.trim() == "ok") {

                                    }
                                    alert("添加成功");
                                    window.location.reload();
                                }
                            });
                        });
                    }
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
            } else if (obj.event === 'delete') {  // 监听删除操作
                var checkStatus = table.checkStatus('currentTableId')
                    , data = checkStatus.data;
                layer.alert(JSON.stringify(data));
            }
        });

        //监听表格复选框选择
        table.on('checkbox(currentTableFilter)', function (obj) {
            console.log(obj)
        });

        table.on('tool(currentTableFilter)', function (obj) {
            var data = obj.data;

             $('#taskName').val(data.name);
             $('#noticeInf').val(data.content);
            if (obj.event === 'edit') {
                layer.open({
                    title: '信息显示',
                    type: 1,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    offset: ['50px','35%'],
                    area: ['500px', '600px'],
                    closeBtn: false,
                    id: 'LAY_layuipro',
                    btn: ['发布', '返回'],
                    btnAlign: 'c',
                    moveType: 1,
                    content: $('#classNotice'), //内容
                    success: function (layero, index) {
                        var btn = layero.find('.layui-layer-btn');
                        btn.find('.layui-layer-btn0').click(function () {
                            // var body = layer.getChildFrame('body', index);
                            var taskName = $('#taskName').val();
                            var noticeInf = $('#noticeInf').val();
                            var sendmsgTime = $('#sendmsgTime').val();
                            $.ajax({
                                type: "post",
                                url: "<%=path%>/tc/updateClamsg",
                                async: true,
                                data: {
                                    // type:"taskAdd",
                                    clamsgName: taskName,
                                    clamsgDetail: noticeInf,
                                    sendmsgTime: sendmsgTime,
                                    clamsgId:data.clamsgId
                                },
                                dataType: "text",
                                success: function (data) {
                                    if (data.trim() == "ok") {

                                    }
                                    alert("修改成功");
                                    window.location.reload();
                                }
                            });
                        });
                    }
                });
                return false;
            }else if (obj.event === 'delete') {
                layer.confirm('真的删除行么', function (index) {
                    shanchu(data.clamsgId);//alert(data.id);
                    obj.del();
                    layer.close(index);
                });
            }
        });

        //时间选取
        laydate.render({
            elem: '#startTime'
            // ,type: 'datetime'
        });
        //时间选取
        laydate.render({
            elem: '#endTime'
        });
        //时间选取:noticeTime
        laydate.render({
            elem: '#sendmsgTime'
            ,value: new Date()
            ,type:'datetime'
        });
        //上传文件
        upload.render({
            elem: '#test3'
            , url: '<%=path%>/tc/upLoad' //改成您自己的上传接口
            , accept: 'file' //普通文件
            , done: function (res) {
                layer.msg('上传成功');
                $("#route").val(res.msg);
                console.log(res);
            }
        });

        // 监听搜索操作
        form.on('submit(data-search-btn)', function (data) {
            var result = JSON.stringify(data.field);

            var startTime = $("#startTime").val();//选取的起始时间
            var endTime = $("#endTime").val();//选取的结束时间
            //执行搜索重载
            table.reload('currentTableId', {
                url: '<%=path%>/tc/clamsgSelectList',
                page: {
                    curr: 1 //重新从第 1 页开始
                },
                where: {
                    startFinishTime: startTime, endFinishTime: endTime
                }
            }, 'data');

            return false;
        });
        //删除
        function shanchu(data){
            $.ajax({
                url:"<%=path%>/tc/delClamsg",
                type:"post",
                async:true,
                data:{
                    type:"shanchu",
                    clamsgId:data
                },
                dataType:"text",
                success:function(data){
                    // alert(data);
                    location.reload();
                }
            });
        }
    });
</script>

</body>
</html>