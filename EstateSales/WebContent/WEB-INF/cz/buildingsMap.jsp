<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path= request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<title>楼盘地图</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
    <meta name="author" content="Muhammad Usman">
	<%@include file="./Jspscript.jsp" %>
    <link rel="stylesheet" href="<%=path%>/toastr/toastr.min.css">
 	
    <link href="<%=path%>/plugins/bootstrap/bootstrap.min.css" rel="stylesheet">
	<link href="<%=path%>/bootstrap/bootstrap-table.css" rel="stylesheet"/> 
	<script type="text/javascript" src="<%=path%>/bootstrap/dist/js/bootstrapValidator.js"></script>
	 <link rel="stylesheet" href="<%=path%>/bootstrap/dist/css/bootstrapValidator.css"/>
	 <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=x67gHfVD1WUEc85lSreVfFIaWajsQSZG"></script>
	<body>
	
	  		<!-- 更换经销商logo -->
			<%@ include file="./changeAgencyLogo.jsp" %>
		    <!-- topbar starts -->
		  <%@ include file="./top.jsp" %>
    <div class="row">
        
        <!-- left menu starts -->
       <%@ include file="./lefEmp.jsp" %>
        <!--/span-->
        <!-- left menu ends -->

        <div id="content" class="col-lg-10 col-sm-10">
            <!-- content starts -->
            <div>
    <ul class="breadcrumb">
        <li>
            <a href="<%=path%>">首页</a>
        </li>
        <li>
            <a href="#">楼盘地图</a>
        </li>
    </ul>
</div>
	<div class="row">
		<div style="width: col-md-12; height: 550px; border: #ccc solid 1px;"
				id="allmap"></div>
    </div>
</div>
</div><!--/.fluid-container-->
        
<script src="<%=path%>/bootstrap/bootstrap-table.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-locale-all.min.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-zh-CN.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-export.js"></script>
<script src="<%=path%>/bootstrap/tableExport.js"></script>
<script src="<%=path %>/js/formFill.js"></script>
<!-- jQuery消息提示框 -->
<script src="<%=path%>/toastr/toastr.min.js"></script>
<script src="<%=path%>/js/toastrOption.js"></script>  
<script src="<%=path%>/js/empbuildingList.js"></script> 
 <!-- 上传图片 -->
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
var opts = {
		width : 400,     // 信息窗口宽度
		height: 200,     // 信息窗口高度
		enableMessage:true//设置允许信息窗发送短息
	   };
	  var lng=${emp.buildings.longitude}
	  var lat=${emp.buildings.latitude}
	  var title='${emp.buildings.name}';
	  var logo='${emp.buildings.logo}';
	  var c='${emp.buildings.intro}';
	var marker = new BMap.Marker(new BMap.Point(lng,lat));  // 创建标注
	var content = "<h4 style='margin:0 0 5px 0;padding:0.2em 0'>"+title+"</h4>" + 
	"<img style='float:right;margin:4px' id='imgDemo' src='"+logo+"' width='139' height='104'/>" + 
	"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>"+c+"</p>" + 
	"</div>";
	map.addOverlay(marker);               // 将标注添加到地图中
	addClickHandler(content,marker);
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
$('#logo').fileinput({
    language: 'zh',
    uploadUrl: '<%=path%>/staff/uploadLogo',
    allowedFileExtensions : ['jpg', 'png','gif'],
})
var imgSrc="";
$('#logo').on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功		
	 imgSrc=data.response.emp.headicon;
	 $("#changeLogo").modal("toggle");
})
$(function () {
	$('#changeLogo').on('hide.bs.modal', function () {
		$("#headicon").attr('src',imgSrc)
 	})
 });
</script>
 
</body>
</html>