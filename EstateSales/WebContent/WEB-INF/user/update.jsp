<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改资料</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="author" content="Muhammad Usman">
  <!-- The styles -->
  <%@include file="../xsl/JsAndCss.jsp" %>
 	
 	<!-- jQuery消息提示框 -->
	<link rel="stylesheet" href="<%=path%>/toastr/toastr.min.css">
    <link href="<%=path%>/plugins/bootstrap/bootstrap.min.css" rel="stylesheet">
	<link href="<%=path%>/bootstrap/bootstrap-table.css" rel="stylesheet"/>
    <link rel="stylesheet" href="<%=path %>/bootstrap/dist/css/bootstrapValidator.min.css"/>
    <link rel="stylesheet" href="<%=path %>/bootstrap/bootstrap-datetimepicker.min.css">  
	<script type="text/javascript"  src="<%=path %>/bootstrap/bootstrap-datetimepicker.min.js"></script>  
    
</head>
<body style="background-color:#fff;">
	<div>
		<!-- topbar starts -->
		<div class="navbar navbar-default" role="navigation">
			<div class="navbar-inner">
				<button type="button" class="navbar-toggle pull-left animated flip">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html"> <img
					alt="Charisma Logo" src="<%=path%>/managePlugin/img/logo20.png"
					class="hidden-xs" /> <span>用户中心</span></a>

				<!-- user dropdown starts -->
				<div class="btn-group pull-right">
					<button class="btn btn-default dropdown-toggle"
						data-toggle="dropdown">
						<i class="glyphicon glyphicon-user"></i><span
							class="hidden-sm hidden-xs">&nbsp;&nbsp;${session.user.name}</span> <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li><a href="../user/changePwdPage">修改密码</a></li>
						<li class="divider"></li>
						<li><a href="../user/exit">退出登录</a></li>
					</ul>
				</div>
				<!-- user dropdown ends -->
			</div>
		</div>

		<!-- topbar ends -->
		<div class="ch-container">
			<div class="row">

				<!-- left menu starts -->
				<%@ include file="./leftMenu.jsp"%>
				<!--/span-->
				<!-- left menu ends -->

				<div id="content" class="col-lg-10 col-sm-10">
					<!-- content starts -->
					<div>
						<ul class="breadcrumb">
							<li><a href="../user/index">首页</a></li>
							<li><a href="../user/homePage">修改资料</a></li>
						</ul>
					</div>

					<div class="content">
						<form action="<%=path%>/user/update" id="defaultForm"
							method="post">
							<div class="row">
								<div class="col-md-4 col-md-offset-1">
									<div class="form-group">
										<label>用户名称</label> <input type="text"
											class="form-control border-input" name="user.name"
											value="${session.user.name}">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label>我的昵称</label> <input type="text"
											class="form-control border-input" name="user.nickname"
											value="${session.user.nickname}">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-8 col-md-offset-1">
									<div class="form-group">
										<label>性别&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<s:if test='#session.user.gender=="男"'>
											<label class="radio-inline"> <input type="radio"
												name="user.gender" checked value="男">男
											</label>
											<label class="radio-inline"> <input type="radio"
												name="user.gender" value="女">女
											</label>
										</s:if>
										<s:else>
											<label class="radio-inline"> <input type="radio"
												name="user.gender" value="男">男
											</label>
											<label class="radio-inline"> <input type="radio"
												name="user.gender" value="女" checked value="女">女
											</label>
										</s:else>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-8 col-md-offset-1">
									<div class="form-group">
										<label>出生日期</label> <input type="date" id="birthday"
											class="form-control border-input" name="user.birthday"
											value="${session.user.birthday}">

									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-4 col-md-offset-1">
									<div class="form-group">
										<label>手机号码</label> <input type="tel"
											class="form-control border-input" id="phone" name="user.phone"
											value="${session.user.phone}">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label>QQ号码</label> <input type="text"
											class="form-control border-input" name="user.qq"
											value="${session.user.qq}">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4 col-md-offset-1">
									<div class="form-group">
										<label>微信号</label> <input type="text"
											class="form-control border-input" name="user.wechat"
											value="${session.user.wechat}">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label>Email</label> <input type="text"
											class="form-control border-input" name="user.email"
											value="${session.user.email}">
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-8 col-md-offset-1">
									<div class="form-group">
										<label>家庭住址</label> <input type="text"
											class="form-control border-input" name="user.address"
											value="${session.user.address}">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-8 col-md-offset-1">
									<div class="form-group">
										<label>兴趣爱好/简介</label>
										<textarea class="form-control border-input"
											name="user.introduction" rows="3" cols="">${session.user.introduction}</textarea>
									</div>
								</div>
							</div>
							<div class="text-center">
								<button type="submit"class="btn btn-info btn-fill btn-wd">保存修改</button>
							</div>
							<div class="clearfix"></div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/.fluid-container-->
	<!-- external javascript -->
<!-- 表单验证 -->
<script type="text/javascript" src="<%=path %>/bootstrap/dist/js/bootstrapValidator.min.js"></script>                               
<script type="text/javascript" src="<%=path %>/js/user.js"></script>
<script>
$('#headicon').fileinput({
    language: 'zh',
    uploadUrl: '<%=path%>/user/uploadHeadicon',
    allowedFileExtensions : ['jpg', 'png','gif'],
})
var imgSrc="";
$('#headicon').on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功		
	imgSrc=data.response.user.headicon;
	$("#myModal").modal("toggle");
})
$(function () {
	$('#myModal').on('hide.bs.modal', function () {
		$("#logoImg").attr('src',imgSrc)
 	})
 });
</script>
</body>
</html>