<%--
  Created by IntelliJ IDEA.
  User: Mr.huang
  Date: 2020/7/20
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文件上传</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend>作业名称:<span id="Name"></span> &emsp;</legend>
    只需要提交<span style="color: red">文档</span>或者<span style="color: red">图片</span>即可
</fieldset>

<div class="layui-upload">
    <button type="button" class="layui-btn layui-btn-normal" id="test8">选择文件</button>
    <button type="button" class="layui-btn" id="test9">开始上传</button>
</div>
<%String path = request.getContextPath();%>
<input id="path" type="hidden" value=<%=path%>>
</body>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.all.js"></script>
<script>
    layui.use('upload', function() {
        var $ = layui.jquery
            , upload = layui.upload;
        var path=$("#path").val();
        $("#Name").text(parent.PartitionId);


//选完文件后不自动上传
        upload.render({
            elem: '#test8'
            ,url: path+'/pt/uploadHomeWork?releaseid='+parent.ANAME //改成您自己的上传接口
            ,auto: false
            //,multiple: true
            ,accept:'file' //普通文件
            ,exts:'png|jpg|bmp|doc|docx|ppt|pptx|txt|xls|xlsx'
            ,bindAction: '#test9'
            ,before:function () {
                $("#test9").attr('disabled',true);
                $("#test9").text("上传中请稍后...");


            }
            ,done: function(res){

                if (res.code===0){
                    // var index = parent.layer.getFrameIndex(window.name);
                    $("#test9").attr('disabled',false);
                    console.log(res);
                    // parent.layer.msg('作业上传成功！');

                    var index = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(index);//关闭当前页
                    parent.location.reload();
                    parent.layer.alert('文件上传成功', {icon: 1});
                }else {
                    layer.msg(res.msg);
                }

            }
        });
    });





</script>
</html>
