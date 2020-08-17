<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>接送记录</title>

    <%
        String path = request.getContextPath();
        String account= (String) request.getSession().getAttribute("account");
    %>

    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="<%=path%>/static/X-admin/css/font.css">
    <link rel="stylesheet" href="<%=path%>/static/X-admin/css/xadmin.css">
    <script src="<%=path%>/static/X-admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=path%>/static/X-admin/js/xadmin.js"></script>
    <script type="text/javascript" src="<%=path%>/static/jquery-3.5.1.js"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<input type="hidden" id="path" value="<%=path%>">
<input type="hidden" id="account" value="<%=account%>">


<label style="font-size: 16px">宝宝姓名：<input id="studentName" disabled/></label>
<br/>
<label style="font-size: 16px">性别：<input id="studentSex" disabled/></label>
<label style="font-size: 16px">所在班级：<input id="studentClass" disabled/></label>
<input type="hidden" id="studentsId">

<script>
    var pickupDetail1=parent.pickupDetail
    console.log(pickupDetail1);
    $("#studentName").val(pickupDetail1.studentName);
    $("#studentSex").val(pickupDetail1.studentSex);
    $("#studentClass").val(pickupDetail1.className);
    $("#studentsId").val(pickupDetail1.studentsId);
</script>

<%--<div class="layui-fluid">--%>
<%--    <div class="layui-row layui-col-space15">--%>
<%--        <div class="layui-col-md12">--%>
<%--            <div class="layui-card">--%>
<%--                <div class="layui-card-body ">--%>
<%--                    <table class="layui-table" lay-data="{url:'/sc/getPickupDetail',page:true,toolbar: '#toolbarDemo',id:'test'}" lay-filter="test">--%>
<%--                        <thead>--%>
<%--                        <tr>--%>
<%--                            <th lay-data="{type:'checkbox'}">ID</th>--%>
<%--                            <th lay-data="{field:'pickId', width:100, sort: true}">接送ID</th>--%>
<%--                            <th lay-data="{field:'pickupDateTime',sort: true, minWidth: 150}">日期</th>--%>
<%--                            <th lay-data="{field:'weekDay',sort: true, minWidth: 100}">星期</th>--%>
<%--                            <th lay-data="{field:'noon', sort: true}">上/下午</th>--%>
<%--                            <th lay-data="{field:'pickupTime',sort: true}">时间</th>--%>
<%--                            <th lay-data="{field:'parentsName', sort: true, }">接送人</th>--%>
<%--                        </thead>--%>
<%--                    </table>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<div class="layui-card-body layui-table-body layui-table-main">
    <table id="demo" lay-filter="test" class="layui-table layui-form"></table>
</div>




</body>
</html>

<script>

    layui.use(['table','layer','form'],
        function () {
            var table = layui.table;
            var $ = layui.jquery;
            var form=layui.form;
            // var layer=layui.layer;


            let studentsId=$("#studentsId").val();
            console.log(studentsId);

            table.render({
                limits:[14,28,42],
                limit:14,
                elem: '#demo',
                url: '/sc/getPickupDetail?studentsId='+pickupDetail1.studentId,
                height: 400,
                cols: [[
                    {field:'pickId',title:'接送ID'}
                    ,{field:'pickupDateTime',title:'日期'}
                    ,{field:'weekDay',title:'星期'}
                    ,{field:'noon',title:'上/下午'}
                    , {field:'pickupTime',title:'时间'}
                    ,{field:'parentsName',title:'接送人'}]] //设置表头
                ,done:function (response) {
                    //定位当前table视图
                    var tableView = this.elem.next();
                    //response.data获取后端返回的JSON格式数据
                    $.each(response.data,function (index,item) {
                        // console.log(item.pickupTime);
                        //逻辑判断
                        if(item.pickupTime > "08:30:00"&&item.noon=="上午"){
                            //改变TR标签内字体颜色
                            tableView.find('tbody tr[data-index="'+ index +'"]').css('color','red');
                        }
                    })
                }

            });

            // //执行渲染
            // table.render({
            //     limits:[14,28,42],limit:14,
            //     elem: '#demo' //指定原始表格元素选择器（推荐id选择器）
            //     ,page:true
            //
            //     ,url: '/sc/getPickupDetail?studentsId='+pickupDetail1.studentId
            //     // ,method:'POST'
            //     ,height: 600 //容器高度
            //     ,cols: [{field:'pickupId',title:'接送ID'}
            //         ,{field:'pickupDateTime',title:'日期'}
            //         ,{field:'weekDay',title:'星期'}
            //         ,{field:'noon',title:'上/下午'}
            //         , {field:'pickupTime',title:'时间'}
            //         ,{field:'parentsName',title:'接送人'}] //设置表头
            //     ,request:{
            //         pageName:'curPage'
            //         ,limitName:'pageSize'
            //     }
            //
            //     //,…… //更多参数参考右侧目录：基本参数选项
            // });


    });



</script>