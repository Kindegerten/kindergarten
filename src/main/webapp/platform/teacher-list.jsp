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
    <title>教师列表</title>
    <%
        String path = request.getContextPath();
    %>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="<%=path%>/static/X-admin/css/font.css">
    <link rel="stylesheet" href="<%=path%>/static/X-admin/css/xadmin.css">
    <!-- <link rel="stylesheet" href="./css/theme5.css"> -->
    <script src="<%=path%>/static/X-admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=path%>/static/X-admin/js/xadmin.js"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
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
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body demoTable">
                    <div class="layui-inline layui-show-xs-block">
                        <input type="text" name="teacherName" lay-verify="required" id="teacherName" placeholder="请输入用户名" autocomplete="off"
                               class="layui-input">
                    </div>
                    <div class="layui-inline layui-show-xs-block">
                        <button data-type="reload" class="layui-btn" id="search"><i class="layui-icon">&#xe615;</i>
                        </button>
                    </div>
                    <%--                            </form>--%>
                </div>
                <div class="layui-card-header">
<%--                    <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除--%>
<%--                    </button>--%>
<%--                    <button class="layui-btn" onclick="xadmin.open('添加用户','/platform/teacher-add.jsp',600,400)"><i--%>
<%--                            class="layui-icon"></i>添加--%>
<%--                    </button>--%>
                    <%--                            <button class="layui-btn"><i class="layui-icon">&#xe642;</i>修改会员等级</button>--%>
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
    layui.use(['laydate', 'form', 'laypage', 'table', 'laytpl','util'], function () {

        // var path = $("#path").val();

        var form = layui.form;
        var laypage = layui.laypage;
        var table = layui.table;
        var laydate = layui.laydate;
        var laytpl = layui.laytpl;
        var util=layui.util;
        table.render({
            limits: [5, 10, 20]
            , limit: 5,
            elem: '#usertable',
            id: 'listReload',
            page: true
            , url:"/platformController/selectParents?roleID="+5//数据接口?roleID="+5
            // ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , cols: [[
               ,{field: 'teacherId', title: 'id', width: 80,fixed: 'left', hide: "true" }
                , {field: 'teacherName', title: '用户名', width: 80}
                , {field: 'teacherPwd', title: '密码', width: 80}
                , {field: 'teacherSex', title: '性别', width: 80, sort: true}
                , {field: 'teacherAge', title: '年龄', width: 80, sort: true}
                , {field: 'teacherTel', title: '手机号', width: 120, sort: true}
                , {field: 'teacherRegtime', title: '注册时间', width: 200, sort: true,
                    templet: function(d) {return util.toDateString(d.teacherRegtime)}
                }
                , {
                    field: 'teacherStatus',
                    title: '状态',
                    width: 80,
                    sort: true,
                    templet:    function (d) {
                        // console.log(d.parentsStatus);
                         // return d.parentsStatus == 1 ? "启用":"禁用";
                        if (d.teacherStatus == 1) {
                            return "<span style='color:green'>启用</span>";
                        } else if (d.teacherStatus == 2) {
                            return "<span style='color:red'>禁用</span>";
                        }
                    }
                }
                , {title: '操作', align: 'center', width: 250, toolbar:'#barDemo'}


            ]],
            request: {
                pageName: 'curPage' //页码的参数名称，默认：page
                , limitName: 'pageSize' //每页数据量的参数名，默认：limit
            }

        });
        var active = {
            reload: function () {
                var teacherName = $('#teacherName').val();
                // console.log(parentsName)
                //执行重载
                table.reload('listReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {
                        teacherName: teacherName,
                        // roleID:5,//等级id，进行分类的分页查询要用
                        // start:start,
                        // end:end
                    }
                }, 'data');
            }
        };

        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        table.on('tool(test)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            // console.log(data.parentsId);
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）

            if (layEvent === 'ban') { //删除
                // console.log("obj"+obj)
                $.ajax({
                    url: "/platformController/updateParents",
                    asnyc: true,
                    type: "Post",
                    data: "id=" + data.teacherId + "&type=" + 2+"&roleId="+5,
                    dataType: "text",
                    success: function (msg) {
                        layer.msg("修改成功"),
                            location.reload();
                    }
                })
            } else if (layEvent === 'up') { //编辑
                $.ajax({
                    url:"/platformController/updateParents",
                    asnyc: true,
                    type: "Post",
                    data: "id=" + data.teacherId + "&type=" + 1+"&roleId="+5,
                    dataType: "text",
                    success: function (msg) {
                        layer.msg("修改成功"),
                            location.reload();
                    }
                })
            }
        });


    });

</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="ban">禁用</a>
    <a class="layui-btn layui-btn-xs" lay-event="up">启用</a>
<%--    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>--%>
</script>
</html>

