
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>密码修改</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <script src="${pageContext.request.contextPath}/static/X-admin/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/X-admin/dist/jquery.validate.min.js"></script>

    <style type="text/css">
            .input-text.size-L, .btn.size-L {
                font-size: 16px;
                height: 41px;
                padding: 15px;
         /*    输入内容的内边距*/
            }

            .input-text {
                box-sizing: border-box;
                border: solid 1px #ddd;
                width: 60%;
                -webkit-transition: all .2s linear 0s;
                -moz-transition: all .2s linear 0s;
                -o-transition: all .2s linear 0s;
                transition: all .2s linear 0s;
            }

            .loginBtn {
                background: #12b5b0;
                height: 40px;
                text-align: center;
                color: #fff;
                font-size: 20px;
                margin-top: 20px;
                width: 100px;
                border-radius: 0px;
                padding: 0px 0px;
                border-radius: 30px;
            }

            .formControls {
                text-align: center;
                margin: 10px 20px 0 20px;
                clear: both;
            }


            .loginDiv {
                background: #fff;
                /*position: relative;*/
                width: 30%;
                text-align: center;
                border-radius: 20px;
                height: 50%;
                top: 50%;
                margin: 0 auto;
                padding: 0;
            }
    </style>
    <%
        String path = request.getContextPath();

    %>

</head>
<body>
<div class="loginDiv">
<%--    <input type="hidden" id="path" value=<%=path%>>--%>
<%--    <div class="title">修改密码</div>--%>
    <form action="login" method="post" id="formLogin">
        <div class="formControls">
            <label for="account">原密码:</label>
            <input type="text" name="account" id="account" class="input-text size-L" readonly="readonly" value="${admin.adminPwd}"/>
        </div>
        <div class="formControls">
            <label for="pwd">请输入新密码:</label>
            <input type="password" name="pwd" id="pwd" class="input-text size-L" placeholder="请输入您的密码"/>
        </div>
        <div class="formControls">
            <label for="apwd">请再次输入密码:</label>
            <input type="password" name="apwd" id="apwd" class="input-text size-L" placeholder="请再次输入您的密码"/>
        </div>
        <div>
            <input type="button" id="commitBtn" name="commitBtn" value="提交" class="loginBtn">
            <input type="button" id="cancalBtn" name="cancalBtn" value="取消" class="loginBtn" onclick="custom_close()">
        </div>
    </form>
</div>
</body>
<script>
    function custom_close(){
        window.parent.location.reload();
        window.close();
        // window.location.href='/platform/index.jsp';
    }
    $(document).ready(function () {// 在键盘按下并释放及提交后验证提交表单

        $("#commitBtn").click(function () {
            if (!validate()) {
                return;
            }
            $.ajax({
                url:"/platformController/updatePwd",
                type: 'POST',
                asnyc: true,
                dataType: "text",//预期服务器返回的数据类型text、json
                data:{
                    adminTel: ${admin.adminTel},
                    adminPwd: $("#pwd").val(),
                },
                success: function (data) {

                    if (data == "success") {
                         alert("修改成功");
                        window.parent.location.reload();;
                        window.close();
                    }else {
                        alert("修改失败");
                    }
                },
                beforeSend: function () {
                    $('#commitBtn').attr("disabled", "disabled");//attr增加属性，禁止点击

                },
                error: function () {
                },
                complete: function () {
                    $('#commitBtn').removeAttr("disabled");

                }
            });
        });
    })
    function validate() {
        //自定义的手机号验证

        return $("#formLogin").validate({
            //把错误信息统一放在一个容器里面。
            // errorLabelContainer: "#messageBox",
            // //用什么标签再把上边的 errorELement 包起来。
            // wrapper: "li",//显示的标签可以用span

            rules: {
                pwd: {
                    required: true,
                    rangelength: [2, 8]
                },
                apwd: {
                    required: true,
                    rangelength: [2, 8],
                    equalTo: '#pwd'
                }

            },
            messages: {
                pwd: {
                    required: "请输入密码",
                    rangelength: "长度2到8个字符"
                },
                apwd: {
                    required: "请输入密码",
                    rangelength: "长度2到8个字符",
                    equalTo: "两次密码输入不一致"
                },
            }
        }).form();
    }
</script>
</html>