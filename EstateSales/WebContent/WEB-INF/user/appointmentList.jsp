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
<title>预约信息</title>
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
				<!-- 修改模态框开始 -->
				<div id="modifyappointment" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-body">
								<button class="close" data-dismiss="modal">
									<span>&times;</span>
								</button>
							</div>
							<div class="modal-title">
								<h2 class="text-left">修改预约</h2>
							</div>
							<div class="modal-body">
								<form class="form-group" id="appointmentUpdate" method="post">
									<input type="hidden" name="appointment.id" id="app_id">
									<div class="form-group">
										<label for="app_arrive_time">预约看房时间</label>
										<input class="form-control form_datetime" type="text" style="background-color: #FFFFFF;"name="appointment.app_arrive_time"  id="app_arrive_time" readonly>
									</div>
									<div class="text-right">
										<button class="btn btn-primary" id="update_btn">修改</button>
										<button class="btn btn-danger" data-dismiss="modal">取消</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- 修改模态框结束 -->
				<div id="content" class="col-lg-10 col-sm-10">
					<!-- content starts -->
					<div>
						<ul class="breadcrumb">
							<li><a href="../user/index">首页</a></li>
							<li><a href="../appointment/userlist">预约信息</a></li>
						</ul>
					</div>

					<div class="content">
					   <!-- 表格工具栏开始 -->
				        <div id="toolbar" class="btn-group">
				      	<button  class="edit btn btn-info">
				            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
				        </button>
				        <button class="inOractive btn btn-warning">
				            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>取消预约
				        </button>
				    	</div>
				    	<!-- 表格工具栏结束 -->
						<!-- 表格开始 -->
			            <div class="col-xs-12">
			                <table id="tb" class="table table-bordered table-hover table-condensed" data-toggle="table"
								data-url="<%=path %>/appointment/userlist" data-pagination="true" data-striped="true">
								<thead>
									<tr>
										<th data-field="state" data-radio="true"></th>
										<th data-field="house.name">户型名称</th>
										<th data-field="emp.name">员工姓名</th>
										<th data-field="created_time" data-formatter="formatDate">预约时间</th>
										<th data-field="app_arrive_time" data-formatter="formatDate">预约看房时间</th>
										<th data-field="status">预约状态</th>
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
<script src="<%=path %>/js/table_appointment.js"></script>
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
<script type="text/javascript">
  $('.form_datetime').datetimepicker({
	    minView: "month", //选择日期后，不会再跳转去选择时分秒 
	    locale:'en', //设置语言
	    format: 'yyyy-mm-dd',//设置时间格式
	    todayBtn:  1,
	    startDate: new Date(),//开始时间  endDate 结束时间
	    autoclose: 1,//当选择一个日期之后是否立即关闭此日期时间选择器。
	});
</script>
</body>
</html>