<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>往期作业</title>
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

                        </div>

                        <div class="layui-card-body layui-table-body layui-table-main">
                            <table class="layui-table layui-form" id="usertable" lay-filter="test">

                            </table>
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

            table.render({
                 limit: 10,
                elem: '#usertable',
                id: 'listReload',

                page: true

                , url:'/pt/historyhomework'
                ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增

                , cols: [[

                    // {field: 'campusInfoId', title: 'ID',width: 50, sort: true}
                     {field: 'workreleaseId', title: '作业编号'}
                    , {field: 'workName', title: '作业名称'}
                    , {field: 'workreleaseTime', title: '发布时间', sort: true}
                    , {field: 'workEva', title: '作业评价', sort: true}
                    , {field: 'workResult', title: '完成情况', sort: true}
                    , {field: 'campusInfoTime', title: '作业内容',toolbar: '#barDemo1'}



                ]],
                request: {
                    pageName: 'curPage' //页码的参数名称，默认：page
                    , limitName: 'pageSize' //每页数据量的参数名，默认：limit
                }

            });
            //表格所有的操作。
            table.on('tool(test)',function (obj) {  //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                var data = obj.data; //获得当前行数据33.

                var layEven=obj.event;  //事件数据
                if (layEven==='查看作业'){
                    $.ajax({
                        url:"/pt/myworkdownload",
                        async: true,
                        type: "post",
                        data:{"id":data.workreleaseId},
                        dataType: "json",
                        success: function (msg) {
                            console.log(msg);
                          window.location.href="http://"+msg
                        },
                        error: function () {
                            alert("网络繁忙");

                        },
                        complete: function () {
                            // alert("ajax执行完毕");
                        }
                    });


                }

            })

      });
    </script>
    <script type="text/html" id="barDemo1">


        {{#  if(d.workResult=='完成'){ }}
        <a class="layui-btn layui-btn-xs"   lay-event="查看作业">查看我提交的作业</a>
        {{#  } }}
    </script>
</html>