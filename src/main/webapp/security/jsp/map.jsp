<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>

    <%
        String path = request.getContextPath();
    %>

    <style type="text/css">
        body, html {
            width: 100%;
            height: 100%;
            margin: 0;
            font-family: "微软雅黑";
        }

        #allmap {
            width: 100%;
            height: 93%;
            overflow: hidden;
        }

        #result {
            width: 100%;
            font-size: 12px;
        }

        dl, dt, dd, ul, li {
            margin: 0;
            padding: 0;
            list-style: none;
        }

        p {
            font-size: 12px;
        }

        dt {
            font-size: 14px;
            font-family: "微软雅黑";
            font-weight: bold;
            border-bottom: 1px dotted #000;
            padding: 5px 0 5px 5px;
            margin: 5px 0;
        }

        dd {
            padding: 5px 0 0 5px;
        }

        li {
            line-height: 28px;
        }
    </style>
    <script type="text/javascript" src="//api.map.baidu.com/api?v=2.0&ak=PUpFUFstTXZ8wXZFnu8caGaIuq8bu6h7"></script>
    <!--加载鼠标绘制工具-->
    <script type="text/javascript"
            src="//api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.js"></script>
    <link rel="stylesheet" href="//api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.css"/>
    <!--加载检索信息窗口-->
    <script type="text/javascript"
            src="//api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.js"></script>
    <link rel="stylesheet" href="//api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.css"/>

    <link rel="stylesheet" href="<%=path%>/static/X-admin/css/font.css">
    <link rel="stylesheet" href="<%=path%>/static/X-admin/css/xadmin.css">
    <link rel="stylesheet" href="<%=path%>/static/X-admin/css/theme3944.min.css">
    <script src="<%=path%>/static/X-admin/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="<%=path%>/static/X-admin/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="<%=path%>/static/GeoUtils.js"></script>
    <script type="text/javascript" src="<%=path%>/static/jquery-3.5.1.js"></script>
    <title>鼠标绘制工具</title>
</head>
<body>
<div id="allmap" style="overflow:hidden;zoom:1;position:relative;">
    <div id="map" style="height:100%;-webkit-transition: all 0.5s ease-in-out;transition: all 0.5s ease-in-out;"></div>
</div>
<div id="result">
    <input type="button" class="layui-btn" value="获取栅栏个数" onclick="alert(overlays.length)"/>
    <input type="button" class="layui-btn" value="获取栅栏坐标" onclick="getLayerInformation()">
    <input type="button" class="layui-btn" value="绘制多边形栅栏" onclick="drawPolygon()">
    <input type="button" class="layui-btn" value="清除所有栅栏" onclick="clearAll()"/>
    <label for="">经度：</label> <input type="text" id="ILng">
    <label for="">纬度：</label> <input type="text" id="ILat">
    <input type="button" class="layui-btn" value="刷新位置" onclick="refreshPoint()">
    <input type="button" class="layui-btn" value="判断是否在栅栏内" onclick="IsInPolygon()">
