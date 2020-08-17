<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!-- 根据浏览器的屏幕大小自适应的展现合适的效果 -->
    <meta name="applicable-device" content="pc,mobile"/>
    <!-- 移动端 浏览器中页面将以原始大小显示，不允许缩放 -->
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <!--自动选择更好的浏览器-->
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <title>穿梭框</title>
    <link href="${pageContext.request.contextPath}/static/layui/css/layui.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/static/X-admin/css/shuttle-box.css" rel="stylesheet" />
</head>
<body>
<%--<div class="layui-form-item">--%>
        <span>请选择角色：</span>
        <select name="roleName" id="roleName"  >
            <option value="1">家长</option>
            <%--                <option value="1" selected="">系统管理</option>--%>
        </select>
<h1 class="frame-btn">配置权限菜单</h1>
<%--</div>--%>


<!--选择可配送区域弹框-->
<div class="frame-wrap freight-frame-wrap" >
    <div class="freight-frame bg-f">
        <div class="title">选择权限</div>
        <div class="cont">
            <div class="box frame_content" >
                <div class="fl frame_left">
                    <div class="caption">可选权限</div>
                    <div class="context">
                        <div id="freight-formwork"></div>
                    </div>
                </div>
                <div class="fl frame_middle">
                    <span class="left_btn"></span>
                    <span class="right_btn"></span>
                </div>
                <div class="fr frame_right">
                    <div class="caption">已选权限</div>
                    <div class="context">
                        <div id="freight-formwork_checked"></div>
                    </div>
                </div>
            </div>
            <div class="btngroup text-center clearfix">
                <input class="confirm" type="button" value="确定"><input class="cancel" type="button" value="取消">
            </div>
        </div>
        <span class="close-frame-btn"></span>
    </div>
</div>

<script src="${pageContext.request.contextPath}/static/X-admin/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/layui/lay/modules/layer.js"></script>
<script src="${pageContext.request.contextPath}/static/X-admin/js/shuttle-box.js"></script>
</body>
</html>
