<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html class="x-admin-sm">
    
    <head>
        <meta charset="UTF-8">
        <title>欢迎页面-X-admin2.2</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/X-admin/css/font.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/X-admin/css/xadmin.css">
        <script src="${pageContext.request.contextPath}/static/X-admin/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/X-admin/js/xadmin.js"></script>
        <script src="${pageContext.request.contextPath}/static/jquery-3.5.1.js"></script>
        <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
        <!--[if lt IE 9]>
            <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
            <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <div class="layui-fluid">
            <div class="layui-row">
                <form class="layui-form">
                    <div class="layui-form-item">
                        <label for="BillName" class="layui-form-label">
                            <span class="x-red">*</span>缴费单名称</label>
                        <div class="layui-input-inline">
                            <input type="text" id="BillName" name="BillName" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>

                            </div>
                    <div class="layui-form-item">
                        <label for="BillMoney" class="layui-form-label">
                            <span class="x-red">*</span>缴费金额(元)</label>
                        <div class="layui-input-inline">
                            <input type="text" id="BillMoney" name="BillMoney" required="" lay-verify="required" autocomplete="off" class="layui-input" oninput = "value=value.replace(/[^\d]/g,'')"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="BillDirector" class="layui-form-label">
                            <span class="x-red">*</span>缴费单说明</label>
                        <div class="layui-input-inline">
                            <input type="text" id="BillDirector" name="BillDirector" required="" lay-verify="required" autocomplete="off" class="layui-input"></div>
                        </div>
                    <div class="layui-form-item">
                        <label for="L_repass" class="layui-form-label">
                            <span class="x-red">*</span>缴费班级</label>
                        <div class="layui-input-inline" id="L_repass">
                            <select name="class" lay-filter="class" id="class">
                                <option value=""></option>
<%--                                <option value="0">写作</option>--%>
<%--                                <option value="1" selected="">阅读</option>--%>
<%--                                <option value="2">游戏</option>--%>
<%--                                <option value="3">音乐</option>--%>
<%--                                <option value="4">旅行</option>--%>
                            </select>
                        </div>
<%--&lt;%&ndash;                    <div class="layui-form-item">&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <br><br>&ndash;%&gt;--%>
<%--                        <button type="submit" id="add" class="layui-btn layui-btn-lg" lay-filter="add" lay-submit="">增加</button></div>--%>
                        <div class="layui-form-item">
                            <label for="L_repass" class="layui-form-label"></label>
                            <button class="layui-btn" lay-filter="add" lay-submit="">增加</button></div>
                </form>
            </div>
        </div>
        <script>
            $.ajax({
                url: "/RectorControl/FindClass",
                type: "post",
                async: true,
                data:{},
                dataType: "json",
                success: function (msg) {
                    console.log(msg);
                    for (var i=0;i<msg.length;i++){
                        $("#class").append(new Option(msg[i].className,msg[i].classId));
                    }

                    layui.form.render("select");

                },
                error: function () {
                    alert("网络繁忙！");
                },
            });


            layui.use(['form', 'layer','jquery'],
            function() {
                $ = layui.jquery;
                var form = layui.form,
                layer = layui.layer;

                //监听提交
                form.on('submit(add)',
                    function(data) {
                        console.log(data);
                        //发异步，把数据提交给php
                        if ($("#class option:selected").val()===""){
                            layer.alert("请选择班级", {icon: 3});
                        }else {
                            $.ajax({
                                url: "/RectorControl/InsertBill",
                                type: "post",
                                async: true,
                                data:{"billName":data.field.BillName,"billMoney":data.field.BillMoney,"billDirector":data.field.BillDirector,"billClassId":$("#class option:selected").val(),"billClassName":$("#class option:selected").text()},
                                dataType: "text",
                                success: function (msg) {
                                    if (msg==="success"){
                                        layer.alert("增加成功", {icon: 6},
                                            function() {
                                                //关闭当前frame
                                                xadmin.close();

                                                // 可以对父窗口进行刷新
                                                xadmin.father_reload();
                                            });
                                    }else {
                                        layer.alert("增加失败", {icon: 2});
                                        xadmin.close();
                                    }
                                },
                                error: function () {
                                    alert("网络繁忙！");
                                },
                            });

                        }

                        return false;
                    });
            });

            </script>

    </body>

</html>