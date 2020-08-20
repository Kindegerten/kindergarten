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
        <form class="layui-form" lay-filter="update">
            <div class="layui-form-item">
                <label for="test8" class="layui-form-label">
                    <span class="x-red">*</span>上传视频</label>
                <div class="layui-input-inline">
                    <button type="button" class="layui-btn layui-btn-normal" id="test8">选择文件</button>
                    <%--                            <input type="file" id="securityPhone" name="securityPhone" required="" lay-verify="required|phone" autocomplete="off" class="layui-input">--%>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="safetyVideoName" class="layui-form-label">
                    <span class="x-red">*</span>视频名称</label>
                <div class="layui-input-inline">
                    <input type="text" id="safetyVideoName" name="safetyVideoName" required="" lay-verify="nikename"
                           autocomplete="off" class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label for="videoName" class="layui-form-label">
                    <span class="x-red">*</span>文件名称</label>
                <div class="layui-input-inline">
                    <input type="text" id="videoName" name="videoName" required="" lay-verify="pass" autocomplete="off"
                           class="layui-input"></div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">设置时间</label>
                <div class="layui-inline layui-show-xs-block">
                    <input class="layui-input " autocomplete="off" placeholder="开始日" lay-verify="required" name="safetyVideoStar"
                           id="safetyVideoStar">
                </div>
                <div class="layui-inline layui-show-xs-block">
                    <input class="layui-input" autocomplete="off" placeholder="截止日" lay-verify="required" name="safetyVideoEnd"
                           id="safetyVideoEnd">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="test9" class="layui-form-label"></label>
                <button class="layui-btn" type="button" lay-filter="formDemo" lay-submit="" id="test9">增加</button>
                <%--                        <button type="button" class="layui-btn" id="test9">开始上传</button>--%>
                <button class="layui-btn" lay-filter="add" lay-submit="">取消</button>
            </div>
        </form>
    </div>
</div>
<script>

    layui.use(['form', 'layer', 'layedit', 'laydate', 'upload', "jquery"],  function () {
            var $ = layui.$
            // var $ = layui.jquery;
            var form = layui.form,
                layer = layui.layer;
            var laydate = layui.laydate;
            var upload = layui.upload;
            //初始化选择值

            //自定义验证规则
            form.verify({
                nikename: function (value) {
                    if (value.length < 2) {
                        return '文件名至少得2个字符啊';
                    }
                },
                pass: [/(.+){3,12}$/, '密码必须3到12位'],
                teacherAge: [/^(?:[1-9][0-9]?|1[01][0-9]|120)$/, '年龄输入不合法'],
            });
            /* 执行ladate实例*/
            laydate.render({
                elem: '#safetyVideoStar'
            });
            laydate.render({
                elem: '#safetyVideoEnd'
            });
            //选完文件后不自动上传
            upload.render({

                elem: '#test8'
                , url: "/platformController/videoUpload" //改成您自己的上传接口
                , auto: false //不自动上传，需要绑定某个按钮点击上传
                , accept: 'video' //普通文件（文件类型）
                , data: {
                    safetyVideoName:function () {
                        return $("#safetyVideoName").val()
                    },
                    videoName:function () {
                        return $("#videoName").val()
                    },
                    safetyVideoStar:function () {
                        return $("#safetyVideoStar").val()
                    },
                    safetyVideoEnd:function () {
                        return $("#safetyVideoEnd").val()
                    },

                    // safetyVideoName: $("#safetyVideoName").val(),
                    // videoName:$("#videoName").val(),
                    // safetyVideoStar:$("#safetyVideoStar").val(),
                    // safetyVideoEnd:$("#safetyVideoEnd").val()
                }//额外添加的参数
                , choose: function (obj) {

                    obj.preview(function (index, file, result) {
                        //对上传失败的单个文件重新上传，一般在某个事件中使用
                        //obj.upload(index, file);
                        var  videoName=$("#videoName");

                       videoName.text(" ");//当另外选择一个文件后，文件名那栏要更新
                        form.val("update", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
                            "videoName": file.name // "name": "value"

                        });
                    });
                }
                // ,exts: 'jpg|png|gif|bmp|jpeg|docx' //普通文件（文件类型）
                //,multiple: true //是否多个文件上传
                , bindAction: '#test9'
                , done: function (res) {
                    layer.msg(res.msg);
                    xadmin.close();
                    // 可以对父窗口进行刷新
                    xadmin.father_reload();
                }
            });


        });
</script>

</body>

</html>