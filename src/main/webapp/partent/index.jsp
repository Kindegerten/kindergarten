<%@ page import="com.kindergarten.bean.Parents" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>智慧幼儿园家长端</title>
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <meta http-equiv="Cache-Control" content="no-siteapp" />
        <link rel="stylesheet" href="../static/X-admin/css/font.css">
        <link rel="stylesheet" href="../static/X-admin/css/xadmin.css">
        <!-- <link rel="stylesheet" href="./css/theme5.css"> -->
        <script src="../static/X-admin/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="../static/X-admin/js/xadmin.js"></script>
        <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
        <!--[if lt IE 9]>
          <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
          <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <%Parents parents= (Parents) request.getSession().getAttribute("parents"); %>
    </head>
    <body class="index" onload="findInform()">
        <!-- 顶部开始 -->
        <div class="container">
            <div class="logo">
                <a href="./index.html">欢迎你:<%=parents.getParentsName()%></a>
                <a>宝宝姓名:<%=request.getSession().getAttribute("studentName")%></a>
            </div>

            <div class="left_open">
                <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
            </div>

            <ul class="layui-nav left fast-add" lay-filter="">
                <li class="layui-nav-item">
                </li>


            </ul>
            <ul class="layui-nav right" lay-filter="">

                <li class="layui-nav-item">
                    <a href="javascript:;">个人中心</a>
                    <dl class="layui-nav-child">
                        <!-- 二级菜单 -->
                        <dd>
                            <a onclick="xadmin.open('个人信息','myinfo.jsp')">个人信息</a></dd>
                        <dd>
                            <a href="login.jsp" >切换帐号</a></dd>
<%--                        <dd>--%>
<%--                            <a href="./login.html">退出</a></dd>--%>
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
                            <i class="iconfont left-nav-li" lay-tips="会员管理">&#xe6b8;</i>
                            <cite>宝宝资讯</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('体检信息查看','babyhealth.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>幼儿保健</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('宝宝膳食','/pt/searchmeal')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>宝宝膳食</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('亲子阅读','/pt/parentRead')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>亲子阅读</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('家校联系','/pt/Cheat')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>家校联系</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('宝宝考勤','attendance.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>宝宝考勤</cite></a>
                            </li>



<%--                            <li>--%>
<%--                                <a onclick="xadmin.add_tab('宝宝作业','homework.html')">--%>
<%--                                    <i class="iconfont">&#xe6a7;</i>--%>
<%--                                    <cite>宝宝作业</cite></a>--%>
<%--                            </li>--%>
<%--                            <li>--%>
<%--                                <a onclick="xadmin.add_tab('往期作业','historyhomework.html')">--%>
<%--                                    <i class="iconfont">&#xe6a7;</i>--%>
<%--                                    <cite>往期作业</cite></a>--%>
<%--                            </li>--%>
                            <li>
                                <a onclick="xadmin.add_tab('安全教育','SafeVideoEdu.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>安全教育</cite></a>
                            </li>
<%--                            <li>--%>
<%--                                <a href="javascript:;">--%>
<%--                                    <i class="iconfont">&#xe70b;</i>--%>
<%--                                    <cite>会员管理</cite>--%>
<%--                                    <i class="iconfont nav_right">&#xe697;</i></a>--%>
<%--                                <ul class="sub-menu">--%>
<%--                                    <li>--%>
<%--                                        <a onclick="xadmin.add_tab('会员删除','member-del.html')">--%>
<%--                                            <i class="iconfont">&#xe6a7;</i>--%>
<%--                                            <cite>会员删除</cite></a>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <a onclick="xadmin.add_tab('等级管理','member-list1.html')">--%>
<%--                                            <i class="iconfont">&#xe6a7;</i>--%>
<%--                                            <cite>等级管理</cite></a>--%>
<%--                                    </li>--%>
<%--                                </ul>--%>
<%--                            </li>--%>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="作业中心">&#xe6ce;</i>
                            <cite>作业中心</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('宝宝作业','homework.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>今日作业</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('往期作业','historyhomework.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>往期作业</cite></a>
                            </li>
                        </ul>
                    </li>


                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="个人中心">&#xe6ce;</i>
                            <cite>个人中心</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('费用缴交','updatePwd.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>修改密码</cite></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="缴费平台">&#xe6ce;</i>
                            <cite>缴费平台</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('费用缴交','mybill.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>费用缴交</cite></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="系统统计">&#xe6ce;</i>
                            <cite>直播中心</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('校园直播','onlineVideo.jsp')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>校园直播</cite></a>
                            </li>
                        </ul>
                    </li>


                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="公告面板">&#xe6ce;</i>
                            <cite>公告面板</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('校园公告','schoolinfo-list.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>校园公告</cite></a>
                            </li>
                        </ul>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('平台资讯','platforminfo-list.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>平台资讯</cite></a>
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
                        <iframe src='../partent/welcome.html' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
                    </div>
                </div>
                <div id="tab_show"></div>
            </div>
        </div>
        <div class="page-content-bg"></div>
        <style id="theme_style"></style>
        <!-- 右侧主体结束 -->
        <!-- 中部结束 -->
        <script>
            // 是否开启刷新记忆tab功能
            var is_remember = false;
        </script>
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