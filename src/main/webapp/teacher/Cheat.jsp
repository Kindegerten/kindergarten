<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.kindergarten.bean.Parents" %>
<%@ page import="com.kindergarten.bean.Teachers" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>家长对话</title>
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
            background: black;
            background: url("../static/img/cheatimg.jpg");
            background-size: 100% 100%;
            background-repeat: no-repeat;
            opacity:0.9;
            /*float: left;*/

        }
        #myinfo{
            width: 100%;
            height: 10%;
            /*background: #00a2d4;*/
        }
        #myinfo>span{

            margin-left: 5%;
            font-size: 17px;

        }
        .friend{
            width: 100%;
            height: 20%;
            /*background: wheat;*/
        }
        .friend:hover{
            background: rgba(217,217,217,0.6);
        }

        #cheating{

            margin-top: -200%;
            width: 600px;
            height: 600px;
            background: #ffffff;
            margin-left: 110%;
            float: left;
            border-radius: 50%;

        }
        hr{
            height: 3%;
        }
        #MessageFrame{
            height: 60%;
            width: 100%;
            background:#ffffff;
            overflow: auto;
            background: url("../static/img/cheatimg.jpg");
            opacity:0.6;
        }
        #userInfo{
            height: 7%;
            width: 100%;
            background: #484a4b;
            color: whitesmoke;
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
            /*background: #ffffff;*/
        }
        #SendMsg,#closeMsg{
            margin-left: 5%;
            float: right;
        }
        .msg-left{
            font-size: 17px;
            margin-left: 3%;
            color: black;
        }
        .msg-right{
            margin-right: 5%;
            font-size: 17px;
            color: black;
            text-align: right;
        }
        #friendlist{
            height: 600px;
            overflow-y: auto;
        }

    </style>
    <% Teachers teachers= (Teachers) request.getSession().getAttribute("tblTeachers"); %>
</head>
<body>
<div id="cheatFrame">
    <div id="cheat">
    <div id="myinfo">
        <img src="../static/img/c1.bmp" style="width: 70px;height: 100%;" alt="">
        <span class="ownname"><%=teachers.getTeacherName()%></span>(<span class="owntel"><%=teachers.getTeacherTel()%></span>)
    </div>
    <img src="../static/img/cheat.bmp" style="width:100%;  height:10%;">
    <div id="friendlist">
        <c:if test="${not empty parents}">
            <C:forEach items="${parents}" var="i">
                <div class="friend" onclick="openCheat(this)">
                    <img src="../static/img/c1.bmp" style="width: 70px;  border-radius:50%;" alt="" >
                    <span class="t-name">${i.parentsName}</span>(<span class="t-tel">${i.parentsTel}</span>)
                </div>

            </C:forEach>
        </c:if>

    </div>
    </div>

    <div id="cheating" style="display: none">
        <div id="userInfo">
            <h2><span class="name"></span>(<span class="tel"></span>)</h2>
        </div>
        <div id="MessageFrame" src=>
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
</div>



<script src="../static/layui/layui.all.js" charset="utf-8"></script>
<script  src="../static/X-admin/js/jquery.min.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    Date.prototype.Format = function (fmt) { // author: meizz
        var o = {
            "M+": this.getMonth() + 1, // 月份
            "d+": this.getDate(), // 日
            "h+": this.getHours(), // 小时
            "m+": this.getMinutes(), // 分
            "s+": this.getSeconds(), // 秒
            "q+": Math.floor((this.getMonth() + 3) / 3), // 季度
            "S": this.getMilliseconds() // 毫秒
        };
        if (/(y+)/.test(fmt))
            fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    };



    var ws;
    var i=10000;
    function openCheat(node){
        $("#cheating").css("display",'block');
        var tname=$(node).find(".t-name").text();
        var ttel=$(node).find(".t-tel").text();  //老师的手机号
        var owntel=$(".owntel").text(); //自己的手机号
        $(".name").text(tname);
        $(".tel").text(ttel);
        var ownname=$(".ownname").text(); //自己的名字
        $(".msg-left").text("");
        $(".msg-right").text("");

        if (!ws) {
            // var user = document.getElementById("name").value;
            // var other = document.getElementById("name").value;
            var sendmsg=$("#data").val();


            try {
                //服务器地址+自己手机号+对方手机号
                ws = new WebSocket("ws://120.25.208.32:8080/websocket/" + owntel+"/"+ttel+"/"+ownname);//连接服务器
                ws.onopen = function (event) {
                    console.log("已经与服务器建立了连接...");
                    // alert("登陆成功，可以开始聊天了")
                };

                ws.onmessage = function (event) {
                    console.log("接收到服务器发送的数据..." + event.data);
                    // document.getElementById("info").innerHTML += event.data + "<br>";
                    // $(".msg-left").append(event.data+"<br>");
                    $("#MessageFrame").append("<div id="+i+" class='msg-left'>"+event.data+"<div>");
                    i++;

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
    var mys=5000;
    function SendData() {
        var sendmsg=$(".msg");
        if (sendmsg.val()===""){
            alert("输入的内容不能为空")
        }else{
            var time2 = new Date().Format("yyyy-MM-dd hh:mm:ss");
            // $(".msg-right").append($(".ownname").text()+'&emsp;'+time2+":"+sendmsg.val()+'<br>');
            // $("#MessageFrame").append("<div id="+mys+" class='msg-right'>"+sendmsg.val()+':'+'&emsp;'+time2+'&emsp;'+$(".ownname").text()+"<div>");
            $("#MessageFrame").append("<div id="+mys+" class='msg-right'>"+$(".ownname").text()+'&emsp;'+time2+'&emsp;'+"<div>");
            $("#MessageFrame").append("<div id="+mys+1+" class='msg-right'>"+sendmsg.val()+"<div>");
            mys++;
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