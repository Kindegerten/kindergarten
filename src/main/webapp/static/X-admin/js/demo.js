var nameArr = [];
var valueArr = [];
var obArr = [];

$(function() {
	$.ajax({
		method : "POST",
		url : "DataServlet",
		dataType : "text",
		success : function(msg) {
			var arr = JSON.parse(msg);

			for (var i = 0; i < arr.length; i++) {
				// 普通柱状图使用的数据
				nameArr.push(arr[i].name);
				valueArr.push(arr[i].record);
				// 南丁格尔玫瑰圆饼图使用的数据
				obArr.push({
					value : arr[i].record,
					name : arr[i].name
				});

			}
			createEchars();// 创建普通柱状图
			rose();// 创建南丁格尔玫瑰圆饼图
		},
		error : function() {
			alert("服务器正忙");
		}
	});
});
//普通柱状图
function createEchars() {
	
	//基于准备好的dom，初始化echarts实例
	var myChart = echarts.init(document.getElementById('echarts_div'),'dark');//dark为暗黑主题 不要可以去掉

	// 指定图表的配置项和数据
	var option = {
		title : {
			text : 'ECharts 基础柱状图'
		},
		tooltip : {},
		legend : {
			data : [ '柱状数据表' ]
		},
		xAxis : {
			data : nameArr
		},
		yAxis : {},
		series : [ {
			name : '数据',
			type : 'bar',
			data : valueArr
		} ],
	};
	
	// 使用刚指定的配置项和数据显示图表。
	myChart.setOption(option);

}
//南丁格尔玫瑰图
function rose() {
	
	//基于准备好的dom，初始化echarts实例
	var myChart2 = echarts.init(document.getElementById('echarts_div2'),"dark");//dark为暗黑主题 不要可以去掉

	var option = {
		title : {
			text : 'ECharts 南丁格尔玫瑰图'
		},
		series : [ {
			name : '访问来源',
			type : 'pie',
			roseType: 'angle',//南丁格尔玫瑰图样式  去掉则显示基本圆饼图
			radius : '55%',
			data : obArr
		} ]
	};
	

	myChart2.setOption(option);
}
