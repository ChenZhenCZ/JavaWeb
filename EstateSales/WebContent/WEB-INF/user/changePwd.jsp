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
<title>修改密码</title>
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
</head>
<body onload="msg()" style="background-color:#fff;">
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
							<li><a href="../user/changePwdPage">更改密码</a></li>
						</ul>
					</div>

					<div class="content">
			             <div class="container-fluid">
			                <div class="row">
			                     <div class="col-lg-12 col-md-12">
			                        <div class="card">
			                            <div class="header">
			                                <h2 id="tip" class="title" style="text-align: center;">更改密码</h2>
			                            </div>
			                            <div class="content">
			                             	<form action="<%=path%>/user/changePwd" id="changePwd" class= "form-group" method="post">
										        <div class="row">
			                                        <div class="col-md-8 col-md-offset-2">
			                                            <div class="form-group">
			                                                <label for="pwd">旧密码</label>
			                                                <input type="password" class="form-control border-input" name="user.pwd" id="pwd" placeholder="请输入旧密码">
			                                            </div>
			                                        </div>
			                                    </div>
			                                    <div class="row">
			                                        <div class="col-md-8 col-md-offset-2">
			                                            <div class="form-group">
			                                                <label for="qq">新密码</label>
			                                                <input type="password" class="form-control border-input" name="user.qq" id="qq" placeholder="请输入新密码">
			                                            </div>
			                                        </div>
			                                    </div>
												<div class="row">
			                                        <div class="col-md-8 col-md-offset-2">
			                                            <div class="form-group">
			                                                <label for="confirmPassword">确认密码</label>
			                                                <input type="password" class="form-control border-input" name="confirmPassword" id="confirmPassword" placeholder="确认新密码">
			                                            </div>
			                                        </div>
			                                    </div>
			                                    <div class="text-center">
			                                        <button type="submit" class="btn btn-info btn-fill btn-wd" value="更换密码">更换密码</button>
			                                    </div>
			                                    <div class="clearfix"></div>
			                                </form>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			            </div>
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
<!-- 错误提示 -->
<script src="<%=path%>/toastr/toastr.min.js"></script>
<script src="<%=path%>/js/toastrOption.js"></script>
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
function msg(){
	var msg='${msg}'
	if(msg!=''){
		$("#tip").css("color","red");
		$("#tip").html(msg);
	}
}
</script>
</body>
</html>