<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>欢迎页面-X-admin2.2</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="stylesheet" href="../static/X-admin/css/font.css">
        <link rel="stylesheet" href="../static/X-admin/css/xadmin.css">
        <script src="../static/X-admin/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="../static/X-admin/js/xadmin.js"></script>
        <!--[if lt IE 9]>
          <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
          <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <style>
            #main>.info{
                float: left;
                margin-left: 5%;
                margin-top: 5%;
            }
        </style>
    </head>
    <body>
    <br>
    <h2 align="center" >亲子阅读</h2>
    <div class="layui-row">
        <div class="layui-row">
            <div align="center" id="main">
                <c:if test="${not empty read}">
                    <c:forEach items="${read.list}" var="i">
                        <div class="info " onclick="readIn(this)">
                            <input class="readMagId" type="hidden" value="${i.readmagId}">
                            <input class="titleName" type="hidden" value="${i.readmagName}">
                            <img src="${i.readmagPic}" style=" width:150px;height:100px;">
                            <div>${i.readmagName}</div>
                        </div>
                    </c:forEach>
                </c:if>

            </div>

        </div>
        <p>&nbsp;</p>
        <table width="80%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td><div align="center"> <a  class="layui-btn layui-btn-lg layui-btn-normal" href="${pageContext.request.contextPath}/pt/parentRead?curPage=${read.prePage}">上一页</a></div></td>
                <td><div align="center"> <a  class="layui-btn layui-btn-lg layui-btn-normal" href="${pageContext.request.contextPath}/pt/parentRead?curPage=${read.nextPage}">上一页</a></div></td>
            </tr>
        </table>
    </div>


    </body>
    <script type="text/javascript" src="../static/X-admin/js/jquery.min.js"></script>
    <script>

        function readIn(node) {
            var readMagId=$(node).find(".readMagId").val();
            var titleName=$(node).find(".titleName").val();
            // alert(readMagId);
            // alert(titleName);
            $.ajax({

                url : '/pt/ParentPhoto',
                async : true,
                type : "POST",
                data :{"titleName":titleName,"readMagId":readMagId},
                dataType : "json",
                success : function(msg) {
                    layer.photos({
                        photos: msg
                        ,anim: 5 //0-6的选择，指定弹出图片动画类型，默认随机（请注意，3.0之前的版本用shift参数）
                    });
                },
                error : function() {
                    layer.msg('网络错误!', {icon: 2, time: 1000});
                }
            });
        }



    </script>


</html>