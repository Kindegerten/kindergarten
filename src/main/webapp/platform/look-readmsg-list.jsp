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
    <title>查看绘本</title>
    <%
        String path = request.getContextPath();
    %>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <script src="/static/X-admin/js/jquery-3.5.1.js" charset="UTF-8"></script>

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
    <style>
        .layui-table-cell {
            height: 80px;
            /*line-height: 60px;*/
        }
        th .layui-table-cell {
            height: 30px;
            line-height: 30px;
        }
    </style>
</head>
<body>
<%--<div class="x-nav">--%>
<%--          <span class="layui-breadcrumb">--%>
<%--            <a href="">首页</a>--%>
<%--            <a href="">演示</a>--%>
<%--            <a>--%>
<%--              <cite>导航元素</cite></a>--%>
<%--          </span>--%>
<%--    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"--%>
<%--       onclick="location.reload()" title="刷新">--%>
<%--        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>--%>
<%--</div>--%>


<div class="layui-row layui-col-space15">
    <div class="layui-col-md12">
        <div class="layui-card">
            <div class="layui-card-body layui-table-body layui-table-main">
                <table class="layui-table layui-form" id="usertable" lay-filter="test">
                </table>
            </div>
        </div>
    </div>
</div>

<%--新增图片的div--%>
<div class="layui-card-body  layui-form" id="update_div" style="display:none" lay-filter="update"><%--当添加layui下拉框就要在最外层加上layui-form，要不然不会显示下拉框的样式--%>
    <div class="layui-row">
        <form class="layui-form" lay-filter="update">
            <div class="layui-form-item">
                <div class="layui-upload">

                    <button type="button" class="layui-btn" id="test1">上传图片</button>

                    <div class="layui-upload-list">
                        <img class="layui-upload-img" name="imageUrl" src="" id="imageUrl" width="100px" height="70px">
                        <p id="demoText"></p>
                    </div>
                    <input id="credential_hide" name="credentialOne" type="hidden" lay-verify="credentialOne"
                           autocomplete="off" class="layui-input">
                    <input id="c" name="credentialOne" type="hidden" lay-verify="credentialOne"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">内容信息</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入内容" name="alt" class="layui-textarea" id="alt"></textarea>
                </div>

            </div>
            <div class="layui-form-item">
                <label for="pid" class="layui-form-label">
                    <span class="x-red">*</span>页码</label>
                <div class="layui-input-inline">
                    <input type="text" id="pid" name="pid" autocomplete="off"
                           class="layui-input"></div>
            </div>

<%--            <div class="layui-form-item">--%>
<%--                <label for="test9" class="layui-form-label"></label>--%>
<%--                <button class="layui-btn" type="button" lay-filter="formDemo" lay-submit="" id="test9">增加</button>--%>
<%--                &lt;%&ndash;                        <button type="button" class="layui-btn" id="test9">开始上传</button>&ndash;%&gt;--%>
<%--                <button class="layui-btn" lay-filter="add" onclick="close()">取消</button>--%>
<%--            </div>--%>
        </form>
    </div>
