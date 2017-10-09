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

<title>楼盘信息</title>
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
	<link href="<%=path %>/agency/css/style.default.css" rel="stylesheet">
  	<link href="<%=path %>/agency/css/fullcalendar.css" rel="stylesheet">
	<body>
	
	  		<!-- 更换经销商logo -->
		<%@ include file="./changeAgencyLogo.jsp" %>
		    <!-- topbar starts -->
		  <%@ include file="./top.jsp" %>
        <!-- left menu starts -->
       <%@ include file="./lefEmp.jsp" %>
        <!--/span-->
        <!-- left menu ends -->
        <div class="ch-container">
    <div class="row">
        <!-- left menu starts -->
        <!-- left menu ends -->
        <!-- content starts -->
		<div id="content" class="col-lg-10 col-sm-10">
			<div>
				  <ul class="breadcrumb">
		        <li>  <a href="<%=path%>">首页</a></li>
		        <lI><a href="#">楼盘信息</a></li>
		    </ul>
			</div>
			<div class="contentpanel">
				<!-- content goes here... -->
			   	<div class="row blog-content">
			      <div class="col-sm-9">
			        <div class="panel panel-default panel-blog">
			          <div class="panel-body">
			              <h3 class="blogsingle-title">${emp.buildings.name}楼盘</h3>
			             <ul class="blog-meta">
			              <li>创建于</li>
			              <li>${emp.buildings.created_time }</li>
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
			              <p>${emp.buildings.traffic }</p>
			            </div><br/>
			            <div class="media-body event-body">
			              <h4 class="subtitle">周边配置</h4>
			              <p>${emp.buildings.equipments }</p>
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
		            <li>房源类型：${emp.buildings.house_type}</li>
		            <li>建筑类型：${emp.buildings.building_type}</li>
		          </ul>
		          
		          <div class="mb30"></div>
		          <h5 class="subtitle">位置信息</h5>
		          <ul class="sidebar-list">
		           	<li>所属区域： ${emp.buildings.area}</li>
		            <li>楼盘位置：${emp.buildings.address}</li>
		            <li>占地面积： ${emp.buildings.floor_area}平方米</li>
		            <li>建筑面积： ${emp.buildings.building_area}平方米</li>
		          </ul>
		          
		          <div class="mb30"></div>
		          <h5 class="subtitle">销售信息</h5>
		          <ul class="sidebar-list">
		          	<li>楼盘均价：  ${emp.buildings.avg_price}元/㎡ </li>
		          	<li>总套数：  ${emp.buildings.total_rooms}</li>
		           	<li>咨询电话： ${emp.buildings.tel}</li>
		            <li>开 发  商： ${emp.buildings.company }</li>
		            <li>开盘时间：  ${emp.buildings.company}</li>
		            <li>售楼地址： ${emp.buildings.reception_address}</li>
		          </ul>
		          
		          <div class="mb30"></div>
		          <h5 class="subtitle">规划信息</h5>
		          <ul class="sidebar-list">
		           <li>占地面积：  ${emp.buildings.floor_area}平方米</li>
		            <li>建筑面积： ${emp.buildings.building_area}平方米</li>
		            <li>绿 化  率： ${emp.buildings.green_ratio}%</li>
		            <li>容积率： ${emp.buildings.plot_ratio}</li>
		          </ul>
		          
		          <div class="mb30"></div>
		          <h5 class="subtitle">配套信息</h5>
		          <ul class="sidebar-list">
		           	<li>物业公司：  ${emp.buildings.property_company}</li>
		            <li>物 业  费： ${emp.buildings.property_fee}元/平方米·月</li>
		            <li>停  车   位： ${emp.buildings.car_station}个</li>
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
        
        
        
        
<script src="<%=path%>/bootstrap/bootstrap-table.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-locale-all.min.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-zh-CN.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-export.js"></script>
<script src="<%=path%>/bootstrap/tableExport.js"></script>
<script src="<%=path %>/js/formFill.js"></script>
<!-- jQuery消息提示框 -->
<script src="<%=path%>/toastr/toastr.min.js"></script>
<script src="<%=path%>/js/toastrOption.js"></script>  
 <!-- 上传图片 -->
<script>
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