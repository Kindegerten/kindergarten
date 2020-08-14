<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>face</title>

    <%
        String path = request.getContextPath();
        String account = (String) request.getSession().getAttribute("account");
    %>

    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="stylesheet" href="<%=path%>/static/X-admin/css/font.css">
    <link rel="stylesheet" href="<%=path%>/static/X-admin/css/xadmin.css">
    <link rel="stylesheet" href="<%=path%>/static/X-admin/css/theme3944.min.css">
    <script src="<%=path%>/static/X-admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=path%>/static/X-admin/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <title>添加人脸</title>
</head>

<body>
<video id="v" style="width: 640px;height: 480px;float: left;"></video>
<canvas id="canvas" style="display: none;"></canvas>
<img src="http://placehold.it/640&text=Your%20image%20here%20..." id="photo" alt="photo" style="width: 640px;height: 480px; float: right;">
<br/>

<button id="take" class="layui-btn" style="margin-left: 45px">拍照</button>
<button id="add" class="layui-btn" style="margin-left: 45px">添加</button>
<input type="hidden" value="" id="pic"/>



<script>
    !(function () {
        // 老的浏览器可能根本没有实现 mediaDevices，所以我们可以先设置一个空的对象
        if (navigator.mediaDevices === undefined) {
            navigator.mediaDevices = {};
        }
        if (navigator.mediaDevices.getUserMedia === undefined) {
            navigator.mediaDevices.getUserMedia = function (constraints) {
                // 首先，如果有getUserMedia的话，就获得它
                var getUserMedia = navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia;

                // 一些浏览器根本没实现它 - 那么就返回一个error到promise的reject来保持一个统一的接口
                if (!getUserMedia) {
                    return Promise.reject(new Error('getUserMedia is not implemented in this browser'));
                }

                // 否则，为老的navigator.getUserMedia方法包裹一个Promise
                return new Promise(function (resolve, reject) {
                    getUserMedia.call(navigator, constraints, resolve, reject);
                });
            }
        }
        const constraints = {
            video: true,
            audio: false
        };
        let videoPlaying = false;
        let v = document.getElementById('v');
        let promise = navigator.mediaDevices.getUserMedia(constraints);
        promise.then(stream => {
            // 旧的浏览器可能没有srcObject
            if ("srcObject" in v) {
                v.srcObject = stream;
            } else {
                // 防止再新的浏览器里使用它，应为它已经不再支持了
                v.src = window.URL.createObjectURL(stream);
            }
            v.onloadedmetadata = function (e) {
                v.play();
                videoPlaying = true;
            };
        }).catch(err => {
            console.error(err.name + ": " + err.message);
        })
        document.getElementById('take').addEventListener('click', function () {
            if (videoPlaying) {
                let canvas = document.getElementById('canvas');
                canvas.width = v.videoWidth;
                canvas.height = v.videoHeight;
                canvas.getContext('2d').drawImage(v, 0, 0);
                let data = canvas.toDataURL('image/png');
                document.getElementById('photo').setAttribute('src', data);
                // alert(data);

                $("#pic").val(data);
                // $.ajax({
                //     url: "/sc/addFace",
                //     async: true,
                //     type: "POST",
                //     data: "base64=" + encodeURIComponent(data),
                //     dataType: "text",
                //     success: function (msg) {
                //         layer.msg(msg)
                //         console.log(msg);
                //     },
                //     error: function () {
                //         layer.msg("网络繁忙!");
                //     }
                // });

            }
        }, false);

        document.getElementById('add').addEventListener('click', function () {

            let data=$("#pic").val();
            console.log(data);
            $("#pic").val("");

            if (data==""||data==null||data=="null"){
                layer.msg("请先拍照！")
            }else {
                $.ajax({
                    url: "/sc/addFace",
                    async: true,
                    type: "POST",
                    data: "base64=" + encodeURIComponent(data),
                    dataType: "text",
                    success: function (msg) {
                        layer.msg(msg)
                        console.log(msg);
                    },
                    error: function () {
                        layer.msg("网络繁忙!");
                    }
                });
                document.getElementById('photo').setAttribute('src', "http://placehold.it/640&text=Your%20image%20here%20...");
            }

        },false);
    })();
</script>
</body>

</html>