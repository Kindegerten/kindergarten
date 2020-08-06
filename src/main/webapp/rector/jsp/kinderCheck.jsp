<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
<%String path = request.getContextPath();%>
<head>
    <meta charset="UTF-8">
    <title>个人信息</title>
    <meta name="renderer" content="webkit">
    <%--    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">--%>
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/X-admin/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/X-admin/css/xadmin.css">
    <script src="${pageContext.request.contextPath}/static/X-admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/X-admin/js/xadmin.js"></script>
    <script src="${pageContext.request.contextPath}/static/jquery-3.5.1.js"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<input type="hidden" id="path" value=<%=path%>>
<%--//修改个人信息的div--%>
<div  class="layui-fluid" id="updateDiv">
    <div class="layui-row">
        <form class="layui-form" action="" method="post">
            <h1>园所资格审批</h1>
            <div class="layui-form-item">
                <label class="layui-form-label">幼儿园名称</label>
                <div hidden class="layui-input-inline">
                    <input hidden  type="text" id="kinderName" name="kinderName" required lay-verify="kinderName"
                            autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">法人</label>
                <div class="layui-input-inline">
                    <input type="text"  id="kinderLp" name="kinderLp" required lay-verify="required"
                            autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
<%--            <div class="layui-form-item">--%>
<%--                <label class="layui-form-label">法人身份证</label>--%>
<%--                <div class="layui-input-inline">--%>
<%--                    <input type="text" id="kinderLpid" name="kinderLpid" required lay-verify="required"--%>
<%--                            autocomplete="off" class="layui-input">--%>
<%--                </div>--%>
<%--            </div>--%>
            <div class="layui-form-item">
                <label class="layui-form-label">法人身份证</label>
                <div class="layui-input-block">
                    <input type="text" name="kinderLpid" lay-verify="identity" required placeholder="" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">地址</label>
                <div class="layui-input-inline">
                    <input type="text" id="kinderLpadd" name="kinderLpadd" required lay-verify="required"
                            autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">联系电话</label>
                <div class="layui-input-inline">
                    <input type="tel" id="kinderLptel" name="kinderLptel" lay-verify="required|phone"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">办学许可证</label>
                <div class="layui-input-inline">
                    <input type="text" id="schoolPermit" name="schoolPermit" lay-verify="schoolPermit"
                           autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">卫生许可证</label>
                <div class="layui-input-inline">
                    <input type="text" id="healthPermit" name="healthPermit" lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">消防许可证</label>
                <div class="layui-input-inline">
                    <input type="text" id="firePermit" name="firePermit" lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">组织代码证</label>
                <div class="layui-input-inline">
                    <input type="text" id="groupPermit" name="groupPermit" lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">税务登记证</label>
                <div class="layui-input-inline">
                    <input type="text" id="registrationPermit" name="registrationPermit" lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="updateData">申请审批</button>
                    <button type="reset" class="layui-btn layui-btn-primary">取消</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form,
            layer = layui.layer,
            layedit = layui.layedit,
            laydate = layui.laydate;
        //自定义验证规则
        form.verify({
            kinderName: function(value){
                if(value.length===0){
                    return '幼儿园名称不能为空哦';
                }
            }
            ,schoolPermit: [
                /^[A-Z]{2}[0-9]{13}$/
                ,'办学许可证号以2个大写字母开头，后面13位正整数'
            ]
        });
        //弹出层表单操作，主要是提交
        form.on('submit(updateData)', function (data) {
                var newData = {
                    "kinderName": data.field.kinderName,
                    "kinderLp": data.field.kinderLp,
                    "kinderLpid": data.field.kinderLpid,
                    "kinderLpadd": data.field.kinderLpadd,
                    "kinderLptel": data.field.kinderLptel,
                    "schoolPermit": data.field.schoolPermit,
                    "healthPermit": data.field.healthPermit,
                    "firePermit": data.field.firePermit,
                    "groupPermit": data.field.groupPermit,
                    "registrationPermit": data.field.registrationPermit,
                };
            console.log(newData);
            $.ajax({
                url: "/RectorControl/addKinder",
                async: true,
                type: "POST",
                data: {"value": JSON.stringify(newData)},
                dataType: "text",
                success: function (msg) {
                    if (msg === "success") {
                        layer.msg('提交成功!刷新浏览器', {icon: 1, time: 5000})
                        parent.location.reload();
                    } else {
                        layer.msg('提交失败!', {icon: 2, time: 6000});
                    }
                },
                error: function () {
                    layer.msg('网络错误!', {icon: 2, time: 1000});
                }
            });

            return false;
        });
    });
</script>
</html>
