<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="x-admin-sm">
<%
    String path = request.getContextPath();
    /*   System.out.println("path:"+path);*/
%>
<head>
    <meta charset="UTF-8">
    <title>智慧幼儿园平台端</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/X-admin/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/X-admin/css/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/X-admin/css/xadmin.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/X-admin/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/X-admin/lib/layui/layui.js" charset="utf-8"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="login-bg">

<div class="login layui-anim layui-anim-up">
    <div class="message">欢迎登陆智慧幼儿园管理系统</div>
    <div id="darkbannerwrap"></div>

    <form method="post" class="layui-form">
        <input name="adminTel" placeholder="手机号" type="text" lay-verify="required" class="layui-input">
        <hr class="hr15">
        <input name="adminPwd" lay-verify="required" placeholder="密码" type="password" class="layui-input">
        <hr class="hr15">
        <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
        <hr class="hr20">

    </form>
</div>

<script>
    $(function () {
        layui.use('form', function () {
            <%--var path=<%=path%>;--%>
            var form = layui.form;

            form.on('submit(login)', function (data) {
                var adminJson = data.field;
                /*  console.log("adminjson:"+adminJson)*/
                $.ajax({
                    type: "POST",
                    url: "/platformController/login",
                    data: adminJson,
                    dataType: "text",
                    success: function (data) {
                        // console.log("data"+data)
                        // alert(data);
                        if (data=="success"){
                            location.href='/platform/index.jsp'
                        }else {
                            alert("登陆失败");
                        }

                    }
                })
                return false;//防止页面刷
            });
            // form.verify({
            //     adminTel: [
            //         /^[\S]{2,10}$/
            //         , '用户名必须2到10位'
            //     ],
            //     adminPwd: [
            //         /^[\S]{3,20}$/
            //         , '密码必须为3到20位'
            //     ],
            //
            // });
        });

    })
</script>
</body>
</html>