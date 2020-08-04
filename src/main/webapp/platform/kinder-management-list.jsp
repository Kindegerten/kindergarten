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
    <title>园所管理</title>
    <%
        String path = request.getContextPath();
    %>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <script src="${pageContext.request.contextPath}/static/X-admin/js/jquery-3.5.1.js" charset="UTF-8"></script>

    <link rel="stylesheet" href="<%=path%>/static/X-admin/css/font.css">
    <link rel="stylesheet" href="<%=path%>/static/X-admin/css/xadmin.css">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/X-admin/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/X-admin/css/bootstrap.min.css">
    <!-- <link rel="stylesheet" href="./css/theme5.css"> -->
    <script src="<%=path%>/static/X-admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=path%>/static/X-admin/js/xadmin.js"></script>
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

<input id="hid" type="hidden" value="">
<div class="layui-row layui-col-space15">
    <div class="layui-col-md12">
        <div class="layui-card">
            <div class="layui-card-body demoTable layui-form"><%--当添加layui下拉框就要在最外层加上layui-form，要不然不会显示下拉框的样式--%>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">审批时间</label>
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input " autocomplete="off" placeholder="开始日" name="start" id="start">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input" autocomplete="off" placeholder="截止日" name="end" id="end">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">园所名称</label>
                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="kinderName" lay-verify="required" id="kinderName"
                                   placeholder="请输入园所名" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">状态</label>
                    <div class="layui-input-inline">
                        <select name="quiz1" id="quiz1" lay-filter="quiz1">
                            <option value="">状态</option>
                            <option value="1" selected="">启用</option>
                        </select>
                    </div>
                    <div class="layui-input-inline ">
