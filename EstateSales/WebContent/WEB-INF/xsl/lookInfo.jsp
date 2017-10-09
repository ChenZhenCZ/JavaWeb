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
<title>经销商信息查看</title>
 	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="author" content="Muhammad Usman">

    <!-- The styles -->
	<%@include file="./JsAndCss.jsp" %>
</head>

<body>
	<!-- 更换经销商logo -->
	<%@ include file="./changeAgencyLogo.jsp" %>
    <!-- topbar starts -->
    <%@ include file="./top.jsp"%>
    <!-- topbar ends -->
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
					<li><a href="javacsript:void(0);">经销商信息查看</a></li>
				</ul>
			</div>
			<!-- 信息修改开始 -->
			<form id="modify" method="post" class="form-horizontal" >
			<div class="form-group">
				<label class="col-lg-3 control-label">经销商名称</label>
				<div class="col-lg-5">
					<input type="text" readonly="readonly" class="form-control" name="agencyVo.name" value="${agencyVo.name}"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label">负责人手机号</label>
				<div class="col-lg-5">
					<input type="text" readonly="readonly" class="form-control" name="agencyVo.phone" value="${agencyVo.phone}"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label">负责人姓名</label>
				<div class="col-lg-5">
					<input type="text" readonly="readonly" class="form-control" name="agencyVo.leader" value="${agencyVo.leader}"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label">邮箱</label>
				<div class="col-lg-5">
					<input type="text" readonly="readonly" class="form-control" name="agencyVo.email" value="${agencyVo.email}"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label">固定电话</label>
				<div class="col-lg-5">
					<input type="text" readonly="readonly" class="form-control" name="agencyVo.tel" value="${agencyVo.tel}"/>
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-3 control-label">地址</label>
				<div class="col-lg-5">
					<input type="text" readonly="readonly" class="form-control" name="agencyVo.address" value="${agencyVo.address}"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label" id="captchaOperation">简介</label>
				<div class="col-lg-5">
					<textarea  rows="5" readonly="readonly" class="form-control" name="agencyVo.intro">${agencyVo.intro}</textarea>
				</div>
			</div>
			<div class="form-group">
				<div class="col-lg-10 col-lg-offset-5" >
					
				</div>
			</div>
			</form>
			<!-- 信息修改结束 -->
		</div>
		<!-- content end -->
	</div>
	<!--/row-->
</div>
<!--/.fluid-container-->

<!-- 上传图片 -->
<script>
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