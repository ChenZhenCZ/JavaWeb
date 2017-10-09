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

    <!-- The styles -->
	<%@include file="./JsAndCss.jsp" %>
	
	<!-- jQuery消息提示框 -->
	<link rel="stylesheet" href="<%=path%>/toastr/toastr.min.css">
    
    <link href="<%=path%>/plugins/bootstrap/bootstrap.min.css" rel="stylesheet">
	<link href="<%=path%>/bootstrap/bootstrap-table.css" rel="stylesheet"/> 
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=x67gHfVD1WUEc85lSreVfFIaWajsQSZG"></script>
</head>

<body>
	<!-- 模态框：更换经销商logo -->
	<%@ include file="./changeAgencyLogo.jsp" %>
    <%@ include file="./top.jsp"%>    
<div class="ch-container">
    <div class="row">
        <!-- left menu starts -->
        <%@ include file="./leftMenu.jsp" %>
        <!-- left menu ends -->
        <!-- content starts -->
		<div id="content" class="col-lg-10 col-sm-10">
			<div>
				<ul class="breadcrumb">
					<li><a href="<%=path%>/agency/main">首页</a></li>
					<li><a href="javacsript:void(0);">楼盘地图</a></li>
				</ul>
			</div>
			<!-- 表内容开始 -->
			<div class="row">
				<div style="width: col-md-12; height: 550px; border: #ccc solid 1px;"
				id="allmap"></div>
			</div>
		</div>
		<!-- content end -->
	</div>
	<!--/row-->
</div>
<!--/.fluid-container-->

<script src="<%=path%>/bootstrap/bootstrap-table.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-locale-all.min.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-zh-CN.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-export.js"></script>
<script src="<%=path%>/bootstrap/tableExport.js"></script>

<script src="<%=path %>/js/formFill.js"></script>
<script src="<%=path %>/js/buildsList.js"></script>

<!-- jQuery消息提示框 -->
<script src="<%=path%>/toastr/toastr.min.js"></script>
<!-- 经销商更换logo -->
<script>
//地图js
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
	var data=new Array();
	data=${buildsList};
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


$('#logo').fileinput({
    language: 'zh',
    uploadUrl: '<%=path%>/agency/uploadLogo',
    allowedFileExtensions : ['jpg', 'png','gif'],
})
var imgSrc="";
$('#logo').on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功		
	imgSrc=data.response.agencyVo.logo;
	$("#changeLogo").modal("toggle");
})
$(function () {
	$('#changeLogo').on('hide.bs.modal', function () {
		if(imgSrc!=""){
			$("#logoImg").attr('src',imgSrc)
		}
 	})
 });
 
  
 //打开模态框 ： 批量上传楼盘图片
var buildId="";
$(function(){
	$(".batchUploadImg").click(function(){
		var data=$("#tb").bootstrapTable("getSelections");
		if(data.length==1){
			buildId = data[0].id; //获取选中的活动Id
			$("#batchImg").modal();	//打开模态框
		}else{
			toastr.warning("未选中需要添加图片的楼盘!");  
		}
	})
})
 
 $('#batchUploadImg').fileinput({
    language: 'zh',
    uploadUrl: '<%=path%>/buildings/batchUploadImg',
    allowedFileExtensions : ['jpg', 'png','gif'],
    uploadExtraData:
    	function(previewId, index) {   //额外参数的关键点
	    	var data = {
	   			buildId:buildId
	    	};
	        return data;
    }
})
$('#batchUploadImg').on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功		
	$("#batchUploadImg").fileinput('reset');
})
$(function () {
	$('#batchImg').on('hide.bs.modal', function () {
		  //清空文件框的预览图片
 	})
 });
</script>
</body>
</html>