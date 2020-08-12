<%--
  Created by IntelliJ IDEA.
  User: Mr.huang
  Date: 2020/6/17
  Time: 9:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>幼儿统计</title>
</head>
<style>
    #nav{
        margin: 0px auto;
        height: 10%;
        width: 100%;
        background: gainsboro;
    }
    #nav>ul>li{
        line-height: 80px;
        text-align: center;
        /*border: 1px solid black;*/
        /*margin-top: 2%;*/
        margin-left: 10%;
        list-style-type: none;
        width: 19%;
        height: 80px;
        float: left;

    }
    #nav>ul>li:hover{
        background: #4466aa;
    }

</style>
<body>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="nav"><ul>
    <li onclick="thisweek()">性别与健康状况</li>
<%--    <li onclick="thismonth()">年龄</li>--%>
<%--    <li onclick="thishalfyear()">近半年</li>--%>

</ul></div>
<div id="info" style="width: 200px;height: 45px;margin-left: 65%;margin-top: 30px; font-size: 20px;"></div>
<div id="week" style="width: 600px;height:600px; margin-left: 30%; margin-top: 2%; float: left; "></div>
<div id="month" style="width: 600px;height:600px; margin-left: 30%; margin-top: 2%; float: left; display: none"></div>
<div id="halfyear" style="width: 600px;height:600px; margin-left: 30%; margin-top: 2%; float: left; display: none"></div>

<%String path=request.getContextPath();%>
<input id="path" type="hidden" value=<%=path%> >
</body>
<script src="${pageContext.request.contextPath}/static/X-admin/js/jquery-3.4.1.js" charset="UTF-8"></script>
<script src="${pageContext.request.contextPath}/static/X-admin/js/echarts.js" charset="UTF-8" ></script>

<script>
    // $(function () {
    //     var path=$("#path").val();
    //     var myChart =echarts.init(document.getElementById('week'));
    //     $.ajax({
    //         url : path+"/systemMangerServlet?methodName=ShowWeekCount",
    //         async : true,
    //         type : "POST",
    //         data : "",
    //         dataType : "json",
    //         success : function(msg) {
    //             $("#info").text("本周新增人数：");
    //             $("#info").append(msg[0]*1+msg[1]*1+msg[2]*1+msg[3]*1+msg[4]*1+msg[5]*1+msg[6]*1);
    //
    //
    //             var option = {
    //                 title: {
    //                     text: '用户统计'
    //                 },
    //                 tooltip: {},
    //                 legend: {
    //                     data:['人数']
    //                 },
    //                 xAxis: {
    //                     data: ["周一","周二","周三","周四","周五","周六","周日"]
    //                 },
    //                 yAxis: {},
    //                 series: [{
    //                     name: '人数',
    //                     type: 'bar',
    //                     data: [msg[0], msg[1], msg[2], msg[3], msg[4], msg[5], msg[6]]
    //                 }]
    //             };
    //
    //             // 使用刚指定的配置项和数据显示图表。
    //             myChart.setOption(option);
    //         }
    //     });
    //
    // })

    function thisweek() {

        $("#week").css('display','block');
        $("#month").css('display','none');
        $("#halfyear").css('display','none');
        var path=$("#path").val();

        $.ajax({
            url:"/platformController/selectStudentSexAndHealth",
            async: false,
            type: "POST",
            data: "",
            dataType: "json",
            success: function (msg) {


                var xAxis = msg.xAxis;
                var data = msg.data;
                // console.log("msg" + xAxis)
                // console.log("msg" + data)
                var menuList = ['男', '女'];
                var dataList = [15, 8];
                var option = {
                    title: {
                        text: '幼儿性别与健康状况统计',
                    },
                    tooltip: {
                        show: true,
                        trigger: 'axis',
                        axisPointer: {  // 坐标轴指示器，坐标轴触发有效
                            type: 'shadow', // 默认为直线，可选为：'line' | 'shadow'
                            fontSize: 8
                        }
                    },
                    legend: {
                        data: ['访问量']
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true,
                        // y2:140,
                    },
                    yAxis: {
                        name: '数值',
                        nameLocation: 'middle',// middle 居中显示  end 右边  start 左边
                        nameTextStyle: {
                            fontWeight: 'bold',
                            fontSize: 14,
                            padding: [10, 0, 0, 0]
                        },
                        type: 'value',
                        boundaryGap: [0, 0.01],
                        splitLine: {  //网格样式
                            show: true,
                            lineStyle: {
                                color: ['#e7e8ec'],
                                width: 1,
                                type: 'solid'
                            }
                        }
                    },
                    xAxis: {
                        name: '性别与健康状况',
                        nameLocation: 'middle',
                        nameTextStyle: {
                            fontSize: 14,
                            fontWeight: 'bold'
                        },
                        type: 'category',
                        data: xAxis,
                        inverse: false, //设置倒序排序
                        splitLine: {  //网格样式
                            show: true,
                            lineStyle: {
                                color: ['#e7e8ec'],
                                width: 1,
                                type: 'solid'
                            }
                        },
                        axisLabel: {
                            interval: 0,//Y轴信息全部显示
                            // rotate:-30,//-30度角倾斜显示
                        }
                    },
                    series: [{
                        name: '数值',
                        type: 'bar',
                        data: data,
                        barWidth: 30,
                        // barMaxWidth: 30,
                        itemStyle: {
                            normal: {
                                label: {
                                    show: true,
                                    position: 'right',
                                    textStyle: {
                                        color: 'black',
                                        fontSize: 16
                                    }
                                },
                                color: '#88CFFF'
                            }
                        }
                    }
                    ]
                };

                // 设置容器的高度和宽度
                var container = document.getElementById('week');
                var allNode = xAxis.length;
                if (allNode < 3) {
                    allNode = 3;
                } else if (allNode < 5) {
                    allNode = 5;
                }
                var currentHeight = 100 * allNode;
                container.style.height = currentHeight + 'px'; //设置容器高度
                var myChart =echarts.init(document.getElementById('week'));
                window.onresize = function () {
                    myChart.resize();
                }
                myChart.setOption(option);
            }
        })

    }

</script>
</html>
