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
<title>浏览楼盘记录</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="author" content="Muhammad Usman">
  <!-- The styles -->
 	<!-- 图片上传 -->
    <!-- jQuery -->
    <!--表格css -->
   <%@include file="../xsl/JsAndCss.jsp" %>
   <link rel="stylesheet" href="<%=path%>/toastr/toastr.min.css">
    <link href="<%=path%>/plugins/bootstrap/bootstrap.min.css" rel="stylesheet">
	<link href="<%=path%>/bootstrap/bootstrap-table.css" rel="stylesheet"/> 
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
							<li><a href="../history/list">浏览楼盘记录</a></li>
						</ul>
					</div>

					<div class="content">
					 <!-- 表格工具栏开始 -->
			        <div id="toolbar" class="btn-group">
			        <button id="detail"class="btn btn-info">
			        	<span class="glyphicon glyphicon-eye-open" aria-hidden="true">查看详情</span>
			        </button>
	
			        <button id="dd"class=" btn btn-warning">
			            <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除
			        </button>
			  		</div>
			    	<!-- 表格工具栏结束 -->
					<!-- 表格开始 -->
		            <div class="col-xs-12">
		                <table id="tb" class="table table-bordered table-hover table-condensed" data-toggle="table"
							data-url="<%=path %>/history/listPage" data-pagination="true" data-striped="true">
							<thead>
								<tr>
									<th data-field="state" data-radio="true"></th>
										<th data-field="buildings.name">楼盘名称</th>
											<th data-field="created_time" data-formatter="formatDate">浏览时间</th>
							
								</tr>
							</thead>
						</table>
		            </div>
		           	<!-- 表格结束 -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/.fluid-container-->
	<!-- external javascript -->
	
<!-- 表格js -->
<script src="<%=path%>/bootstrap/bootstrap-table.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-locale-all.min.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-zh-CN.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-export.js"></script>
<script src="<%=path%>/bootstrap/tableExport.js"></script>
<script src="<%=path %>/js/formFill.js"></script>
<script src="<%=path%>/toastr/toastr.min.js"></script>
<script src="<%=path%>/js/toastrOption.js"></script>
<script src="<%=path %>/js/table_history.js"></script>
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