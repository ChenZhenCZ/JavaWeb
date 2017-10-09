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
<title>楼盘详情</title>
 	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="author" content="Muhammad Usman">
    <!-- The styles -->
	<%@include file="./JsAndCss.jsp" %>
	
	<link rel="stylesheet" href="../bootstrap/dist/css/bootstrapValidator.css"/>
	<script type="text/javascript" src="../bootstrap/dist/js/bootstrapValidator.js"></script>
	
	<link href="<%=path %>/agency/css/style.default.css" rel="stylesheet">
  	<link href="<%=path %>/agency/css/fullcalendar.css" rel="stylesheet">
</head>

<body>
	<!-- 更换经销商logo -->
	<%@ include file="./changeAgencyLogo.jsp" %>
	<%@ include file="./top.jsp" %>    
    
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
					<li><a href="javacsript:void(0);">查看楼盘详情</a></li>
				</ul>
			</div>
			<div class="contentpanel">
				<!-- content goes here... -->
			   	<div class="row blog-content">
			      <div class="col-sm-9">
			        <div class="panel panel-default panel-blog">
			          <div class="panel-body">
			            <h3 class="blogsingle-title">${buildingsVO.name }楼盘</h3>
			            <ul class="blog-meta">
			              <li>创建于</li>
			              <li>${buildingsVO.created_time }</li>
			            </ul>
			            <br />
			            <div class="blog-img"><img src="${buildingsVO.logo}" class="img-responsive" alt="楼盘图片" /></div>
			            <div class="mb20"></div>
			            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${buildingsVO.intro }</p>  
			          </div><!-- panel-body -->
			        </div><!-- panel -->
			        <div class="authorpanel">
			          <div class="media">
			            <div class="media-body event-body">
			              <h4 class="subtitle">交通状况</h4>
			              <p>${buildingsVO.traffic }</p>
			            </div><br/>
			            <div class="media-body event-body">
			              <h4 class="subtitle">周边配置</h4>
			              <p>${buildingsVO.equipments }</p>
			            </div>
			          </div><!-- media -->
			        </div><!-- authorpanel -->
			        <div class="mb10"></div>
			   
			        <div class="mb30"></div>
			        
			        <div class="mb30"></div>
		          	
			      </div><!-- col-sm-8 -->
			      <div class="col-sm-3">
			        <div class="blog-sidebar">
			          <h5 class="subtitle">类型信息</h5>
			          <ul class="sidebar-list">
			            <li>房源类型：${buildingsVO.house_type }</li>
			            <li>建筑类型：${buildingsVO.building_type }</li>
			          </ul>
			          <div class="mb30"></div>
			          <h5 class="subtitle">销售信息</h5>
		        	  <ul class="media-list comment-list">
			          	 <li>楼盘均价：  ${buildingsVO.avg_price }元/㎡ </li>
			          	 <li>总套数：  ${buildingsVO.total_rooms }</li>
			           	 <li>咨询电话：  ${buildingsVO.tel }</li>
			             <li>开 发  商： ${buildingsVO.company }</li>
			             <li>开盘时间：  ${buildingsVO.open_date }</li>
			             <li>售楼地址：  ${buildingsVO.reception_address }</li>
			          </ul><!-- comment-list -->
			          <h5 class="subtitle">位置信息</h5>
			          <ul class="sidebar-list">
			           	<li>所属区域： ${buildingsVO.area }</li>
			            <li>楼盘位置：  ${buildingsVO.address }</li>
			            <li>占地面积： ${buildingsVO.floor_area }平方米</li>
			            <li>建筑面积：  ${buildingsVO.building_area }平方米</li>
			          </ul>
			          <div class="mb30"></div>
			          <h5 class="subtitle">销售信息</h5>
			          <ul class="sidebar-list">
			          	<li>楼盘均价：  ${buildingsVO.avg_price }元/㎡ </li>
			          	<li>总套数：  ${buildingsVO.total_rooms }</li>
			           	<li>咨询电话：  ${buildingsVO.tel }</li>
			            <li>开 发  商： ${buildingsVO.company }</li>
			            <li>开盘时间：  ${buildingsVO.open_date }</li>
			            <li>售楼地址：  ${buildingsVO.reception_address }</li>
			          </ul>
			          <div class="mb30"></div>
			          <h5 class="subtitle">规划信息</h5>
			          <ul class="sidebar-list">
			           <li>占地面积：  ${buildingsVO.floor_area }平方米</li>
			            <li>建筑面积：  ${buildingsVO.building_area }平方米</li>
			            <li>绿 化  率： ${buildingsVO.green_ratio }%</li>
			            <li>容积率：  ${buildingsVO.plot_ratio }</li>
			          </ul>
			          <div class="mb30"></div>
			          <h5 class="subtitle">配套信息</h5>
			          <ul class="sidebar-list">
			           	<li>物业公司：  ${buildingsVO.property_company }</li>
			            <li>物 业  费：  ${buildingsVO.property_fee }元/平方米·月</li>
			            <li>停  车   位： ${buildingsVO.car_station }个</li>
			          </ul>
			        </div><!-- blog-sidebar -->
			      </div><!-- col-sm-4 -->
			      </div><!-- row -->
			</div><!-- contentpanel -->
		</div>
		<!-- content end -->
	</div>
	<!--/row-->
</div>
<!--/.fluid-container-->


<script>
//上传图片
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
</script>
</body>
</html>