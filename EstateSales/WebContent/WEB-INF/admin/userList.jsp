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
<title>用户管理</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="author" content="Muhammad Usman">

    <!-- The styles -->
    <%@include file="./jsAndCss.jsp" %>
    <!-- jQuery -->
     <link rel="stylesheet" href="<%=path %>/bootstrap/dist/css/bootstrapValidator.css"/>
	<link href="<%=path%>/bootstrap/bootstrap-table.css" rel="stylesheet"/> 
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
							<li><a href="<%=path%>/admin/index">首页</a></li>
							<li><a href="javacsript:void(0);">用户管理</a></li>
						</ul>
					</div>

					<div class="row">
						<!-- 表格 -->
						<div id="toolbar" class="btn-group">
							<button id="look" type="button" class="btn btn-success">
								<span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span>查看详情
							</button>
						</div>
						<div class="col-xs-12 table-responsive">
							<table id="tb" class="table  table-hover" data-toggle="table"
								data-url="<%=path %>/user/userList" data-pagination="true"
								data-striped="true">
								<thead>
									<tr>
										<th data-radio="true"></th>
										<th data-field="nickname">昵称</th>
										<th data-field="headicon" data-formatter="headiconFormatter">头像</th>
										<th data-field="name">姓名</th>
										<th data-field="phone">手机号码</th>
										<th data-field="email">邮箱</th>
										<th data-field="gender">性别</th>
										<th data-field="address">住址</th>
									</tr>
								</thead>
							</table>
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
<script src="<%=path %>/js/userList.js"></script>
<script src="<%=path %>/js/toastrOption.js"></script>
<script src="<%=path %>/js/formFill.js"></script>
</body>
</html>