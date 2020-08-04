
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

        <div style="margin-left:45%;"><h2>配置试题</h2></div>
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
<div id="insert_div" style="display:none;">
    <form class="layui-form" action="" id="add">
        <div class="layui-inline">
            <label class="layui-form-label">视频名称:</label>
            <div class="layui-input-block">
                <select name="videoName" id="videoName" lay-verify="required">
                    <option value=""></option>
                </select>
            </div>
            <label class="layui-form-label">开始日期:</label>
            <div class="layui-input-block">
                <input type="text" name="startTime" id="startTime" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
            </div>
            <label class="layui-form-label">结束日期:</label>
            <div class="layui-input-block">
                <input type="text" name="endTime" id="endTime" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
            </div>
        </div>
    </form>
</div>
<div id="addEduVideo_div" style="display:none;">
    <form class="layui-form" action="" id="addVideo">
        <div class="layui-upload">
            <input type="hidden" name="route" id="route" >
            <button type="button" class="layui-btn layui-btn-normal" id="test3"><i class="layui-icon"></i>上传文件</button>
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
            url:'<%=path%>/safetyEduControl/selectList',
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                {type: "checkbox", width: 50},
                {field: 'id', width: 120, title: '视频编号', sort: true},
                {field: 'name', width: 150, title: '视频名称'},
                {field: 'startTime', width: 150, title: '开始时间', sort: true},
                {field: 'endTime', width: 150, title: '结束时间'},
                {title: '操作', minWidth: 150, toolbar: '#currentTableBar', align: "center"}
            ]],
            limits: [10, 15, 20, 25, 50, 100],
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
                    title: '添加视频',
                    type: 1,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    offset: ['50px','35%'],
                    area: ['500px', '600px'],
                    closeBtn: false,
                    id: 'LAY_layuipro',
                    btn: ['确定', '返回'],
                    btnAlign: 'c',
                    moveType: 1,
                    content: $('#insert_div'), //内容
                    success: function(layero,index){
                        var btn = layero.find('.layui-layer-btn');
                        btn.find('.layui-layer-btn0').click(function(){
                            // var body = layer.getChildFrame('body', index);
                            var videoName = $('#videoName option:selected').text();
                            var startTime = $('#startTime').val();
                            var endTime = $('#endTime').val();
                            var videoId = $('#videoName option:selected').val();
                            if(videoName==''){
                                layer.msg('请选择视频');
                                document.getElementById("layui-layer-iframe"+index).contentWindow.location.reload();
                            }else if(startTime==''||endTime==''){
                                layer.msg('请选择日期');
                                document.getElementById("layui-layer-iframe"+index).contentWindow.location.reload();
                            }else if(endTime<startTime){
                                layer.msg('开始日期必须大于结束日期');
                                document.getElementById("layui-layer-iframe"+index).contentWindow.location.reload();
                            }else{
                                $.ajax({
                                    type:"post",
                                    url:"<%=path%>/safetyEduControl/add",
                                    async:true,
                                    data:{
                                        // type:"taskAdd",
                                        name:videoName,
                                        startTime:startTime,
                                        endTime:endTime,
                                        id:videoId,
                                    },
                                    dataType:"text",
                                    success:function(data){
                                        if(data>=1){
                                            alert("添加成功");
                                            window.location.reload();
                                        }else {
                                            alert("添加失败");
                                            location.reload();
                                        }
                                    }
                                });
                            }
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
                    title: '配置试题',
                    type: 1,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    btn: ['确定', '返回'],
                    closeBtn: false,
                    id: 'LAY_layuipro1',
                    offset: ['50px','35%'],
                    area: ['500px', '400px'],
                    btnAlign: 'c',
                    moveType: 1,
                    content: $('#addEduVideo_div'), //内容
                    success: function(layero,index){
                        var btn = layero.find('.layui-layer-btn');
                        btn.find('.layui-layer-btn0').click(function(){
                            // var body = layer.getChildFrame('body', index);
                            var route = $('#route').val();
                            if (route!=""&&route!=null){
                                $.ajax({
                                    type:"post",
                                    url:"<%=path%>/safetyEduControl/update",
                                    async:true,
                                    data:{
                                        id:data.id,
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
                            }else {
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
            elem: '#startTime',
            value: new Date()
        });
        laydate.render({
            elem: '#endTime',
            value: new Date()
        });
        //上传文件
        upload.render({
            elem: '#test3'
            ,url: '<%=path%>/utilControl/upLoad' //改成您自己的上传接口
            ,accept: 'file' //普通文件
            ,done: function(res){
                layer.msg('上传成功');
                $("#route").val(res.msg);
                console.log(res);
            }
        });
        //获取视频名称

        $(function () {
            $.ajax({
                type:"post",
                url:'<%=path%>/safeVideoControl/selectList',
                dataType:"json",
                success:function (data1) {
                    console.log(data1);
                    // var data1=$.parseJSON(data1);
                    // console.log(data1);
                    $.each(data1.data,function (index,item) {
                        debugger
                        console.log(item);
                        $('#videoName').append(new Option(item.vName,item.id));
                    });
                    layui.form.render("select");
                },error:function () {
                    alert("查询失败")
                }
            });
        })
    });
</script>

</body>
</html>