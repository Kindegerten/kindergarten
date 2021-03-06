<%--
  Created by IntelliJ IDEA.
  User: 瓷甃
  Date: 2020/7/29
  Time: 23:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>安防员后台</title>

    <%
        String path = request.getContextPath();
        String account= (String) request.getSession().getAttribute("account");
    %>

    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="<%=path%>/static/X-admin/css/font.css">
    <link rel="stylesheet" href="<%=path%>/static/X-admin/css/xadmin.css">
    <link rel="stylesheet" href="<%=path%>/static/X-admin/css/theme3944.min.css">
    <script src="<%=path%>/static/X-admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=path%>/static/X-admin/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>
        // 是否开启刷新记忆tab功能
        var is_remember = false;
    </script>
</head>
<body class="index" onload="findInform()">

<%--隐藏--%>
<input type="hidden" id="path" value="<%=path%>">
<input type="hidden" id="account" value="<%=account%>">

<!-- 顶部开始 -->
<div class="container">
    <div class="logo">
        <a href="./index.html">安防员后台</a></div>
    <div class="left_open">
        <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
    </div>
    <ul class="layui-nav left fast-add" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:">+新增</a>
            <dl class="layui-nav-child">
                <!-- 二级菜单 -->
                <dd>
                    <a onclick="xadmin.open('最大化','http://www.baidu.com','','',true)">
                        <i class="iconfont">&#xe6a2;</i>弹出最大化</a></dd>
                <dd>
                    <a onclick="xadmin.open('弹出自动宽高','http://www.baidu.com')">
                        <i class="iconfont">&#xe6a8;</i>弹出自动宽高</a></dd>
                <dd>
                    <a onclick="xadmin.open('弹出指定宽高','http://www.baidu.com',500,300)">
                        <i class="iconfont">&#xe6a8;</i>弹出指定宽高</a></dd>
                <dd>
                    <a onclick="xadmin.add_tab('在tab打开','member-list.html')">
                        <i class="iconfont">&#xe6b8;</i>在tab打开</a></dd>
                <dd>
                    <a onclick="xadmin.add_tab('在tab打开刷新','member-del.html',true)">
                        <i class="iconfont">&#xe6b8;</i>在tab打开刷新</a></dd>
            </dl>
        </li>
    </ul>
    <ul class="layui-nav right " lay-filter="">
        <label class="layui-form-label " style="margin-top: 5px">欢迎您，</label>
        <li class="layui-nav-item">
            <a href="javascript:;">安防员</a>
            <dl class="layui-nav-child">
                <!-- 二级菜单 -->
                <dd>
                    <a onclick="xadmin.open('个人信息','<%=path%>/security/personalPage.jsp')">个人信息</a></dd>
                <dd>
<%--                    <a onclick="xadmin.open('切换帐号','http://www.baidu.com')">切换帐号</a></dd>--%>
<%--                <dd>--%>
                    <a href="<%=path%>/security/securityLogin.jsp">退出</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item to-index">
            <a href="/">前台首页</a></li>
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
                    <i class="iconfont left-nav-li" lay-tips="个人中心">&#xe6b8;</i>
                    <cite>个人中心</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('个人信息','personalPage.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>个人信息</cite></a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li layui-icon" lay-tips="安全中心">&#xe672;</i>
                    <cite>安全中心</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('接送管理','pickup_list.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>接送管理</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('电子围栏','map.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>电子围栏</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('报警信息','alert_list.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>报警信息</cite></a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li layui-icon" lay-tips="直播中心">&#xe652;</i>
                    <cite>直播中心</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('直播管理','monitor_list.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>直播管理</cite></a>
                    </li>
                </ul>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('直播权限管理','')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>直播权限管理</cite></a>
                    </li>
                </ul>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('视频管理','monitor_video.jsp')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>视频管理</cite></a>
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
                <i class="layui-icon">&#xe68e;</i>我的桌面</li></ul>
        <div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
            <dl>
                <dd data-type="this">关闭当前</dd>
                <dd data-type="other">关闭其它</dd>
                <dd data-type="all">关闭全部</dd></dl>
        </div>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='home_page.html' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
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
