
<%@ page contentType="text/html;charset=UTF-8" language="java" isThreadSafe="false" %>
<%
    String path=request.getContextPath();
%>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <title>职工登录</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="<%=path%>/static/X-admin/lib/layuimini/lib/layui-v2.5.5/css/layui.css" media="all">
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        body {background-image:url("<%=path%>/static/img/bg1.png");background-size:cover;}
        #container{height:100%;width:100%;}
        input:-webkit-autofill {-webkit-box-shadow:inset 0 0 0 1000px #fff;background-color:transparent;}
        .admin-login-background {width:300px;height:300px;position:absolute;left:50%;top:40%;margin-left:-150px;margin-top:-100px;}
        .admin-header {text-align:center;margin-bottom:20px;color:#ffffff;font-weight:bold;font-size:30px;color: #1E9FFF}
        .admin-input {border-top-style:none;border-right-style:solid;border-bottom-style:solid;border-left-style:solid;height:50px;width:300px;padding-bottom:0px;}
        .admin-input::-webkit-input-placeholder {color:#a78369}
        .layui-icon-username {color:#a78369 !important;}
        .layui-icon-username:hover {color:#9dadce !important;}
        .layui-icon-password {color:#a78369 !important;}
        .layui-icon-password:hover {color:#9dadce !important;}
        .admin-input-username {border-top-style:solid;border-radius:10px 10px 0 0;}
        .admin-input-verify {border-radius:0 0 10px 10px;}
        .admin-icon {margin-left:260px;margin-top:10px;font-size:30px;}
        i {position:absolute;}
        .captcha-img {display:inline-block;width:34%;float:right;position: absolute;margin-left: 205px;margin-top: -40px;}
        #forget_pwd{color: #1E9FFF;font-size: 15px}
    </style>
</head>
<body>
<div id="container">
    <div></div>
    <div class="admin-login-background">
        <div class="admin-header">
            <span>教职员登录</span>
        </div>
        <form class="layui-form" action="">
            <div>
                <i class="layui-icon layui-icon-username admin-icon"></i>
                <input type="text" name="tel" id="tel" placeholder="请输入手机号" value="" autocomplete="off" class="layui-input admin-input admin-input-username">
            </div>
            <div>
                <i class="layui-icon layui-icon-password admin-icon"></i>
                <input type="password" name="password" id="password" placeholder="请输入密码"value="" autocomplete="off" class="layui-input admin-input">
            </div>
            <div>
                <input type="text" id="captcha" placeholder="请输入验证码" value="" autocomplete="off" class="layui-input admin-input admin-input-verify">
                <div class="captcha-img">
                    <canvas id="canvas" width="100" height="38"></canvas>
                </div>
            </div>
            <div style="margin-top: 10px;text-align: right">
                <a id="forget_pwd" href="/page/teacher/find_password">忘记密码</a>
            </div>
            <div style="margin-top: 20px">
                <button class="layui-btn layui-btn layui-btn-normal layui-btn-fluid" lay-submit="" lay-filter="login" id="loginBtn">登 入</button>
            </div>
        </form>
    </div>
</div>
<script src="<%=path%>/static/X-admin/lib/layuimini/lib/jquery-3.4.1/jquery-3.4.1.min.js" charset="utf-8"></script>
<script src="<%=path%>/static/X-admin/lib/layuimini/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>

<script>
    layui.use(['form'], function () {
        var form = layui.form,
            layer = layui.layer;
        // 登录过期的时候，跳出ifram框架
        if (top.location != self.location) top.location = self.location;

    });

    $(function(){

        var show_num = [];
        draw(show_num);
        $("#canvas").on('click',function(){
            draw(show_num);
        })

        layui.use(['form','layer'], function () {
            var form = layui.form,
                layer = layui.layer,
                $=layui.jquery;
            // 进行登录操作
            form.on('submit(login)', function (data) {
                data = data.field;
                if (data.tel == '') {
                    layer.msg('用户名不能为空');
                    return false;
                }
                if (data.password == '') {
                    layer.msg('密码不能为空');
                    return false;
                }
                if ($("#captcha").val() == '') {
                    layer.msg('验证码不能为空');
                    return false;
                }else{
                    // alert('提交成功！');
                    var val = $("#captcha").val().toLowerCase();
                    // alert('val:'+val);
                    var num = show_num.join("");
                    // alert('num:'+num);
                    if(val == num){
                        // alert('提交成功！');
                        $("#captcha").val('');
                        draw(show_num);
                        var tel = $("#tel").val().toLowerCase();
                        // alert('tel:'+tel);
                        var password = $("#password").val().toLowerCase();
                        // alert('password:'+password);
                        // console.log(tel);
                        // alert('passwordssss:'+console.log(tel));
                        // console.log(password);
                        // alert('asdasdasd:'+console.log(password));
                        $.ajax({
                            url:"/tc/login",
                            method:"post",
                            // data:data,
                            data:{"tel":tel,"password":password},
                            dataType:"json",
                            success:function (msg) {
                                if (msg === 1) {
                                    layer.msg("登录成功,msg为:"+msg);
                                    window.location.href = "/teacher/main.jsp";
                                    // window.location.href = "/partent/index.jsp";
                                }else {
                                    layer.msg("登录失败，msg为:"+msg);
                                }
                            },
                            beforeSend:function () {
                                $("#loginBtn").attr('disabled',true)
                            },
                            complete:function () {
                                $("#loginBtn").attr('disabled',false)
                            }
                        })
                    }else{
                        alert('验证码错误！请重新输入！');
                        $("#captcha").val('');
                        draw(show_num);
                        return false;
                    }
                }
                return false;
            });
        })
    })

    function draw(show_num) {
        var canvas_width=$('#canvas').width();
        var canvas_height=$('#canvas').height();
        var canvas = document.getElementById("canvas");//获取到canvas的对象，演员
        var context = canvas.getContext("2d");//获取到canvas画图的环境，演员表演的舞台
        canvas.width = canvas_width;
        canvas.height = canvas_height;
        // var sCode = "A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0";
        var sCode = "1,2,3,4,5,6,7,8,9,0";
        var aCode = sCode.split(",");
        var aLength = aCode.length;//获取到数组的长度

        for (var i = 0; i <= 3; i++) {
            var j = Math.floor(Math.random() * aLength);//获取到随机的索引值
            var deg = Math.random() * 30 * Math.PI / 180;//产生0~30之间的随机弧度
            var txt = aCode[j];//得到随机的一个内容
            show_num[i] = txt.toLowerCase();
            var x = 10 + i * 20;//文字在canvas上的x坐标
            var y = 20 + Math.random() * 8;//文字在canvas上的y坐标
            context.font = "bold 23px 微软雅黑";

            context.translate(x, y);
            context.rotate(deg);

            context.fillStyle = randomColor();
            context.fillText(txt, 0, 0);

            context.rotate(-deg);
            context.translate(-x, -y);
        }
        for (var i = 0; i <= 5; i++) { //验证码上显示线条
            context.strokeStyle = randomColor();
            context.beginPath();
            context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);
            context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);
            context.stroke();
        }
        for (var i = 0; i <= 30; i++) { //验证码上显示小点
            context.strokeStyle = randomColor();
            context.beginPath();
            var x = Math.random() * canvas_width;
            var y = Math.random() * canvas_height;
            context.moveTo(x, y);
            context.lineTo(x + 1, y + 1);
            context.stroke();
        }
    }

    function randomColor() {//得到随机的颜色值
        var r = Math.floor(Math.random() * 256);
        var g = Math.floor(Math.random() * 256);
        var b = Math.floor(Math.random() * 256);
        return "rgb(" + r + "," + g + "," + b + ")";
    }

</script>
</body>
</html>

