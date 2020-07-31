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
        .layui-table-cell {
            height: 80px;
            line-height: 60px;
        }
        th .layui-table-cell {
            height: 30px;
            line-height: 30px;
        }
        th .laytable-cell-1-0-7 {
            height: 30px;
            line-height: 30px;
        }
        .layui-table img {
            /*width: 100px;*/
            /*height: 60px;*/
        }
        /*.layui-table-cell设置行高*/

        /*th .layui-table-cell设置表头行高*/

        /*th .laytable-cell-1-0-7设置固定列表头行高*/

        /*.layui-table img设置显示图片的高和宽*/
    </style>
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
        table.render({
            limits: [5, 10, 20]
            , limit: 5,
            elem: '#usertable',
            id: 'listReload',
            // height:'full-100',

            page: true

            , url:'/pt/schoolVideo'
            ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增

            , cols: [[

                // {field: 'campusInfoId', title: 'ID',width: 50, sort: true}
                {field: 'monitorImgUrl',align:'center', title: '监控图片',templet: "#imgtmp"}
                , {field: 'monitorName',align:'center', title: '监控位置', sort: true}
                , { title: '操作', sort: true,align:'center',templet: "#videotmp"}


            ]],
            request: {
                pageName: 'curPage' //页码的参数名称，默认：page
                , limitName: 'pageSize' //每页数据量的参数名，默认：limit
            }


        });


        //表格所有的操作。
        table.on('tool(test)',function (obj) {  //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEven=obj.event;  //事件数据
            layer.open({
                type: 2,
                title: false,
                area: ['630px', '360px'],
                shade: 0.8,
                closeBtn: 0,
                shadeClose: true,
                content: '//player.youku.com/embed/XMjY3MzgzODg0'
            });
        });

    });

</script>
<script type="text/html" id="imgtmp">
    <img src="{{d.monitorImgUrl}}" style="width: 1000px;"   alt="">
</script>
<script type="text/html" id="videotmp">
    <a class="layui-btn layui-btn-xs" lay-event="see">查看监控</a>
</script>
</html>