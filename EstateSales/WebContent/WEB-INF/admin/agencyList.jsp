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
<title>经销商管理</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="author" content="Muhammad Usman">

    <!-- The styles -->
    <%@include file="./jsAndCss.jsp" %>
    <!-- jQuery -->
	<link href="<%=path%>/bootstrap/bootstrap-table.css" rel="stylesheet"/> 
	<link href="<%=path%>/toastr/toastr.min.css" rel="stylesheet"/> 
</head>

<body>
	<!-- 审核模态框 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">经销商审核</h4>
	      </div>
	      <div class="modal-body">
	       	<form id="form1" class="form-horizontal" >
	       	<input type="hidden" name="agencyVo.id" id="id">
			<div class="form-group">
				<label class="col-lg-3 control-label">经销商名称:</label>
				<div class="col-lg-5">
					<span id="name"></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label">负责人手机号:</label>
				<div class="col-lg-5">
					<span id="phone"></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label">负责人姓名:</label>
				<div class="col-lg-5">
					<span id="leader"></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label">邮箱:</label>
				<div class="col-lg-5">
					<span id="email"></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label">固定电话:</label>
				<div class="col-lg-5">
					<span id="tel"></span>
				</div>
			</div>

			<div class="form-group">
				<label class="col-lg-3 control-label">地址:</label>
				<div class="col-lg-5">
					<span id="address"></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label">状态:</label>
				<div class="col-lg-5">
					<span id="status"></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label">入驻日期:</label>
				<div class="col-lg-5">
					<span id="time"></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label" id="captchaOperation">简介:</label>
				<div class="col-lg-5">
					<span id="intro"></span>
				</div>
			</div>
			<div class="form-group">
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 <a class="btn btn-primary"  id="update">审&nbsp;核</a>
		        </div>
		</form> 
	      </div>
	      <div class="modal-footer">
       		 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 审核模态框结束 -->
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
							<li><a href="javascript:void(0)">经销商管理</a></li>
						</ul>
					</div>

					<div class="row">
						<!-- 表格 -->
						<div id="toolbar" class="btn-group">
					         <button id="check" type="button" class="btn btn-success">
					             <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>审核
					         </button>
					         <button id="remove" type="button" class="btn btn-danger">
					             <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>冻结
					         </button>
				    	 </div>
						<div class="col-xs-12">
							<table id="tb" class="table  table-hover" data-toggle="table" 
								data-url="<%=path %>/agency/list" data-pagination="true" data-striped="true"
							>
								<thead>
									<tr>
										<th data-radio="true"></th>
										<th data-field="name" >经销商名称</th>
										<th data-field="logo"  data-formatter="logoFormatter">商标</th>
										<th data-field="leader">负责人</th>
										<th data-field="address">地址</th>
										<th data-field="created_time"  data-formatter="formatDate">入驻日期</th>
										<th data-field="status" >状态</th>
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
<script src="<%=path %>/js/agencyList.js"></script>
<script src="<%=path %>/js/toastrOption.js"></script>
<script src="<%=path %>/js/formFill.js"></script>
</body>
</html>