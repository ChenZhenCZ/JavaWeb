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
<title>楼盘管理</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="author" content="Muhammad Usman">

    <!-- The styles -->
    <%@include file="./jsAndCss.jsp" %>
    <!-- jQuery -->
    <link rel="stylesheet" href="<%=path %>/bootstrap/select2/select2.min.css" />
	<link href="<%=path%>/bootstrap/bootstrap-table.css" rel="stylesheet"/> 
	<link href="<%=path%>/toastr/toastr.min.css" rel="stylesheet"/> 
</head>

<body>
	<!-- 审核模态框 -->
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
							<li><a href="javascript:void(0)">楼盘管理</a></li>
						</ul>
					</div>

					<div class="row">
					<div class="col-lg-5 col-xs-7 pull-left">
                    <div class="input-group">
                    	<select id="select" name="agencyId" >
	   			   			<s:iterator var="t" value="#request.agencyList">
	   			   				<option value="${t.id }" >${t.name }</option>
	   			   			</s:iterator>
	   			   		</select>
                            <button class="btn btn-default search" type="button">Go!</button>
                    </div>
                </div>
						<!-- 表格 -->
						<div id="toolbar" class="btn-group">
							<button id="look" type="button" class="btn btn-success">
								<span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span>查看详情
							</button>
						</div>
						<div class="col-xs-12">
							<table id="tb" class="table table-bordered table-hover table-condensed" data-toggle="table"
						data-url="<%=path %>/buildings/allBuildsList" data-pagination="true" data-striped="true">
						<thead>
							<tr>
								<th data-radio="true"></th>
								<th data-field="logo" data-formatter="logoFormatter">楼盘封面</th>
								<th data-field="name">楼盘名称</th>
								<th data-field="agency.name">所属经销商</th>
								<th data-field="floor_area">占地面积</th>
								<th data-field="avg_price">楼盘均价</th>
								<th data-field="company">开发公司</th>
								<th data-field="tel">售楼电话</th>
								<th data-field="property_company">物业公司</th>
								<th data-field="status">状态</th>
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
<script src="<%=path %>/bootstrap/select2/select2.full.min.js"></script>
<script src="<%=path %>/bootstrap/select2/select2.min.js"></script>
<script src="<%=path %>/js/allBuildingsList.js"></script>
<script src="<%=path %>/js/toastrOption.js"></script>
<script src="<%=path %>/js/formFill.js"></script>
</body>
</html>