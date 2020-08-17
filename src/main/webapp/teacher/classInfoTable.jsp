
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    System.out.println(path);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>班级信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=path%>/static/X-admin/lib/layuimini/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=path%>/static/X-admin/lib/layuimini/css/public.css" media="all">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">

        <div style="margin-left:45%;"><h2>班级信息</h2></div>
        <%--        搜索框--%>
        <fieldset class="table-search-fieldset">
            <legend>搜索信息</legend>
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">入学时间</label>
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
            <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="edit">宝宝信息</a>
        </script>
    </div>
</div>

<%--宝宝信息弹出框--%>
<div id="babyInf" style="display:none;">
    <form class="layui-form" lay-filter="formDetail" action="" id="add">
        <%--宝宝图片--%>
        <div class="layui-inline">
            <div class="layui-input-block">
                <img src="../static/img/c3.bmp" id="faceUrl" class="layui-nav-img" style="height: 150px;width: 150px">
            </div>
        </div>
        <%--宝宝信息--%>
        <div class="layui-inline">
            <label class="layui-form-label">宝宝姓名：</label>
            <div class="layui-input-block">
                <input type="text" name="studentName" id="studentName" placeholder="" class="layui-input" disabled="disabled">
            </div>
            <label class="layui-form-label">宝宝性别：</label>
            <div class="layui-input-block">
                <input type="text" name="studentSex" id="studentSex" placeholder="" class="layui-input" disabled="disabled">
            </div>
            <label class="layui-form-label">出生地址：</label>
            <div class="layui-input-block">
                <input type="text" name="studentAdd" id="studentAdd" placeholder="" class="layui-input" disabled="disabled">
            </div>
            <label class="layui-form-label">出生时间：</label>
            <div class="layui-input-block">
                <input type="text" name="studentBirth" id="studentBirth" placeholder="" class="layui-input"
                       disabled="disabled" style="width: 180px">
            </div>
        </div>
        <%--家长图片--%>
        <div>
            <div class="layui-inline">
                <div class="layui-input-block">
                    <img src="../static/img/c2.bmp" id="photoUrl" class="layui-nav-img" style="height: 150px;width: 150px">
                </div>
            </div>
            <%--家长信息--%>
            <div class="layui-inline">
                <label class="layui-form-label">家长姓名：</label>
                <div class="layui-input-block">
                    <input type="text" name="parentsName" id="parentsName" placeholder="" class="layui-input" disabled="disabled">
                </div>
                <label class="layui-form-label">家长电话：</label>
                <div class="layui-input-block">
                    <input type="text" name="parentsTel" id="parentsTel" placeholder="" class="layui-input" disabled="disabled">
                </div>
                <label class="layui-form-label">家庭地址：</label>
                <div class="layui-input-block">
                    <input type="text" name="studentAdd" placeholder="" class="layui-input" disabled="disabled">
                </div>
                <%--            <label class="layui-form-label">家长职业：</label>--%>
                <%--            <div class="layui-input-block">--%>
                <%--                <input type="text" name="parentsJob" id="parentsJob" placeholder="" class="layui-input"--%>
                <%--                       disabled="disabled" style="width: 180px">--%>
                <%--            </div>--%>
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
            url: '<%=path%>/tc/classInfoSelectList',
            // toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                {type: "checkbox", width: 50},
                {field: 'studentId', width: 100, title: '编号', sort: true},
                {field: 'studentId', width: 100, title: '宝宝编号'},
                {field: 'studentName', width: 100, title: '宝宝名称'},
                {field: 'parentsName', width: 100, title: '家长名称'},
                {field: 'studentTime', width: 180, title: '入学时间', sort: true},
                {field: 'studentSex', width: 120, title: '性别', sort: true},
                {title: '宝宝信息', minWidth: 150, toolbar: '#currentTableBar', align: "center"},
                {field: 'faceUrl', width: 100, title: '宝宝图片', hide: true},

                {field: 'parentsTel', width: 100, title: '家长电话', hide: true},
                // {field: 'parentsAge', width: 100, title: '家长年龄', hide: true},
                // {field: 'parentsJob', width: 100, title: '家长职业', hide: true},


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
                $('#date').val(null);
                var index = layer.open({
                    title: '发布作业',
                    type: 1,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['100%', '100%'],
                    closeBtn: false,
                    id: 'LAY_layuipro',
                    btn: ['发布', '返回'],
                    btnAlign: 'c',
                    moveType: 1,
                    content: $('#insert_div'), //内容
                    success: function (layero, index) {
                        var btn = layero.find('.layui-layer-btn');
                        btn.find('.layui-layer-btn0').click(function () {
                            // var body = layer.getChildFrame('body', index);
                            var taskName = $('#taskName').val();
                            var releaseTime = $('#date').val();
                            var route = $('#route').val();
                            $.ajax({
                                type: "post",
                                url: "<%=path%>/publishTaskControl/publishTaskAdd",
                                async: true,
                                data: {
                                    // type:"taskAdd",
                                    name: taskName,
                                    releaseTime: releaseTime,
                                    route: route
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

            $("#faceUrl").attr("src",  data.faceUrl);
            $("#photoUrl").attr("src",  data.photoUrl);

            // $("#babyName").val("ghjghj");

            if (obj.event === 'edit') {
                layer.open({
                    title: '信息显示',
                    type: 1,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    offset: ['10px'],
                    area: ['500px', '750px'],
                    closeBtn: false,
                    id: 'LAY_layuipro',
                    btn: ['确认'],
                    btnAlign: 'c',
                    moveType: 1,
                    content: $('#babyInf'), //内容
                    success: function (layero, index) {
                        form.val('formDetail', data);
                    }
                });
                return false;
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
            // layer.alert(result, {
            //     title: '最终的搜索信息'
            // });
            var startTime = $("#startTime").val();//选取的起始时间
            var endTime = $("#endTime").val();//选取的结束时间
            //执行搜索重载
            table.reload('currentTableId', {
                url: '<%=path%>/tc/classInfoSelectList',
                page: {
                    curr: 1 //重新从第 1 页开始
                },
                where: {
                    startFinishTime: startTime, endFinishTime: endTime
                }
            }, 'data');

            return false;
        });

    });
</script>

</body>
</html>