<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/X-admin/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/X-admin/css/xadmin.css">
    <script src="${pageContext.request.contextPath}/static/X-admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/X-admin/js/xadmin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.all.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        a { color:red; transition:0.5s; }
        a:hover { color:blue; }
    </style>
</head>
<body>

<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-card-body ">
            <div class="layui-carousel" id="test1" lay-filter="test1" style="margin:auto;width: auto;height: auto; ">
                <div carousel-item="" style="margin: auto">
                    <div style="background-size: cover;-moz-background-size: cover;width: 100%;height:100%;background: url('${pageContext.request.contextPath}/static/img/mainbg.jpg') no-repeat center;"></div>
                    <div style="background-size: cover;-moz-background-size: cover;width: 100%;height:100%;background: url('${pageContext.request.contextPath}/static/img/chidren2.bmp') no-repeat center;"></div>
                    <div style="background-size: cover;-moz-background-size: cover;width: 100%;height:100%;background: url('${pageContext.request.contextPath}/static/img/chidren5.bmp') no-repeat center;"></div>

                </div>
            </div>
            <div class="layui-row">
                <div class="layui-col-xs6">
                    <div class="grid-demo grid-demo-bg1">
                        <h1>园所动态  &emsp; NEWS</h1>
                        <hr class="layui-bg-orange">
                        <a><h3>园所新闻 &emsp;NEWS</h3></a>
                        <a><h3>园所新闻 &emsp;NEWS</h3></a>
                        <a><h3>园所新闻 &emsp;NEWS</h3></a>
                    </div>
                </div>
                <div class="layui-col-xs6">
                    <div class="grid-demo grid-demo-bg1">
                        <h1>平台咨询  &emsp; INFO</h1>
                        <hr class="layui-bg-orange">
                        <a><h3>平台动态 &emsp;NEWS</h3></a>
                        <a><h3>平台动态 &emsp;NEWS</h3></a>
                        <a><h3>平台新闻 &emsp;NEWS</h3></a>
                    </div>
                </div>
                <div class="layui-col-xs6">
                    <div class="grid-demo">
                        <h1>园所视频 &emsp;VIDEO</h1>
                        <hr class="layui-bg-orange">
                        <h3><a onclick="xadmin.open('宝宝快乐玩耍','https://haokan.baidu.com/v?vid=10543688707153388516&pd=bjh&fr=bjhauthor&type=video',500,600)">宝宝快乐玩耍 Video</a></h3>
<%--                        <video autoplay href="https://www.baidu.com"></video>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    layui.use(['carousel', 'form'], function () {
        var carousel = layui.carousel
            , form = layui.form;

        //常规轮播
        carousel.render({
            elem: '#test1'
            , arrow: 'always'
            , width: '100%'
            , height: '400px'
        });
    });

</script>
</html>