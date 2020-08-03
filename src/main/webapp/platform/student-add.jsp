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
                <label for="studentName" class="layui-form-label">
                    <span class="x-red">*</span>姓名</label>
                <div class="layui-input-inline">
                    <input type="text" id="studentName" name="studentName" required="" lay-verify="nikename"
                           autocomplete="off" class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label for="male" class="layui-form-label">
                    <span class="x-red">*</span>性别</label>
                <div class="layui-input-inline">
                    <input type="radio" id="male" checked="checked" name="studentSex" value="男">男
                    <input type="radio" id="female" name="studentSex" value="女">女
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">班级选择</label>
                <div class="layui-input-inline">
                    <select name="quiz1" id="quiz1" lay-filter="quiz1">
                        <option value="">请选择园区</option>
                        <option value="2" selected="">光明幼儿园</option>
                    </select>
                </div>
                <div class="layui-input-inline">
                    <select name="quiz2" id="quiz2">
                        <option value="">请选择班级</option>
                        <option value="7">小一班</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="test1" class="layui-form-label">
                    <span class="x-red">*</span>生日</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" id="test1" placeholder="yyyy-MM-dd">
                    <%--                            <input type="text" id="healtherAge" name="healtherAge" required="" lay-verify="teacherAge" autocomplete="off" class="layui-input">--%>
                </div>
            </div>
                <div class="layui-form-item" id="addressDiv">
                    <label class="layui-form-label">详细地址</label>
                    <div class="layui-input-inline">
                        <select name="P1" lay-filter="province" id="province">
                            <option></option>
                        </select>
                    </div>
                    <div class="layui-input-inline">
                        <select name="C1" lay-filter="city" id="city">
                            <option></option>
                        </select>
                    </div>
                    <div class="layui-input-inline">
                        <select name="A1" lay-filter="area" id="area">
                            <option></option>
                        </select>
                    </div>
                    <div class="layui-input-inline" id="addressDetail">
                        <input id="address" type="text" name="address" lay-verify="title" autocomplete="off"
                               placeholder="请输入具体地址" class="layui-input" style="width: 120%;">
<%--                        <dl id="addressTip" class="addressDl"></dl>--%>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="male" class="layui-form-label"></label>
                    <button class="layui-btn" lay-filter="add" lay-submit="">增加</button>
                </div>

        </form>
    </div>
</div>
<script>
    //引入另外的js
    layui.config({
        base: '/static/X-admin/js/'//拓展模块的根目录
    }).extend({
        pca: 'pca'
    });

    layui.use(['form', 'layer', 'layedit', 'laydate', 'upload', "jquery", "pca"],
        function () {

            var $ = layui.$
            var pca = layui.pca;
            // var $ = layui.jquery;
            var form = layui.form,
                layer = layui.layer;
            var laydate = layui.laydate;
            //初始化选择值
            pca.init('select[name=P1]', 'select[name=C1]', 'select[name=A1]', '浙江', '杭州', '滨江区');
            //自定义验证规则
            form.verify({
                nikename: function (value) {
                    if (value.length < 2) {
                        return '昵称至少得2个字符啊';
                    }
                },
                // pass: [/(.+){3,12}$/, '密码必须3到12位'],
                // teacherAge: [/^(?:[1-9][0-9]?|1[01][0-9]|120)$/, '年龄输入不合法'],
            });

            //监听提交
            form.on('submit(add)', function (data) {
                var studentName=$("#studentName").val();
                 var studentSex=$('input[name="studentSex"]:checked').val();
                var studentBirth=$("#test1").val();
                 // console.log(studentSex)
                var address = document.getElementById("address").value;
                var province = document.getElementById("province").value;
                var city = document.getElementById("city").value;
                var area = document.getElementById("area").value;
                var studentAdd= province + city + area + address;
                // console.log(studentAdd);
                var kinderId=$("#quiz1").val();
                var classId=$("#quiz2").val();

                // console.log(kinderId+"   f"+classId);
                //发异步，把数据提交给php
                $.ajax({
                    url: "/platformController/insertStudent",
                    type: "post",
                    asnyc: true,//异步
                    dataType: "text",//json,后端返回给前端的数据格式
                    data: {
                        studentName:studentName,
                        studentSex:studentSex,
                        studentBirth:studentBirth,
                        studentAdd:studentAdd,
                        kinderId:kinderId,
                        classId:classId
                    },
                    success: function (msg) {
                        if (msg == "success") {
                            layer.alert("增加成功", {icon: 6},
                                function () {
                                    //关闭当前frame
                                    xadmin.close();
                                    // 可以对父窗口进行刷新
                                    xadmin.father_reload();
                                });
                        } else {
                            layer.alert(msg, {icon: 6},
                            );
                        }
                    }
                });

                return false;
            });
            //幼儿园与班级二级联动
            $.ajax({
                url: "/platformController/findClassesList",
                type: "post",
                dataType: "json",
                success: function (datas) {
                    // datas=datas.menu;

                    if (datas.length > 0) {
                        $("#quiz1").empty();
                        $("#quiz1").append("<option value=''>园区</option>");
                        for (var i = 0; i < datas.length; i++) {
                            var kinder = datas[i];
                            $("#quiz1").append("<option value=" + kinder.kinderId + ">" + kinder.kinderName + "</option>");
                        }
                    } else {
                        $("#quiz1").empty();
                        $("#quiz1").append("<option value=''>园区</option>");
                    }
                    form.render("select");
                }
            });
            form.on('select(quiz1)', function (data) {
                var value = data.value;//一级菜单选择的value值
                $.ajax({
                    url: "/platformController/selectClasses?kinderId=" + value,
                    type: "post",
                    dataType: "json",
                    success: function (datas) {
                        // datas=datas.menu;
                        if (datas.length > 0) {
                            $("#quiz2").empty();
                            $("#quiz2").append("<option value=''>班级</option>");
                            for (var i = 0; i < datas.length; i++) {
                                var kinder = datas[i];
                                $("#quiz2").append("<option value=" + kinder.classId + ">" + kinder.className + "</option>");
                                // console.log("kinder"+kinder.length)
                                // $.each(kinder,function (index,item) {//kinder.classes,kinder.集合里面的字段名
                                //     // console.log()
                                //     $("#quiz2").append("<option value="+item.classId+">"+item.className+"</option>");
                                // })
                            }
                        } else {
                            $("#quiz2").empty();
                            $("#quiz2").append("<option value=''>班级</option>");
                        }
                        form.render("select");
                    }
                });
            })
            //常规用法
            laydate.render({
                elem: '#test1'
            });
        });
</script>

</body>

</html>