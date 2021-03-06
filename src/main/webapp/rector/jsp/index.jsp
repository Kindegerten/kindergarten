<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<!doctype html>
<html class="x-admin-sm" lang="en">
<%
    String path = request.getContextPath();
    System.out.println("path:" + path);
%>
<head>
    <meta charset="UTF-8">
    <title>园长</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/X-admin/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/X-admin/css/xadmin.css">
    <!-- <link rel="stylesheet" href="./css/theme5.css"> -->
    <script src="${pageContext.request.contextPath}/static/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/static/X-admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/X-admin/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>
        // 是否开启刷新记忆tab功能
        // var is_remember = false;
    </script>
</head>
<body class="index" onload="findInform()">
<%--<input  value="${healther.healtherName}">--%>
<!-- 顶部开始 -->
<div class="container">
    <input type="hidden" id="path" value="${pageContext.request.contextPath}">
    <div class="logo">
        <a href="./index.jsp">园长管理端</a></div>
    <div class="left_open">
        <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
    </div>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">欢迎：园长<b style="color:skyblue">${rector.rectorName}</b></a>
            <dl class="layui-nav-child">
                <!-- 二级菜单 -->
                <dd>
                    <a onclick="xadmin.open('个人信息','${pageContext.request.contextPath}/rector/jsp/myinfo.jsp',500,600)">个人信息</a></dd>
                <dd>
<%--                    <a onclick="xadmin.open('切换帐号','http://www.baidu.com')">切换帐号</a></dd>--%>
                <dd>
                    <a href="login.jsp">退出</a></dd>
                </dl>
        </li>
        <li class="layui-nav-item to-index">
            <a href="${pageContext.request.contextPath}/rector/jsp/login.jsp">返回登录</a></li>
    </ul>
</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="园长管理">&#xe6b8;</i>
                    <cite>园长管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('园所审批','${pageContext.request.contextPath}/rector/jsp/kinderCheck.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>园所审批</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('教职工管理','${pageContext.request.contextPath}/rector/jsp/teacher-list.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>教职工管理</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('教师考勤','${pageContext.request.contextPath}/rector/jsp/attendance-list.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>教师考勤</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('幼儿管理','${pageContext.request.contextPath}/rector/jsp/baby-list.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>幼儿管理</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('家长管理','${pageContext.request.contextPath}/rector/jsp/parent-list.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>家长管理</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('班级管理','${pageContext.request.contextPath}/rector/jsp/class-list.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>班级管理</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('班级成员管理','${pageContext.request.contextPath}/rector/jsp/classMember-list.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>班级成员管理</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('课程管理','${pageContext.request.contextPath}/rector/jsp/course-list.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>课程管理</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('消息通知','${pageContext.request.contextPath}/rector/jsp/messageSend.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>消息通知</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('校园公告','${pageContext.request.contextPath}/rector/jsp/campusNews-list.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>校园公告</cite></a>
                    </li>

                    <li>
                        <a onclick="xadmin.add_tab('学生缴费','${pageContext.request.contextPath}/rector/jsp/bill.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>学生缴费</cite></a>
                    </li>

                </ul>
            </li>
        </ul>
    </div>
</div>
<!-- <div class="x-slide_left"></div> -->
<!-- 左侧菜单结束 -->
<!-- 右侧主体开始 -->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
        <ul class="layui-tab-title">
            <li class="home">
                <i class="layui-icon">&#xe68e;</i>我的桌面
            </li>
        </ul>
        <div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
            <dl>
                <dd data-type="this">关闭当前</dd>
                <dd data-type="other">关闭其它</dd>
                <dd data-type="all">关闭全部</dd>
            </dl>
        </div>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='${pageContext.request.contextPath}/rector/jsp/welcome.jsp' frameborder="0"
                        scrolling="yes" class="x-iframe"></iframe>
            </div>
        </div>
        <div id="tab_show"></div>
    </div>
</div>
<div class="page-content-bg"></div>
<style id="theme_style"></style>
<!-- 右侧主体结束 -->
<!-- 中部结束 -->

</body>
<script>
    function findInform() {
        var kinderId = $("#kinderId").val();
        console.log(kinderId);
        $.ajax({
            url: "/InformControl/findInform",
            async: true,
            type: "post",
            data: "kinderId", kinderId,
            datatype: "text",
            success: function (msg) {
                layui.use([ 'layer'], function () {
                    var layer = layui.layer;
                    layer.open({
                        title: '通知',
                        type: 1,
                        area: ['300px', '200px'],
                        content: msg,
                    });
                });
            }
        });
    }
</script>
</html>