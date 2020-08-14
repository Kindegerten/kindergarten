<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>接送记录</title>

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
    <script type="text/javascript" src="<%=path%>/static/jquery-3.5.1.js"></script>
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
                            <input type="text" name="name" placeholder="宝宝名称" autocomplete="off" class="layui-input"></div>
                        <div class="layui-inline layui-show-xs-block">
                            <select class="layui-select" name="classes" id="classes" title="班级"></select></div>
<%--                            <input type="text" name="name" placeholder="班级" autocomplete="off" class="layui-input">--%>
                        <div class="layui-inline layui-show-xs-block">
                            <button class="layui-btn" lay-submit="" lay-filter="sreach">
                                <i class="layui-icon">&#xe615;</i></button>
                        </div>
                    </form>
                </div>
                <div class="layui-card-body ">
                    <table class="layui-table" lay-data="{url:'/sc/getPickup',page:true,toolbar: '#toolbarDemo',id:'test'}" lay-filter="test">
                        <thead>
                        <tr>
                            <th lay-data="{type:'checkbox'}">ID</th>
                            <th lay-data="{field:'studentId', width:100, sort: true}">宝宝编号</th>
                            <th lay-data="{field:'studentName',sort: true, minWidth: 100}">宝宝名称</th>
                            <th lay-data="{field:'className', sort: true, }">所在班级</th>
                            <th lay-data="{field:'teacherName',sort: true}">班主任</th>
                            <th lay-data="{field:'studentSex',sort: true}">性别</th>
                            <th lay-data="{fixed: 'right', width:100, align:'center', toolbar: '#barDemo'}">操作
<%--                                <a onclick="xadmin.open('开始添加人脸','<%=path%>/security/jsp/faceAdd.jsp')"></a>--%>
                            </th>

<%--                            <th lay-data="{field:'alert', sort: true}">报警时间</th>--%>
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
    var pickupDetail;
    layui.use(['table', 'form','layer'],
        function () {
            var table = layui.table;
            var form = layui.form;
            var $ = layui.jquery;
            var layer=layui.layer;
            let path = $("#path").val();

            // $("#search").click(function (data) {
            //     var startDate = $("#start").val();
            //     var endDate = $("#end").val();
            //     var name = $("#name").val();
            //
            //     layer.msg("search!!!")
            //
            //     table.reload('test', {
            //         url: '/sc/getAlert',
            //         page: {
            //             curr: 1
            //         },
            //         where: {
            //             name: name, startDate: startDate, endDate: endDate
            //         }
            //     });
            //     // return false;
            // })
            form.on('submit(sreach)', function(data){
                console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}

                var startDate = data.field.start;
                var endDate = data.field.end;
                var name = data.field.name;
                var classes=data.field.classes;

                // layer.msg("search!!!")

                table.reload('test', {
                    url: '/sc/getPickup',
                    page: {
                        curr: 1
                    },
                    where: {
                        name: name, class:classes
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


            <%--工具栏监听--%>
            //监听工具条
            table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
                var data = obj.data; //获得当前行数据
                var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
                var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）

                if(layEvent === 'detail'){ //查看
                    //TODO 弹出框个人考勤表
                    console.log(data);

                    pickupDetail=data;
                    console.log("parent:"+pickupDetail);

                <%--<a onclick="xadmin.open('开始添加人脸','<%=path%>/security/jsp/faceAdd.jsp')">开始添加人脸</a>--%>

                    layer.open({
                        type: 2,
                        title: false,
                        closeBtn: 0, //不显示关闭按钮
                        shade: [0],
                        area: ['200px', '200px'],
                        offset: 'rb', //右下角弹出
                        time: 2000, //2秒后自动关闭
                        anim: 2,
                        content: ['/security/jumping.jsp', 'no'], //iframe的url，no代表不显示滚动条
                        end: function(){ //此处用于演示
                            layer.open({
                                type: 2,
                                title: '宝宝接送信息',
                                shadeClose: true,
                                shade: false,
                                maxmin: true, //开启最大化最小化按钮
                                area: ['893px', '600px'],
                                content: '/security/pickup_detail.jsp'
                            });
                        }
                    });

                } else if(layEvent === 'del'){ //删除
                    layer.confirm('真的删除行么', function(index){
                        obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                        layer.close(index);
                        //向服务端发送删除指令
                    });
                } else if(layEvent === 'edit'){ //编辑
                    //do something

                    //同步更新缓存对应的值
                    obj.update({
                        username: '123'
                        ,title: 'xxx'
                    });
                } else if(layEvent === 'LAYTABLE_TIPS'){
                    layer.alert('Hi，头部工具栏扩展的右侧图标。');
                }
            });
        });


</script>

<script>
    window.onload=function(){
        // layer.msg("拉取下拉框选项中...");
        layui.use('form', function () {
            // var path = $("#path").val();
            var form = layui.form;
        $.ajax({
            url: "/sc/getClassSelect",
            async: true,
            type: "POST",
            data: "",
            dataType: "json",
            success: function (msg) {
                console.log(msg);

                $("#classes").empty();
                $("#classes").append("<option value=''>请选择</option>");
                msg.forEach(item=>
                    $("#classes").append("<option value="+item.classId+">"+item.className+"</option>")
                );
                form.render("select");

            },
            error: function () {
                layer.msg("网络繁忙!");
            }
        });
        })
    };
</script>

<%--工具栏--%>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
<%--    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>--%>
<%--    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>--%>

</script>

</html>