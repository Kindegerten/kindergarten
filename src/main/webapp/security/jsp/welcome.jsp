<%--
  Created by IntelliJ IDEA.
  User: 瓷甃
  Date: 2020/7/30
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <%
        String path = request.getContextPath();
        String account = (String) request.getSession().getAttribute("account");
    %>

    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>

<input type="hidden" id="path" value="<%=path%>">
<input type="button" class="layui-btn" value="getAuth" onclick="getAuth()">


</body>
</html>

<script>
    function getAuth() {

        let path=$("#path").val();
        console.log("in "+path);

        $.ajax({
            url: path + "/sc/getAuth",
            async: true,
            type: "POST",
            data:"",
            dataType: "text",
            success: function (msg) {
                // layer.msg(msg);
                console.log(msg);

            },
            error: function () {
                // layer.msg("网络繁忙!");
                console.log("网络繁忙");
            }
        });
    }
</script>