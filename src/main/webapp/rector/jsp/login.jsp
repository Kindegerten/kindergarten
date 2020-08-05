<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<html lang="en">
<%String path = request.getContextPath();%>
<head>
    <meta charset="UTF-8">
    <title>园长登录</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/X-admin/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/X-admin/css/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/X-admin/css/xadmin.css">
    <%--    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>--%>
    <script src="${pageContext.request.contextPath}/static/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/healther/js/login.js"></script>
    <script src="${pageContext.request.contextPath}/static/X-admin/lib/layui/layui.js" charset="utf-8"></script>
    <%--    <!--[if lt IE 9]>--%>
    <%--<!--      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>-->--%>
    <%--<!--      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>-->--%>

    <%--    <![endif]-->--%>
</head>
<body class="login-bg">
<input type="hidden" id="path" value=<%=path%>>

<div class="login layui-anim layui-anim-up">
    <div class="message">园长登录</div>
    <div id="darkbannerwrap"></div>

    <form method="post" class="layui-form">
        <input id="rectorTel" name="rectorTel" placeholder="手机号" type="text" lay-verify="required|phone"
               class="layui-input">
        <hr class="hr15">
        <input id="rectorPwd" name="rectorPwd" lay-verify="required" placeholder="密码" type="password"
               class="layui-input">
        <hr class="hr15">
        <input id="vCode" name="vCode" lay-verify="required" placeholder="验证码" type="text" class="layui-input">
        <hr class="hr15">
        <img id="vCodeImg" style="width: 160px; height: 60px" onclick="changeImg()"
             src="${pageContext.request.contextPath}/VerifyCodeControl/code">
        <a style="text-decoration:none;" value="" onclick="changeImg()">看不清，换一张</a>
        <hr class="hr15">
        <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="button" onclick="ajax()">
        <hr class="hr20">
    </form>
</div>
<script>

</script>
<script>
    function changeImg() {
        var path = $("#path").val();
        // var img = document.getElementsByTagName("img")[0];
        $("#vCodeImg").attr("src", "/VerifyCodeControl/code?time=" + new Date().getTime());
        // node.src =path + "/verifyCodeServlet?time=" + new Date().getTime() ;
    }

    function ajax() {
        var rectorTel = $("#rectorTel").val();
        var rectorPwd = $("#rectorPwd").val();
        var vCode = $("#vCode").val();
        console.log(rectorTel, rectorPwd);
        $.ajax({
                url: "/RectorControl/login",
                async: true,
                type: "post",
                data: {"rectorTel": rectorTel, "rectorPwd": rectorPwd, "vCode": vCode},
                datatype: "text",
                success: function (msg) {
                    alert(msg);
                    if (msg === "登陆成功") {
                        location.href = "/rector/jsp/index.jsp";
                    } else {
                        changeImg();
                    }
                },
                error: function () {
                    alert("网络繁忙！");
                },
            }
        );
    }
</script>

</body>
</html>