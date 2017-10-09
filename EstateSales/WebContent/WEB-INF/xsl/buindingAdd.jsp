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
<title>新增楼栋</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="author" content="Muhammad Usman">

    <!-- The styles -->
	<%@include file="./JsAndCss.jsp" %>
	
	<link rel="stylesheet" href="../bootstrap/dist/css/bootstrapValidator.css"/>
	<script type="text/javascript" src="../bootstrap/dist/js/bootstrapValidator.js"></script>
</head>

<body>
	<!-- 更换经销商logo -->
	<%@ include file="./changeAgencyLogo.jsp" %>
    <!-- topbar starts -->
    <%@ include file="./top.jsp"%>
    <!-- topbar ends -->
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
					<li><a href="javacsript:void(0);">添加楼栋</a></li>
				</ul>
			</div>
			<!--楼盘添加开始 -->
			<form class="form-horizontal" id="building" method="post" action="<%=path %>/building/save">
			<div class="form-group">
	    			<label  class="col-sm-2 control-label" >选择楼盘</label>
	   				<div class="col-md-3 col-sm-4 col-xs-4">
	   			   		<select name="buildingVO.buildings.id">
	   			   			<s:iterator var="t" value="#request.buildList">
	   			   				<option value="${t.id}" >${t.name}</option>
	   			   			</s:iterator>
	   			   		</select>
	   			 	</div>
  			</div>
			
			<div class="form-group">
	    			<label  class="col-sm-2 control-label" >楼栋名称</label>
	   				<div class="col-md-3 col-sm-4 col-xs-4">
	   			   		<input type="text" class="form-control" name="buildingVO.name" placeholder="请输入楼栋名称" required="required">
	   			 	</div>
  			</div>
			
			<div class="form-group">
	    			<label  class="col-sm-2 control-label" >总层数</label>
	   				<div class="col-md-3 col-sm-4 col-xs-4">
	   			   		<input type="text" class="form-control" name="buildingVO.total_floor" placeholder="请输入总层数" required="required">
	   			 	</div>
  			</div>
  			
  			<div class="form-group">
	    			<label  class="col-sm-2 control-label" >每层户数</label>
	   				<div class="col-md-3 col-sm-4 col-xs-4">
	   			   		<input type="text" class="form-control" name="buildingVO.floor_rooms" placeholder="请输入每层户数" required="required">
	   			 	</div>
  			</div>
  			
  			<div class="form-group">
	    			<label  class="col-sm-2 control-label" >电梯数</label>
	   				<div class="col-md-3 col-sm-4 col-xs-4">
	   			   		<input type="text" class="form-control" name="buildingVO.total_lift" placeholder="请输入电梯数" required="required">
	   			 	</div>
  			</div>
			
			<div  class="form-group has-success">
				<label for="inputError2" class="col-xs-12 col-sm-2 control-label no-padding-right"></label>
				<div class="col-xs-12 col-sm-5">
					
					<input type="submit"  class="btn btn-success btn-lg" style="width:150px" value="保存">
				</div>
			</div>
			</form>
			<!-- 楼盘添加结束 -->
		</div>
		<!-- content end -->
	</div>
	<!--/row-->
</div>
<!--/.fluid-container-->

<!-- 上传图片 -->
<script>
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

$(document).ready(function() {
    $('#building').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	'buildingVO.name': {
                validators: {
                    notEmpty: {
                        message: '楼栋名称不能为空'
                    }
                }
            },
            'buildingVO.total_floor': {
                validators: {
                    notEmpty: {
                        message: '总层数不能为空'
                    },
                   
                    regexp: {
                        regexp: /^[1-9]*[1-9][0-9]*$/,
                        message: '数据格式错误'
                    }
                }
            },
            'buildingVO.floor_rooms': { 
                validators: {
                    notEmpty: {
                        message: '每层户数不能为空'
                    },
                   
                    regexp: {
                        regexp: /^[1-9]*[1-9][0-9]*$/,
                        message: '数据格式错误'
                    }
                }
            },
            'buildingVO.total_lift': {  
                validators: {
                    notEmpty: {
                        message: '电梯数不能为空'
                    },
                   
                    regexp: {
                        regexp: /^[1-9]*[1-9][0-9]*$/,
                        message: '数据格式错误'
                    }
                }
            }
        }
    });
});
</script>
</body>
</html>