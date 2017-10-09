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
<title>活动列表</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="author" content="Muhammad Usman">
	<%@include file="../xsl/JsAndCss.jsp" %>
    <!-- jQuery -->
    <link rel="stylesheet" href="<%=path%>/toastr/toastr.min.css">
    <link href="<%=path%>/plugins/bootstrap/bootstrap.min.css" rel="stylesheet">
	<link href="<%=path%>/bootstrap/bootstrap-table.css" rel="stylesheet"/> 
    <link href="<%=path%>/bootstrap/bootstrap-table.css" rel="stylesheet"/> 
	<link href="<%=path%>/toastr/toastr.min.css" rel="stylesheet"/>
	<link rel="stylesheet" href="<%=path %>/bootstrap/bootstrap-datetimepicker.min.css">  
	<script type="text/javascript"  src="<%=path %>/bootstrap/bootstrap-datetimepicker.min.js"></script>  
</head>
<body >
	<div class="modal fade" id="activityLogo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">更换logo</h4>
	      </div>
	      <div class="modal-body">
	       	<form  enctype="multipart/form-data">
        		<label>请选择logo</label>
        		<input id="activitylogo" name="activitylogo" type="file">
    		</form> 
	      </div>
	      <div class="modal-footer">
       		 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 修改活动图片结束 -->
	
	<!-- 修改模态框开始-->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">活动修改</h4>
	      </div>
	      <div class="modal-body">
	       	<form  id="activityUpdate">
	       		<input type="hidden" name="activityVO.id">
	       		<input type="hidden" name="activityVO.logo">
	       		<input type="hidden" name="activityVO.status">
				<div class="form-group">
		        	<label for="recipient-name" class="control-label">活动标题：</label>
		        	<input type="text" class="form-control" name="activityVO.title" required="required">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">活动内容：</label>
		        	<input type="text" class="form-control" name="activityVO.content" required="required">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">活动地址：</label>
		        	<input type="text" class="form-control" name="activityVO.address" required="required">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">开始时间：</label>
		        	<input type="text" class="form-control form_datetime" name="activityVO.start_time" readonly required="required">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">结束时间：</label>
		        	<input type="text" class="form-control form_datetime" name="activityVO.end_time" readonly  required="required">
		        </div>
		        <div class="form-group">
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 <a class="btn btn-primary" onclick="activityUpdate();">保&nbsp;存</a>
		        </div>
    		</form> 
	      </div>
	      <div class="modal-footer">
       		 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	      </div>
	    </div>
	  </div>
	</div>
	<div class="container">
    <!-- topbar starts -->
    <%@ include file="./topbar.jsp" %>
    <!-- topbar ends -->
		<div class="ch-container">
			</div>
			<!-- left menu starts -->
			<%@ include file="./leftMenu.jsp" %>
			<!--/span-->
			<!-- left menu ends -->


		<div id="content" class="col-lg-10 col-sm-10">
			<div>
				<ul class="breadcrumb">
					<li><a href="<%=path%>/admin/index">首页</a></li>
					<li><a href="javacsript:void(0);">活动管理</a></li>
				</ul>
			</div>
            <!-- 表格工具栏开始 -->
	        <div id="toolbar" class="btn-group">
	        <a href="<%=path%>/activity/addAdminActivityPage"  class="btn btn-default">
	            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
	        </a>
	        <button  class="edit btn btn-default">
	            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
	        </button>
	        <button class="inOractive btn btn-default">
	            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>冻结-激活
	        </button>
	        <button class="modifyActivityLogo btn btn-default">
	            <span class="glyphicon glyphicon-picture" aria-hidden="true"></span>修改图片
	        </button>
	    	</div>
	    	<!-- 表格工具栏结束 -->
			<!-- 表格开始 -->
            <div class="col-xs-12">
                <table id="tb" class="table table-bordered table-hover table-condensed" data-toggle="table"
					data-url="<%=path %>/activity/adminActivityList" data-pagination="true" data-striped="true">
					<thead>
						<tr>
							<th data-field="state" data-radio="true"></th>
							<th data-field="logo" data-events="logoEvents" data-formatter="logoFormatter">活动图标</th>
							<th data-field="title">活动标题</th>
							<th data-field="content">活动内容</th>
							<th data-field="address">活动地址</th>
							<th data-field="start_time" data-formatter="formatDate">开始时间</th>
							<th data-field="end_time" data-formatter="formatDate">结束时间</th>
							<th data-field="status">状态</th>
						</tr>
					</thead>
				</table>
            </div>
           	<!-- 表格结束 -->
		</div>
		</div>

	</div>
</div>
</body>

<!--简体中文-->
<script src="<%=path%>/bootstrap/bootstrap-table.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-locale-all.min.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-zh-CN.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-export.js"></script>
<script src="<%=path%>/bootstrap/tableExport.js"></script>
<script src="<%=path %>/toastr/toastr.min.js"></script>
<script src="<%=path %>/js/toastrOption.js"></script>
<script src="<%=path %>/js/formFill.js"></script>
<script src="<%=path %>/js/adminActivityList.js"></script>
<script >
var activityId="";
$(function(){
	$(".modifyActivityLogo").click(function(){
		var data=$("#tb").bootstrapTable("getSelections");
		if(data.length==1){
			activityId = data[0].id; //获取选中的活动Id
			$("#activityLogo").modal();	//打开模态框
		}else{
			toastr.warning("未选中需要修改的图片!");  
		}
	})
})

//活动图片修改
$('#activitylogo').fileinput({
	language: 'zh',
    uploadUrl: '<%=path%>/activity/modifyActivityLogo',
    allowedFileExtensions : ['jpg', 'png','gif'],
    initialCaption: "请选择上传图片",
    uploadExtraData:
    	function(previewId, index) {   //额外参数的关键点
	    	var data = {
	   			activityid:activityId
	    	};
	        return data;
    }
})

$('#activitylogo').on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功		
	$("#activityLogo").modal("toggle");
	$("#tb").bootstrapTable("refresh",{url:"/EstateSales/activity/adminActivityList"});
})
  $('.form_datetime').datetimepicker({
	    minView: "month", //选择日期后，不会再跳转去选择时分秒 
	    locale:'en', //设置语言
	    format: 'yyyy-mm-dd',//设置时间格式
	    todayBtn:  1,
	    startDate: new Date(),//开始时间  endDate 结束时间
	    autoclose: 1,//当选择一个日期之后是否立即关闭此日期时间选择器。
	});
</script>
</html>