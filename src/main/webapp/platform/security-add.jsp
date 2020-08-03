<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="x-admin-sm">
    
    <head>
        <meta charset="UTF-8">
        <title>欢迎页面-X-admin2.2</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="stylesheet" href="/static/X-admin/css/font.css">
        <link rel="stylesheet" href="/static/X-admin/css/xadmin.css">
        <script type="text/javascript" src="/static/X-admin/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="/static/X-admin/js/xadmin.js"></script>
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
                        <label for="securityPhone" class="layui-form-label">
                            <span class="x-red">*</span>手机号</label>
                        <div class="layui-input-inline">
                            <input type="text" id="securityPhone" name="securityPhone" required="" lay-verify="required|phone" autocomplete="off" class="layui-input"></div>
                        <div class="layui-form-mid layui-word-aux">
                            <span class="x-red">*</span>将会成为您唯一的登入名</div>
                    </div>
<%--                    <div class="layui-form-item">--%>
<%--                        <label for="adminEmail" class="layui-form-label">--%>
<%--                            <span class="x-red">*</span>邮箱</label>--%>
<%--                        <div class="layui-input-inline">--%>
<%--                            <input type="text" id="adminEmail" name="adminEmail" required="" lay-verify="email" autocomplete="off" class="layui-input"></div>--%>
<%--                       &lt;%&ndash; <div class="layui-form-mid layui-word-aux">--%>
<%--                            <span class="x-red">*</span>将会成为您唯一的登入名</div>&ndash;%&gt;--%>
<%--                    </div>--%>
                    <div class="layui-form-item">
                        <label for="securityName" class="layui-form-label">
                            <span class="x-red">*</span>昵称</label>
                        <div class="layui-input-inline">
                            <input type="text" id="securityName" name="securityName" required="" lay-verify="nikename" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="securityPwd" class="layui-form-label">
                            <span class="x-red">*</span>密码</label>
                        <div class="layui-input-inline">
                            <input type="password" id="securityPwd" name="securityPwd" required="" lay-verify="pass" autocomplete="off" class="layui-input"></div>
                        <div class="layui-form-mid layui-word-aux">3到16个字符</div></div>
                    <div class="layui-form-item">
                        <label for="male" class="layui-form-label">
                            <span class="x-red">*</span>性别</label>
                        <div class="layui-input-inline">
                            <input type="radio" id="male" checked="checked" name="securitySex" value="男">男
                            <input type="radio" id="female" name="securitySex" value="女">女
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="securityAge" class="layui-form-label">
                            <span class="x-red">*</span>年龄</label>
                        <div class="layui-input-inline">
                            <input type="text" id="securityAge" name="securityAge" required="" lay-verify="teacherAge" autocomplete="off" class="layui-input"></div>
                        <div class="layui-form-mid layui-word-aux"></div></div>
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
                        <button class="layui-btn" lay-filter="add" lay-submit="">增加</button></div>
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
                    nikename: function(value) {
                        if (value.length < 3) {
                            return '昵称至少得3个字符啊';
                        }
                    },
                    pass: [/(.+){3,12}$/, '密码必须3到12位'],
                teacherAge: [/^(?:[1-9][0-9]?|1[01][0-9]|120)$/, '年龄输入不合法'],
                });

                //监听提交
                form.on('submit(add)',function(data) {
                    // console.log(data.field);
                    var securityName=$("#securityName").val();
                    var securitySex=$('input[name="securitySex"]:checked').val();
                    var securityAge=$("#securityAge").val();
                    // console.log(studentSex)
                    var address = document.getElementById("address").value;
                    var province = document.getElementById("province").value;
                    var city = document.getElementById("city").value;
                    var area = document.getElementById("area").value;
                    var securityAdd= province + city + area + address;
                    var securityPhone=$("#securityPhone").val();
                    var securityPwd=$("#securityPwd").val();
                    //发异步，把数据提交给php
                    $.ajax({
                        url:"/platformController/insertSecurity",
                        type:"post",
                        asnyc:true,//异步
                        dataType:"text",//json,后端返回给前端的数据格式
                        data:{
                            securityName:securityName,
                            securitySex:securitySex,
                            securityAge:securityAge,
                            securityAdd:securityAdd,
                            securityPhone:securityPhone,
                            securityPwd:securityPwd,
                        },
                        success:function (msg) {
                            if(msg=="success"){
                                layer.alert("增加成功", { icon: 6 },
                                    function() {
                                        //关闭当前frame
                                        xadmin.close();
                                        // 可以对父窗口进行刷新
                                        xadmin.father_reload();
                                    });
                            }else {
                                layer.alert(msg, { icon: 6 },
                                   );
                            }
                        }
                    });

                    return false;
                });

            });
        </script>

    </body>

</html>