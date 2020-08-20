<%--
  Created by IntelliJ IDEA.
  User: 瓷甃
  Date: 2020/8/14
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <%
        String path = request.getContextPath();
        String account = (String) request.getSession().getAttribute("account");
    %>

    <link rel="stylesheet" href="/static/layui/css/layui.css">
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<input type="hidden" id="account" value="<%=account%>">
<table id="mytable" lay-filter="test"></table>
<script src="/static/layui/layui.all.js"></script>
<script>
    layui.use(['layer', 'table'], function () {
        var layer = layui.layer;
        var table = layui.table;

        table.render({
            elem: '#mytable',
            height: 490,
            limit:10,
            url: '/sc/getMonitorVideo',
            page: true,
            request: {
            pageName: 'curPage' //页码的参数名称，默认：page
                ,limitName: 'limit' //每页数据量的参数名，默认：limit
        },
            cols: [[
                {field: 'videoId', title: '视频编号'},
                {field: 'videoName', title: '视频名称'},
                {field: 'monitorLocation',title: '监控位置'},
                {field: 'videoDate',title: '视频日期'},
                {field: 'videoUrl', title: '操作', templet: '#vdo'}
            ]]
        })
    });
</script>


<script type="text/html" id="vdo">
    <div>
        <button value="{{ d.videoUrl }}" class="layui-btn" onclick="openVideo(this)" style="width: 80px; height: 30px;">播放视频
        </button>
    </div>
</script>

<script>
    function openVideo(item) {
        var layer = layui.layer;
        var $=layui.jquery;
        console.log(item.value);
        layer.open({
            type: 2,
            title: false,
            skin: 'layui-layer-rim',
            closeBtn: 1, //不显示关闭按钮
            area: ['630px', '360px'],
            shade: 0.7,
            content:item.value,
            success: function(layero){
                console.log(layero);
                // 处理layer层中video播放器全屏样式问题
                setTimeout(function() {
                    $(layero).removeClass('layer-anim');
                }, 0);
            }
        });
    }
</script>

</body>
</html>