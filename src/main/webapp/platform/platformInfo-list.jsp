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
    <title>平台资讯</title>
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
                        <label class="layui-form-label">创建时间</label>
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input " autocomplete="off" placeholder="开始日" name="start" id="start">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input" autocomplete="off" placeholder="截止日" name="end" id="end">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">资讯名称</label>
                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="platformInfoName" lay-verify="required" id="platformInfoName"  placeholder="请输入资讯名" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"></label>

                    <div class="layui-input-inline ">
                        <button class="layui-btn" onclick="xadmin.open('添加资讯','/platform/platforminfo-add.jsp',600,400)">
                            <i class="layui-icon"></i>添加
                        </button>
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

<div id="insert_div" style="display:none;">
    <form class="layui-form" action="" id="add">
        <div class="layui-card-body demoTable ">
            <div class="layui-form-item">
                <label class="layui-form-label">资讯标题</label>
                <div class="layui-input-block">
                    <input type="text" name="platformInfoName"  lay-verify="title" autocomplete="off"  class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">创建时间</label>
                <div class="layui-input-block">
                    <input type="text" name="platformInfoTime" id="platformInfoTime" readonly="readonly" autocomplete="off" class="layui-input">
                </div>
            </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">普通文本域</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入内容" name="platformInfoDetail" id="platformInfoDetail" class="layui-textarea"></textarea>
            </div>
        </div>
        </div>
    </form>

</div>
</body>
<script>
    layui.use(['laydate', 'form', 'laypage', 'table', 'laytpl', 'util'], function () {
        // var path = $("#path").val();
        var $ = layui.$;
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
            , url: "/platformController/selectPlatformInfo"
            // ,cellMinWidth: 80 //全kin局定义常规单元格的最小宽度，layui 2.2.1 新增
            , cols: [[
                , {field: 'platformInfoId', title: '资讯编号', fixed: 'left'}
                , {field: 'platformInfoName', title: '资讯名称'}
                , {field: 'platformInfoDetail', title: '资讯内容'}
                , {
                    field: 'platformInfoTime', title: '创建时间', sort: true
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
                var platformInfoName = $('#platformInfoName').val();
                var start = $("#start").val();
                var end = $("#end").val();
                // console.log(parentsName)
                //执行重载
                table.reload('listReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {
                        platformInfoName: platformInfoName,
                        start: start,
                        end: end,
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
                        url: "/platformController/deletePlatformInfo",
                        asnyc: true,
                        type: "Post",
                        data: "platformInfoId=" + data.platformInfoId,
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


            if (layEvent === 'release') { //
                // console.log("obj"+obj)
                layer.confirm('确认要发布吗？', function (index) {
                    //发异步删除数据
                    $.ajax({
                        url: "/platformController/releaseOrCancel",
                        asnyc: true,
                        type: "Post",
                        data: "platformInfoId=" + data.platformInfoId+"&title="+'release',
                        dataType: "text",
                        success: function (msg) {
                            layer.msg("修改成功"),
                                location.reload();
                        }
                    })
                    layer.msg('已发布!', {icon: 1, time: 1000});
                });
            }
            if (layEvent === 'cancel') {
                layer.confirm('确认要取消发布吗？', function (index) {
                    //发异步删除数据
                    $.ajax({
                        url: "/platformController/releaseOrCancel",
                        asnyc: true,
                        type: "Post",
                        data: "platformInfoId=" + data.platformInfoId+"&title="+'cancel',
                        dataType: "text",
                        success: function (msg) {
                            layer.msg("修改成功"),
                                location.reload();
                        }
                    })
                    layer.msg('已取消!', {icon: 1, time: 1000});
                });
            }
            if(layEvent==='update'){
                str = '<div class="layui-form layui-form-pane">';
                str+='   <div class="layui-form-item">';
                str += "<label for='name' class='layui-form-label'>资讯标题：</label>" +
                    " <input type=\"text\" name=\"platformInfoName\" id=\"platformInfoName\"   autocomplete=\"off\" class=\" layui-input\" value='"+ data.platformInfoName +"'/>";

                str+='</div>';
                str+='   <div class="layui-form-item">';
                str += "<label for='name' class='layui-form-label'>创建时间：</label>" +
                    "<input type=\"text\" name=\"platformInfoTime\" id=\"platformInfoTime\" readonly=\"readonly\" autocomplete=\"off\" class=\"layui-input\" value='"+ data.platformInfoTime +"'>";
                str+='</div>';
                str+='   <div class="layui-form-item">';
                str += "<label class=\"layui-form-label\">资讯内容</label>" +
                    " <textarea  name=\"platformInfoDetail\" id=\"platformInfoDetail\" class=\"layui-textarea \">"+data.platformInfoDetail+"</textarea>";//
                str += '</div>';
                str+='</div>';

                var index = layer.open({
                    title: '资讯内容',
                    type: 1,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    offset: ['50px','33%'],
                    area: ['600px', '400px'],
                    btn: ['提交', '返回'],
                    btnAlign: 'c',
                    closeBtn: false,
                    id: 'LAY_layuipro',
                    moveType: 1,
                    content: str,//$('#insert_div')
                    success: function(layero,index){
                        var btn = layero.find('.layui-layer-btn');
                        btn.find('.layui-layer-btn0').click(function(){
                            // debugger
                            //layero为子窗口对象
                            var platformInfoName=layero.find('#platformInfoName').val();
                            var platformInfoDetail=layero.find('#platformInfoDetail').val();
                            // console.log("platformInfoName"+platformInfoName)
                            // console.log("platformInfoDetail"+platformInfoDetail)
                            if(platformInfoName!=''&&platformInfoName!=null && platformInfoDetail!=''&&platformInfoDetail!=null){
                                $.ajax({
                                    type:"post",
                                    url:"/platformController/updatePlatformInfo",
                                    async:true,
                                    data:{
                                        platformInfoId:data.platformInfoId,
                                        platformInfoName:platformInfoName,
                                        platformInfoDetail:platformInfoDetail,
                                    },
                                    dataType:"text",
                                    success:function(data){
                                        if(data=="success"){
                                            alert("修改成功");
                                            window.location.reload();
                                        }
                                        // alert("修改成功");
                                        // location.reload();
                                    }
                                });
                            }else{
                                alert("请输入正确信息");
                                document.getElementById("layui-layer-iframe"+index).contentWindow.location.reload();
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


</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="update">修改</a>
    {{#  if(d.platformInfoStatus ===1){ }}
    <a class="layui-btn layui-btn-xs" lay-event="release">发布</a>
    {{#  } }}
    {{#  if(d.platformInfoStatus ===2){ }}
    <a class="layui-btn layui-btn-xs" lay-event="cancel">取消发布</a>
    {{#  } }}

    {{#  if(d.platformInfoStatus ===3){ }}
    <a class="layui-btn layui-btn-xs" lay-event="release">发布</a>
    {{#  } }}
    <a class="layui-btn layui-btn-xs" lay-event="delete">删除</a>
</script>
</html>

