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
<title>新增楼盘活动</title>
 	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="author" content="Muhammad Usman">
	<link rel="stylesheet" href="<%=path %>/bootstrap/select2/select2.min.css" />
    <!-- The styles -->
	<%@include file="./JsAndCss.jsp" %>
	
	<link rel="stylesheet" href="../bootstrap/dist/css/bootstrapValidator.css"/>
	<script type="text/javascript" src="../bootstrap/dist/js/bootstrapValidator.js"></script>
	<!-- 控制时间格式 -->
	<link rel="stylesheet" href="<%=path %>/bootstrap/bootstrap-datetimepicker.min.css">  
	<script type="text/javascript"  src="<%=path %>/bootstrap/bootstrap-datetimepicker.min.js"></script>  
</head>

<body>
	<!-- 更换经销商logo -->
	<%@ include file="./changeAgencyLogo.jsp" %>
	<%@ include file="./top.jsp" %>    
    
<div class="ch-container">
    <div class="row">
        <!-- left menu starts -->
        <%@ include file="./leftMenu.jsp" %>
        <!-- left menu ends -->
        <!-- content starts -->
		<div id="content" class="col-lg-10 col-sm-10">
			<div>
				<ul class="breadcrumb">
					<li><a href="<%=path%>/agency/main">首页</a></li>
					<li><a href="javacsript:void(0);">活动添加</a></li>
				</ul>
			</div>
			<!-- 活动添加开始 -->
			<form id="activityAdd" class="form-horizontal" method="post" action="<%=path %>/activity/addActivitySuccess"  enctype="multipart/form-data">
			<div class="form-group">
    			<label  class="col-sm-2 control-label" >选择楼盘</label>
   				<div class="col-md-6 col-sm-6 col-xs-12">
   			   		<select name="activityVO.buildings.id" id="select">
			   			<s:iterator var="t" value="#request.buildList">
			   				<option value="${t.id}" >${t.name}</option>
			   			</s:iterator>
			   		</select>
   			 	</div>
  			</div>
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
	   			   		<input type="text" class="form-control form_datetime" name="activityVO.start_time"  required="required" readonly="readonly" placeholder="请选择时间">
	   			 	</div>
  			</div>
			
			<div class="form-group">
	    			<label  class="col-sm-2 control-label" >结束时间</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<input type="text" class="form-control form_datetime" name="activityVO.end_time"  required="required" readonly="readonly" placeholder="请选择时间">
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
			<div  class="form-group has-success">
				<label for="inputError2" class="col-xs-12 col-sm-2 control-label no-padding-right"></label>
				<div class="col-xs-12 col-sm-5">	
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="submit"  value="保存" class="btn btn-success btn-lg" style="width:200px">
				</div>
			</div>
			</form>
			<!-- 活动添加结束 -->
		</div>
		<!-- content end -->
	</div>
	<!--/row-->
</div>
<!--/.fluid-container-->
<script src="<%=path %>/bootstrap/select2/select2.full.min.js"></script>
<script src="<%=path %>/bootstrap/select2/select2.min.js"></script>


<script>
$("#select").select2({width:"530px"});

//上传图片
$('#logo').fileinput({
    language: 'zh',
    uploadUrl: '<%=path%>/agency/uploadLogo',
    allowedFileExtensions : ['jpg', 'png','gif'],
})
var imgSrc="";
$('#logo').on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功		
	imgSrc=data.response.agencyVo.logo;
	$("#changeLogo").modal("toggle");
})
$(function () {
	$('#changeLogo').on('hide.bs.modal', function () {
		if(imgSrc!=""){
			$("#logoImg").attr('src',imgSrc)
		}
 	})
 });
</script>
<script>
var i=true;
function addElementImg(obj) {
		if(i){
			var ul = document.getElementById(obj);
			var img = document.createElement("img");
			img.setAttribute("id", "newImg");
			img.setAttribute("style", "width:300px;height:200px");
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

<script>
$(document).ready(function() {
    $('#activityAdd').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	'activityVO.title': {
                validators: {
                    notEmpty: {
                        message: '活动标题不能为空'
                    }
                }
            },
            'activityVO.content': {
                validators: {
                    notEmpty: {
                        message: '活动内容不能为空'
                    }
                }
            },
            'activityVO.address': { 
                validators: {
                    notEmpty: {
                        message: '活动地址不能为空'
                    }
                }
            },
            'activityVO.start_time': {  
                validators: {
                    notEmpty: {
                        message: '开始时间不能为空'
                    }
                }
            },
            'activityVO.end_time': {  
                validators: {
                    notEmpty: {
                        message: '结束时间不能为空'
                    }
                }
            }
        }
    });
});
</script>
<!--控制时间格式-->
<script>
  $('.form_datetime').datetimepicker({
	    minView: "month", //选择日期后，不会再跳转去选择时分秒 
	    locale:'en', //设置语言
	    format: 'yyyy-mm-dd',//设置时间格式
	    todayBtn:  1,
	    startDate: new Date(),
	   //endDate: '2017-12-30',	//开始时间  endDate 结束时间
	    autoclose: 1,//当选择一个日期之后是否立即关闭此日期时间选择器。
	});
</script> 
</body>
</html>