<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="/static/X-admin/css/font.css">
    <link rel="stylesheet" href="/static/X-admin/css/xadmin.css">
    <link rel="stylesheet" type="text/css" href="/static/layui/css/layui.css"/>
    <link rel="stylesheet" type="text/css" href="/static/X-admin/css/select.css"/>
    <script type="text/javascript" src="/static/X-admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/static/X-admin/js/xadmin.js"></script>
    <%--        <script src="/static/X-admin/js/select.js" type="text/javascript" charset="utf-8"></script>--%>
    <%--        <script src="/static/X-admin/js/pca.js" type="text/javascript" charset="utf-8"></script>--%>
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
                <label class="layui-form-label">班级选择</label>
                <div class="layui-input-inline">
                    <select name="kinderName" id="kinderName" lay-filter="kinderName" lay-verify="required">
                        <option value="">请选择园区</option>
                        <option value="2" selected="">光明幼儿园</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="kinderAccount" class="layui-form-label">
                    <span class="x-red">*</span>账号</label>
                <div class="layui-input-inline">
                    <input type="text" id="kinderAccount" name="kinderAccount" required="" lay-verify="nikename"
                           autocomplete="off" class="layui-input"></div>
            </div>
                <div class="layui-form-item">
                    <label for="kinderAccount" class="layui-form-label"></label>
                    <button class="layui-btn" lay-filter="add" lay-submit="">增加</button>
                </div>
        </form>
    </div>
</div>
<script>


    layui.use(['form', 'layer', 'layedit', 'laydate', 'upload', "jquery"],
        function () {
            var $ = layui.$
            // var $ = layui.jquery;
            var form = layui.form,
                layer = layui.layer;
            var laydate = layui.laydate;

            //自定义验证规则
            form.verify({
                nikename: function (value) {
                    if (value.length < 2) {
                        return '账号至少得2个字符啊';
                    }
                },
                // pass: [/(.+){3,12}$/, '密码必须3到12位'],
                // teacherAge: [/^(?:[1-9][0-9]?|1[01][0-9]|120)$/, '年龄输入不合法'],
            });

            //监听提交
            form.on('submit(add)', function (data) {
                var kinderId=$("#hid").val();
                console.log("kinderId"+kinderId)
                 // console.log(data.field);
                //发异步，把数据提交给php
                // $.ajax({
                //     url: "/kinderController/updateKinder",
                //     type: "post",
                //     asnyc: true,//异步
                //     dataType: "text",//json,后端返回给前端的数据格式
                //     data:data.field,
                //     success: function (msg) {
                //         if (msg == "success") {
                //             layer.alert("增加成功", {icon: 6},
                //                 function () {
                //                     //关闭当前frame
                //                     xadmin.close();
                //                     // 可以对父窗口进行刷新
                //                     xadmin.father_reload();
                //                 });
                //         } else {
                //             layer.alert(msg, {icon: 6},
                //             );
                //         }
                //     }
                // });
                // return false;
            });
            //幼儿园与班级二级联动
            $.ajax({
                url: "/platformController/findClassesList",
                type: "post",
                dataType: "json",
                success: function (datas) {
                    // datas=datas.menu;

                    if (datas.length > 0) {
                        $("#kinderName").empty();
                        $("#kinderName").append("<option value=''>园区</option>");
                        for (var i = 0; i < datas.length; i++) {
                            var kinder = datas[i];
                            $("#kinderName").append("<option value=" + kinder.kinderName + ">" + kinder.kinderName + "</option>");
                        }
                    } else {
                        $("#kinderName").empty();
                        $("#kinderName").append("<option value=''>园区</option>");
                    }
                    form.render("select");
                }
            });
        });
</script>

</body>

</html>