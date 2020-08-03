<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
<%String path = request.getContextPath();%>
<head>
    <meta charset="UTF-8">
    <title>体检列表</title>
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
                        <label class="layui-form-label">搜索园所班级</label>
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input" autocomplete="off" placeholder="园所名（如“英才幼儿园”）"
                                   id="kinderName" name="kinderName" value="${kinderName}">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="className" placeholder="班级名(如“小一班”)" autocomplete="off"
                                   id="className" class="layui-input" value="${className}">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <button class="layui-btn" data-type="reload"
                                    id="search"><i
                                    class="layui-icon">&#xe615;</i></button>
                        </div>
                    </div>
                </div>
                <div class="layui-card-header">
                    <%--                    <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除--%>
                    <%--                    </button>--%>
                    <button class="layui-btn" onclick="xadmin.open('新增体检情况','./bodyCheck-add.jsp',450,400)"><i
                            class="layui-icon"></i>新增体检情况
                    </button>
                </div>
                <div class="layui-card-body layui-table-body layui-table-main">
                    <table class="layui-table layui-form" id="bodytable" lay-filter="test">

                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<%--//修改体检信息的div--%>
<div hidden class="layui-fluid" id="updateDiv">
    <div class="layui-row">
        <form class="layui-form" action="" method="post">
            <div class="layui-form-item">
                <label class="layui-form-label">宝宝ID</label>
                <div  hidden class="layui-input-inline">
                    <input hidden readonly type="text" id="sid" name="sid" required lay-verify="required" autocomplete="off"
                           placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
            <label class="layui-form-label">宝宝名称</label>
            <div class="layui-input-inline">
                <input type="text" id="studentName" name="studentName" required lay-verify="required" autocomplete="off"
                       placeholder="" class="layui-input">
            </div>
        </div>
            <div class="layui-form-item">
                <label class="layui-form-label">身高</label>
                <div class="layui-input-inline">
                    <input type="text" id="height" name="height" required lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">体重</label>
                <div class="layui-input-inline">
                    <input type="text" id="weight" name="weight" required lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">视力</label>
                <div class="layui-input-inline">
                    <input type="text" id="vision" name="vision" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">体温</label>
                <div class="layui-input-inline">
                    <input type="text" id="temperature" name="temperature" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">健康状况</label>
                <div class="layui-input-inline">
                    <%--                    <input type="radio" name="sex" value="男" title="男">--%>
                    <%--                    <input type="radio" name="sex" value="女" title="女" checked>--%>
                    <input type="text" id="healthStatus" name="healthStatus" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="examinationData">保存</button>
                    <button type="reset" class="layui-btn layui-btn-primary">取消</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit" >修改</a>
</script>


<script>
    // 体检列表展示及分页
    layui.use(['laydate', 'form', 'laypage', 'table', 'laytpl'], function () {
        var path = $("#path").val();
        var form = layui.form;
        var laypage = layui.laypage;
        var table = layui.table;
        var laydate = layui.laydate;
        var laytpl = layui.laytpl;
        table.render({
            limits: [5, 10, 20]
            , limit: 5,
            elem: '#bodytable',
            id: 'listReload',
            page: true
            , url: path + '/HealtherControl/bodyCheck'
            , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , cols: [[
                {field: 'id', type: 'checkbox', title: 'ID'}
                , {field: 'sid', title: '宝宝编号', width: 50, sort: true}
                , {field: 'studentName', title: '宝宝名称'}
                , {field: 'height', title: '身高', sort: true}
                , {field: 'weight', title: '体重', sort: true}
                , {field: 'vision', title: '视力', sort: true}
                , {field: 'temperature', title: '体温', sort: true}
                , {field: 'healthStatus', title: '健康状况', sort: true}
                , {field: 'examinationTime', title: '体检时间', sort: true}
                , {title: '操作', align: 'center', toolbar: '#barDemo'}
            ]],
            request: {
                pageName: 'curPage' //页码的参数名称，默认：page
                , limitName: 'pageSize' //每页数据量的参数名，默认：limit
            }
        });
        var active = {
            reload: function () {
                var kinderName = $('#kinderName').val();
                var className = $("#className").val();
                //执行重载
                table.reload('listReload', {//重载表格数据
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {
                        kinderName: kinderName,
                        className: className,
                    }
                }, 'data');
            }
        };
        //表格操作，进行编辑修改等
        table.on('tool(test)', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
            if(layEvent=="edit") {
                layer.confirm('确认要做此操作吗？', function (index) {
                    if (index) {
                      layer.open({
                          title:'修改体检情况',
                          type:1,
                          area:['400px','400px'],
                          content:$('#updateDiv'),
                          success:function(layero,index){
                              console.log(data);
                              $("#sid").val(data.sid);
                              console.log($("#sid"))
                              $("#studentName").val(data.studentName);
                              $("#height").val(data.height);
                              $("#weight").val(data.weight);
                              $("#vision").val(data.vision);
                              $("#temperature").val(data.temperature);
                              $("#healthStatus").val(data.healthStatus);
                          }
                      })
                    }
                })
            }
        });
        //弹出层表单操作，主要是提交
        form.on('submit(examinationData)', function (data) {
            var path = $("#path").val();
            var examinationData = {
                "sid": data.field.sid,
                "studentName": data.field.studentName,
                "height": data.field.height,
                "weight": data.field.weight,
                "vision": data.field.vision,
                "temperature": data.field.temperature,
                "healthStatus": data.field.healthStatus
            };
            $.ajax({
                url: "/HealtherControl/updateExamination",
                async: true,
                type: "POST",
                data: {"value": JSON.stringify(examinationData)},
                dataType: "text",
                success: function (msg) {
                    if (msg === "success") {
                        parent.location.reload();
                        layer.msg('更新成功!刷新浏览器', {icon: 1, time: 8000})

                    } else {
                        layer.msg('更新失败!', {icon: 2, time: 6000});
                    }
                },
                error: function () {
                    layer.msg('网络错误!', {icon: 2, time: 1000});
                }
            });
            return false;
        });

        $('.demoTable .layui-btn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
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
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });


    });

    /*用户-停用*/
    function member_stop(obj, id) {
        layer.confirm('确认要停用吗？', function (index) {
            if ($(obj).attr('title') == '启用') {
                //发异步把用户状态进行更改
                $(obj).attr('title', '停用')
                $(obj).find('i').html('&#xe62f;');
                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                layer.msg('已停用!', {icon: 5, time: 1000});
            } else {
                $(obj).attr('title', '启用')
                $(obj).find('i').html('&#xe601;');
                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                layer.msg('已启用!', {icon: 5, time: 1000});
            }
        });
    }

    /*用户-删除*/
    function member_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            //发异步删除数据
            $(obj).parents("tr").remove();
            layer.msg('已删除!', {icon: 1, time: 1000});
        });
    }


    function delAll(argument) {
        var ids = [];

        // 获取选中的id 
        $('tbody input').each(function (index, el) {
            if ($(this).prop('checked')) {
                ids.push($(this).val())
            }
        });

        layer.confirm('确认要删除吗？' + ids.toString(), function (index) {
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
    }
</script>
</html>