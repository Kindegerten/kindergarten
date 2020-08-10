<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
<%String path = request.getContextPath();%>
<head>
    <meta charset="UTF-8">
    <title>新增幼儿</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/X-admin/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/X-admin/css/xadmin.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/X-admin/lib/layui/layui.js"
            charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/X-admin/js/xadmin.js"></script>
    <script src="${pageContext.request.contextPath}/static/jquery-3.5.1.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<input type="hidden" id="path" value=<%=path%>>
<div class="layui-fluid" id="updateDiv">
    <div class="layui-row">
        <form class="layui-form" action="" method="post">
            <div  class="layui-form-item">
                <label class="layui-form-label">园所id</label>
                <div class="layui-input-inline">
                    <input  hidden readonly type="text" id="kinderId" name="kinderId" value="${rector.kinderId}"
                           autocomplete="off"
                           placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">班级名称</label>
                <div class="layui-input-inline">
                    <input  type="text" id="className" name="className" required lay-verify="required"
                            autocomplete="off"
                            placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">所在教室</label>
                <div class="layui-input-inline">
                    <input  type="text" id="classRoom" name="classRoom" required lay-verify="required"
                            autocomplete="off"
                            placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">班主任Id</label>
                <div class="layui-input-inline">
                    <input  type="text" id="teacherId" name="teacherId" required lay-verify="required"
                            autocomplete="off"
                            placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">班主任姓名</label>
                <div class="layui-input-inline">
                    <input  type="text" id="teacherName" name="teacherName" required lay-verify="required"
                            autocomplete="off"
                            placeholder="" class="layui-input" onblur="checkTeacher()">
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="newData">保存</button>
                    <button type="reset" class="layui-btn layui-btn-primary">取消</button>
<%--                    <a hidden id="faceAdd" class="layui-btn layui-btn-primary"--%>
<%--                       onclick="xadmin.open('开始添加人脸','<%=path%>/security/jsp/faceAdd.jsp')">开始添加人脸</a>--%>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    //学生姓名检测
    function checkTeacher(){
        var teacherName= $("#teacherName").val();
        $.ajax({
            url: "/RectorControl/checkTeacher",
            async: true,
            type: "POST",
            data: {"teacherName": teacherName},
            dataType: "text",
            success: function (msg) {
                if (msg === "success") {
                    layer.msg('姓名存在，请继续!', {icon: 1, time: 2000}, function () {
                    })
                } else {
                    layer.msg('姓名不存在!', {icon: 2, time: 2000});
                }
            },
            error: function () {
                layer.msg('网络错误!', {icon: 2, time: 1000});
            }
        });
    }
</script>
<script>
    layui.use(['laydate', 'form', 'laypage', 'table', 'laytpl'], function () {
        var path = $("#path").val();
        var form = layui.form;
        var table = layui.table;
        var laydate = layui.laydate;
        //日期渲染
        laydate.render({
            elem: '#test1'
        });
        //监听提交
        form.on('submit(newData)', function (data) {
            // var path = $("#path").val();
            var newData = {
                "kinderId": data.field.kinderId,
                "className": data.field.className,
                "teacherId": data.field.teacherId,
                "teacherName": data.field.teacherName,
                "classRoom": data.field.classRoom,
            };
            console.log(newData);
            $.ajax({
                url: "/RectorControl/addClasses",
                async: true,
                type: "POST",
                data: {"value": JSON.stringify(newData)},
                dataType: "text",
                success: function (msg) {
                    console.log(data);
                    if (msg === "success") {
                        layer.msg('添加成功!', {icon: 1, time: 2000}, function () {
                            parent.location.reload();
                        })
                    } else {
                        layer.msg('添加失败!', {icon: 2, time: 2000});
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
<%--<script>layui.use(['form', 'layer', 'jquery'],--%>
<%--    function () {--%>
<%--        $ = layui.jquery;--%>
<%--        var form = layui.form,--%>
<%--            layer = layui.layer;--%>

<%--        //自定义验证规则--%>
<%--        form.verify({--%>
<%--            nikename: function (value) {--%>
<%--                if (value.length < 5) {--%>
<%--                    return '昵称至少得5个字符啊';--%>
<%--                }--%>
<%--            },--%>
<%--            pass: [/(.+){6,12}$/, '密码必须6到12位'],--%>
<%--            repass: function (value) {--%>
<%--                if ($('#L_pass').val() != $('#L_repass').val()) {--%>
<%--                    return '两次密码不一致';--%>
<%--                }--%>
<%--            }--%>
<%--        });--%>

<%--        //监听提交--%>
<%--        form.on('submit(add)',--%>
<%--            function (data) {--%>
<%--                console.log(data);--%>
<%--                //发异步，把数据提交给php--%>
<%--                layer.alert("增加成功", {--%>
<%--                        icon: 6--%>
<%--                    },--%>
<%--                    function () {--%>
<%--                        //关闭当前frame--%>
<%--                        xadmin.close();--%>

<%--                        // 可以对父窗口进行刷新 --%>
<%--                        xadmin.father_reload();--%>
<%--                    });--%>
<%--                return false;--%>
<%--            });--%>

<%--    });</script>--%>
<script>var _hmt = _hmt || [];
(function () {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();</script>
</body>

</html>