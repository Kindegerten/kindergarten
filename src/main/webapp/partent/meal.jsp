<%@ page import="com.kindergarten.bean.PageBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="../static/layui/css/layui.css"  media="all">

<title>膳食表</title>
</head>
<body>
<h2 style="text-align:center">膳食表</h2>
<c:if test="${not empty meals}">
<% PageBean pageBean= (PageBean) request.getAttribute("meals");
  System.out.println();
%>

<h4 style="text-align:center"><%=pageBean.getList().get(0).toString()%><span id="lodate"></span></h4>
<table class="layui-table" width="80%" height="50%" border="1" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="15%" bgcolor="orange"><div align="center" style="color: white">餐别</div></td>
    <td width="15%" bgcolor="orange"><div align="center" style="color: white">周一</div></td>
    <td width="15%" bgcolor="orange"><div align="center" style="color: white">周二</div></td>
    <td width="15%" bgcolor="orange"><div align="center" style="color: white">周三</div></td>
    <td width="15%" bgcolor="orange"><div align="center" style="color: white">周四</div></td>
    <td width="15%" bgcolor="orange"><div align="center" style="color: white">周五</div></td>
  </tr>
  <c:forEach items="${meals.list}" var="i">
    <tr>
      <td align="center">${i.mealType}</td>
      <td align="center">${i.monday}</td>
      <td align="center">${i.tuesday}</td>
      <td align="center">${i.wednesday}</td>
      <td align="center">${i.thursday}</td>
      <td align="center">${i.friday}<input type="hidden" id="datescope" value="22222"></td>

    </tr>
  </c:forEach>

  </c:if>

</table>
<p>&nbsp;</p>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><div align="center"> <a  class="layui-btn layui-btn-lg layui-btn-normal" href="${pageContext.request.contextPath}/pt/searchmeal?curPage=${meals.prePage}">上一周食谱</a></div></td>
    <td><div align="center"> <a  class="layui-btn layui-btn-lg layui-btn-normal" href="${pageContext.request.contextPath}/pt/searchmeal?curPage=${meals.nextPage}">下一周食谱</a></div></td>
  </tr>
</table>
<%--<script>--%>
<%--  $.ajax({--%>
<%--    url:"/pt/searchmeal",--%>
<%--    async: true,--%>
<%--    type: "post",--%>
<%--    dataType: "json",--%>
<%--    success: function (msg) {--%>
<%--    console.log(msg);--%>
<%--    },--%>
<%--    error: function () {--%>
<%--      alert("网络繁忙");--%>

<%--    },--%>
<%--  })--%>
<%--</script>--%>
<script type="text/javascript" rel="./partent/js/jquery-3.4.1.js"></script>
<script>
  var path = $("#path").val();
  alert(path);

</script>
</body>


</html>
