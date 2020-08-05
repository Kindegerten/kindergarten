<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path=request.getContextPath();
    System.out.println(path);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=path%>/static/X-admin/lib/layuimini/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=path%>/static/X-admin/lib/layuimini/css/public.css" media="all">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">

        <div style="margin-left:45%;"><h2>查看作业</h2></div>
        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add"> 添加 </button>
            </div>
        </script>
        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>
        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="edit">作业打分</a>
            <%--            <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>--%>
        </script>
        <script type="text/html" id="downTask">
            <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit"  href="/"+data.route>查看作业</a>
        </script>
    </div>
</div>
<div id="insert_div" style="display:none;">
    <form class="layui-form" action="" id="add">
        <div class="layui-inline">
            <label class="layui-form-label">作业打分：</label>
            <div class="layui-input-block">
                <select name="taskLevel" id="taskLevel" lay-verify="required">
                    <option value=""></option>
                    <option value="A">A</option>
                    <option value="B">B</option>
                    <option value="C">C</option>
                    <option value="D">D</option>

                </select>
            </div>
        </div>
    </form>
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
            url:'<%=path%>/tc/taskSelectList',
            // toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                {type: "checkbox", width: 50},
                {field: 'workID', width: 120, title: 'ID', sort: true},
                {field: 'studentId', width: 120, title: '宝宝编号'},
                {field: 'studentName', width: 120, title: '宝宝名称'},
                {field: 'parentsName', width: 120, title: '家长名称'},
                {field: 'workUrl',title: '作业内容', width: 120,align: "left",templet:function (d) {
                        return "<a href=<%=path%>'"+d.workUrl+"' style='color: #00a2d4;font-weight: bold'>文件下载</a>";
                    }},
                {field: 'workreleaseTime', width: 120, title: '发布时间', sort: true},
                {field: 'workFinishtime', width: 200, title: '完成时间', sort: true},
                {field: 'workEva', width: 200, title: '作业等级'},
                {title: '操作', minWidth: 150, toolbar: '#currentTableBar', align: "center"},
            ]],
            limits: [2,5,10, 15, 20, 25, 50, 100],
            limit: 15,
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
                    offset: ['50px','33%'],
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
                                url:"<%=path%>/tc/publishTaskAdd",
                                async:true,
                                data:{
                                    // type:"taskAdd",
                                    workName:taskName,
                                    workreleaseTime:releaseTime,
                                    workUrl:route
                                },
                                dataType:"text",
                                success:function(data){
                                    if(data.trim()=="ok"){
                                        alert("添加成功");
                                        window.location.reload();
                                    }
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
                    type: 1,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    offset: ['50px','33%'],
                    area: ['500px', '600px'],
                    btn: ['保存', '返回'],
                    btnAlign: 'c',
                    closeBtn: false,
                    id: 'LAY_layuipro',
                    moveType: 1,
                    content: $('#insert_div'),
                    success: function(layero,index){
                        var btn = layero.find('.layui-layer-btn');
                        btn.find('.layui-layer-btn0').click(function(){
                            // var body = layer.getChildFrame('body', index);
                            var taskLevel = $("#taskLevel option:selected").val();

                            // var taskLevel =$("#taskLevel").val();
                            console.log(taskLevel);
                            if(taskLevel!=''&&taskLevel!=null){
                                $.ajax({
                                    type:"post",
                                    url:"<%=path%>/tc/updateTaskLevel",
                                    async:true,
                                    data:{
                                        workID:data.workID,
                                        workEva:taskLevel,
                                    },
                                    dataType:"text",
                                    success:function(data){
                                        if(data.trim()=="ok"){
                                            alert("添加成功");
                                            window.location.reload();
                                        }
                                        alert("修改成功");
                                        location.reload();
                                    }
                                });
                            }else{
                                alert("请输入正确信息");
                                document.getElementById("layui-layer-iframe"+index).contentWindow.location.reload();
                            }
                        });
                    }
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
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });
        //上传文件
        upload.render({
            elem: '#test3'
            ,url: '<%=path%>/tc/upLoad' //改成您自己的上传接口
            ,accept: 'file' //普通文件
            ,done: function(res){
                layer.msg('上传成功');
                $("#route").val(res.msg);
                console.log(res);
            }
        });


    });
</script>

</body>
</html>