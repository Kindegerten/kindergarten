<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html class="x-admin-sm">
<%String path = request.getContextPath();%>
<head>
    <meta charset="UTF-8">
    <title>新增体检情况</title>
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
<div  class="layui-fluid" id="updateDiv">
    <div class="layui-row">
        <form class="layui-form" action="" method="post">
            <%--            <div class="layui-form-item">--%>
            <%--                <label class="layui-form-label">教职工ID</label>--%>
            <%--                <div  hidden class="layui-input-inline">--%>
            <%--                    <input hidden readonly type="text" id="teacherId" name="teacherId" required lay-verify="required" autocomplete="off"--%>
            <%--                           placeholder="" class="layui-input">--%>
            <%--                </div>--%>
            <%--            </div>--%>
            <%--            <input hidden value="teacher">--%>
                <div  hidden readonly class="layui-form-item">
                    <label class="layui-form-label">园所id</label>
                    <div class="layui-input-inline">
                        <input type="text" id="kid" name="kid" value="${rector.kinderId}"
                               autocomplete="off"
                               placeholder="" class="layui-input">
                    </div>
                </div>
            <div class="layui-form-item">
                <label class="layui-form-label">教职工姓名</label>
                <div class="layui-input-inline">
                    <input type="text" id="teacherName" name="teacherName" required lay-verify="required"
                           autocomplete="off"
                           placeholder="" class="layui-input">
                </div>
            </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">教职工电话</label>
                    <div class="layui-input-inline">
                        <input type="tel" id="telphone" name="telphone" required lay-verify="required|phone"
                               autocomplete="off"
                               placeholder="" class="layui-input">
                    </div>
                </div>

            <div class="layui-form-item">
                <label class="layui-form-label">角色</label>
                <div class="layui-input-inline">
                    <select lay-filter="mySelect" name="select">
                        <option value="5">班主任</option>
                        <option value="4">保健员</option>
                        <option value="3">消防员</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="newData">保存</button>
                    <button type="reset" class="layui-btn layui-btn-primary">取消</button>
                    <a hidden id="faceAdd" class="layui-btn layui-btn-primary"
                       onclick="xadmin.open('开始添加人脸','<%=path%>/security/jsp/faceAdd.jsp')">开始添加人脸</a>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    layui.use('form', function () {
        var form = layui.form;
        //监听提交
        form.on('submit(newData)', function (data) {
            // var path = $("#path").val();
            var newData = {
                "teacherName": data.field.teacherName,
                "telphone": data.field.telphone,
                "roleId":data.field.select,
                "kinderid":data.field.kid,
            };
            console.log(newData);
            $.ajax({
                url: "/RectorControl/addStaffs",
                async: true,
                type: "POST",
                data: newData,
                dataType: "text",
                success: function (msg) {
                    console.log(data);
                    if (msg === "success") {
                        layer.msg('添加成功!', {icon: 1, time: 1000},function () {
                           // parent.location.reload();
                            xadmin.open('开始添加人脸','<%=path%>/security/jsp/faceAdd.jsp')
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