</div>
<script type="text/javascript">
    // 百度地图API功能
    var map = new BMap.Map('map');
    var poi = new BMap.Point(118.19319099808, 24.488554180987);
    map.centerAndZoom(poi, 19);
    map.enableScrollWheelZoom();
    var overlays = [];
    var overlaycomplete = function (e) {
        overlays.push(e.overlay);
    };
    var styleOptions = {
        strokeColor: "red",    //边线颜色。
        fillColor: "",      //填充颜色。当参数为空时，圆形将没有填充效果。
        strokeWeight: 3,       //边线的宽度，以像素为单位。
        strokeOpacity: 0.8,	   //边线透明度，取值范围0 - 1。
        fillOpacity: 0.6,      //填充的透明度，取值范围0 - 1。
        strokeStyle: 'solid' //边线的样式，solid或dashed。
    }
    //实例化鼠标绘制工具
    var drawingManager = new BMapLib.DrawingManager(map, {
        isOpen: false, //是否开启绘制模式
        enableDrawingTool: true, //是否显示工具栏
        drawingToolOptions: {
            anchor: BMAP_ANCHOR_TOP_RIGHT, //位置
            offset: new BMap.Size(5, 5), //偏离值
        },
        circleOptions: styleOptions, //圆的样式
        polylineOptions: styleOptions, //线的样式
        polygonOptions: styleOptions, //多边形的样式
        rectangleOptions: styleOptions //矩形的样式
    });
    //添加鼠标绘制工具监听事件，用于获取绘制结果
    drawingManager.addEventListener('overlaycomplete', overlaycomplete);

    function clearAll() {
        for (var i = 0; i < overlays.length; i++) {
            map.removeOverlay(overlays[i]);
        }
        overlays.length = 0
    }

    //获取点信息
    //TODO 传到数据库
    function getLayerInformation() {
        console.log(overlays[0].getPath());
        console.log(JSON.stringify(overlays[0].getPath()));
    }

    var polygon;
    var pointData=[];

    //绘制多边形
    //TODO 获取点信息
    function drawPolygon() {
        let point;
        point= overlays[0].getPath();

        let polArry = [];
        point.forEach(item => {
            let p = new BMap.Point(item.lng, item.lat);
            polArry.push(p);
        });
        polygon = new BMap.Polygon(polArry, styleOptions);
        map.addOverlay(polygon);
    }

    //判断点是否在多边形内
    function IsInPolygon() {

        if (pointData!=null){
            pointData.forEach(item=>{
                let lng = item.lng;
                let lat = item.lat;
                let name=item.studentName;
                let id=item.studentId;
                let point = new BMap.Point(lng, lat);
                let marker = new BMap.Marker(point);
                map.addOverlay(marker);
                if (BMapLib.GeoUtils.isPointInPolygon(point, polygon)) {
                    console.log(name+"在区域内");
                } else {
                    //TODO 发送记录信息写入报警表
                    layer.msg(name+"不在区域内",{
                        // icon: 1,
                        time: 2000 //2秒关闭（如果不配置，默认是3秒）
                    }, function(){
                        //do something
                        sendAlert(id,name,point);
                    });
                }
            });

        }else {
            let lng = $("#ILng").val();
            let lat = $("#ILat").val();
            let point = new BMap.Point(lng, lat);
            let marker = new BMap.Marker(point);
            map.addOverlay(marker);
            if (BMapLib.GeoUtils.isPointInPolygon(point, polygon)) {
                console.log("在区域内");
            } else {
                console.log("不在区域内");
            }
        }



        //获取点坐标
        // map.addEventListener("click",function(e){
        //     alert(e.point.lng + "," + e.point.lat);
        // });

    }

    //获取最新点坐标
    function refreshPoint() {
        console.log("refreshPoint");
        $.ajax({
            url: "/sc/getPoint",
            async: true,
            type: "POST",
            data: "",
            dataType: "json",
            success: function (msg) {
                console.log(msg);
                pointData=msg;
                console.log(pointData);
                layer.msg("刷新成功");
                // $("#ILat").val(msg.split("#")[1]);
                // $("#ILng").val(msg.split("#")[0]);
            },
            error: function () {
                layer.msg("网络繁忙!");
            }
        });

    }
    
    function sendAlert(id,name,point) {
        let alertMsg="{\"studentId\":"+id+",\"lng\":"+point.lng+",\"lat\":"+point.lat+",\"studentName\":\""+name+"\"}";
        console.log("sendAlter:"+name+" "+point);
        console.log(alertMsg);

        $.ajax({
            url: "/sc/sendAlter",
            async: true,
            type: "POST",
            data: "alertMsg="+alertMsg,
            dataType: "text",
            success: function (msg) {
                layer.msg(msg);
            },
            error: function () {
                layer.msg(name+"的报警记录失败!");
            }
        });

    }

</script>
</body>
</html>
