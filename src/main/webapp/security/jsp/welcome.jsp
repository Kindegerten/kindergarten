<%--
  Created by IntelliJ IDEA.
  User: 瓷甃
  Date: 2020/7/30
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>签到</title>

    <%
        String path = request.getContextPath();
        String account = (String) request.getSession().getAttribute("account");
    %>


    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="<%=path%>/static/X-admin/css/font.css">
    <link rel="stylesheet" href="<%=path%>/static/X-admin/css/xadmin.css">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=path%>/static/X-admin/css/theme3944.min.css">
    <script src="<%=path%>/static/X-admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=path%>/static/X-admin/js/xadmin.js"></script>
    <script type="text/javascript" src="<%=path%>/static/X-admin/js/jquery.min.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>

<button type="button" class="layui-btn" id="test1">
    <i class="layui-icon">&#xe67c;</i>人脸识别
</button>

<button type="button" class="layui-btn" id="test2">
    <i class="layui-icon">&#xe67c;</i>添加人脸
</button>

<button type="button" class="layui-btn" id="video">
    <i class="layui-icon">&#xe67c;</i>
    <a onclick="xadmin.open('开始人脸识别','<%=path%>/security/jsp/face.jsp')">开始人脸识别</a>
</button>




<script src="<%=path%>/static/layui/layui.js" type="text/javascript"></script>



<script>
    layui.use('upload', function(){
        var upload = layui.upload;
        let $=layui.jquery;
        let path=$("#path").val();

        //执行实例
        var uploadInst = upload.render({
            elem: '#test1' //绑定元素
            ,url: '' //上传接口
            ,data: {}
            ,choose: function(obj){
                //将每次选择的文件追加到文件队列
                var files = obj.pushFile();

                //预读本地文件，如果是多文件，则会遍历。(不支持ie8/9)
                obj.preview(function(index, file, result){
                    console.log(index); //得到文件索引
                    console.log(file); //得到文件对象
                    console.log(result); //得到文件base64编码，比如图片
                    console.log(path);

                    $.ajax({
                        url: "/sc/getAuth",
                        async: true,
                        type: "POST",
                        data: "base64=" + encodeURIComponent(result),
                        dataType: "text",
                        success: function (msg) {
                            layer.msg(msg)
                            console.log(msg);
                        },
                        error: function () {
                            layer.msg("网络繁忙!");
                        }
                    });

                    delete files[0]; //删除列表中对应的文件，一般在某个事件中使用
                })}
            ,done: function(res){
                //上传完毕回调
            }
            ,error: function(){
                //请求异常回调
            }
        });
    });
</script>

<script>
    layui.use('upload', function(){
        var upload = layui.upload;
        let $=layui.jquery;
        let path=$("#path").val();

        //执行实例
        var uploadInst = upload.render({
            elem: '#test2' //绑定元素
            ,url: '' //上传接口
            ,data: {}
            ,choose: function(obj){
                //将每次选择的文件追加到文件队列
                var files = obj.pushFile();

                //预读本地文件，如果是多文件，则会遍历。(不支持ie8/9)
                obj.preview(function(index, file, result){
                    console.log(index); //得到文件索引
                    console.log(file); //得到文件对象
                    console.log(result); //得到文件base64编码，比如图片
                    console.log(path);

                    $.ajax({
                        url: "/sc/addFace",
                        async: true,
                        type: "POST",
                        data: "base64=" + encodeURIComponent(result),
                        dataType: "text",
                        success: function (msg) {
                            layer.msg(msg)
                            console.log(msg);
                        },
                        error: function () {
                            layer.msg("网络繁忙!");
                        }
                    });

                    delete files[0]; //删除列表中对应的文件，一般在某个事件中使用
                })}
            ,done: function(res){
                //上传完毕回调
            }
            ,error: function(){
                //请求异常回调
            }
        });
    });
</script>

</body>
</html>



<script>
    function getAuth() {

        let path=$("#path").val();
        console.log("in "+path);

        $.ajax({
            url: path + "/sc/getAuth",
            async: true,
            type: "POST",
            data:"",
            dataType: "text",
            success: function (msg) {
                // layer.msg(msg);
                console.log(msg);

            },
            error: function () {
                // layer.msg("网络繁忙!");
                console.log("网络繁忙");
            }
        });
    }
</script>