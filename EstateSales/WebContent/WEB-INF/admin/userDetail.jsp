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
<title>用户详情</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="author" content="Muhammad Usman">

    <!-- The styles -->
    <%@include file="./jsAndCss.jsp" %>
    <!-- jQuery -->
	<link href="<%=path%>/toastr/toastr.min.css" rel="stylesheet"/> 
</head>

<body>
	<div class="container">
 
    <!-- topbar starts -->
    <%@ include file="./topbar.jsp" %>
    <!-- topbar ends -->
<div class="ch-container">
    <div class="row">
        
        <!-- left menu starts -->
        <%@ include file="./leftMenu.jsp" %>
        <!--/span-->
        <!-- left menu ends -->
				<div id="content" class="col-lg-10 col-sm-10">
					<!-- content starts -->
					<div>
						<ul class="breadcrumb">
							<li><a href="javascript:void(0)">首页</a></li>
							<li><a href="javascript:void(0)">用户详细资料</a></li>
						</ul>
					</div>

					<div class="row">
						<div class="panel panel-info">
							<div class="panel-heading">
						    	<div class="media">
									<div class="media-left">
										 <img class="media-object" src="${user.headicon }" alt="...">
									</div>
									 <div class="media-body">
    									<span>${user.nickname }</span>
									</div>
								</div>
						  </div>
							<div class="panel-body">
							<ul>
								<li>手机：${user.phone}</li>
								<li>邮箱：${user.email }</li>
								<li>QQ：${user.qq }</li>
								<li>微信：${user.wechat }</li>
								<li>性别：${user.gender }</li>
								<li>真实姓名：${user.name }</li>
								<li>生日：${user.birthday }</li>
								<li>住址：${user.address }</li>
								<li>简介：<span>${user.introduction }</span></li>
								</ul>
							</div>
						</div>
						<!--/row-->
					</div>

				</div><!--/.fluid-container-->
</div>
<!-- external javascript -->

<script type="text/javascript" src="<%=path %>/bootstrap/dist/js/bootstrapValidator.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-locale-all.min.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-zh-CN.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-export.js"></script>
<script src="<%=path%>/bootstrap/tableExport.js"></script>
<script src="<%=path %>/toastr/toastr.min.js"></script>
<script src="<%=path %>/js/article.js"></script>
<script src="<%=path %>/js/toastrOption.js"></script>
<script src="<%=path %>/js/formFill.js"></script>
</body>
</html>