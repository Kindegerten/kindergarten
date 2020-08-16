<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="../static/X-admin/css/font.css">
    <link rel="stylesheet" href="../static/X-admin/css/xadmin.css">
    <script src="../static/X-admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../static/X-admin/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        .title {
            font-size: 17px;
        }
    </style>
</head>

<body>
<%--<div class="layui-fluid">--%>
<%--    <div class="layui-row" >--%>
<%--        <h1 align="center">安全教育试题</h1>--%>
<%--        <br>--%>
<%--        <form class="layui-form" action="">--%>
<%--            <button id="add" class="layui-btn">新增</button>--%>
<%--&lt;%&ndash;            <div class="layui-input-block" id="main">&ndash;%&gt;--%>

<%--&lt;%&ndash;            </div>&ndash;%&gt;--%>
<%--            --%>
<%--            <div class="layui-form-item">--%>
<%--&lt;%&ndash;                <div class="layui-input-block">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <button type="submit" class="layui-btn layui-btn-lg" lay-submit="" lay-filter="demo1">立即提交</button>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </div>&ndash;%&gt;--%>
<%--            </div>--%>
<%--        </form>--%>

<%--    </div>--%>
<%--</div>--%>
<div class="layui-row layui-col-space15">
    <div class="layui-col-md12">
        <div class="layui-card">
            <div class="layui-card-body demoTable layui-form"><%--当添加layui下拉框就要在最外层加上layui-form，要不然不会显示下拉框的样式--%>

                <div class="layui-form-item">

                    <div class="layui-input-inline ">
                        <%--                        <button data-type="reload" class="layui-btn">查询</button>--%>
                        <button id="add" class="layui-btn">新增</button>
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
<%--//弹出层--%>
<div class="layui-card-body   layui-form" id="insert_div" style="display:none"
     lay-filter="update"><%--当添加layui下拉框就要在最外层加上layui-form，要不然不会显示下拉框的样式--%>
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">题目内容</label>
            <div class="layui-input-inline">
                <input type="text" name="safetyVtqName" lay-verify="required|title" id="safetyVtqName"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">a选项</label>
            <div class="layui-input-block">
                <input type="text" name="a" id="a" lay-verify="required|title" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">选项得分</label>
            <div class="layui-input-inline">
                <input type="text" name="aValue" id="aValue" lay-verify="required|orderId" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">b选项</label>
            <div class="layui-input-block">
                <input type="text" name="b" id="b" lay-verify="required|title" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">b选项得分</label>
            <div class="layui-input-inline">
                <input type="text" name="bValue" id="bValue" lay-verify="required|orderId" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
    </form>
</div>
<div class="layui-card-body   layui-form" id="update_div" style="display:none"
     lay-filter="update"><%--当添加layui下拉框就要在最外层加上layui-form，要不然不会显示下拉框的样式--%>
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">题目内容</label>
            <div class="layui-input-inline">
                <input type="text" name="safetyVtqName" lay-verify="required|title" id="safetyVtqNameTwo"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">a选项</label>
            <div class="layui-input-block">
                <input type="text" name="a" id="aTwo" lay-verify="required|title" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">选项得分</label>
            <div class="layui-input-inline">
                <input type="text" name="aValue" id="aValueTwo" lay-verify="required|orderId" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">b选项</label>
            <div class="layui-input-block">
                <input type="text" name="b" id="bTwo" lay-verify="required|title" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">b选项得分</label>
            <div class="layui-input-inline">
                <input type="text" name="bValue" id="bValueTwo" lay-verify="required|orderId" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
    </form>
