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
    <title>亲子阅读管理</title>
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
                        <label class="layui-form-label">上传时间</label>
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input " autocomplete="off" placeholder="开始日" name="start" id="start">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input" autocomplete="off" placeholder="截止日" name="end" id="end">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">绘本名称</label>
                        <div class="layui-input-inline">
                            <input type="text" id="readmagName" name="readmagName" required=""
                                   autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-inline ">
                        <button class="layui-btn" id="withExport">创建绘本</button>
                    </div>
                    <div class="layui-input-inline ">
                        <button data-type="reload" class="layui-btn">查询</button>
                    </div>
                </div>
            </div>
            <div class="layui-card-body layui-table-body layui-table-main">
                <table class="layui-table layui-form" id="usertable" lay-filter="test">
                </table>
            </div>
        </div>
    </div>
</div>

<div class="layui-card-body  layui-form" id="insert_readmag_div" style="display:none"
     lay-filter="update"><%--当添加layui下拉框就要在最外层加上layui-form，要不然不会显示下拉框的样式--%>
    <div class="layui-row">
        <form class="layui-form" lay-filter="update">
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">绘本标题</label>
                <div class="layui-input-block">
                    <input type="text" id="readmagNameTwo" name="readmagName" required="" autocomplete="off"
                           class="layui-input">
                </div>

            </div>
            <div class="layui-form-item">
                <div class="layui-upload">
                    <button type="button" class="layui-btn" id="test1">上传封面图片</button>
                    <div class="layui-upload-list">
                        <img class="layui-upload-img" id="demo1" width="100px" height="100px">
                        <p id="demoText"></p>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <button type="button" class="layui-btn" id="test9">开始上传</button>
<%--                <button type="button" class="layui-btn" id="canel" onclick="close()">取消</button>--%>
            </div>
        </form>
    </div>
</div>

<div class="layui-card-body  layui-form" id="insert_photo_div" style="display:none"
     lay-filter="update"><%--当添加layui下拉框就要在最外层加上layui-form，要不然不会显示下拉框的样式--%>
    <div class="layui-row">
        <form class="layui-form" lay-filter="update">
            <div class="layui-form-item">
                <div class="layui-upload">
                    <button type="button" class="layui-btn" id="test">上传图片</button>
                    <div class="layui-upload-list">
                        <img class="layui-upload-img" id="demo" width="100px" height="100px">
                        <p id="demoTextTwo"></p>
                    </div>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">内容信息</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入内容" class="layui-textarea" id="alt"></textarea>
                </div>

            </div>
            <div class="layui-form-item">
                <label for="pid" class="layui-form-label">
                    <span class="x-red">*</span>页码</label>
                <div class="layui-input-inline">
                    <input type="text" id="pid" name="pid" autocomplete="off"
                           class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <button type="button" class="layui-btn" id="test10">开始上传</button>
<%--                <button type="button" class="layui-btn" id="canelTwo" onclick="close()">取消</button>--%>
            </div>
        </form>
    </div>
