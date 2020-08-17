<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>体检信息</title>
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
                      <h2>  &emsp;宝宝姓名:<span id="babyname" style="color: red"><%=request.getSession().getAttribute("studentName")%></span></h2>

                        <div class="layui-card-body layui-table-body layui-table-main">
                            <table class="layui-table layui-form" id="usertable" lay-filter="test"> </table>
                           </div>
                </div>
            </div>
        </div>
        </div>
    </body>
    <script>
        layui.use(['laydate', 'form', 'laypage', 'table', 'laytpl'], function () {
        var laydate = layui.laydate;
        var  form = layui.form;
        var laypage = layui.laypage;
        var table = layui.table;
        var laytpl = layui.laytpl;
        var babyname=$("#babyname");
            table.render({
                limits: [5, 10, 20]
                , limit: 5,
                elem: '#usertable',
                id: 'listReload',

                page: true

                , url:'/pt/babyhealth'
                ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增

                , cols: [[

                    // {field: 'campusInfoId', title: 'ID',width: 50, sort: true}
                    {field: 'examinationTime', title: '体检时间'}
                    , {field: 'height', title: '身高', sort: true}
                    , {field: 'weight', title: '体重', sort: true}
                    , {field: 'vision', title: '视力', sort: true}
                    , {field: 'temperature', title: '体温', sort: true}
                    , {field: 'healthStatus', title: '健康状态', sort: true}


                ]],
                request: {
                    pageName: 'curPage' //页码的参数名称，默认：page
                    , limitName: 'pageSize' //每页数据量的参数名，默认：limit
                }


            });

      });
    </script>
</html>