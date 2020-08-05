<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.kindergarten.bean.Parents" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../static/layui/css/layui.css"  media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
    <style>
        #cheatFrame{
            margin-top: 5%;
            margin-left: 5%;
            width: 290px;
            height: 720px;
            background: #888888;
            float: left;
        }
        #myinfo{
            width: 100%;
            height: 10%;
            background: #00a2d4;
        }
        #myinfo>span{

            margin-left: 5%;
            font-size: 17px;
        }
        .friend{
            width: 100%;
            height: 20%;
            background: wheat;
        }
        .friend:hover{
            background: #888888;
        }

        #cheating{
            margin-top: 10%;
            width: 600px;
            height: 600px;
            background: #0000FF;
            margin-left: 15%;
            float: left;
        }
        hr{
            height: 5px;
        }
        #MessageFrame{
            height: 60%;
            width: 100%;
            background:#888888;
            overflow: auto;
        }
        #userInfo{
            height: 7%;
            width: 100%;
            background: yellow;
        }
        #userInfo>h2{

            margin-left: 5%;
        }
        .msg{
            border: 0;
            width: 100%;
            height: 77%;
            resize: none;

        }
        #SendMsgFrame{
            width: 100%;
            height: 30%;
            background: aqua;
        }
        #SendMsg,#closeMsg{
            margin-left: 5%;
            float: right;
        }
        .msg-left{
            font-size: 17px;
            margin-left: 3%;
        }
        .msg-right{
            margin-left: 5%;
            font-size: 17px;
        }
    </style>
    <% Parents parents= (Parents) request.getSession().getAttribute("parents"); %>
</head>
<body>
    <div id="cheatFrame">
        <div id="myinfo">
            <img src="../static/img/c1.bmp" style="width: 70px;height: 100%;" alt="">
            <span class="ownname"><%=parents.getParentsName()%></span>(<span class="owntel"><%=parents.getParentsTel()%></span>)
        </div>
        <img src="../static/img/cheat.bmp" style="width:100%;  height:10%;">
        <div id="friendlist">
            <c:if test="${not empty teachers}">
                <C:forEach items="${teachers}" var="i">
                    <div class="friend" onclick="openCheat(this)">
                        <img src="../static/img/c1.bmp" style="width: 70px;  border-radius:50%;" alt="" >
                        <span class="t-name">${i.teacherName}</span>(<span class="t-tel">${i.teacherTel}</span>)
                    </div>

                </C:forEach>
            </c:if>



<%--            <div class="friend">--%>
<%--                <img src="../static/img/c1.bmp" style="width: 70px;  border-radius:50%;" alt="" >--%>
<%--                <span>老师1</span>(<span>13000000000</span>)--%>
<%--            </div>--%>
<%--            <div class="friend">--%>
<%--                <img src="../static/img/c1.bmp" style="width: 70px; border-radius:50%;" alt="" >--%>
<%--                <span>老师1</span>(<span>13000000000</span>)--%>
<%--            </div>--%>
        </div>
    </div>

    <div id="cheating" style="display: none">
        <div id="userInfo">
            <h2><span class="name"></span>(<span class="tel"></span>)</h2>
        </div>
        <div id="MessageFrame">
            <div class="msg-left"></div>
            <div class="msg-right"></div>

        </div>
        <hr>
        <div id="SendMsgFrame">
                <textarea class="msg"></textarea>
            <button class="layui-btn layui-btn-normal" id="SendMsg" onclick="SendData()">发送</button>
            <button class="layui-btn layui-btn-normal" id="closeMsg">关闭</button>

        </div>

    </div>

<script src="../static/layui/layui.all.js" charset="utf-8"></script>
<script  src="../static/X-admin/js/jquery.min.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    var ws;

    function openCheat(node){
        $("#cheating").css("display",'block');
        var tname=$(node).find(".t-name").text();
        var ttel=$(node).find(".t-tel").text();  //老师的手机号
        var owntel=$(".owntel").text(); //自己的手机号
        $(".name").text(tname);
        $(".tel").text(ttel);



        if (!ws) {
            // var user = document.getElementById("name").value;
            // var other = document.getElementById("name").value;
            var sendmsg=$("#data").val();


            try {
                        //服务器地址+自己手机号+对方手机号
                ws = new WebSocket("ws://127.0.0.1:8080/websocket/" + owntel+"/"+ttel);//连接服务器
                ws.onopen = function (event) {
                    console.log("已经与服务器建立了连接...");
                    // alert("登陆成功，可以开始聊天了")
                };

                ws.onmessage = function (event) {
                    console.log("接收到服务器发送的数据..." + event.data);
                    // document.getElementById("info").innerHTML += event.data + "<br>";
                    $(".msg-left").text(event.data+"<br>");

                };
                ws.onclose = function (event) {
                    console.log("已经与服务器断开连接...");
                };
                ws.onerror = function (event) {
                    console.log("WebSocket异常！");
                };
            } catch (ex) {
                alert(ex.message);
            }
            // document.getElementById("login").innerHTML = "退出";
        } else {
            // ws.close();
            ws = null;
        }



    }

    $("#closeMsg").click(function () {
        $("#cheating").css("display",'none');
        $(".msg-right").text("");
        $(".msg-left").text("");
    });
    function SendData() {
        var sendmsg=$(".msg");
        if (sendmsg.val()===""){
            alert("输入的内容不能为空")
        }else{
            $(".msg-right").append($(".ownname").text()+":"+sendmsg.val()+'<br>');
            try {
                ws.send(sendmsg.val());
            } catch (ex) {
                alert(ex.message);
            }
            sendmsg.val("");
        }


    }





</script>

</body>
</html>