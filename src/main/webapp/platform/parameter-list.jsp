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
    <title>参数配置</title>
    <%
        String path = request.getContextPath();
    %>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <script src="${pageContext.request.contextPath}/static/X-admin/js/jquery-3.5.1.js" charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath}/static/X-admin/js/jquery.min.js" charset="UTF-8"></script>
    <%--    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>--%>
    <script type="text/javascript" src="/static/X-admin/dist/jquery.validate.js"></script>
    <link rel="stylesheet" href="<%=path%>/static/X-admin/css/font.css">
    <link rel="stylesheet" href="<%=path%>/static/X-admin/css/xadmin.css">
    <link rel="stylesheet" href="<%=path%>/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/X-admin/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/X-admin/css/bootstrap.min.css">
    <!-- <link rel="stylesheet" href="./css/theme5.css"> -->
    <script src="<%=path%>/static/X-admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=path%>/static/X-admin/js/xadmin.js"></script>

    <%--    <!--[if lt IE 9]>--%>
    <%--    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>--%>
    <%--    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>--%>
    <%--    <![endif]-->--%>
</head>
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
                        <label class="layui-form-label">参数名称</label>
                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="parameterText" lay-verify="required" id="parameterText"
                                   placeholder="请输入参数名" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">参数类型</label>
                    <div class="layui-input-inline">
                        <select name="parameterType" id="parameterType" lay-filter="parameterType">
                            <%--                            <option value="">菜单</option>--%>
                            <option value="account_state" selected="">账号状态</option>
                        </select>
                    </div>
                    <div class="layui-input-inline ">
                        <button class="layui-btn" onclick="xadmin.open('添加菜单','/platform/parameter-add.jsp',600,400)">
                            <i class="layui-icon"></i>添加
                        </button>
                        <button data-type="reload" class="layui-btn">查询</button>
                    </div>
                </div>
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

