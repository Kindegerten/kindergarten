
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path=request.getContextPath();
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
        <div style="margin-left:45%;"><h2>查看完成情况</h2></div>
        <fieldset class="table-search-fieldset">
            <legend>搜索信息</legend>
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">完成时间</label>
                            <div class="layui-input-inline">
                                <input type="text" name="startTime" id="startTime" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">至</label>
                            <div class="layui-input-inline">
                                <input type="text" name="endTime" id="endTime" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">完成状态：</label>
                            <div class="layui-input-inline">
                                <select name="safetyTestResult" id="safetyTestResult" lay-verify="required">
                                    <option value=""></option>
                                    <option value="1">完成</option>
                                    <option value="2">未完成</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <button type="submit" class="layui-btn layui-btn-primary"  lay-submit lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索</button>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>
        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add"> 新增 </button>
            </div>
        </script>
        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>
        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="edit">配置试题</a>
        </script>

    </div>
</div>
<script src="<%=path%>/static/X-admin/lib/layuimini/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>

<script>
    layui.use(['form', 'table','jquery', 'layedit', 'laydate','upload'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table;
        var layer = layui.layer
            ,upload = layui.upload
            ,layedit = layui.layedit
            ,laydate = layui.laydate;

         table.render({
            elem: '#currentTableId',
            url:'<%=path%>/tc/safetyTestCompleteSelectList',
            // toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                {type: "checkbox", width: 50},
                {field: 'safetyTestTd', width: 120, title: '编号', sort: true},
                {field: 'studentId', width: 120, title: '宝宝编号'},
                {field: 'studentName', width: 120, title: '宝宝名称'},
                {field: 'parentsName', width: 120, title: '家长名称'},
                {field: 'safetyVideoName', width: 120, title: '视频名称'},
                // {field: 'endTime', width: 130, title: '结束时间', sort: true},
                // {field: 'finishTime', width: 130, title: '完成时间', sort: true},
                {field: 'safetyTestScore', width: 130, title: '得分', sort: true},
                {field: 'safetyTestResult', minWidth: 120, title: '完成情况', align: "center", toolbar: '#status'},
            ]],
            limits: [2,5,10, 15, 20, 25, 50, 100],
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
                    maxmin:true,
                    shadeClose: true,
                    offset: ['50px','35%'],
                    area: ['500px', '600px'],
                    closeBtn: false,
                    id: 'LAY_layuipro',
                    btn: ['发布', '返回'],
                    btnAlign: 'c',
                    moveType: 1,
                    content: $('#insert_div'), //内容
                    success: function(layero,index){
                        var btn = layero.find('.layui-layer-btn');
                        btn.find('.layui-layer-btn0').click(function(){
                            // var body = layer.getChildFrame('body', index);
                            var taskName = $('#taskName').val();
                            var releaseTime = $('#date').val();
                            var route = $('#route').val();
                            $.ajax({
                                type:"post",
                                url:"<%=path%>/publishTaskControl/publishTaskAdd",
                                async:true,
                                data:{
                                    // type:"taskAdd",
                                    name:taskName,
                                    releaseTime:releaseTime,
                                    route:route
                                },
                                dataType:"text",
                                success:function(data){
                                    if(data.trim()=="ok"){

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
            if (obj.event === 'edit') {

                var index = layer.open({
                    title: '编辑用户',
                    type: 2,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    area: ['100%', '100%'],
                    content: '../page/table/edit.html',
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
                return false;
            } else if (obj.event === 'delete') {
                layer.confirm('真的删除行么', function (index) {
                    shanchu(data.id);//alert(data.id);
                    obj.del();
                    layer.close(index);
                });
            }
        });

        //时间选取
        laydate.render({
            elem: '#startTime'
        });
        laydate.render({
            elem: '#endTime'
        });

        //上传文件
        upload.render({
            elem: '#test3'
            ,url: '<%=path%>/publishTaskControl/upLoad' //改成您自己的上传接口
            ,accept: 'file' //普通文件
            ,done: function(res){
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
            var startFinishTime = $("#startTime").val();//选取的起始时间
            var endFinishTime = $("#endTime").val();//选取的结束时间
            var stateFinish = $('#safetyTestResult option:selected').val();
            //执行搜索重载
            table.reload('currentTableId', {
                url:'<%=path%>/tc/safetyTestCompleteSelectList',
                page: {
                    curr: 1 //重新从第 1 页开始
                },
                where:{
                    startFinishTime:startFinishTime, endFinishTime:endFinishTime,safetyTestResult:stateFinish
                }
            }, 'data');

            return false;
        });




    });
</script>
<script type="text/html" id="status">
    {{#if (d.finishState == 1) { }}
    <span>完成</span>
    {{# }else if(d.finishState == 2){ }}
    <span>未完成</span>
    {{# } }}
</script>

</body>
</html>