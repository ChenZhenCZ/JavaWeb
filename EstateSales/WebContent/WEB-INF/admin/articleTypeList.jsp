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
<title>文章类别管理</title>
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
	<!-- 编辑模态框-->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">修改文章类别</h4>
	      </div>
	      <div class="modal-body">
	       	<form id="f" >
	       		<input type="hidden" name="articleType.id">
        		<label>文章类别名称</label>
        		<input name="articleType.name" type="text" required="required"> 
        		<label>文章类别描述</label>
        		<input type="text" name="articleType.des" required="required">
    		</form> 
	      </div>
	      <div class="modal-footer">
       		 <button type="button" class="btn btn-success" id="update" >修改</button>
	      </div>
	    </div>
	  </div>
	</div>
<!-- 编辑模态框结束 -->
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
							<li><a href="javacsript:void(0);">文章类别管理</a></li>
						</ul>
					</div>

					<div class="row">
						<!-- 表格 -->
						<div id="toolbar" class="btn-group">
							<button id="edit" type="button" class="btn btn-success">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>编辑
							</button>
							<button id="delete" type="button" class="btn btn-danger">
								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
							</button>
						</div>
						<div class="col-xs-12">
							<table id="tb" class="table table-bordered table-hover"
								data-toggle="table" data-url="<%=path %>/admin/articleTypeList"
								data-pagination="true" data-striped="true">
								<thead>
									<tr>
										<th data-radio="true"></th>
										<th data-field="name">名称</th>
										<th data-field="des">描述</th>
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
<script src="<%=path %>/js/articleTypeList.js"></script>
<script src="<%=path %>/js/toastrOption.js"></script>
<script src="<%=path %>/js/formFill.js"></script>
</body>
</html>