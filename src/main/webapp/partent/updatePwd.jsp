
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

<%String path = request.getContextPath();%>
<input id="path" type="hidden" value=<%=path%>>
<br><br><br>
<form class="layui-form" action="" method="post">

    <div class="layui-form-item">
        <label class="layui-form-label">原密码</label>
        <div class="layui-input-inline">
            <input type="password" name="oldpwd" required lay-verify="password" placeholder="请输入原密码"  autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">新密码</label>
        <div class="layui-input-inline">
            <input type="password" name="newpwd" required lay-verify="required" placeholder="请输入新密码" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">确认密码</label>
        <div class="layui-input-inline">
            <input type="password" name="reqpwd" required lay-verify="required" placeholder="确认密码" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit  lay-filter="userdata" >立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script src="${pageContext.request.contextPath}/static/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/partent/js/jquery-3.4.1.js"></script>
<script>
    //Demo
    layui.use('form', function(){
        var form = layui.form;
        //监听提交
        form.on('submit(userdata)', function(data){
            var path = $("#path").val();
            var userdata={"account":data.field.account,"tel":data.field.phone,"nickName":data.field.title,"password":data.field.password,"email":data.field.email,"sex":data.field.sex};
            $.ajax({

                url : path+"/pt/UpdatePwd",
                async : true,
                type : "POST",
                data :{"oldpwd":data.field.oldpwd,"newpwd":data.field.newpwd},
                dataType : "text",
                success : function(msg) {
                    if (msg === "success") {
                        // parent.location.reload();

                        layer.msg('修改成功!', {icon: 1, time: 8000})

                    } else {
                        layer.msg('更新失败,原密码输入错误!', {icon: 2, time: 6000});
                    }
                },
                error : function() {
                    layer.msg('网络错误!', {icon: 2, time: 1000});
                }
            });
            // alert(data.field.title);


            // layer.msg(JSON.stringify(data.field));
            return false;
        });
    });
</script>

</body>
</html>
