<%--
  Created by IntelliJ IDEA.
  User: 瓷甃
  Date: 2020/7/17
  Time: 1:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心</title>

    <%
        String path = request.getContextPath();
        String account= (String) request.getSession().getAttribute("account");
    %>

    <link href="<%=path%>/static/X-admin/lib/layui/css/layui.css" rel="stylesheet" type="text/css"/>
    <script src="<%=path%>/static/X-admin/js/jquery.min.js" charset="UTF-8"></script>
    <script src="<%=path%>/static/X-admin/lib/layui/layui.js" charset="utf-8"></script>

</head>
<body>

<input type="hidden" id="account" value="<%=account%>">

<form id="personalForm" class="layui-form" action="" method="post" lay-filter="test1" style="width: 800px">
    <div class="layui-form-item">
        <label class="layui-form-label">用户ID</label>
        <div class="layui-input-block">
            <input disabled type="text" name="securityId" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-block">
            <input id="securityName" type="text" name="securityName" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">手机号码</label>
        <div class="layui-input-block">
            <input disabled type="text" name="securityPhone" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-inline">
            <input type="password" name="securityPwd" required lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">状态</label>
        <div class="layui-input-block">
            <input disabled type="text" name="securityState" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">注册时间</label>
        <div class="layui-input-block">
            <input disabled type="text" name="securityRegtime" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input disabled type="text" id="securitySex" name="securitySex" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">年龄</label>
        <div class="layui-input-block">
            <input id="securityAge" type="text" name="securityAge" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">地址</label>
        <div class="layui-input-block">
            <input id="securityAdd" type="text" name="securityAdd" required  lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button id="sub" class="layui-btn" lay-submit lay-filter="formDemo">修改</button>
            <button  class="layui-btn layui-btn-primary">重置</button>
<%--             type="reset"--%>
        </div>
    </div>
</form>

<input type="hidden" id="path" value=<%=path%>>
</body>

<script>
    layui.use('form', function(){
        var form = layui.form;

        $(function () {
            //ajax
            let path=$("#path").val();
            let account=$("#account").val();
            console.log(account);
            if (account==null||account==""){
                layer.msg("请先登录！",{
                    time: 2000 //2秒关闭
                }, function(){
                    //do something
                    // location.href = "/security/jsp/login.jsp";
                    parent.location.href="/security/jsp/securityLogin.jsp";
                });
            }else {
                $.ajax({
                    url : path+"/sc/getInfo",
                    async : true,
                    type : "POST",
                    data : "account=<%=account%>",
                    dataType : "text",
                    success : function(msg) {
                        // layer.msg("获取成功!");
                        // console.log(msg);

                        if (msg=="login"){
                            layer.msg("请先登录！",{
                                time: 2000 //2秒关闭
                            }, function(){
                                //do something
                                location.href = "/security/jsp/login.jsp";
                            });
                        }else {
                            msg=$.parseJSON(msg);
                            console.log(msg);

                            //渲染
                            form.val("test1", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
                                "securityId": msg.securityId// "name": "value"
                                ,"securityPhone": msg.securityPhone
                                ,"securityPwd":msg.securityPwd
                                ,"securityName":msg.securityName
                                ,"securityStateName":msg.securityStateName
                                ,"securityRegtime":msg.securityRegtime
                                ,"securityAdd":msg.securityAdd
                                ,"securityAge":msg.securityAge
                                ,"securitySex":msg.securitySex

                            });
                        }

                        // form.render();
                    },
                    error : function() {
                        layer.msg("网络繁忙!");
                    }
                });
            }



        })
    });
</script>

<script>
    //Demo
    layui.use('form', function(){
        var form = layui.form;
        let path=$("#path").val();
        // let data= form.val("test1");
        layer.msg(path);


        // 监听提交
        form.on('submit(formDemo)', function(data){
            // layer.msg(JSON.stringify(data.field));
            layer.msg("2");
            console.log("2");

            $.ajax({
                url : path+"/sc/update",
                async : true,
                type : "POST",
                data : "data=" + JSON.stringify(data.field),
                dataType : "text",
                success : function(msg) {
                    layer.msg("获取成功!");
                    console.log(msg);

                    if(msg=="success"){
                        layer.msg("修改成功!");
                    }else {
                        layer.msg(msg);
                    }

                },
                error : function() {
                    layer.msg("网络繁忙!");
                }
            });
            layer.msg("3");
            return false;
        });


    });
</script>
</html>
