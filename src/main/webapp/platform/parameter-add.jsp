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
                        <label for="parameterText" class="layui-form-label">
                        <span class="x-red">*</span>参数名称</label>
                        <div class="layui-input-inline">
                            <input type="text" name="parameterText" lay-verify="title"  id="parameterText" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="parameterType" class="layui-form-label">
                        <span class="x-red">*</span>参数类型</label>
                        <div class="layui-input-inline">
                            <select name="parameterType" id="parameterType"  lay-verify="required">
                                <option value="">参数类型</option>
                                <%--                <option value="1" selected="">系统管理</option>--%>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="parameterValue" class="layui-form-label">
                        <span class="x-red">*</span>参数值</label>
                        <div class="layui-input-inline">
                            <input type="text" name="parameterValue" id="parameterValue" lay-verify="orderId"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="parameterValue" class="layui-form-label"></label>
                        <button class="layui-btn" lay-filter="add" lay-submit="">增加</button></div>
                </form>
            </div>
        </div>
        <script>
            layui.use(['form', 'layer','jquery'],
            function() {
                $ = layui.jquery;
                var form = layui.form,
                layer = layui.layer;

                //自定义验证规则
                form.verify({
                    title: function(value){
                        if(value.length < 2){
                            return '标题至少得2个字符啊';
                        }
                    }
                    ,orderId: [
                        /^\+?[1-9][0-9]*$/
                        ,'输入不合法'
                    ]
                    ,content: function(value){
                        layedit.sync(editIndex);
                    }
                });
                //查询一级菜单
                $.ajax({
                    url: "/platformController/selectParameterType",
                    type: "post",
                    dataType: "json",
                    success: function (datas) {
                        // datas=datas.menu;
                        // console.log("datas.menu"+datas.menu)
                        if (datas.length > 0) {
                            $("#parameterType").empty();
                            $("#parameterType").append("<option value=''>参数类型</option>");
                            for (var i = 0; i < datas.length; i++) {
                                var parameter = datas[i];
                                $("#parameterType").append("<option value=" + parameter.parameterType + ">" + parameter.parameterName + "</option>");
                            }
                        } else {
                            $("#parameterType").empty();
                            $("#parameterType").append("<option value=''>参数类型</option>");
                        }
                        form.render("select");
                    }
                });
                //监听提交
                form.on('submit(add)',function(data) {
                    // console.log(data.field);
                    //发异步，把数据提交给php
                    var parameterText = $('#parameterText').val();
                    var parameterType =$('#parameterType').val();
                    var parameterValue = $('#parameterValue').val();
                    var parameterName = $('#parameterType option:selected').text();
                    $.ajax({
                        url:"/platformController/insertParameter",
                        type:"post",
                        asnyc:true,//异步
                        dataType:"text",//json,后端返回给前端的数据格式
                        data:{
                            parameterText:parameterText,
                            parameterType:parameterType,
                            parameterValue:parameterValue,
                            parameterName:parameterName
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