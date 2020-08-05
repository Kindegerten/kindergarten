<%@ page import="com.kindergarten.bean.Course" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>后台登录-X-admin2.2</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="../static/X-admin/css/font.css">
    <link rel="stylesheet" href="../static/X-admin/css/xadmin.css">
    <!-- <link rel="stylesheet" href="./css/theme5.css"> -->
    <script src="../static/X-admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../static/X-admin/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <%Course tblCourse= (Course) request.getSession().getAttribute("tblCourse"); %>
</head>
<body>

<!-- 显示课程表， -->
<a href="#" class="btn btn-primary btn-xs"
   data-toggle="modal" data-target="#kechengList" onclick="getKecheng(${tblCourse.getTeacherId()})">课程表
</a>

<!-- 课程表对话框 -->
<div class="modal fade" id="kechengList" tabindex="-1"
     role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document" style="width: 900px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">课程表信息</h4>
            </div>

            <div class="modal-body">
                <div class="table-div">
                    <h2 style="text-align: center;">课程表</h2>
                    <table class="table table-bordered table-striped table-hover" style="height: 450px">
                        <thead>
                        <tr>
                            <th scope="col"></th>
                            <th scope="col">星期一</th>
                            <th scope="col">星期二</th>
                            <th scope="col">星期三</th>
                            <th scope="col">星期四</th>
                            <th scope="col">星期五</th>
                        </tr>
                        </thead>

                        <tbody style="text-align: center;">
                        <tr style="height: 80px">
                            <th scope="row">1节
                            </th>
                            <td id="table_1_1"></td>
                            <td id="table_2_1"></td>
                            <td id="table_3_1"></td>
                            <td id="table_4_1"></td>
                            <td id="table_5_1"></td>

                        </tr>
                        <tr style="height: 80px">
                            <th scope="row">2节
                            </th>
                            <td id="table_1_2"></td>
                            <td id="table_2_2"></td>
                            <td id="table_3_2"></td>
                            <td id="table_4_2"></td>
                            <td id="table_5_2"></td>
                        </tr>
                        <tr style="height: 80px">
                            <th scope="row">3节
                            </th>
                            <td id="table_1_3"></td>
                            <td id="table_2_3"></td>
                            <td id="table_3_3"></td>
                            <td id="table_4_3"></td>
                            <td id="table_5_3"></td>
                        </tr>
                        <tr style="height: 80px">
                            <th scope="row">4节
                            </th>
                            <td id="table_1_4"></td>
                            <td id="table_2_4"></td>
                            <td id="table_3_4"></td>
                            <td id="table_4_4"></td>
                            <td id="table_5_4">
                            </td>
                        </tr>
                        <tr style="height: 80px">
                            <th scope="row">5节
                            </th>
                            <td id="table_1_5"></td>
                            <td id="table_2_5"></td>
                            <td id="table_3_5"></td>
                            <td id="table_4_5"></td>
                            <td id="table_5_5">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<!-- 课程表对话框end -->
</body>

<script>
    // 通过Tid(教师的id)获取课程表信息
    function getKecheng(id) {

        $.ajax({
            type:"get",
            url:"/tc/getKechengByTid.action",
            data:{"id":id},
            success:function(data) {
                //清空课程表
                for(var i=1;i<6;i++){
                    for(var j=1;j<6;j++){
                        $("#table_"+j+"_"+i).html("");
                    }
                }
                //遍历课程表
                for (var i=0;i<data.length;i++) {
                    $("#table_"+data[i].week+"_"+data[i].jieci).html(data[i].cname+"<br>"+data[i].banji+"<br>"+data[i].address);
                }
            }
        });
    }

</script>

</html>