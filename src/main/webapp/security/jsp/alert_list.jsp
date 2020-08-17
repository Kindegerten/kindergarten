<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>报警记录</title>

    <%
        String path = request.getContextPath();
        String account= (String) request.getSession().getAttribute("account");
    %>

    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="<%=path%>/static/X-admin/css/font.css">
    <link rel="stylesheet" href="<%=path%>/static/X-admin/css/xadmin.css">
    <script src="<%=path%>/static/X-admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=path%>/static/X-admin/js/xadmin.js"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<input type="hidden" id="path" value="<%=path%>">
<input type="hidden" id="account" value="<%=account%>">

<div class="x-nav">
            <span class="layui-breadcrumb">
                <a href="">首页</a>
                <a href="">演示</a>
                <a>
                    <cite>导航元素</cite></a>
            </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i>
    </a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <form class="layui-form layui-col-space5">
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input" autocomplete="off" placeholder="开始日" name="start" id="start"></div>
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input" autocomplete="off" placeholder="截止日" name="end" id="end"></div>
                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="name" placeholder="请输入用户名" autocomplete="off" class="layui-input"></div>
                        <div class="layui-inline layui-show-xs-block">
                            <button class="layui-btn" lay-submit="" lay-filter="sreach">
                                <i class="layui-icon">&#xe615;</i></button>
                        </div>
                    </form>
                </div>
                <div class="layui-card-body ">
                    <table class="layui-table" lay-data="{url:'/sc/getAlert',page:true,toolbar: '#toolbarDemo',id:'test'}" lay-filter="test">
                        <thead>
                        <tr>
                            <th lay-data="{type:'checkbox'}">ID</th>
                            <th lay-data="{field:'alertId', width:100, sort: true}">报警ID</th>
                            <th lay-data="{field:'studentName', sort: true, }">名字</th>
                            <th lay-data="{field:'studentId',sort: true, minWidth: 150}">学号</th>
                            <th lay-data="{field:'lng',sort: true}">经度</th>
                            <th lay-data="{field:'lat',sort: true, minWidth: 100}">纬度</th>
                            <th lay-data="{field:'alert', sort: true}">报警时间</th>
<%--                            , templet: '#switchTpl'--%>
<%--                            <th lay-data="{field:'dw_xinzhi',templet: function(d){ return d.dw_xinzhi.titel;}}">学校</th></tr>--%>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/html" id="toolbarDemo">
    <div class = "layui-btn-container" >
        <button class = "layui-btn layui-btn-sm" lay-event = "getCheckData" > 获取选中行数据 </button>
        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button >
        <button class = "layui-btn layui-btn-sm" lay-event = "isAll" > 验证是否全选</button>
    </div >
</script>

<script>layui.use('laydate',
    function() {
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });

    });</script>
<script>
    layui.use(['table', 'form'],
        function () {
            var table = layui.table;
            var form = layui.form;
            var $ = layui.jquery
            let path = $("#path").val();

            form.on('submit(sreach)', function(data){
                console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}


                    var startDate = data.field.start;
                    var endDate = data.field.end;
                    var name = data.field.name;

                    layer.msg("search!!!")

                    table.reload('test', {
                        url: '/sc/getAlert',
                        page: {
                            curr: 1
                        },
                        where: {
                            name: name, startDate: startDate, endDate: endDate
                        }
                    });

                return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
            });




        //监听单元格编辑
        table.on('edit(test)',
            function(obj) {
                var value = obj.value //得到修改后的值
                    ,
                    data = obj.data //得到所在行所有键值
                    ,
                    field = obj.field; //得到字段
                layer.msg('[ID: ' + data.id + '] ' + field + ' 字段更改为：' + value);
            });

        //头工具栏事件
        table.on('toolbar(test)',
            function(obj) {
                var checkStatus = table.checkStatus(obj.config.id);
                switch (obj.event) {
                    case 'getCheckData':
                        var data = checkStatus.data;
                        layer.alert(JSON.stringify(data));
                        break;
                    case 'getCheckLength':
                        var data = checkStatus.data;
                        layer.msg('选中了：' + data.length + ' 个');
                        break;
                    case 'isAll':
                        layer.msg(checkStatus.isAll ? '全选': '未全选');
                        break;
                };
            });
    });
</script>



</html>