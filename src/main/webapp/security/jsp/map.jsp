<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style type="text/css">
        body, html{width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
        #allmap {width: 100%; height:100%; overflow: hidden;}
        #result {width:100%;font-size:12px;}
        dl,dt,dd,ul,li{
            margin:0;
            padding:0;
            list-style:none;
        }
        p{font-size:12px;}
        dt{
            font-size:14px;
            font-family:"微软雅黑";
            font-weight:bold;
            border-bottom:1px dotted #000;
            padding:5px 0 5px 5px;
            margin:5px 0;
        }
        dd{
            padding:5px 0 0 5px;
        }
        li{
            line-height:28px;
        }

    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=7R9KWvjvVaV32ejXIC16T05dP7yPnulY"></script>
    <!--加载鼠标绘制工具-->
    <script type="text/javascript" src="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.js"></script>
    <link rel="stylesheet" href="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.css" />
    <!--加载检索信息窗口-->
    <script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.js"></script>
    <link rel="stylesheet" href="http://api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.css" />
    <!--官方jquery 压缩版引用-->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

    <title>绘制围栏</title>

    <%
        String path = request.getContextPath();
    %>

</head>
<body>

<input type="hidden" id="path" value=<%=path%>>

<div id="allmap" style="overflow:hidden;zoom:1;position:relative;">
    <div id="map" style="height:100%;-webkit-transition: all 0.5s ease-in-out;transition: all 0.5s ease-in-out;"></div>
</div>
<!--
<div id="result">
    <input type="button" value="获取覆盖物个数" onclick="alert(overlays.length)"/>
    <input type="button" value="清除所有覆盖物" onclick="clearAll()"/>
</div>
-->

<script type="text/javascript">

    //初始化地图
    //var map = new BMap.Map('map');
    //var poi = new BMap.Point(106.909136,29.895601);
    //初始化地图
    var map = new BMap.Map("allmap");
    map.centerAndZoom(new BMap.Point(106.909136,29.895601), 16);
    map.disableDoubleClickZoom();

    //覆盖物列表 本地围栏
    var overlays = [];
    //覆盖物类型
    var overlays_type = [];
    //云端围栏
    var yingyanfences;
    //ak service_id
    var ak='your_ak'; //ak
    var service_id='your_service_id'; //service_id
    //百度鹰眼接口 查询get 上传post
    var createcircle_url='http://yingyan.baidu.com/api/v3/fence/createcirclefence';//创建圆形
    var createpolygon_url='http://yingyan.baidu.com/api/v3/fence/createpolygonfence';//创建多边形
    var createpolyline_url='http://yingyan.baidu.com/api/v3/fence/createpolylinefence';//创建线形
    var createpolyline_url='http://yingyan.baidu.com/api/v3/fence/createpolylinefence';//创建线形
    var createdistrict_url='http://yingyan.baidu.com/api/v3/fence/createdistrictfence';//创建行政区
    var updatecircle_url='http://yingyan.baidu.com/api/v3/fence/updatecirclefence';//更新圆形
    var updatepolygon_url='http://yingyan.baidu.com/api/v3/fence/updatepolygonfence';//更新多边形
    var updatepolyline_url='http://yingyan.baidu.com/api/v3/fence/updatepolylinefence';//更新线型
    var updatedistrict_url='http://yingyan.baidu.com/api/v3/fence/updatedistrictfence';//更新行政区
    var delete_url='http://yingyan.baidu.com/api/v3/fence/delete';//删除围栏
    var list_url='http://yingyan.baidu.com/api/v3/fence/list';//查询围栏 0-99
    var addmonitor_url='http://yingyan.baidu.com/api/v3/fence/addmonitoredperson';//增加围栏需监控的entity
    var deletemonitor_url='http://yingyan.baidu.com/api/v3/fence/deletemonitoredperson';//删除围栏可去除监控的entity
    var listmonitor_url='http://yingyan.baidu.com/api/v3/fence/listmonitoredperson';//查询围栏监控的所有entity
    //相关数据，位置，logo初始化
    mapinit();

    //绘制事件完成时，将该绘制图形加入到覆盖物列表
    var overlaycomplete = function(e){
        overlays.push(e.overlay);
        overlays_type.push(e.drawingMode);
    };
    //鼠标绘制工具
    var styleOptions = {
        strokeColor:"red",    //边线颜色。
        fillColor:"red",      //填充颜色。当参数为空时，圆形将没有填充效果。
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
            offset: new BMap.Size(50, 5), //偏离值
        },
        circleOptions: styleOptions, //圆的样式
        polylineOptions: styleOptions, //线的样式
        polygonOptions: styleOptions, //多边形的样式
        rectangleOptions: styleOptions //矩形的样式
    });
    //添加鼠标绘制工具监听事件，用于获取绘制结果
    drawingManager.addEventListener('overlaycomplete', overlaycomplete);


    //清空覆盖物列表
    function clearAll() {
        for(var i = 0; i < overlays.length; i++){

            map.removeOverlay(overlays[i]);
        }
        overlays.length = 0
    }
    //将覆盖物列表（本地围栏）保存到云端围栏
    function saveAll()
    {
        for(var i = 0; i < overlays.length; i++){
            //alert(overlays[i].drawingMode);
            /*
            var property = "";
            for (var item in overlays[i]) {
                 property += "属性：" + item + "数值：" + overlays[i][item] + "\n";
            }
            */
            //console.log(overlays_type[i]);
            //console.log(overlays[i].drawingMode);
            console.log(overlays[i]);
            if(overlays_type[i]=="circle")
            {
                //console.log(overlays[i].point.lat);
                //console.log(overlays[i].point.lng);
                //console.log(overlays[i].xa);
                //按圆形方式保存
                var createcircle_data={
                    ak:ak,
                    service_id:service_id,
                    fence_name:'circle_fences',
                    monitored_person:'',
                    longitude: overlays[i].point.lng,
                    latitude: overlays[i].point.lat,
                    radius: overlays[i].xa,
                    coord_type:'bd09ll',
                    denoise:'',
                    sn:'',
                };
                post_data(createcircle_url, createcircle_data);
            }
            /*
            if(overlays_type[i]=="rectangle")
            {
                for(var j = 0; j < overlays[i].so.length; j++){
                    console.log(overlays[i].so[j].lng);
                    console.log(overlays[i].so[j].lat);
                }
                //按矩形方式保存
            }
            */
            if(overlays_type[i]=="rectangle" || overlays_type[i]=="polygon")
            {
                var createpolygon_vertexes="";
                for(var j = 0; j < overlays[i].so.length; j++){
                    createpolygon_vertexes=createpolygon_vertexes+overlays[i].so[j].lat;
                    createpolygon_vertexes=createpolygon_vertexes+',';
                    createpolygon_vertexes=createpolygon_vertexes+overlays[i].so[j].lng;
                    createpolygon_vertexes=createpolygon_vertexes+';';
                }
                console.log(createpolygon_vertexes);
                //按多边形方式保存
                var createpolygon_data={
                    ak:ak,
                    service_id:service_id,
                    fence_name:'polygon_fence',
                    monitored_person:'',
                    vertexes: createpolygon_vertexes,
                    coord_type:'bd09ll',
                    denoise:'',
                    sn:'',
                };
                post_data(createpolygon_url, createpolygon_data);
            }

            if(overlays_type[i]=="polyline")
            {
                for(var j = 0; j < overlays[i].so.length; j++){
                    console.log(overlays[i].so[j].lng);
                    console.log(overlays[i].so[j].lat);
                }
                //按线型方式保存
            }

        }
    }
    //清除所有服务器已经存在的围栏
    function ClearAll_onService() {
        var fence_id = '0,'
        for(var i = 1; i < 99; i++){
            fence_id=fence_id+i;
            fence_id=fence_id+',';
        }
        fence_id=fence_id+99;

        var delete_data={
            ak:ak,
            service_id:service_id,
            monitored_person:'',
            fence_ids: fence_id,
            sn:'',
        };
        post_data(delete_url, delete_data);
    }

    //定义一个控件类,即function
    function ZoomControl(){
        // 默认停靠位置和偏移量
        this.defaultAnchor = BMAP_ANCHOR_TOP_LEFT;
        this.defaultOffset = new BMap.Size(10, 10);
    }
    // 通过JavaScript的prototype属性继承于BMap.Control
    ZoomControl.prototype = new BMap.Control();
    // 自定义控件必须实现自己的initialize方法,并且将控件的DOM元素返回
    // 在本方法中创建个div元素作为控件的容器,并将其添加到地图容器中
    ZoomControl.prototype.initialize = function(map){
        // 创建一个DOM元素
        var div = document.createElement("div");
        // 添加文字说明
        div.appendChild(document.createTextNode("重新绘制"));
        // 设置样式
        div.style.cursor = "pointer";
        div.style.border = "1px solid gray";
        div.style.backgroundColor = "white";
        // 绑定事件,点击一次放大两级
        div.onclick = function(e){
            //map.setZoom(map.getZoom() + 2);
            clearAll();
        }
        // 添加DOM元素到地图中
        map.getContainer().appendChild(div);
        // 将DOM元素返回
        return div;
    }

    function SendControl(){
        this.defaultAnchor = BMAP_ANCHOR_TOP_LEFT;
        this.defaultOffset = new BMap.Size(100, 10);
    }
    SendControl.prototype = new BMap.Control();
    SendControl.prototype.initialize = function(map){
        var div = document.createElement("div");
        div.appendChild(document.createTextNode("保存围栏"));
        div.style.cursor = "pointer";
        div.style.border = "1px solid gray";
        div.style.backgroundColor = "white";
        div.onclick = function(e){
            saveAll();
        }
        map.getContainer().appendChild(div);
        return div;
    }

    function ClearControl(){
        this.defaultAnchor = BMAP_ANCHOR_TOP_LEFT;
        this.defaultOffset = new BMap.Size(200, 10);
    }
    ClearControl.prototype = new BMap.Control();
    ClearControl.prototype.initialize = function(map){
        var div = document.createElement("div");
        div.appendChild(document.createTextNode("清除全部"));
        div.style.cursor = "pointer";
        div.style.border = "1px solid gray";
        div.style.backgroundColor = "white";
        div.onclick = function(e){
            ClearAll_onService();
        }
        map.getContainer().appendChild(div);
        return div;
    }

    // 创建控件
    var myZoomCtrl = new ZoomControl();
    var mySendCtrl = new SendControl();
    var myClearControl = new ClearControl();
    // 添加到地图当中
    map.addControl(myZoomCtrl);
    map.addControl(mySendCtrl);
    map.addControl(myClearControl);

    /* 显示卫星地图
    var mapType1 = new BMap.MapTypeControl(
        {
            mapTypes: [BMAP_NORMAL_MAP,BMAP_HYBRID_MAP],
            anchor: BMAP_ANCHOR_TOP_RIGHT
        }
    );//2D图，混合图
    map.addControl(mapType1);
    */

    //设置版权控件
    function mapinit() {
        //初始化地图
        //map.centerAndZoom(poi, 16);
        map.enableScrollWheelZoom();

        var cr = new BMap.CopyrightControl({anchor: BMAP_ANCHOR_BOTTOM_RIGHT});
        //设置版权控件位置
        map.addControl(cr); //添加版权控件
        var bs = map.getBounds();   //返回地图可视区域
        cr.addCopyright({id: 1, content: "<a href='#' style='font-size:12px;background:white'> Copyright ©重庆第二师范物联网硬件工作室</a>", bounds: bs});

        get_yingyanfences();
    }

    //绘制云端围栏
    function draw_yingyanfences()
    {
        var fences=[];

        for(var i=0; i<yingyanfences.size; i++)
        {
            if(yingyanfences.fences[i].shape=='circle')
            {
                var point = new BMap.Point(yingyanfences.fences[i].longitude, yingyanfences.fences[i].latitude);
                var circle = new BMap.Circle(point,yingyanfences.fences[i].radius,{strokeColor:"blue", strokeWeight:2, strokeOpacity:0.5}); //创建圆

                fences.push(circle);
            }
            if(yingyanfences.fences[i].shape=='polygon')
            {
                //console.log(yingyanfences.fences[i]);
                var polygon_point=[];
                for(var j=0; j<yingyanfences.fences[i].vertexes.length; j++)
                {
                    var point = new BMap.Point(yingyanfences.fences[i].vertexes[j].longitude, yingyanfences.fences[i].vertexes[j].latitude);
                    polygon_point.push(point);
                }
                var polygon = new BMap.Polygon(polygon_point, {strokeColor:"blue", strokeWeight:2, strokeOpacity:0.5});  //创建多边形
                fences.push(polygon);
            }

        }

        //将围栏（覆盖物）加入到地图，并绑定事件
        for(var i=0; i<fences.length; i++)
        {
            //点击覆盖物时，覆盖物可编辑
            fences[i].addEventListener("click",click_circle);
            function click_circle(){
                this.enableEditing();
            }
            //双击覆盖物时，删除覆盖物
            fences[i].addEventListener("dblclick",delete_circle);
            function delete_circle(){
                if(window.confirm('是否移除该围栏')){
                    this.remove();
                }else{

                }
            }
            //当鼠标移动到某个覆盖物时，将该覆盖物设置为最顶层
            fences[i].addEventListener("mouseover",moveover_circle);
            function moveover_circle(){
                this.setTop(true);
            }
            //当鼠标移出某个覆盖物时，将该覆盖物设置为最底层
            fences[i].addEventListener("mouseout",moveout_circle);
            function moveout_circle(){
                this.disableEditing()
                this.setTop(false);
            }
            /*
            //当围栏发生改变时
            circle_fences[i].addEventListener("lineupdate",update_circle);
            function update_circle(){
                //this.setStrokeColor("red");
                console.log(getStrokeColor());
            }
            */
            map.addOverlay(fences[i]);     //增加圆
        }
    }
    /*
    function post(){
        $.ajax({
        url:'http://yingyan.baidu.com/api/v3/fence/createcirclefence',
        type: 'post',
        dataType:'json',
        data:{
            ak:'7R9KWvjvVaV32ejXIC16T05dP7yPnulY',
            service_id:'212041',
            fence_name:'test123',
            monitored_person:'',
            longitude: longitude,
            latitude: latitude,
            //longitude: gcj.lon,
            //latitude: gcj.lat,
            radius:'75.93805346277371',
            coord_type:'gcj02',
            denoise:'',
            sn:'',
        },
        success:function(result){
            console.log(result);
            },
        error:function(err){
            console.log(err)
            }
        });
    }*/

    function post_data(url, date){
        $.ajax({
            url:url,
            type: 'post',
            dataType:'json',
            data:date,
            success:function(result){
                console.log(result);
                if(result.status==2)
                {
                    if(window.confirm(result.message+",请重新绘制")){
                        clearAll();
                    }else{

                    }
                }
            },
            error:function(err){
                console.log(err)
            }
        });
    }

    function get_data(url, date){
        $.ajax({
            url:url,
            type: 'get',
            dataType:'json',
            data:date,
            success:function(result){
                console.log(result);
                return result;
            },
            error:function(err){
                console.log(err)
            }
        });
    }

    //从云端获取围栏数据
    function get_yingyanfences(){
        var fence_id = '0,'
        for(var i = 1; i < 99; i++){
            fence_id=fence_id+i;
            fence_id=fence_id+',';
        }
        fence_id=fence_id+99;

        $.ajax({
            url:'http://yingyan.baidu.com/api/v3/fence/list',
            type: 'get',
            dataType:'json',
            data:{
                ak:ak,
                service_id:service_id,
                monitored_person:'',
                fence_ids:fence_id,
                coord_type_output:'bd09ll',
                page_index:'',
                page_size:'',
                sn:'',
            },
            success:function(result){
                yingyanfences=result;
                console.log(result);
                //绘制云端围栏
                draw_yingyanfences();
            },
            error:function(err){
                console.log(err);
            }
        });
    }

    /*
    //向服务器上传围栏
    function upload_circle(e){
        console.log(e);
        $.ajax({
        url:'http://yingyan.baidu.com/api/v3/fence/createcirclefence',
        type: 'post',
        dataType:'json',
        data:{
            ak:'7R9KWvjvVaV32ejXIC16T05dP7yPnulY',
            service_id:'212041',
            fence_name:'test123',
            monitored_person:'',
            longitude: e.point.lng,
            latitude: e.point.lat,
            radius: e.xa,
            coord_type:'bd09ll',
            denoise:'',
            sn:'',
        },
        success:function(result){
            console.log(result);
        },
        error:function(err){
            console.log(err)
        }
        });
    }
    */


</script>
</body>
</html>
