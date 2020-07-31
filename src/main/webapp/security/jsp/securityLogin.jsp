<%--
  Created by IntelliJ IDEA.
  User: 瓷甃
  Date: 2020/7/29
  Time: 23:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html  class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>安防员登录</title>

    <%
        String path = request.getContextPath();
    %>

    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="<%=path%>/static/X-admin/css/font.css">
    <link rel="stylesheet" href="<%=path%>/static/X-admin/css/login.css">
    <link rel="stylesheet" href="<%=path%>/static/X-admin/css/xadmin.css">
    <link rel="stylesheet" href="<%=path%>/static/sliderValidate/layui/css/layui.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="<%=path%>/static/X-admin/lib/layui/layui.js" charset="utf-8"></script>
    <script src="<%=path%>/static/sliderValidate/src/sliderVerify/sliderVerify.js" charset="utf-8"></script>
<%--    <script src="<%=path%>/static/X-admin/lib/layui/lay/modules/slider.js"></script>--%>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="login-bg">
<input type="hidden" id="path" value=<%=path%>>

<div class="login layui-anim layui-anim-up">
    <div class="message">安防员登录</div>
    <div id="darkbannerwrap"></div>

    <form method="post" class="layui-form" >
        <input name="phone" placeholder="手机号码" value="13579086421" type="text" lay-verify="required" class="layui-input" >
        <hr class="hr15">
        <input name="pwd" id="pwd" lay-verify="required" value="123456" placeholder="密码"  type="password" class="layui-input">
        <hr class="hr15">
<%--        <input name="vCode" placeholder="验证码"  type="text" lay-verify="required" class="layui-input" >--%>
        <div class="layui-form-item">
            <label class="layui-form-label" style="text-align: left">滑动验证:</label>
            <div class="layui-input-block">
                <div id="slider"></div>
            </div>
        </div>
        <hr class="hr15">
        <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="button">
        <hr class="hr20" >
    </form>
</div>

<%--提交监听--%>
<script>
        layui.use(['form','layer'], function(){
            var form = layui.form;
            var layer=layui.layer;
            // var $=layui.jquery;
            // var path=$("path").val();
            var $ = layui.$;

            form.on('submit(login)', function(data){
                // layer.msg(data.field);
                // alert("Q");
                $.ajax({

                    url:"/sc/login",
                    // async:true,
                    type:"POST",
                    data:data.field,
                    dataType:"text",
                    /*contentType: 'application/json;charset=utf-8', //设置请求头信息*/
                    success:function (msg) {
                        if  ( msg == "success"){
                            layer.msg("登入成功！");
                            location.href = "/security/jsp/index.jsp";
                        }else {
                            layer.msg(msg);
                            $("#pwd").val("");
                        }
                    },
                    error:function () {
                        layer.msg("网络繁忙！");
                    },
                });
            });
        });
</script>

<%--滑动验证码--%>
<script type="text/javascript" charset="utf-8">
    layui.config({
        base: '<%=path%>/static/sliderValidate/dist/sliderVerify/'
    }).use(['sliderVerify', 'jquery', 'form'], function() {
        var sliderVerify = layui.sliderVerify,
            $ = layui.jquery,
            form = layui.form;
        var slider = sliderVerify.render({
            elem: '#slider',
            onOk: function(){//当验证通过回调
                layer.msg("滑块验证通过");
            }
        })
        $('#reset').on('click',function(){
            slider.reset();
        })
        //监听提交
        form.on('submit(formDemo)', function(data) {
            if(slider.isOk()){
                layer.msg(JSON.stringify(data.field));
            }else{
                layer.msg("请先通过滑块验证");
            }
            return false;
        });

    })
</script>

<!-- 底部结束 -->

</body>
</html>