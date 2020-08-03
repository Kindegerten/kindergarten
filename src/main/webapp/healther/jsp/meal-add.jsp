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
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/X-admin/js/xadmin.js"></script>
    <script src="${pageContext.request.contextPath}/static/jquery-3.5.1.js"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<form>
    <div>
        <table class="layui-table" lay-filter="test3">
            <thead>
            <tr>
                <th lay-data="{field:'mealType'}">餐别</th>
                <th lay-data="{field:'monday' }">周一</th>
                <th lay-data="{field:'tuesday'}">周二</th>
                <th lay-data="{field:'tuesday'}">周三</th>
                <th lay-data="{field:'tuesday'}">周四</th>
                <th lay-data="{field:'friday'}">周五</th>
            </tr>
            <tr>
                <th lay-data="{}">早餐</th>
                <th contenteditable="true">示例：包子、牛奶</th>
                <th contenteditable="true"></th>
                <th contenteditable="true" ></th>
                <th contenteditable="true" ></th>
                <th contenteditable="true" ></th>
            </tr>
            <tr>
                <th lay-data="{}">中餐</th>
                <th contenteditable="true" ></th>
                <th contenteditable="true" ></th>
                <th contenteditable="true" ></th>
                <th contenteditable="true" ></th>
                <th contenteditable="true" ></th>
            </tr>
            <tr>
                <th lay-data="{}">点心</th>
                <th contenteditable="true" ></th>
                <th contenteditable="true" ></th>
                <th contenteditable="true" ></th>
                <th contenteditable="true" ></th>
                <th contenteditable="true" ></th>
            </tr>
            </thead>
        </table>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="mealData">保存</button>
            <button type="reset" class="layui-btn layui-btn-primary">取消</button>
        </div>
    </div>
</form>
<script>
    layui.use('form', function () {
        var form = layui.form;
        var table=layui.table;
        //监听单元格编辑
        table.on('edit(test3)', function(obj){
            var value = obj.value //得到修改后的值
                ,data = obj.data //得到所在行所有键值
                ,field = obj.field; //得到字段
            layer.msg('[ID: '+ data.id +'] ' + field + ' 字段更改为：'+ value);
        });
        //监听提交
        form.on('submit(mealData)', function (data) {
            var path = $("#path").val();
            var mealData = {
                "mealType": data.field.mealType,
                "monday": data.field.monday,
                "tuesday": data.field.tuesday,
                "wednesday": data.field.wednesday,
                "thursday": data.field.thursday,
                "friday": data.field.friday,
            };
            console.log(mealData);
            $.ajax({
                url: "/HealtherControl/addmeal",
                async: true,
                type: "POST",
                data: {"value": JSON.stringify(mealData)},
                dataType: "text",
                success: function (msg) {
                    if (msg === "success") {
                        parent.location.reload();
                        layer.msg('更新成功!刷新浏览器', {icon: 1, time: 8000})

                    } else {
                        layer.msg('更新失败!', {icon: 2, time: 6000});
                    }
                },
                error: function () {
                    layer.msg('网络错误!', {icon: 2, time: 1000});
                }
            });
            return false;
        });
    });
</script>
</body>
</html>