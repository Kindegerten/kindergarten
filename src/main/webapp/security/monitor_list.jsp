<%--
  Created by IntelliJ IDEA.
  User: 瓷甃
  Date: 2020/8/13
  Time: 16:34
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
            height: 312,
            url: '/sc/getMonitor',
            page: false,
            cols: [[
                {field: 'monitorId', title: '监控编号'},
                {field: 'monitorName', title: '监控位置'},
                {field: 'monitorImgUrl', title: '监控图片', templet: '#img'},
                // {field: 'monitorImgUrl', title: '监控图片', templet: '<div><img src="{{ d.monitorImgUrl }}" style="width:30px; height:30px;"></div>'},
                {field: 'monitorMvUrl', title: '操作', templet: '#vdo'}
            ]]
        })
    });
</script>

<script type="text/html" id="img">
    <div><img src="{{ d.monitorImgUrl }}" style="width: 30px; height: 30px;"></div>
</script>

<script type="text/html" id="vdo">
    <%--    <div class="videoContainer">--%>
    <%--    <video id="videoPlayer" ontimeupdate="progressUpdate()">--%>
    <%--        <source src="{{ d.monitorMvUrl }}" type="audio/mp4"/>--%>
    <%--    </video>--%>
    <%--    </div>--%>
    <div>
        <button value="{{ d.monitorMvUrl }}" class="layui-btn" onclick="openVideo(this)" style="width: 60px; height: 30px;">播放
        </button>
    </div>
</script>

<script>
    function openVideo(item) {
        layer.open({
            type: 2,
            title: false,
            skin: 'layui-layer-rim',
            closeBtn: 1, //不显示关闭按钮
            area: ['630px', '360px'],
            shade: 0.7,
            content:item.value,
            success: function(layero){
                console.log(layero)
                //处理layer层中video播放器全屏样式问题
                setTimeout(function() {
                    $(layero).removeClass('layer-anim');
                }, 0);
            }
        });
    }
</script>

</body>
</html>