</div>
</div>
</body>
<script>
    layui.use(['laydate', 'form', 'laypage', 'table', 'laytpl', 'upload'], function () {
        // var path = $("#path").val();
        var form = layui.form;
        var laypage = layui.laypage;
        var table = layui.table;
        var laydate = layui.laydate;
        var laytpl = layui.laytpl;
        var util = layui.util;
        var upload = layui.upload;
        var $ = layui.$;
        table.render({
            // limits: [5, 10, 20]
            // , limit: 5,
            elem: '#usertable',
            id: 'listReload'
            //, page: true
            , url: "/pt/selectReadmagPhoto?readmagId=" + parent.readmagId
            // ,cellMinWidth: 80 //全kin局定义常规单元格的最小宽度，layui 2.2.1 新增
            , cols: [[
                , {field: 'pid', title: '页数', fixed: 'left'}
                , {field: 'alt', title: '内容'}
                , {
                    field: 'src', title: '图片', sort: true,
                    templet: function (d) {
                        if (d.src != null) {
                            return '<div οnclick="show_img(this)" ><img src="http://' + d.src + '" alt="" width="75px" height="75px"></a></div>';
                        } else {
                            return ""
                        }

                    }
                }
                , {title: '操作', align: 'center', toolbar: '#barDemo'}


            ]],
            // request: {
            //     pageName: 'curPage' //页码的参数名称，默认：page
            //     , limitName: 'pageSize' //每页数据量的参数名，默认：limit
            // }

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
        // var active = {
        //     reload: function () {
        //         var start = $('#start').val();
        //         var end = $("#end").val();
        //         var safetyVideoName = $("#safetyVideoName").val();
        //
        //         //获取文本框选中的值：
        //         //    var name = $("#parentName option:checked").text();
        //         //执行重载
        //         table.reload('listReload', {
        //             page: {
        //                 curr: 1 //重新从第 1 页开始
        //             }
        //             , where: {
        //                 safetyVideoName: safetyVideoName,
        //                 start: start,
        //                 end:end
        //             }
        //         }, 'data');
        //     }
        // };
        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
        /* 执行ladate实例*/
        laydate.render({
            elem: '#safetyVideoStar'
        })
        laydate.render({
            elem: '#safetyVideoEnd'
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
                        url: "/pt/deleteReadmsgPhoto?readmagPhotoId=" + data.readmagPhotoId,
                        asnyc: true,
                        type: "Post",
                        // data: "readmagId=" + data.safetyVideoId,
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
                // $('#imageUrl').change(function() {
                //     var eImg=$('#imageUrl');
                //     eImg.attr('src', getObjectURL($(this)[0].files[0]));
                //     $(this).after(eImg);
                // });
                var index = layer.open({
                    title: '修改',
                    type: 1,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    offset: ['50px', '33%'],
                    area: ['600px', '400px'],
                    btn: ['提交', '返回'],
                    btnAlign: 'c',
                    // closeBtn: false,
                    id: 'LAY_layuipro',
                    moveType: 1,
                    content: $('#update_div'),
                    success:function () {
                        // console.log("data.pid"+data.pid)
                        // var imageUrl=$("#imageUrl")
                        var eImg=$('#imageUrl');
                        eImg.attr('src', "http://"+data.src);
                        // return '<div οnclick="show_img(this)" ><img src="' + d.src + '" alt="" width="60px" height="60px"></a></div>';
                        form.val("update", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
                            // "imageUrl": data.src, // "name": "value"
                            "pid": data.pid,
                            "alt": data.alt,

                        });
                    }
                    , yes: function () {
                        // var alt = layero.find('#alt').val();
                        // var pid = layero.find('#pid').val();
                        // if (parameterText != '' && parameterText != null && parameterValue != '' && parameterValue != null) {
                        $.ajax({
                            type: "post",
                            url: "/platformController/updateReadPhoto",
                            async: true,
                            data: {
                                readmagPhotoId: data.readmagPhotoId,
                                pid: function () {
                                    return $('#pid').val()
                                },
                                alt:  function () {
                                    return $('#alt').val()
                                }
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
                    }
                    , btn2: function () {
                        layer.closeAll();
                    }

                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
                return false;
            }
        });

        function close() {
            xadmin.close();
            // 可以对父窗口进行刷新
            xadmin.father_reload();
        }
    });

    //显示大图片
    function show_img(t) {
        var t = $(t).find("img");
        //页面层
        layer.open({
            type: 1,
            skin: 'layui-layer-rim', //加上边框
            area: ['80%', '80%'], //宽高
            shadeClose: true, //开启遮罩关闭
            end: function (index, layero) {
                return false;
            },
            content: '<div style="text-align:center"><img src="' + $(t).attr('src') + '" /></div>'
        });
    }
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="update">修改</a>
    <a class="layui-btn layui-btn-xs" lay-event="delete">删除</a>
</script>
</html>

