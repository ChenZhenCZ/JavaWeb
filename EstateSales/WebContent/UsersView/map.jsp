	<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String path= request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">	
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>用户注册页面</title>
<link rel="stylesheet" href="<%=path %>/bootstrap/vendor/bootstrap/css/bootstrap.min.css"/>
<script type="text/javascript" src="<%=path %>/bootstrap/vendor/jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="<%=path %>/bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- jQuery -->
<link href="<%=path%>/toastr/toastr.min.css" rel="stylesheet"/> 
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=x67gHfVD1WUEc85lSreVfFIaWajsQSZG"></script>
</head>
<body >
<button data-toggle="modal" data-target="#map" class="btn btn-info"><i class="glyphicon glyphicon-map-marker">地图</i></button>                     
<div id="map" class="modal fade" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-title">
					<h2 class="text-center">高德地图</h2>
				</div>
				<div class="modal-body">
					 <div class="row">
				          <div class="col-md-12"  >
				          	<div id="allmap" style="height:400px; width:560px;" >
					         </div>
				          </div>
				     </div>
			</div>
		</div>
	</div>
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
	map.addEventListener("click",function(e){
	alert(e.point.lng + "," + e.point.lat);
});
</script>
</body>
</html>