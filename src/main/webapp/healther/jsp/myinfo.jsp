<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
<%String path = request.getContextPath();%>
<head>
    <meta charset="UTF-8">
    <title>个人信息</title>
    <meta name="renderer" content="webkit">
<%--    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">--%>
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
<input type="hidden" id="path" value=<%=path%>>
<%--//修改个人信息的div--%>
<div  class="layui-fluid" id="updateDiv">
    <div class="layui-row">
        <form class="layui-form" action="" method="post">
            <div class="layui-form-item">
                <label class="layui-form-label">ID</label>
                <div hidden class="layui-input-inline">
                    <input hidden readonly type="text" id="healtherId" name="healtherId" required lay-verify="required"
                           value="${healther.healtherId}" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">名字</label>
                <div class="layui-input-inline">
                    <input type="text" readonly id="healtherName" name="healtherName" required lay-verify="required"
                           value="${healther.healtherName}" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">地址</label>
                <div class="layui-input-inline">
                    <input type="text" id="healtherAdd" name="healtherAdd" required lay-verify="required"
                           value="${healther.healtherAdd}" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">电话</label>
                <div class="layui-input-inline">
                    <input type="text" id="healtherPhone" name="healtherPhone" required lay-verify="required"
                           value="${healther.healtherPhone}" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">原密码</label>
                <div class="layui-input-inline">
                    <input type="password" id="oldhealtherPwd" name="oldhealtherPwd" lay-verify="required"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">新密码</label>
                <div class="layui-input-inline">
                    <input type="password" id="newhealtherPwd" name="newhealtherPwd" lay-verify="required"
                           autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">确认密码</label>
                <div class="layui-input-inline">
                    <input type="password" id="healtherPwd" name="healtherPwd" lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="updateData">保存</button>
                    <button type="reset" class="layui-btn layui-btn-primary">取消</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<script>
    layui.use('form', function () {
        var form = layui.form;
        //弹出层表单操作，主要是提交
        form.on('submit(updateData)', function (data) {
            if (data.field.healtherPwd === data.field.newhealtherPwd) {
                var newData = {
                    "healtherId": data.field.healtherId,
                    "healtherName": data.field.healtherName,
                    "healtherAdd": data.field.healtherAdd,
                    "healtherPhone": data.field.healtherPhone,
                    "oldhealtherPwd": data.field.oldhealtherPwd,
                    "healtherPwd": data.field.healtherPwd,
                };
            }else{
                alert("两次密码输入不一致");
            }
            console.log(newData);

                $.ajax({
                    url: "/HealtherControl/updateSelf",
                    async: true,
                    type: "POST",
                    data: {"value": JSON.stringify(newData)},
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
</html>
