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
                <div class="layui-card-body demoTable">
                    <%--                            <form class="layui-form layui-col-space5" action="" method="post" >--%>
                    <div class="layui-inline layui-show-xs-block">
                        <input class="layui-input"  autocomplete="off" placeholder="开始日" name="start" id="start">
                    </div>
                    <div class="layui-inline layui-show-xs-block">
                        <input class="layui-input"  autocomplete="off" placeholder="截止日" name="end" id="end">
                    </div>
                    <div class="layui-inline layui-show-xs-block">
                        <input type="text" name="classname" id="classname"  placeholder="班级名称" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-inline layui-show-xs-block">
                        <button  data-type="reload" class="layui-btn" id="search"><i class="layui-icon">&#xe615;</i></button>
                    </div>
                    <%--                            </form>--%>
                </div>
                <div class="layui-card-header">
                    <button class="layui-btn" onclick="xadmin.open('添加缴费单','bill-add.jsp',600,400)"><i
                            class="layui-icon"></i>添加缴费单
                    </button>
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
            , limit: 5,
            elem: '#usertable',
            id: 'listReload',

            page: true

            , url:'/RectorControl/SearchBill'
            ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增

            , cols: [[

                // {field: 'campusInfoId', title: 'ID',width: 50, sort: true}
                {field: 'billName', title: '缴费单名称', sort: true}
                , {field: 'billCreatetime', title: '缴费单创建时间'}
                , {field: 'billMoney', title: '缴费金额(元)', sort: true}
                , {field: 'billDirector', title: '缴费单描述', sort: true}
                , {field: 'billClassName', title: '缴费班级', sort: true}
                , {title: '查看缴费情况', align: 'center', toolbar: '#barDemo'}


            ]],
            request: {
                pageName: 'curPage' //页码的参数名称，默认：page
                , limitName: 'pageSize' //每页数据量的参数名，默认：limit
            }

        });
        //表格搜索
        var active = {
            reload: function(){
                var classname = $('#classname').val();
                var start=$("#start").val();
                var  end=$("#end").val();

                //执行重载
                table.reload('listReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        classname: classname,
                        start:start,
                        end:end

                    }
                }, 'data');
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
            // ,type: 'datetime'
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
            // ,type: 'datetime'
        });



        //表格所有的操作。
        table.on('tool(test)',function (obj) {  //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEven=obj.event;  //事件数据
            // if (layEven==='班级缴费情况'){
            //
            // }
            window.classId=data.billClassId;
            window.billId=data.billId;



        })

    });
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs"   lay-event="班级缴费情况" onclick="xadmin.open('班级缴费情况','classbill.jsp',700,500)">班级缴费情况</a>
</script>
</html>