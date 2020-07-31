<%@ page import="com.kindergarten.bean.Admin" %>

<%--
  Created by IntelliJ IDEA.
  User: litaoquan
  Date: 2020/7/30
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,user-scalable=no,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0">
    <title>个人中心</title>
<%--    <link rel="stylesheet" href="/static/X-admin/layui/css/layui.css">--%>
    <link rel="stylesheet" href="/static/X-admin/css/index.css">
<%--    <link rel="stylesheet" href="../res/static/css/grjs.css" />--%>
<%--    <%--%>
<%--        Admin admin= (Admin) request.getSession().getAttribute("admin");--%>
<%--        System.out.println("管理员："+admin);--%>
<%--    %>--%>
</head>

<body>
<!-- nav部分 -->
<!-- banner部分 -->
<div class="banner grjs">
    <div class="title">
        <p>个人信息</p>
        <p class="en">Personal Introduction</p>
    </div>
</div>
<!-- main部分 -->
<div class="main-about">
    <div class="layui-container">
        <div class="layui-row">
            <div class="tabJob">
                <div class="content">
                    <c:if test="${not empty admin}">
                    <img class="grz" src="${admin.imageUrl}"  width="200px" height="200px" />
                    <ol>

                        <li>姓名：${admin.adminName} </li>
                        <li>性别：${admin.adminSex}</li>
                        <li>手机号：${admin.adminTel}</li>
                        <li>邮箱：${admin.adminEmail}</li>

                    </ol>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/static/X-admin/lib/layui/layui.js"></script>
<%--<script>
    layui.config({
        base: '../res/static/js/'
    }).use('firm');
</script>--%>
</body>

</html>
