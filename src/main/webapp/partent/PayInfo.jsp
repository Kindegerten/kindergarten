
<%@ page import="com.kindergarten.bean.Parents" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <style>
        body{
            background: white;
        }
        .layui-form-item .layui-input-inline {
            width: 300px;
        }
    </style>
</head>
<body>
<form class="layui-form layui-form-pane" action="">

    <div class="layui-form-item">
        <label class="layui-form-label">学生姓名</label>
        <div class="layui-input-inline">
            <input type="text" id="studentName" class="layui-input" readonly="readonly">
        </div>
        <label class="layui-form-label">缴费时间</label>
        <div class="layui-input-inline">
            <input type="text" id="createtime"  class="layui-input" readonly="readonly">
        </div>
        <label class="layui-form-label">缴费单号</label>
        <div class="layui-input-inline">
            <input type="text" id="tradeno" class="layui-input" readonly="readonly">
        </div>
        <label class="layui-form-label">交易号</label>
        <div class="layui-input-inline">
            <input type="text" id="alitradeno" class="layui-input" readonly="readonly">
        </div>
        <label class="layui-form-label">缴费金额</label>
        <div class="layui-input-inline">
            <input type="text" id="PayMoney"   class="layui-input" readonly="readonly">
        </div>
    </div>
</form>

<script src="${pageContext.request.contextPath}/static/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/partent/js/jquery-3.4.1.js"></script>
<script>

    $.ajax({
        url:"/pt/PayInfo",
        async: true,
        type: "post",
        data:{"billId":parent.billId},
        dataType: "json",
        success: function (msg) {
            // console.log(msg);
            // console.log();
            // console.log(msg.length);
            var studentName=$("#studentName").val(msg.studentName);
            var createtime=$("#createtime").val(msg.studentbillCreatetime);
            var tradeno=$("#tradeno").val(msg.studentbillTradeno);
            var alitradeno=$("#alitradeno").val(msg.studentbillTrano);
            var PayMoney=$("#PayMoney").val(parent.billMoney+"元");


        },
        error: function () {
            alert("网络繁忙");

        },
        complete: function () {
            // alert("ajax执行完毕");
        }
    })

</script>

</body>
</html>