<%--                        <button class="layui-btn" onclick="xadmin.open('添加用户','/platform/kinder-add.jsp',600,400)">--%>
<%--                            <i class="layui-icon"></i>添加--%>
<%--                        </button>--%>
                        <button data-type="reload" class="layui-btn">查询</button>
                    </div>
                </div>
                <%--                    <div class="layui-inline layui-show-xs-block">--%>
                <%--                        <button data-type="reload" class="layui-btn" id="search"><i class="layui-icon">&#xe615;</i>--%>
                <%--                        </button>--%>
                <%--                    </div>--%>
                <%--                            </form>--%>
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
        table.render({
            limits: [5, 10, 20]
            , limit: 5,
            elem: '#usertable',
            id: 'listReload',
            page: true
            , url: "/kinderController/selectKinder"
            // ,cellMinWidth: 80 //全kin局定义常规单元格的最小宽度，layui 2.2.1 新增
            , cols: [[
                , {field: 'kinderId', title: '园所编号', fixed: 'left'}
                , {field: 'kinderName', title: '园所名称'}
                , {field: 'kinderAccount', title: '账号'}
                , {
                    field: 'approveTime', title: '审批时间', sort: true,
                    templet: function (d) {
                        console.log(d["approveTime"])
                        if (d["approveTime"] != null) {
                            return util.toDateString(d["approveTime"])
                        } else {
                            return ""
                        }
                        // util.toDateString(time, format)
                    }
                }
                , {title: '操作', align: 'center', width: 320, toolbar: '#barDemo'}


            ]],
            request: {
                pageName: 'curPage' //页码的参数名称，默认：page
                , limitName: 'pageSize' //每页数据量的参数名，默认：limit
            }

        });
        var active = {
            reload: function () {
                var kinderName = $('#kinderName').val();
                var kinderState = $("#quiz1").val();
                // console.log("kinderStatus" + kinderStatus)
                var start = $("#start").val();
                var end = $("#end").val();
                // console.log(parentsName)
                //执行重载
                table.reload('listReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {
                        kinderName: kinderName,
                        // roleID:5,//等级id，进行分类的分页查询要用
                        start: start,
                        end: end,
                        kinderState: kinderState
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
        $.ajax({
            url: "/kinderController/selectKinderState",
            type: "post",
            dataType: "json",
            success: function (datas) {
                // datas=datas.menu;
                if (datas.length > 0) {
                    $("#quiz1").empty();
                    $("#quiz1").append("<option value=''>状态</option>");
                    for (var i = 0; i < datas.length; i++) {
                        var kinder = datas[i];
                        $("#quiz1").append("<option value=" + kinder.kinderState + ">" + kinder.kinderStateText + "</option>");
                    }
                } else {
                    $("#quiz1").empty();
                    $("#quiz1").append("<option value=''>状态</option>");
                }
                form.render("select");
            }
        });
        table.on('tool(test)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            // console.log(data.parentsId);
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）

            if (layEvent === 'delete') { //
                // console.log("obj"+obj)
                layer.confirm('确认要删除吗？', function (index) {
                    //发异步删除数据
                    $.ajax({
                        url: "/kinderController/deleteKinder",
                        asnyc: true,
                        type: "Post",
                        data: "kinderId=" + data.kinderId,
                        dataType: "text",
                        success: function (msg) {
                            layer.msg("修改成功"),
                                location.reload();
                        }
                    })
                    tr.remove();
                    layer.msg('已删除!', {icon: 1, time: 1000});
                });

            }
            if (layEvent === 'restPwd') { //
                // console.log("obj"+obj)
                layer.confirm('确认重置密码为"123456"吗？', {
                    btn: ['是', '否'],
                    btn1: function () {
                        $.ajax({
                            url: "/kinderController/restPwd",
                            asnyc: true,
                            type: "Post",
                            data: "kinderId=" + data.kinderId,
                            dataType: "text",
                            success: function (msg) {
                                layer.msg("修改成功"),
                                    location.reload();
                            }
                        })

                    },
                    btn2: function () {
                        取消成功
                    }

                });
            }
            if (layEvent === 'ban') { //
                // console.log("obj"+obj)
                layer.confirm('确认要禁用吗？', function (index) {
                    //发异步删除数据
                    $.ajax({
                        url: "/kinderController/updateKinderState",
                        asnyc: true,
                        type: "Post",
                        data: "kinderId=" + data.kinderId+"&title="+'ban',
                        dataType: "text",
                        success: function (msg) {
                            layer.msg("修改成功"),
                                location.reload();
                        }
                    })
                    layer.msg('已禁用!', {icon: 1, time: 1000});
                });
            }
            if (layEvent === 'up') {
                layer.confirm('确认要启用吗？', function (index) {
                    //发异步删除数据
                    $.ajax({
                        url: "/kinderController/updateKinderState",
                        asnyc: true,
                        type: "Post",
                        data: "kinderId=" + data.kinderId+"&title="+'up',
                        dataType: "text",
                        success: function (msg) {
                            layer.msg("修改成功"),
                                location.reload();
                        }
                    })
                    layer.msg('已禁用!', {icon: 1, time: 1000});
                });
            }
            // if (layEvent === 'Modify') {
            //     document.getElementById("hid").value = data.kinderId;
                // var hid=$("#hid");
                // console.log("data.kinderId"+data.kinderId)
                // hid.val(data.kinderId);
                // layer.confirm('确认要启用吗？', function (index) {
                    //发异步删除数据
                    // $.ajax({
                    //     url: "/kinderController/updateKinderState",
                    //     asnyc: true,
                    //     type: "Post",
                    //     data: "kinderId=" + data.kinderId+"&title="+'up',
                    //     dataType: "text",
                    //     success: function (msg) {
                    //         layer.msg("修改成功"),
                    //             location.reload();
                    //     }
                    // })
                    // layer.msg('已禁用!', {icon: 1, time: 1000});
                // });
            // }

        });
    });


    /*用户-删除*/
    function member_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            //发异步删除数据
            $(obj).parents("tr").remove();
            layer.msg('已删除!', {icon: 1, time: 1000});
        });
    }

</script>
<script type="text/html" id="barDemo">

    {{#  if(d.kinderState ===2){ }}
    <a class="layui-btn layui-btn-xs" lay-event="up">启用</a>
    {{#  } }}

    {{#  if(d.kinderState ===1){ }}
    <a class="layui-btn layui-btn-xs" lay-event="ban">禁用</a>
    {{#  } }}

    <a class="layui-btn layui-btn-xs" lay-event="restPwd">重置密码</a>
<%--    <a class="layui-btn layui-btn-xs" data-toggle="modal" data-target="#myModal" lay-event="Modify">修改</a>--%>
<%--    <a class="layui-btn layui-btn-xs" lay-event="Modify"  onclick="xadmin.open('编辑','kinder-update.jsp',600,400)" href="javascript:;">--%>
<%--        修改--%>
<%--    </a>--%>
    <a class="layui-btn layui-btn-xs" lay-event="delete">删除</a>
</script>
</html>

