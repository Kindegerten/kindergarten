<%--
  Created by IntelliJ IDEA.
  User: litaoquan
  Date: 2020/7/31
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>日志查看</title>
    <%
        String path = request.getContextPath();
    %>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <script src="${pageContext.request.contextPath}/static/X-admin/js/jquery-3.5.1.js" charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath}/static/X-admin/js/jquery.min.js" charset="UTF-8"></script>
    <%--    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>--%>
    <script type="text/javascript" src="/static/X-admin/dist/jquery.validate.js"></script>
    <link rel="stylesheet" href="<%=path%>/static/X-admin/css/font.css">
    <link rel="stylesheet" href="<%=path%>/static/X-admin/css/xadmin.css">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/X-admin/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/X-admin/css/bootstrap.min.css">
    <!-- <link rel="stylesheet" href="./css/theme5.css"> -->
    <script src="<%=path%>/static/X-admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=path%>/static/X-admin/js/xadmin.js"></script>

    <%--    <!--[if lt IE 9]>--%>
    <%--    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>--%>
    <%--    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>--%>
    <%--    <![endif]-->--%>
</head>
<div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">演示</a>
            <a>
              <cite>导航元素</cite></a>
          </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>


<div class="layui-row layui-col-space15">
    <div class="layui-col-md12">
        <div class="layui-card">
            <div class="layui-card-body demoTable layui-form"><%--当添加layui下拉框就要在最外层加上layui-form，要不然不会显示下拉框的样式--%>
                <div class="layui-form-item">

                    <div class="layui-inline">
                        <label class="layui-form-label">日志时间</label>
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input " autocomplete="off" placeholder="开始日" name="start" id="start">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input" autocomplete="off" placeholder="截止日" name="end" id="end">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <button data-type="reload" class="layui-btn">查询</button>
                        </div>
                    </div>
                </div>
<%--                <div class="layui-form-item">--%>
<%--                    <div class="layui-input-inline ">--%>
<%--                        <button data-type="reload" class="layui-btn">查询</button>--%>
<%--                    </div>--%>
<%--                </div>--%>
            </div>
            <%--            <div class="layui-card-header">--%>
            <%--            </div>--%>
            <div class="layui-card-body layui-table-body layui-table-main">
                <table class="layui-table layui-form" id="usertable" lay-filter="test">
                </table>
            </div>
        </div>
    </div>
</div>

</div>
</div>
</div>
</body>
<script>
    layui.use(['laydate', 'form', 'laypage', 'table', 'laytpl', 'util'], function () {
        // var path = $("#path").val();
        var form = layui.form;
        var laypage = layui.laypage;
        var table = layui.table;
        var laydate = layui.laydate;
        var laytpl = layui.laytpl;
        var util = layui.util;
        var $ = layui.$;
        table.render({
            limits: [5, 10, 20]
            , limit: 5,
            elem: '#usertable',
            id: 'listReload',
            page: true
            , url: "/platformController/selectSyslog"
            // ,cellMinWidth: 80 //全kin局定义常规单元格的最小宽度，layui 2.2.1 新增
            , cols: [[
                , {field: 'id', type: 'numbers', title: '序号', fixed: 'left'}
                , {field: 'operateor', title: '操作人'}
                , {
                    field: 'operateTime', title: '操作时间', sort: true,
                    templet: function (d) {
                        // console.log(d["operateTime"]);
                        if (d["operateTime"] != null) {
                            return util.toDateString(d["operateTime"])
                        } else {
                            return ""
                        }

                        // util.toDateString(time, format)
                    }
                }
                , {field: 'operateDetail', title: '操作事项', sort: true}
            ]],
            request: {
                pageName: 'curPage' //页码的参数名称，默认：page
                , limitName: 'pageSize' //每页数据量的参数名，默认：limit
            }

        });
        var active = {
            reload: function () {
                var start = $('#start').val();
                var end = $('#end').val();
                //获取文本框选中的值：
                //    var name = $("#parentName option:checked").text();
                //执行重载
                table.reload('listReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {
                        start: start,
                        end: end
                    }
                }, 'data');
            }
        };

        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
        /* 执行ladate实例*/
        laydate.render({
            elem: '#start'
        })
        laydate.render({
            elem: '#end'
        });
    });

</script>
</html>