</div>
</div>
<%--//弹出层--%>
<div class="layui-card-body  layui-form" id="insert_div" style="display:none" lay-filter="update"><%--当添加layui下拉框就要在最外层加上layui-form，要不然不会显示下拉框的样式--%>
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">参数名称</label>
            <div class="layui-input-inline">
                <input type="text" name="parameterText" lay-verify="title" id="parameterTextTwo" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">参数类型</label>
            <div class="layui-input-inline">
                <select name="parameterType" id="parameterTypeTwo">
                    <%--                <option value="">参数类型</option>--%>
                    <%--                <option value="1" selected="">系统管理</option>--%>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">参数值</label>
            <div class="layui-input-inline">

                <input type="text" name="parameterValue" id="parameterValue" lay-verify="orderId" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
    </form>
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
        var $ = layui.$;
        table.render({
            limits: [5, 10, 20]
            , limit: 5,
            elem: '#usertable',
            id: 'listReload',
            page: true
            , url: "/platformController/selectParameterList"
            // ,cellMinWidth: 80 //全kin局定义常规单元格的最小宽度，layui 2.2.1 新增
            , cols: [[
                , {field: 'id', type: 'numbers', title: '序号', fixed: 'left'}
                , {field: 'parameterText', title: '参数名称'}
                , {field: 'parameterName', title: '参数类型', sort: true}
                , {field: 'parameterType', title: '参数类型（字符）', sort: true}
                , {field: 'parameterValue', title: '参数值', sort: true}
                , {title: '操作', align: 'center', width: 200, toolbar: '#barDemo'}


            ]],
            request: {
                pageName: 'curPage' //页码的参数名称，默认：page
                , limitName: 'pageSize' //每页数据量的参数名，默认：limit
            }

        });
        //自定义验证规则
        form.verify({
            title: function (value) {
                if (value.length < 2) {
                    return '标题至少得2个字符啊';
                }
            }
            , orderId: [
                /^\+?[1-9][0-9]*$/
                , '输入不合法'
            ]
            , content: function (value) {
                layedit.sync(editIndex);
            }
        });
        var active = {
            reload: function () {
                var parameterText = $('#parameterText').val();
                var parameterType = $("#parameterType").val();
                //获取文本框选中的值：
                //    var name = $("#parentName option:checked").text();
                //执行重载
                table.reload('listReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {
                        parameterType: parameterType,
                        parameterText: parameterText
                    }
                }, 'data');
            }
        };

        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
        //查询一级菜单
        $.ajax({
            url: "/platformController/selectParameterType",
            type: "post",
            dataType: "json",
            success: function (datas) {
                // datas=datas.menu;
                // console.log("datas.menu"+datas.menu)
                if (datas.length > 0) {
                    $("#parameterType").empty();
                    $("#parameterType").append("<option value=''>参数类型</option>");
                    for (var i = 0; i < datas.length; i++) {
                        var parameter = datas[i];
                        $("#parameterType").append("<option value=" + parameter.parameterType + ">" + parameter.parameterName + "</option>");
                    }
                } else {
                    $("#parameterType").empty();
                    $("#parameterType").append("<option value=''>参数类型</option>");
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
                        url: "/platformController/deleteParameter",
                        asnyc: true,
                        type: "Post",
                        data: "parameterId=" + data.parameterId,
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
            if (layEvent === 'update') {
                //先根据子菜单，父菜单查出下拉框
                $.ajax({
                    url: "/platformController/selectParameterType",
                    type: "post",
                    dataType: "json",
                    success: function (datas) {
                        // datas=datas.menu;
                        // console.log("datas.menu"+datas.menu)
                        if (datas.length > 0) {
                            $("#parameterTypeTwo").empty();
                            $("#parameterTypeTwo").append("<option value=''>参数类型</option>");
                            for (var i = 0; i < datas.length; i++) {
                                var parameter = datas[i];
                                $("#parameterTypeTwo").append("<option value=" + parameter.parameterType + ">" + parameter.parameterName + "</option>");
                            }
                        } else {
                            $("#parameterTypeTwo").empty();
                            $("#parameterTypeTwo").append("<option value=''>参数类型</option>");
                        }
                        form.render("select");
                    }
                });
                var index = layer.open({
                    title: '参数修改',
                    type: 1,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    offset: ['50px', '33%'],
                    area: ['600px', '400px'],
                    btn: ['提交', '返回'],
                    btnAlign: 'c',
                    closeBtn: false,
                    id: 'LAY_layuipro',
                    moveType: 1,
                    content: $('#insert_div'),
                    success: function (layero, index) {
                        //给表单赋值
                        form.val("update", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
                            "parameterText": data.parameterText // "name": "value"
                            , "parameterValue": data.parameterValue
                            // ,"check[write]": true
                            // ,"open": false
                            // ,"desc": "我爱layui"
                        });

                        // //获取表单区域所有值
                        //     var data1 = form.val("update");
                        //     console.log("data1"+data1)
                        var btn = layero.find('.layui-layer-btn');
                        btn.find('.layui-layer-btn0').click(function () {
                            // debugger
                            //layero为子窗口对象
                            var parameterText = layero.find('#parameterTextTwo').val();
                            var parameterType = layero.find('#parameterTypeTwo').val();
                            var parameterValue = layero.find('#parameterValue').val();
                            var parameterName = layero.find('#parameterTypeTwo option:selected').text();

                            // console.log("parameterName"+parameterName)
                            if (parameterText != '' && parameterText != null && parameterValue != '' && parameterValue != null) {
                                $.ajax({
                                    type: "post",
                                    url: "/platformController/updateParameter",
                                    async: true,
                                    data: {
                                        parameterId: data.parameterId,
                                        parameterText: parameterText,
                                        parameterType: parameterType,
                                        parameterValue: parameterValue,
                                        parameterName: parameterName
                                    },
                                    dataType: "text",
                                    success: function (data) {
                                        if (data == "success") {
                                            alert("修改成功");
                                            window.location.reload();
                                        }
                                        // alert("修改成功");
                                        // location.reload();
                                    }
                                });
                            } else {
                                alert("请输入正确信息");

                                document.getElementById("layui-layer-iframe" + index).contentWindow.location.reload();
                            }
                        });
                    }
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
                return false;
            }
        });
    });
    // $(function(){
    //          $("form").validate({
    //                  rules: {
    //                       userName: {
    //                              required: true, //该项表示该字段为必填项
    //                                  maxlength: 5 //表示该字段的最大长度为5
    //                              },
    //                       passWord: {
    //                           required: true,
    //                                number: true  //表示该字段必须为数字
    //                           }
    //                    },
    //                messages: {
    //                        userName: {
    //                          required: "*必填",
    //                                    maxlength: "*最多5个字符"
    //                             },
    //                      passWord: {
    //                                 required: "*必填",
    //                                   number: "*必须是合法的数字"
    //                            }
    //                    }
    //           })
    //       });
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="update">修改</a>
    <a class="layui-btn layui-btn-xs" lay-event="delete">删除</a>
</script>
</html>

