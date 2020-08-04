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
    <title>园所审批</title>
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/X-admin/css/bootstrap.min.css">
    <!-- <link rel="stylesheet" href="./css/theme5.css"> -->
    <script src="<%=path%>/static/X-admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=path%>/static/X-admin/js/xadmin.js"></script>

    <%--    <!--[if lt IE 9]>--%>
    <%--    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>--%>
    <%--    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>--%>
    <%--    <![endif]-->--%>
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


<div class="layui-row layui-col-space15">
    <div class="layui-col-md12">
        <div class="layui-card">
            <div class="layui-card-body demoTable layui-form"><%--当添加layui下拉框就要在最外层加上layui-form，要不然不会显示下拉框的样式--%>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">申请时间</label>
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
                            <option value="1" selected="">未审批</option>
                        </select>
                    </div>
                    <div class="layui-input-inline ">
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
<%--用户评价的模态框--%>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <%--                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>--%>
                <span class="nametitle">园所审批</span>
            </div>
            <div class="modal-body">
                <table width="100%" height="70%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <input type="hidden" value="" class="kinderId t"/>
                        <td>
                            幼儿园名称：<span class="kinderName t"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            法人：<span class="kinderLp t"></span>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            法人身份证：<span class="kinderLpid t"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            地址：<span class="kinderLpadd t"></span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            联系电话：<span class="kinderLptel t"></span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            办学许可证：<span class="schoolPermit t"></span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            卫生许可证：<span class="healthPermit t"></span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            消防许可证：<span class="firePermit t"></span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            组织代码证：<span class="groupPermit t"></span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            税务登记证：<span class="registrationPermit t"></span>
                        </td>
                    </tr>
                </table>
                <div class="modal-footer">

                    <button type="button" class="btn btn-primary" onclick="allow(this)">允许</button>
                    <button type="button" class="btn btn-primary" onclick="Refused(this)">拒绝</button>
<%--                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>--%>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
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
                , {
                    field: 'kinderRegtime', title: '申请时间', sort: true, width: 200,

                    // templet: function (d) {
                    //     // console.log(d.kinderRegtime);
                    //     return util.toDateString(d.kinderRegtime)
                    // }
                }
                , {
                    field: 'approveTime', title: '审批时间', sort: true,
                    templet: function (d) {
                        console.log(d["approveTime"])
                        if (d["approveTime"]!=null){

                            return util.toDateString(d["approveTime"])
                        }else {
                            return ""
                        }

                        // util.toDateString(time, format)
                    }
                }
                , {
                    field: 'kinderStatus',
                    title: '状态',
                    sort: true,
                    templet: function (d) {
                        // console.log(d.parentsStatus);
                        // return d.parentsStatus == 1 ? "启用":"禁用";
                        if (d.kinderStatus == 1) {
                            return "<span style='color:green'>未审批</span>";
                        } else if (d.kinderStatus == 2) {
                            return "<span style='color:green'>通过</span>";
                        } else if (d.kinderStatus == 3) {
                            return "<span style='color:red'>未通过</span>";
                        }
                    }
                }
                , {title: '操作', align: 'center', width: 150, toolbar: '#barDemo'}


            ]],
            request: {
                pageName: 'curPage' //页码的参数名称，默认：page
                , limitName: 'pageSize' //每页数据量的参数名，默认：limit
            }

        });
        var active = {
            reload: function () {
                var kinderName = $('#kinderName').val();
                var kinderStatus = $("#quiz1").val();
                console.log("kinderStatus" + kinderStatus)
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
                        kinderStatus: kinderStatus
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
            url: "/kinderController/selectKinderStatus",
            type: "post",
            dataType: "json",
            success: function (datas) {
                // datas=datas.menu;
                if (datas.length > 0) {
                    $("#quiz1").empty();
                    $("#quiz1").append("<option value=''>状态</option>");
                    for (var i = 0; i < datas.length; i++) {
                        var kinder = datas[i];
                        $("#quiz1").append("<option value=" + kinder.kinderStatus + ">" + kinder.parameterText + "</option>");
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

            if (layEvent === 'approve') { //
                // console.log("obj"+obj)
                var kinderId=$(".kinderId");
                var kinderName = $(".kinderName");
                var kinderLp = $(".kinderLp");
                var kinderLpid = $(".kinderLpid");
                var kinderLpadd = $(".kinderLpadd");
                var kinderLptel = $(".kinderLptel");
                var schoolPermit = $(".schoolPermit");
                var healthPermit = $(".healthPermit");
                var firePermit = $(".firePermit");
                var groupPermit = $(".groupPermit");
                var registrationPermit = $(".registrationPermit");
                $.ajax({
                    url: "/kinderController/selectApproveKinder",
                    asnyc: true,
                    type: "Post",
                    data: "kinderId=" + data.kinderId,
                    dataType: "json",
                    success: function (msg) {
                        // console.log(msg)
                        $(".t").empty();//每次添加数据前把模态框的内容都清空
                        kinderId.val(data.kinderId);//保存改行的id，提交数据有用
                        // console.log("kinderId"+kinderId.val())
                        kinderName.text(msg["kinderName"]);
                        kinderLp.text(msg["kinderLp"]);
                        kinderLpid.text(msg["kinderLpid"]);
                        kinderLpadd.text(msg["kinderLpadd"]);
                        kinderLptel.text(msg["kinderLptel"]);
                        schoolPermit.text(msg["schoolPermit"]);
                        healthPermit.text(msg["healthPermit"]);
                        firePermit.text(msg["firePermit"]);
                        groupPermit.text(msg["groupPermit"]);
                        registrationPermit.text(msg["registrationPermit"]);
                        // layer.msg("修改成功"),
                        //     location.reload();
                    }
                })
            }
        });


    });

    function allow() {
        var kinderId = $(".kinderId").val();//隐藏的id字段的val值
            console.log(kinderId);
            $.ajax({
                url:"/kinderController/upKinderSatus",
                async: true,
                type: "post",
                data: {
                    kinderId:kinderId,
                },
                dataType: "text",
                success: function (msg) {
                    if (msg == "success") {
                        alert("操作成功");
                        window.location.reload();
                    } else {
                        alert("操作失败");
                    }
                }
            })
    }
    function Refused() {
        var kinderId = $(".kinderId").val();//隐藏的id字段的val值
        console.log(kinderId);
        $.ajax({
            url:"/kinderController/banKinderSatus",
            async: true,
            type: "post",
            data: {
                kinderId:kinderId,
            },
            dataType: "text",
            success: function (msg) {
                if (msg == "success") {
                    alert("操作成功");
                    window.location.reload();
                } else {
                    alert("操作失败");
                }
            }
        })
    }
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" data-toggle="modal" data-target="#myModal" lay-event="approve">审批</a>
<%--    <input class="btn btn-primary btn-12g" data-toggle="modal" data-target="#myModal" type="button"--%>
<%--           value="查看详情" &lt;%&ndash;onclick="Bdetails(this)"&ndash;%&gt;/>--%>
</script>
</html>

