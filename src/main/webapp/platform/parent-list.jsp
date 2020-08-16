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
    <title>家长列表</title>
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
                        <input type="text" name="parentsName" lay-verify="required" id="parentsName" placeholder="请输入用户名" autocomplete="off"
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
<%--                    <button class="layui-btn" onclick="xadmin.open('添加用户','/platform/parent-add.jsp',600,400)"><i--%>
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
    layui.use(['laydate', 'form', 'laypage', 'table', 'laytpl'], function () {
        // var path = $("#path").val();
        var form = layui.form;
        var laypage = layui.laypage;
        var table = layui.table;
        var laydate = layui.laydate;
        var laytpl = layui.laytpl;

        table.render({
            limits: [5, 10, 20]
            , limit: 5,
            elem: '#usertable',
            id: 'listReload',
            page: true
            , url:"/platformController/selectParents?roleID="+1 //数据接口
            // ,dataType:"json"
            // ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , cols: [[
               ,{field: 'parentsId', title: 'id',fixed: 'left', hide: "true" }
                , {field: 'parentsName', title: '用户名'}
                , {field: 'parentsPwd', title: '密码'}
                , {field: 'parentsSex', title: '性别', sort: true}
                , {field: 'parentsTel', title: '手机号', sort: true}
                , {
                    field: 'parentsStatus',
                    title: '状态',
                    sort: true,
                    templet:    function (d) {
                        // console.log(d.parentsStatus);
                         // return d.parentsStatus == 1 ? "启用":"禁用";
                        if (d.parentsStatus == 1) {
                            return "<span style='color:green'>启用</span>";
                        } else if (d.parentsStatus == 2) {
                            return "<span style='color:red'>禁用</span>";
                        }
                    }
                }
                , {title: '操作', align: 'center', toolbar:'#barDemo'}
            ]],
            request: {
                pageName: 'curPage' //页码的参数名称，默认：page
                , limitName: 'pageSize' //每页数据量的参数名，默认：limit

            }

        });
        var active = {
            reload: function () {
                var parentsName = $('#parentsName').val();
                // console.log(parentsName)
                //执行重载
                table.reload('listReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {
                        parentsName: parentsName,

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
                    data: "id=" + data.parentsId + "&type=" + 2+"&roleId="+1,
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
                    data: "id=" + data.parentsId + "&type=" + 1+"&roleId="+1,
                    dataType: "text",
                    success: function (msg) {
                        layer.msg("修改成功"),
                            location.reload();
                    }
                })
            }
        });


        // 监听全选
        form.on('checkbox(checkall)', function (data) {

            if (data.elem.checked) {
                $('tbody input').prop('checked', true);
            } else {
                $('tbody input').prop('checked', false);
            }
            form.render('checkbox');
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
    });


    /*用户-停用*/
    function member_stop(obj, id) {
        layer.confirm('确认要停用吗？', function (index) {

            if ($(obj).attr('title') == '启用') {

                //发异步把用户状态进行更改
                $(obj).attr('title', '停用');
                $(obj).find('i').html('&#xe62f;');

                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                layer.msg('已停用!', {icon: 5, time: 1000});

            } else {
                $(obj).attr('title', '启用');
                $(obj).find('i').html('&#xe601;');

                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                layer.msg('已启用!', {icon: 5, time: 1000});
            }

        });
    }
    /*用户-删除*/
    // function member_del(obj, id) {
    //     layer.confirm('确认要删除吗？', function (index) {
    //         //发异步删除数据
    //         $(obj).parents("tr").remove();
    //         layer.msg('已删除!', {icon: 1, time: 1000});
    //     });
    // }


    // function delAll(argument) {
    //     var ids = [];
    //
    //     // 获取选中的id
    //     $('tbody input').each(function (index, el) {
    //         if ($(this).prop('checked')) {
    //             ids.push($(this).val())
    //         }
    //     });
    //
    //     layer.confirm('确认要删除吗？' + ids.toString(), function (index) {
    //         //捉到所有被选中的，发异步进行删除
    //         layer.msg('删除成功', {icon: 1});
    //         $(".layui-form-checked").not('.header').parents('tr').remove();
    //     });
    // }
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="ban">禁用</a>
    <a class="layui-btn layui-btn-xs" lay-event="up">启用</a>
<%--    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>--%>
</script>
</html>

