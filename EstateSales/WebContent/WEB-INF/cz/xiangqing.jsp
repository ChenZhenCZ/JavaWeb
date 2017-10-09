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

<title>查看详情</title>
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
            <a href="#">查看详情</a>
        </li>
    </ul>
</div>
<div class="row">
		<ul>
			<li>客户名称: ${sale.customer.name }</li>
			<li>状态: 已购房</li>
			<li>房屋类型: ${buildings.house_type }</li>
			<li>参考单价: ${sale.unit_price }￥</li>
			<li>销售折扣: ${sale.discount }</li>
			<li>销售总价: ${sale.total_cost }￥</li>
			<li>房号: ${sale.room.name }</li>
			<li>联系地址: ${sale.customer.address }</li>
			<li>联系电话: ${sale.customer.phone }</li>
			<li>员工名称: ${sale.emp.name }</li>
			<li>员工电话: ${sale.emp.phone }</li>
			<li>楼盘名称: ${buildings.name }</li>
			<li>物业费:  ${buildings.property_fee}元/平方米·月</li>
			<li>停  车   位： ${buildings.car_station}个</li>
			<li>客服电话: ${buildings.tel}</li>
			<li>售楼地址： ${buildings.reception_address}</li>
			<li>所属区域： ${buildings.area}</li>
			<li>物业公司: ${buildings.property_company}</li>
			<li>开发公司: ${buildings.company }</li>
		</ul>

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
		if(imgSrc!=""){
		$("#headicon").attr('src',imgSrc)
		}
 	})
 });
</script>
 
</body>
</html>