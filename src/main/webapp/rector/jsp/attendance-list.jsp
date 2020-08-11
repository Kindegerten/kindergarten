<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
<%String path = request.getContextPath();%>
<head>
    <meta charset="UTF-8">
    <title>考勤管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
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
<input type="hidden" id="path" value=<%=path%>>
<input type="hidden" id="kinderId" value="${rector.kinderId}">
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
                <div class="layui-card-body ">
                    <div class="layui-card-body demoTable">

                            <label class="layui-form-label">搜索</label>
                            <div class="layui-inline layui-show-xs-block">
                                <input type="text" name="saStaffname" id="saStaffname" placeholder="教职工名字"
                                       autocomplete="off"
                                       class="layui-input" value="${saStaffname}">
                            </div>
                            <div class="layui-inline layui-show-xs-block">
                                <form class="layui-form">
                                <select lay-filter="mySelect" id="saRolename" name="saRolename">
                                    <option value="班主任">班主任</option>
                                    <option value="安保员">安保员</option>
                                    <option value="保健员">保健员</option>
                                </select>
                                </form>
                            </div>
                            <div class="layui-inline layui-show-xs-block">
                                <button class="layui-btn" data-type="reload"
                                        id="search"><i
                                        class="layui-icon">&#xe615;</i></button>
                            </div>
                    </div>
                </div>
<%--                <div class="layui-card-header">--%>
<%--                    &lt;%&ndash;                    <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                    </button>&ndash;%&gt;--%>
<%--                    <button class="layui-btn" onclick="xadmin.open('新增考勤','./attendance.jsp',500,400)"><i--%>
<%--                            class="layui-icon"></i>新增考勤--%>
<%--                    </button>--%>
<%--                </div>--%>
                <div class="layui-card-body layui-table-body layui-table-main">
                    <table class="layui-table layui-form" id="bodytable" lay-filter="test">

                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="check">查看考勤信息</a>

</script>

<script>

    // 列表展示及分页
    layui.use(['laydate', 'form', 'laypage', 'table', 'laytpl'], function () {
        var path = $("#path").val();
        var form = layui.form;
        var table = layui.table;
        var laydate = layui.laydate;
        var kinderId = $("#kinderId").val();

        table.render({
            limits: [5, 10, 20]
            , limit: 5,
            elem: '#bodytable',
            id: 'listReload',
            page: true
            , url: path + '/RectorControl/attendanceList'
            , where: {
                kinderId: kinderId,
                // teacherName:teacherName,
            }
            , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , cols: [[
                {field: 'id', type: 'checkbox', title: 'ID'}
                , {field: 'saId', title: '考勤编号', width: 50, sort: true}
                , {field: 'staffId', title: '教职工Id',hide:true}
                , {field: 'saStaffname', title: '教职工名称'}
                , {field: 'saRolename', title: '角色名称', sort: true}
                , {field: 'saTimescope', title: '考勤时间', sort: true}
                , {title: '操作', align: 'center', toolbar: '#barDemo'}
            ]],
            request: {
                pageName: 'curPage' //页码的参数名称，默认：page
                , limitName: 'pageSize' //每页数据量的参数名，默认：limit
            }
        });
        var active = {
            reload: function () {
                var saStaffname = $('#saStaffname').val();
                var saRolename = $("#saRolename").val();
                var kinderId = $("#kinderId").val();
                console.log(saStaffname,saRolename,kinderId);
                //执行重载
                table.reload('listReload', {//重载表格数据
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {
                        saStaffname: saStaffname,
                        saRolename: saRolename,
                        kinderId: kinderId
                    }
                }, 'data');
            }
        };
        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
        //日期渲染
        laydate.render({
            elem: '#studentBirth'
        });
        //表格操作，进行编辑修改等
        table.on('tool(test)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
            console.log(data);
            window.saStaffname=data.saStaffname;
            window.saRolename=data.saRolename;
            window.staffId=data.staffId;
            console.log(saStaffname,saRolename,staffId);
            //查看当前行具体信息
            if (layEvent === "check") {
                        layer.open({
                            title: '查看考勤情况',
                            type: 2,
                            area: ['800px', '450px'],
                            content: '${pageContext.request.contextPath}/rector/jsp/attendance.jsp' ,
                            success: function(layero, index) {
                                // form.val("addform", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
                                //     "staffId": parent.staffId // "name": "value"
                                //     , "saStaffname": data.saStaffname
                                //     , "saRolename": parent.saRolename
                                // });

                            }

                        })
            }
            //删除当前行
            // if (layEvent === "del") {
            //     console.log(data.field);
            //     layer.confirm('确认要做此操作吗？', function (index) {
            //         if (index) {
            //             $.ajax({
            //                     url: "/RectorControl/deleteStudent",
            //                     async: true,
            //                     type: "post",
            //                     data: {
            //                         "studentId": data.studentId,
            //                     },
            //                     datatype: "text",
            //                     success: function (msg) {
            //                         alert(msg);
            //                         if (msg === "success") {
            //                             layer.msg('删除成功!刷新浏览器', {icon: 1, time: 5000});
            //                             parent.location.reload();
            //                         } else {
            //                             layer.msg('删除失败');
            //                         }
            //                     },
            //                     error: function () {
            //                         alert("网络繁忙！");
            //                     },
            //                 }
            //             );
            //         }
            //     })
            // }
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
    });
    //弹出层表单操作，主要是提交



    //
    //
    // /*用户-停用*/
    // function member_stop(obj, id) {
    //     layer.confirm('确认要停用吗？', function (index) {
    //         if ($(obj).attr('title') == '启用') {
    //             //发异步把用户状态进行更改
    //             $(obj).attr('title', '停用')
    //             $(obj).find('i').html('&#xe62f;');
    //             $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
    //             layer.msg('已停用!', {icon: 5, time: 1000});
    //         } else {
    //             $(obj).attr('title', '启用')
    //             $(obj).find('i').html('&#xe601;');
    //             $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
    //             layer.msg('已启用!', {icon: 5, time: 1000});
    //         }
    //     });
    // }
    //
    // /*用户-删除*/
    // function member_del(obj, id) {
    //     layer.confirm('确认要删除吗？', function (index) {
    //         //发异步删除数据
    //         $(obj).parents("tr").remove();
    //         layer.msg('已删除!', {icon: 1, time: 1000});
    //     });
    // }
    //
    //
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
</html>