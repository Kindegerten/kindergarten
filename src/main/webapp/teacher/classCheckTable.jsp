
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    System.out.println(path);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>satetyEdu</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=path%><%=path%>/static/X-admin/lib/layuimini/lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=path%><%=path%>/static/X-admin/lib/layuimini/css/public.css" media="all">
</head>
<body>
<input type="hidden" id="msg">
<input type="hidden" id="year">
<div class="layuimini-container">
    <div class="layuimini-main">

        <div style="margin-left:45%;"><h2>班级考勤</h2></div>
        <%--        搜索框--%>
        <fieldset class="table-search-fieldset">
            <legend>查询条件</legend>
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">宝宝名字：</label>
                            <div class="layui-input-block">
                                <input type="text" name="babyName" id="babyName" placeholder="" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                        </div>
                        <div class="layui-inline">
                            <button type="submit" class="layui-btn layui-btn-primary" lay-submit
                                    lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>


        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>
        <%--        行标签--%>
        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="edit">考勤信息</a>
        </script>
    </div>
</div>

<%--宝宝信息弹出框--%>
<div id="babyInf" style="display:none;">
    <form class="layui-form" lay-filter="formDetail" action="" id="add">
        <%--宝宝图片--%>
        <div class="layui-inline">
            <div class="layui-input-block">
                <img src="../static/img/c3.bmp" id="faceUrl" class="layui-nav-img" style="height: 150px;width: 150px">
            </div>
        </div>
        <%--宝宝信息--%>
        <div class="layui-inline">
            <label class="layui-form-label">宝宝姓名：</label>
            <div class="layui-input-block">
                <input type="text" name="studentName" id="studentName" placeholder="" class="layui-input" disabled="disabled">
            </div>
            <label class="layui-form-label">宝宝性别：</label>
            <div class="layui-input-block">
                <input type="text" name="studentSex" id="studentSex" placeholder="" class="layui-input" disabled="disabled">
            </div>
            <label class="layui-form-label">考勤开始：</label>
            <div class="layui-input-block">
                <input type="text" name="stutimeDate" id="stutimeDate" placeholder="" class="layui-input" disabled="disabled">
            </div>
            <label class="layui-form-label">考勤结束：</label>
            <div class="layui-input-block">
                <input type="text" name="stutimeType" id="stutimeType" placeholder="" class="layui-input"
                       disabled="disabled" style="width: 180px">
            </div>
        </div>


<script src="<%=path%>/static/X-admin/lib/layuimini/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script>


    function getweek(dateString){
        var da='';
        if(dateString==undefined){
            var now=new Date();
            var now_m=now.getMonth()+1;
            now_m=(now_m<10)?'0'+now_m:now_m;
            var now_d=now.getDate();
            now_d=(now_d<10)?'0'+now_d:now_d;
            da=now.getFullYear()+'-'+now_m+'-'+now_d;
            console.log('今天系统时间是:'+da);
        }else{
            da=dateString;//日期格式2015-12-30
        }
        var date1 = new Date(da.substring(0,4), parseInt(da.substring(5,7)) - 1, da.substring(8,10));//当前日期
        var date2 = new Date(da.substring(0,4), 0, 1); //1月1号
        //获取1月1号星期（以周一为第一天，0周一~6周日）
        var dateWeekNum=date2.getDay()-1;
        if(dateWeekNum<0){dateWeekNum=6;}
        if(dateWeekNum<4){
            //前移日期
            date2.setDate(date2.getDate()-dateWeekNum);
        }else{
            //后移日期
            date2.setDate(date2.getDate()+7-dateWeekNum);
        }
        var d = Math.round((date1.valueOf() - date2.valueOf()) / 86400000);
        if(d<0){
            var date3 = (date1.getFullYear()-1)+"-12-31";
            return getYearWeek(date3);
        }else{
            //得到年数周数
            var year=date1.getFullYear();
            var week=Math.ceil((d+1 )/ 7);
            console.log(year+"年第"+week+"周");
            return  week;
        }
    }


    layui.use(['form', 'table', 'jquery', 'layedit', 'laydate', 'upload'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table,
            layer = layui.layer,
            upload = layui.upload,
            layedit = layui.layedit,
            laydate = layui.laydate;
        table.render({
            elem: '#currentTableId',
            url: '/tc/classInfoSelectList',
            // toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                {type: "checkbox", width: 50},
                {field: 'studentId', width: 100, title: '宝宝编号', sort: true},
                {field: 'studentName', width: 100, title: '宝宝名称'},
                {field: 'parentsName', width: 180, title: '家长名称'},
                {field: 'stutimeDate', width: 180, title: '考勤开始时间', sort: true},
                {field: 'stutimeType', width: 180, title: '考勤结束时间', sort: true},
                // {field: 'sex', width: 180, title: '性别'},
                // {field: 'nowyear', width: 180, title: '年',hide:true,templet:function () {
                //         return new Date().getFullYear();
                //     }},
                // {field: 'nowweek', width: 180, title: '周',hide:true,templet:function () {
                //         return getweek();
                //     }},
                {title: '操作', minWidth: 150, toolbar: '#currentTableBar', align: "center"},
            ]],
            limits: [2, 5, 10, 15, 20, 25, 50, 100],
            limit: 5,
            page: true,
            skin: 'line'
        });




        //监听表格复选框选择

        // table.on('tool(currentTableFilter)', function (obj) {
        //     var data = obj.data;
        //
        //
        //     $("#week").val(getweek());
        //     $("#year").val(new Date().getFullYear());
        //     $("#msg").val(data.id);
        //     if (obj.event === 'seeCheckInfo') {
        //
        //
        //         layer.open({
        //             title: '考勤信息',
        //             type: 2,
        //             shade: 0.2,
        //             maxmin: true,
        //             shadeClose: true,
        //             area: ['100%', '100%'],
        //             id: 'LAY_layuipro',
        //             content: '/page/teacher/babyCheck', //内容
        //
        //         });
        //
        //         return false;
        //     }
        // });

        //监听表格复选框选择
        table.on('checkbox(currentTableFilter)', function (obj) {
            console.log(obj)
        });

        table.on('tool(currentTableFilter)', function (obj) {
            var data = obj.data;

            $("#faceUrl").attr("src",  data.faceUrl);
            $("#photoUrl").attr("src",  data.photoUrl);

            // $("#babyName").val("ghjghj");

            if (obj.event === 'edit') {
                layer.open({
                    title: '信息显示',
                    type: 1,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    offset: ['10px'],
                    area: ['500px', '750px'],
                    closeBtn: false,
                    id: 'LAY_layuipro',
                    btn: ['确认'],
                    btnAlign: 'c',
                    moveType: 1,
                    content: $('#babyInf'), //内容
                    success: function (layero, index) {
                        form.val('formDetail', data);
                    }
                });
                return false;
            }
        });


        // 监听搜索操作
        form.on('submit(data-search-btn)', function (data) {

            var startTime = $("#startTime").val();//选取的起始时间
            var endTime = $("#endTime").val();//选取的结束时间
            //执行搜索重载
            table.reload('currentTableId', {
                url: '/tc/selectList',
                page: {
                    curr: 1 //重新从第 1 页开始
                },
                where: {
                    startFinishTime: startTime, endFinishTime: endTime
                }
            }, 'data');

            return false;
        });


    });
</script>

</body>
</html>