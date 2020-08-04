<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
<%String path = request.getContextPath();%>
<head>
    <meta charset="UTF-8">
    <title>体检列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/X-admin/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/X-admin/css/xadmin.css">
    <script src="${pageContext.request.contextPath}/static/X-admin/lib/layui/layui.js" charset="utf-8"></script>
<%--    <script type="text/javascript" src="${pageContext.request.contextPath}/static/X-admin/js/xadmin.js"></script>--%>
    <script src="${pageContext.request.contextPath}/static/jquery-3.5.1.js"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<input type="hidden" id="path" value=<%=path%>>
<div id="mealadd">
    <div class="layui-card-body ">
        <div class="layui-card-body demoTable">
            <label class="layui-form-label">选择时间段</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="mealDatescope" name="mealDatescope" placeholder=" - ">
            </div>
        </div>
    </div>
    <div class="layui-card-body layui-table-body layui-table-main">
        <table id="test" class="layui-table layui-form" id="bodytable" lay-filter="test">
            <thead>
            <tr>
                <th >餐别</th>
                <th >周一</th>
                <th >周二</th>
                <th >周三</th>
                <th >周四</th>
                <th >周五</th>
                <th >操作</th>
            </tr>
            </thead>
            <tr class="a">
                <th>早餐</th>
                <th contenteditable="true"></th>
                <th contenteditable="true"></th>
                <th contenteditable="true"></th>
                <th contenteditable="true"></th>
                <th contenteditable="true"></th>
                <th><a class="layui-btn layui-btn-xs" lay-event="edit" onclick="mealadd(this)">增加</a></th>
            </tr>
            <tr>
                <th>中餐</th>
                <th contenteditable="true"></th>
                <th contenteditable="true"></th>
                <th contenteditable="true"></th>
                <th contenteditable="true"></th>
                <th contenteditable="true"></th>
                <th><a class="layui-btn layui-btn-xs" lay-event="edit" onclick="mealadd(this)">增加</a></th>
            </tr>
            <tr>
                <th>点心</th>
                <th contenteditable="true"></th>
                <th contenteditable="true"></th>
                <th contenteditable="true"></th>
                <th contenteditable="true"></th>
                <th contenteditable="true"></th>
                <th><a class="layui-btn layui-btn-xs" lay-event="edit" onclick="mealadd(this)">增加</a></th>
            </tr>
        </table>
    </div>
</div>

<script>
    layui.use(['laydate', 'form', 'laypage', 'table', 'laytpl','layer'], function () {
        var form = layui.form;
        var laypage = layui.laypage;
        var table = layui.table;
        var laydate = layui.laydate;
        var laytpl = layui.laytpl;
        var layer =layui.layer;
        // table.init('test3', {
        //     height: 315 //设置高度
        //     ,limit: 10 //注意：请务必确保 limit 参数（默认：10）是与你服务端限定的数据条数一致
        //     //支持所有基础参数
        // });
        //日期范围
        laydate.render({
            elem: '#mealDatescope'
            , range: true
        });
        //表格操作，进行编辑修改等
        table.on('tool(test)', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
           console.log(data,layEvent,tr)
        });
    });
    function mealadd(node) {
        var flag = confirm("确认" + $(node).val() + "？");
        var trNode = $(node).parent().parent();
        var tdNodes = trNode.children();
        console.log(tdNodes);
        var mealType = $(tdNodes[0]).text();
        console.log(mealType);
        var monday = $(tdNodes[1]).text();
        console.log(monday);
        var tuesday = $(tdNodes[2]).text();
        console.log(tuesday);
        var wednesday = $(tdNodes[3]).text();
        console.log(wednesday);
        var thursday = $(tdNodes[4]).text();
        console.log(thursday);
        var friday = $(tdNodes[5]).text();
        console.log(friday);
        var mealDatescope = $("#mealDatescope").val();
        console.log(mealDatescope);
        var data={
            "mealDatescope":mealDatescope,
            "mealType":mealType,
            "monday":monday,
            "tuesday":tuesday,
            "wednesday":wednesday,
            "thursday":thursday,
            "friday":friday,
        }
        if (flag==true) {
            if(mealDatescope!=null) {
                $.ajax({
                    url: "/HealtherControl/addmeal",
                    async: true,
                    type: "POST",
                    data: {"value": JSON.stringify(data)},
                    dataType: "text",
                    success: function (msg) {
                        if (msg === "success") {
                            layer.msg('添加成功!继续添加', {icon: 1, time: 8000})

                        } else {
                            layer.msg('添加失败!', {icon: 2, time: 6000});
                        }
                    },
                    error: function () {
                        layer.msg('网络错误!', {icon: 2, time: 1000});
                    }
                });
            }else{
                layer.msg("请添加日期")
            }
        }
    }
</script>
</body>
</html>