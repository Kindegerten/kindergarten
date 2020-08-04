
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

        <div style="margin-left:45%;"><h1>班级相册</h1></div>
        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add"> 新增照片 </button>
            </div>
        </script>
        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>
        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="edit">宝宝信息</a>
        </script>

    </div>
</div>
<div id="classPicture" style="display:none;">
    <form class="layui-form" action="" id="add">
        <div class="layui-inline">
            <label class="layui-form-label">发布日期:</label>
            <div class="layui-input-inline">
                <input type="" name="update" id="update" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input" disabled="disabled">
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">照片说明:</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入内容" id="pictureNote" class="layui-textarea" style="height: 250px;width: 300px"></textarea>
                </div>
            </div>
            <div class="layui-upload" style="margin-left: 100px">
                <button type="button" class="layui-btn layui-btn-normal" id="test3" ><i class="layui-icon" ></i>上传</button>
            </div>
            <input type="hidden" name="photoUrl" id="photoUrl" >
            <input type="hidden" name="fileName" id="fileName" >
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
            url:'<%=path%>/tc/classSelectList',
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                {type: "checkbox", width: 50},
                {field: 'photoId', width: 100, title: '照片编号', sort: true},
                {field: 'photoName', width: 100, title: '照片名称'},
                {field: 'photoDetail', width: 110, title: '照片说明'},
                {field: 'photoUrl',title: '照片内容', width: 100,align: "left",templet:function (d) {
                        return "<img src='"+d.photoUrl+"'>";
                    }},
                {field: 'photoTime', minWidth: 120, title: '上传时间',align: "center"},
                // {title: '操作', minWidth: 150, toolbar: '#currentTableBar', align: "center"}
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
                $('#photoUrl').val(null);
                $('#fileName').val(null);
                var index = layer.open({
                    title: '添加照片',
                    type: 1,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    offset: ['50px','35%'],
                    area: ['500px', '600px'],
                    closeBtn: false,
                    id: 'LAY_layuipro',
                    btn: ['确定', '取消'],
                    btnAlign: 'c',
                    moveType: 1,
                    content: $('#classPicture'), //内容
                    success: function(layero,index){
                        var btn = layero.find('.layui-layer-btn');
                        btn.find('.layui-layer-btn0').click(function(){
                            // var body = layer.getChildFrame('body', index);
                            var pictureNote = $('#pictureNote').val();
                            var uploadTime=$('#update').val();
                            var photoUrl = $('#photoUrl').val();
                            var fileName = $('#fileName').val();


                            if (pictureNote==""){
                                layer.msg("请输入信息",{ offset: '200px' });
                                document.getElementById("layui-layer-iframe"+index).contentWindow.location.reload();
                            }else if(photoUrl==""){
                                layer.msg("请选择文件",{ offset: '200px' });
                                document.getElementById("layui-layer-iframe"+index).contentWindow.location.reload();
                            }else {
                                $.ajax({
                                    type:"post",
                                    url:"<%=path%>/tc/addClassPhoto",
                                    async:true,
                                    data:{
                                        photoTime:uploadTime,
                                        photoDetail:pictureNote,
                                        photoUrl:photoUrl,
                                        photoName:fileName
                                    },
                                    dataType:"text",
                                    success:function(data){
                                        if(data.trim()=="ok"){
                                        }
                                        alert("添加成功");
                                        window.location.reload();
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
            elem: '#update',
            value:new Date()
        });

        //上传文件
        upload.render({
            elem: '#test3'
            ,url: '<%=path%>/tc/upLoad' //改成您自己的上传接口
            ,accept: 'file' //普通文件
            ,done: function(res){
                layer.msg('上传成功');
                var arr = res.msg.split('%');
                $("#photoUrl").val(arr[0]);
                $("#fileName").val(arr[1]);
                console.log(res);
            }
        });
    });
</script>

</body>
</html>