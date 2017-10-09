<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path= request.getContextPath();
%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>楼盘地图</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="author" content="Muhammad Usman">
	<%@include file="./jsAndCss.jsp" %>
    <!-- jQuery -->
    <link href="<%=path%>/toastr/toastr.min.css" rel="stylesheet"/> 
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=x67gHfVD1WUEc85lSreVfFIaWajsQSZG"></script>
</head>
<body >
	<div class="container">
    <!-- topbar starts -->
    <%@ include file="./topbar.jsp" %>
    <!-- topbar ends -->
		<div class="ch-container">
			</div>
			<!-- left menu starts -->
			<%@ include file="./leftMenu.jsp" %>
			<!--/span-->
			<!-- left menu ends -->


		<div id="content" class="col-lg-10 col-sm-10">
			<div>
				<ul class="breadcrumb">
					<li><a href="<%=path%>/admin/index">首页</a></li>
					<li><a href="javacsript:void(0);">楼盘地图</a></li>
				</ul>
			</div>
			<!-- content starts -->
			<div style="width:col-md-12; height: 550px; border: #ccc solid 1px;"
				id="allmap"></div>
			<!--/row-->
		</div>

	</div>
		<!--/.fluid-container-->
</div>
<!-- external javascript -->
<script src="<%=path %>/toastr/toastr.min.js"></script>
<script src="<%=path %>/js/toastrOption.js"></script>
<script src="<%=path %>/js/formFill.js"></script>
<script>
	var map = new BMap.Map("allmap");    // 创建Map实例
	map.centerAndZoom(new BMap.Point(114.98,25.82), 12);  // 初始化地图,设置中心点坐标和地图级别
	map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
	map.setCurrentCity("赣州");          // 设置地图显示的城市 此项是必须设置的
	map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
	function myFun(result){
		var cityName = result.name;
		map.setCenter(cityName);
		toastr.info("当前定位城市:"+cityName);
	}
	var myCity = new BMap.LocalCity();
	myCity.get(myFun);
//获取鼠标选取的坐标
	//map.addEventListener("click",function(e){
	//alert(e.point.lng + "," + e.point.lat);
//});
	
	var data=new Array();
	data=${list};
	var opts = {
			width : 400,     // 信息窗口宽度
			height: 200,     // 信息窗口高度
			enableMessage:true//设置允许信息窗发送短息
		   };
	for(var i=0;i<=data.length;i++){
		var marker = new BMap.Marker(new BMap.Point(data[i][0],data[i][1]));  // 创建标注
		var content = "<h4 style='margin:0 0 5px 0;padding:0.2em 0'>"+data[i][2]+"</h4>" + 
		"<img style='float:right;margin:4px' id='imgDemo' src='"+data[i][4]+"' width='139' height='104'/>" + 
		"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>"+data[i][3]+"</p>" + 
		"</div>";
		map.addOverlay(marker);               // 将标注添加到地图中
		addClickHandler(content,marker);
	}
	function addClickHandler(content,marker){
		marker.addEventListener("click",function(e){
			openInfo(content,e)}
		);
	}
	function openInfo(content,e){
		var p = e.target;
		var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
		var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象 
		map.openInfoWindow(infoWindow,point); //开启信息窗口
	}
</script>
</body>
</html>