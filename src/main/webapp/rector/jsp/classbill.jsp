<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>欢迎页面-X-admin2.2</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/X-admin/css/font.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/X-admin/css/xadmin.css">
        <script src="${pageContext.request.contextPath}/static/X-admin/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/X-admin/js/xadmin.js"></script>
        <script src="${pageContext.request.contextPath}/static/jquery-3.5.1.js"></script>
        <!--[if lt IE 9]>
          <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
          <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <div class="x-nav">
          <span class="layui-breadcrumb">
<!--            <a href="">首页</a>-->
<!--            <a href="">演示</a>-->
<!--            <a>-->
<!--              <cite>导航元素</cite></a>-->
          </span>
          <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
        </div>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-body ">
<!--                            <form class="layui-form layui-col-space5">-->
<!--                                <div class="layui-inline layui-show-xs-block">-->
<!--                                    <input class="layui-input"  autocomplete="off" placeholder="开始日" name="start" id="start">-->
<!--                                </div>-->
<!--                                <div class="layui-inline layui-show-xs-block">-->
<!--                                    <input class="layui-input"  autocomplete="off" placeholder="截止日" name="end" id="end">-->
<!--                                </div>-->
<!--                                <div class="layui-inline layui-show-xs-block">-->
<!--                                    <input type="text" name="username"  placeholder="请输入用户名" autocomplete="off" class="layui-input">-->
<!--                                </div>-->
<!--                                <div class="layui-inline layui-show-xs-block">-->
<!--                                    <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>-->
<!--                                </div>-->
<!--                            </form>-->
                        </div>

                        <div class="layui-card-body layui-table-body layui-table-main">
                            <table class="layui-table layui-form" id="usertable" lay-filter="test">

                            </table>
                        </div>

                </div>
            </div>
        </div> 
        </div></body>
    <script>
        layui.use(['laydate', 'form', 'laypage', 'table', 'laytpl'], function () {
        var laydate = layui.laydate;
        var  form = layui.form;
        var laypage = layui.laypage;
        var table = layui.table;
        var laytpl = layui.laytpl;

            table.render({
                limits: [5, 10, 20]
                ,
                // limit: 5,
                elem: '#usertable',
                id: 'listReload',

                page: false

                , url:'/RectorControl/ClassBill?classId='+parent.classId+"&schoolbillId="+parent.billId

                ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增

                , cols: [[

                    // {field: 'campusInfoId', title: 'ID',width: 50, sort: true}
                     {field: 'studentName', title: '学生姓名'}
                    , {field: 'studentbillCreatetime', title: '缴费时间', sort: true}
                    // , {field: 'studentbillType', title: '是否缴费', sort: true}
                    , {toolbar: '#barDemo', title: '是否缴费', sort: true}
                    // , {title: '操作', align: 'center', width: 250, toolbar: '#barDemo'}


                ]],
                // request: {
                //     pageName: 'curPage' //页码的参数名称，默认：page
                //     , limitName: 'pageSize' //每页数据量的参数名，默认：limit
                // }

            });


      });
    </script>
    <script type="text/html" id="barDemo">
        {{#  if(d.studentbillType=='未缴费'){ }}
        <a class="layui-btn layui-btn-warm layui-btn-xs" >未缴费</a>
        {{#  } }}
        {{#  if(d.studentbillType=='已缴费'){ }}
        <a class="layui-btn layui-btn-xs " >已缴费</a>
        {{#  } }}
    </script>
</html>