</div>
</body>
<script type="text/javascript" src="/static/jquery-3.5.1.js"></script>
<script>
    layui.use(['form', 'layedit', 'laydate', 'table'], function () {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate
            , table = layui.table;
        //自定义验证规则

        form.verify({
            title: function (value) {
                if (value.length < 2) {
                    return '内容至少得2个字符啊';
                }
            }
            , orderId: [
                /^\+?[1-9][0-9]*$/
                , '输入不合法'
            ]
            // ,content: function(value){
            //     layedit.sync(editIndex);
            // }
        });
        table.render({
            limits: [5, 10, 20]
            , limit: 5,
            elem: '#usertable'
            ,id: 'listReload'
            ,page: true
            // ,data: {"videoId": parent.videoId}
            , url: "/platformController/SearchQuestion?videoId="+ parent.videoId
            // ,cellMinWidth: 80 //全kin局定义常规单元格的最小宽度，layui 2.2.1 新增
            , cols: [[
                , {field: 'id', type: 'numbers', title: '序号', fixed: 'left'}
                , {field: 'safetyVtqName', title: '题目内容'}
                , {field: 'a', title: 'a选项', sort: true}
                , {field: 'aValue', title: 'a选项得分', sort: true}
                , {field: 'b', title: 'b选项', sort: true}
                , {field: 'bValue', title: 'b选项得分', sort: true}
                , {title: '操作', align: 'center', width: 150, toolbar: '#barDemoTwo'}
            ]],
            request: {
                pageName: 'curPage' //页码的参数名称，默认：page
                , limitName: 'pageSize' //每页数据量的参数名，默认：limit
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
                        url: "/platformController/deleteSafetyVtq",
                        asnyc: true,
                        type: "Post",
                        data: "safetyVtqId=" + data.safetyVtqId,
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
                var index = layer.open({
                    title: '题目修改',
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
                    content: $('#update_div'),
                    success: function (layero, index) {
                        //给表单赋值
                        form.val("update", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
                            "safetyVtqName": data.safetyVtqName // "name": "value"
                            , "a": data.a
                            , "aValue": data.aValue
                            , "b": data.b
                            , "bValue": data.bValue
                        });

                        // //获取表单区域所有值
                        //     var data1 = form.val("update");
                        //     console.log("data1"+data1)
                        var btn = layero.find('.layui-layer-btn');
                        btn.find('.layui-layer-btn0').click(function () {
                            // debugger
                            //layero为子窗口对象
                            var safetyVtqName = layero.find('#safetyVtqNameTwo').val();
                            var a = layero.find('#aTwo').val();
                            var aValue = layero.find('#aValueTwo').val();
                            var b = layero.find('#bTwo').val();
                            var bValue = layero.find('#bValueTwo').val();
                            // if (parameterText != '' && parameterText != null && parameterValue != '' && parameterValue != null) {
                                $.ajax({
                                    type: "post",
                                    url: "/platformController/updateSafetyVtq",
                                    async: true,
                                    data: {
                                        safetyVtqId: data.safetyVtqId,
                                        safetyVtqName: safetyVtqName,
                                        a: a,
                                        aValue: aValue,
                                        b: b,
                                        bValue: bValue
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
                            // } else {
                            //     alert("请输入正确信息");
                            //
                            //     document.getElementById("layui-layer-iframe" + index).contentWindow.location.reload();
                            // }
                        });
                    }
                });
                // $(window).on("resize", function () {
                //     layer.full(index);
                // });
                return false;
            }
        });
        $('#add').on('click', function () {
            // var type = $(this).data('type');
            // active[type] ? active[type].call(this) : '';
            layer.open({
                title: '新增选项',
                type: 1,
                shade: 0.2,
                maxmin: true,
                shadeClose: true,
                offset: ['50px', '13%'],
                area: ['500px', '350px'],
                btn: ['提交', '返回'],
                btnAlign: 'c',
                closeBtn: false,
                id: 'LAY_layuipro',
                moveType: 1,
                content: $('#insert_div'),
                yes: function (index, layero) {
                    var safetyVtqName = layero.find('#safetyVtqName').val();
                    var a = layero.find('#a').val();
                    var aValue = layero.find('#aValue').val();
                    var b = layero.find('#b').val();
                    var bValue = layero.find('#bValue').val();
                    // console.log("safetyVtqName"+safetyVtqName)
                    // console.log("menuName"+a)
                    // console.log("parent"+aValue)
                    // console.log("menuUrl"+b)
                    // console.log("orderId"+bValue)
                    $.ajax({
                        type: "post",
                        url: "/platformController/insertSafetyVtq",
                        async: true,
                        data: {
                            safetyVideoId: parent.videoId,
                            safetyVtqName: safetyVtqName,
                            a: a,
                            aValue: aValue,
                            b: b,
                            bValue: bValue,
                        },
                        dataType: "text",
                        success: function (data) {
                            if (data == "success") {
                                alert("增加成功");
                                window.location.reload();
                            }
                            // alert("修改成功");
                            // location.reload();
                        }
                    });
                },
                btn2: function (index, layero) {
                    layer.close(index);
                }
            });
            return false;//防止打开子窗口后自动关闭
        });


    });


</script>
<script type="text/html" id="barDemoTwo">
    <a class="layui-btn layui-btn-xs" lay-event="update">修改</a>
    <a class="layui-btn layui-btn-xs" lay-event="delete">删除</a>
    <%--    <input class="btn btn-primary btn-12g" data-toggle="modal" data-target="#myModal" type="button"--%>
    <%--           value="查看详情" &lt;%&ndash;onclick="Bdetails(this)"&ndash;%&gt;/>--%>
</script>
</html>