</div>
</body>
<script>
    layui.use(['laydate', 'form', 'laypage', 'table', 'laytpl', 'util', 'upload'], function () {
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
            limits: [5, 10, 20]
            , limit: 5,
            elem: '#usertable',
            id: 'listReload',
            page: true
            , url: "/pt/selectReadmag"
            // ,cellMinWidth: 80 //全kin局定义常规单元格的最小宽度，layui 2.2.1 新增
            , cols: [[
                , {field: 'readmagId', title: '绘本编号', fixed: 'left'}
                , {field: 'readmagName', title: '绘本名称'}
                , {field: 'readmagTime', title: '上传时间', sort: true}
                // , {field: 'readmagDocumentUrl', title: '文件夹路径', sort: true}
                , {title: '操作', align: 'center', toolbar: '#barDemo'}


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
                var start = $('#start').val();
                var end = $("#end").val();
                var readmagName = $("#readmagName").val();

                //获取文本框选中的值：
                //    var name = $("#parentName option:checked").text();
                //执行重载
                table.reload('listReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {
                        readmagName: readmagName,
                        start: start,
                        end: end
                    }
                }, 'data');
            }
        };
        /* 执行ladate实例*/
        laydate.render({
            elem: '#Start'
        })
        laydate.render({
            elem: '#end'
        });
        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        table.on('tool(test)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            // console.log(data.parentsId);
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
            window.readmagId = data.readmagId;
            if (layEvent === 'delete') { //
                // console.log("obj"+obj)
                layer.confirm('确认要删除吗？', function (index) {
                    //发异步删除数据
                    $.ajax({
                        url: "/pt/deleteReadmsg",
                        asnyc: true,
                        type: "Post",
                        data: "readmagId=" + data.readmagId,
                        dataType: "text",
                        success: function (msg) {
                            if (msg=="success"){
                                layer.msg("修改成功"),
                                    location.reload();
                            }

                        }
                    })
                    tr.remove();
                    layer.msg('已删除!', {icon: 1, time: 1000});
                });

            }
            if (layEvent === 'addPhoto') {
                var index = layer.open({
                    title: '上传绘本图片',
                    type: 1,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    offset: ['50px', '33%'],
                    area: ['750px', '500px'],
                    // btn: ['提交', '返回'],
                    btnAlign: 'c',
                    // closeBtn: false,
                    id: 'LAY_layuipro',
                    moveType: 1,
                    content: $('#insert_photo_div'),
                    success: function () {
                        //选完文件后不自动上传

                        //普通图片上传
                        var uploadInst = upload.render({
                            elem: '#test'
                            , url: '/platformController/uploadReadmagPhoto' //改成您自己的上传接口
                            , auto: false
                            //,multiple: true
                            , bindAction: '#test10'
                            , data: {
                                readmagId: function () {
                                    return data.readmagId;
                                },
                                alt: function () {
                                    return $("#alt").val();
                                },
                                pid: function () {
                                    return $("#pid").val();
                                }
                            }
                             , choose: function (obj) {
                                //预读本地文件示例，不支持ie8
                                obj.preview(function (index, file, result) {

                                    $('#demo').attr('src', result); //图片链接（base64）
                                });
                            }
                            , done: function (res,index,files) {
                                //如果上传失败
                                if (res.code > 0) {
                                    return layer.msg('上传失败');
                                } else {

                                    layer.msg(res.msg);
                                    layer.closeAll();
                                    $("#alt").val("");
                                    $("#pid").val("");
                                    delete files[index];

                                    // xadmin.close();
                                    // // 可以对父窗口进行刷新
                                    // xadmin.father_reload();
                                }
                                //上传成功
                            }
                            , error: function () {
                                //演示失败状态，并实现重传
                                var demoText = $('#demoText');
                                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                                demoText.find('.demo-reload').on('click', function () {
                                    uploadInst.upload();
                                });
                            }
                        });
                    }
                })
            }

        });

        $("#withExport").click(function () {
            // layer.msg("点击事件");
            var index = layer.open({
                title: '重新上传',
                type: 1,
                shade: 0.2,
                maxmin: true,
                shadeClose: true,
                offset: ['50px', '33%'],
                area: ['750px', '400px'],
                // btn: ['提交', '返回'],
                btnAlign: 'c',
                // closeBtn: false,
                id: 'LAY_layuipro',
                moveType: 1,
                content: $('#insert_readmag_div'),
                success: function () {
                    //选完文件后不自动上传

                    //普通图片上传
                    var uploadInst = upload.render({
                        elem: '#test1'
                        , url: '/platformController/uploadReadmag' //改成您自己的上传接口
                        , auto: false
                        //,multiple: true
                        , bindAction: '#test9'
                        , data: {
                            readmagName: function () {
                                return $("#readmagNameTwo").val();
                            }
                        }
                        , choose: function (obj) {
                            //预读本地文件示例，不支持ie8
                            obj.preview(function (index, file, result) {
                                // $('#test1').change(function () {
                                //     var eImg = $('#demo1');
                                //     eImg.attr('src', result);
                                //     // $(this).after(eImg);
                                // });
                                $('#demo1').attr('src', result); //图片链接（base64）
                            });
                        }
                        , done: function (res,index,files) {
                            //如果上传失败
                            if (res.code > 0) {
                                return layer.msg('上传失败');
                            } else {
                                layer.msg(res.msg);
                                layer.closeAll();
                                $("#readmagNameTwo").val("");
                                delete files[index];
                                location.reload();
                                // xadmin.close();
                                // // 可以对父窗口进行刷新
                                // xadmin.father_reload();
                            }
                            //上传成功
                        }
                        , error: function () {
                            //演示失败状态，并实现重传
                            var demoText = $('#demoText');
                            demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                            demoText.find('.demo-reload').on('click', function () {
                                uploadInst.upload();
                            });
                        }
                    });
                }
            })
            // return false;
        });
        function close() {
            layer.closeAll();
        }
    });

</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="查看绘本" onclick="xadmin.open('查看绘本','look-readmsg-list.jsp',900,480)">查看绘本</a>
    <a class="layui-btn layui-btn-xs" lay-event="addPhoto">新增图片</a>
    <%--    <a class="layui-btn layui-btn-xs" lay-event="安全试题" onclick="xadmin.open('安全试题','question-update.jsp',900,480)">重新上传</a>--%>
    <a class="layui-btn layui-btn-xs" lay-event="delete">删除</a>
</script>
</html>

