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
<title>销售记录管理</title>
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
							<li><a href="javascript:void(0)">首页</a></li>
							<li><a href="javascript:void(0)">销售记录管理</a></li>
						</ul>
					</div>

					<div class="row">
						<!-- 表格 -->
						<div class="col-xs-12">
							<table id="tb" class="table  table-hover" data-toggle="table" 
								data-url="<%=path %>//articleList" data-pagination="true" data-striped="true"
							>
								<thead>
									<tr>
										<th data-radio="true"></th>
										<th data-field="title" >标题</th>
										<th data-field="logo"   data-formatter="logoFormatter">图标</th>
										<th data-field="abstracts">描述</th>
										<th data-field="articleType.name">类型</th>
										<th data-field="orderBy">序号</th>
										<th data-field="created_time">创建日期</th>
										<th data-field="msg_status">状态</th>
										<th data-formatter="operaFormatter" >操作</th>
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
<script src="<%=path %>/js/article.js"></script>
<script src="<%=path %>/js/toastrOption.js"></script>
<script src="<%=path %>/js/formFill.js"></script>
</body>
</html>