<%@ page import="com.kindergarten.bean.Parents" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="x-admin-sm">
    
    <head>
        <meta charset="UTF-8">
        <title>欢迎页面-X-admin2.2</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="stylesheet" href="../static/X-admin/css/font.css">
        <link rel="stylesheet" href="../static/X-admin/css/xadmin.css">
        <script type="text/javascript" src="../static/X-admin/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="../static/X-admin/js/xadmin.js"></script>
        <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
        <!--[if lt IE 9]>
            <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
            <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <%Parents parents= (Parents) request.getSession().getAttribute("parents"); %>
    </head>
    <body>
        <div class="layui-fluid">
            <div class="layui-row">

                    <div class="layui-form-item">
                        <label  class="layui-form-label">
                            手机号</label>
                        <div class="layui-input-inline">
                            <input type="text"  readonly="readonly" autocomplete="off" class="layui-input" value=<%=parents.getParentsTel()%>>
                           </div>
                        <div class="layui-form-mid layui-word-aux">
                            </div></div>
                    <div class="layui-form-item">
                        <label  class="layui-form-label">
                            昵称</label>
                        <div class="layui-input-inline">
                            <input type="text"  readonly="readonly" autocomplete="off" class="layui-input" value=<%=parents.getParentsName()%>></div>
                    </div>
                <div class="layui-form-item">
                    <label  class="layui-form-label">
                       性别</label>
                    <div class="layui-input-inline">
                        <input type="text"  readonly="readonly" autocomplete="off" class="layui-input" value=<%=parents.getParentsSex()%>></div>
                </div>

            </div>
        </div>

    </body>

</html>