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
<title>活动新增</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="author" content="Muhammad Usman">
	<%@include file="./jsAndCss.jsp" %>
	<link rel="stylesheet" href="<%=path %>/bootstrap/bootstrap-datetimepicker.min.css">  
	<script type="text/javascript"  src="<%=path %>/bootstrap/bootstrap-datetimepicker.min.js"></script> 
    <!-- jQuery -->
</head>
<body >
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
					<li><a href="javacsript:void(0);">活动添加</a></li>
				</ul>
			</div>
			<form class="form-horizontal" method="post" action="<%=path %>/activity/addAdminActivity"  enctype="multipart/form-data">
			<div class="form-group">
	    			<label  class="col-sm-2 control-label" >活动标题</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<input type="text" class="form-control" name="activityVO.title" placeholder="请填写活动标题" required="required">
	   			 	</div>
  			</div>
			<div class="form-group">
	    			<label  class="col-sm-2 control-label" >活动内容</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<input type="text" class="form-control" name="activityVO.content" placeholder="请填写活动内容" required="required">
	   			 	</div>
  			</div>
			<div class="form-group">
	    			<label  class="col-sm-2 control-label" >活动地址</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<input type="text" class="form-control" name="activityVO.address" placeholder="请填写活动地址" required="required">
	   			 	</div>
  			</div>
			<div class="form-group">
	    			<label  class="col-sm-2 control-label" >开始时间</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<input type="text" class="form-control form_datetime" name="activityVO.start_time" readonly  required="required">
	   			 	</div>
  			</div>
			<div class="form-group">
	    			<label  class="col-sm-2 control-label" >结束时间</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<input type="text" class="form-control form_datetime" name="activityVO.end_time" readonly  required="required">
	   			 	</div>
  			</div>
			<div class="form-group">
	    			<label  class="col-sm-2 control-label" >活动图片</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<p id="addp"></p>
					  <input type="file" id="upload" style="display:none" name="logo" onclick="addElementImg('addp')" required="required">
					  <span  class="btn btn-default btn-lg"  onclick="F_Open_dialog()">
					  		选择图片
					  </span>
	   			 	</div>
  			</div>
			<div class="form-group">
   				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 center">
   			   		<input type="submit" class="btn btn-primary btn-lg" value="     新   增     "/>
 				</div>
  			</div>	
			</form>
		</div>

	</div>
</div>
</body>
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
<script>
var i=true;
function addElementImg(obj) {
		if(i){
			var ul = document.getElementById(obj);
			var img = document.createElement("img");
			img.setAttribute("id", "newImg");
			img.setAttribute("style", "width:450px;height:250px");
			img.src = "";
			ul.appendChild(img);
			i=false;
			var input = document.getElementById("upload");
			var $img = $('#newImg');
			input.addEventListener('change',readFile,false);
			function readFile(){
				var file=this.files[0];
				var $file = $(this);
				var fileObj = $file[0];
				var windowURL = window.URL || window.webkitURL;
				var dataURL;
				dataURL = windowURL.createObjectURL(fileObj.files[0]);
				$img.attr('src',dataURL);
			}
		}
	}
	function F_Open_dialog(){ 
		document.getElementById("upload").click(); 
	} 
</script>
</html>