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
    <title>安全教育管理</title>
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
                    <label for="safetyVideoName" class="layui-form-label">
                        <span class="x-red">*</span>文件名称</label>
                    <div class="layui-input-inline">
                        <input type="text" id="safetyVideoName" name="safetyVideoName" required="" lay-verify="pass" autocomplete="off" class="layui-input"></div>
                    </div>
                    </div>
                <div class="layui-form-item">
                    <div class="layui-input-inline ">
                        <button class="layui-btn" onclick="xadmin.open('上传视频','/platform/video-add.jsp',600,400)">
                            <i class="layui-icon"></i>上传视频
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
<div class="layui-card-body  layui-form" id="insert_div" style="display:none"
     lay-filter="update"><%--当添加layui下拉框就要在最外层加上layui-form，要不然不会显示下拉框的样式--%>
    <form class="layui-form">
        <div class="layui-form-item">
            <label for="securityPhone" class="layui-form-label">
                <span class="x-red">*</span>上传视频</label>
            <div class="layui-input-inline">
                <input type="file" id="securityPhone" name="securityPhone" required="" lay-verify="required|phone"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="securityName" class="layui-form-label">
                <span class="x-red">*</span>视频名称</label>
            <div class="layui-input-inline">
                <input type="text" id="securityName" name="securityName" required="" lay-verify="nikename"
                       autocomplete="off" class="layui-input"></div>
        </div>
        <div class="layui-form-item">
            <label for="securityPwd" class="layui-form-label">
                <span class="x-red">*</span>文件名称</label>
            <div class="layui-input-inline">
                <input type="password" id="securityPwd" name="securityPwd" required="" lay-verify="pass"
                       autocomplete="off" class="layui-input"></div>
        </div>

        <div class="layui-form-item">
            <label for="securityAge" class="layui-form-label">
                <span class="x-red">*</span>文件地址</label>
            <div class="layui-input-inline">
                <input type="text" id="securityAge" name="securityAge" required="" lay-verify="teacherAge"
                       autocomplete="off" class="layui-input"></div>
            <div class="layui-form-mid layui-word-aux"></div>
        </div>

        <div class="layui-form-item">
            <label for="securityAge" class="layui-form-label"></label>
            <button class="layui-btn" lay-filter="add" lay-submit="">增加</button>
        </div>
        <button class="layui-btn" lay-filter="add" lay-submit="">取消</button>
    </form>
</div>

</div>
</div>
</body>
<script>
    layui.use(['laydate', 'form', 'laypage', 'table', 'laytpl', 'util','upload'], function () {
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
            , url: "/platformController/selectSafetyVideo"
            // ,cellMinWidth: 80 //全kin局定义常规单元格的最小宽度，layui 2.2.1 新增
            , cols: [[
                , {field: 'safetyVideoId', type: 'numbers', title: '视频编号', fixed: 'left'}
                , {field: 'safetyVideoName', title: '视频名称'}
                , {field: 'videoName', title: '文件名称', sort: true}
                , {field: 'videoAdd', title: '文件地址', sort: true}
                , {field: 'safetyVideoTime', title: '上传时间', sort: true,
                    templet: function (d) {
                        // console.log(d["safetyVideoTime"])
                        if (d["safetyVideoTime"] != null) {
                            return util.toDateString(d["safetyVideoTime"])
                        } else {
                            return ""
                        }
                        // util.toDateString(time, format)
                    }}
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
                var start = $('#start').val();
                var end = $("#end").val();
                var safetyVideoName = $("#safetyVideoName").val();

                //获取文本框选中的值：
                //    var name = $("#parentName option:checked").text();
                //执行重载
                table.reload('listReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {
                        safetyVideoName: safetyVideoName,
                        start: start,
                        end:end
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

            if (layEvent === 'delete') { //
                // console.log("obj"+obj)
                layer.confirm('确认要删除吗？', function (index) {
                    //发异步删除数据
                    $.ajax({
                        url: "/platformController/deleteSafetyVideo",
                        asnyc: true,
                        type: "Post",
                        data: "safetyVideoId=" + data.safetyVideoId,
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

                var index = layer.open({
                    title: '资讯内容',
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
                        //多图片上传
                        upload.render({
                            elem: '#test2'
                            ,url: '' //改成您自己的上传接口
                            ,multiple: true
                            ,before: function(obj){
                                //预读本地文件示例，不支持ie8
                                obj.preview(function(index, file, result){
                                    console.log("file.name"+file.name)
                                    //给表单赋值
                                    form.val("update", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
                                        "securityName":file.name // "name": "value"
                                        // , "menuUrl": data.menuUrl
                                        // , "orderId": data.orderId
                                        // ,"check[write]": true
                                        // ,"open": false
                                        // ,"desc": "我爱layui"
                                    });
                                    // $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
                                });
                            }
                            ,done: function(res){
                                //上传完毕
                            }
                        });


                        // //获取表单区域所有值
                        //     var data1 = form.val("update");
                        //     console.log("data1"+data1)
                        var btn = layero.find('.layui-layer-btn');
                        btn.find('.layui-layer-btn0').click(function () {
                            // debugger
                            //layero为子窗口对象
                            var menuName = layero.find('#menuNameTwo').val();
                            var parentId = layero.find('#parentNameone').val();
                            var menuUrl = layero.find('#menuUrl').val();
                            var orderId = layero.find('#orderId').val();
                            console.log("menuName" + menuName)
                            console.log("parent" + parentId)
                            console.log("menuUrl" + menuUrl)
                            console.log("orderId" + orderId)
                            // if(platformInfoName!=''&&platformInfoName!=null && platformInfoDetail!=''&&platformInfoDetail!=null){
                            $.ajax({
                                type: "post",
                                url: "/platformController/updateMenu",
                                async: true,
                                data: {
                                    menuId: data.menuId,
                                    parentId: parentId,
                                    menuName: menuName,
                                    menuUrl: menuUrl,
                                    orderId: orderId,
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
                            // }else{
                            //     alert("请输入正确信息");
                            //     document.getElementById("layui-layer-iframe"+index).contentWindow.location.reload();
                            // }
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

</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="update">重新上传</a>
    <a class="layui-btn layui-btn-xs" lay-event="delete">删除</a>
</script>
</html>

