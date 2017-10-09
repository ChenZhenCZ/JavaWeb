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
<title>修改密码</title>
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
					<li><a href="javacsript:void(0);">修改密码</a></li>
				</ul>
			</div>
			<!-- 修改密码开始 -->
			<div class="center col-lg-10 col-md-10 col-sm-10 col-xs-10">
			<form class="form-horizontal" action="/EstateSales/agency/modifySuccess"
			method="post" id="modifyPsw">
				<div class="form-group">
					<label class="col-lg-3 control-label">旧密码:</label>
					<div class="col-lg-6">
						<input type="password" class="form-control" name="agencyVo.pwd" placeholder="请输入旧密码"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-3 control-label">新密码:</label>
					<div class="col-lg-6">
						<input type="password" class="form-control" name="newPwd" placeholder="请输入新密码"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-3 control-label">确认密码:</label>
					<div class="col-lg-6">
						<input type="password" class="form-control" name="renewPwd" placeholder="请输入确认密码"/>
					</div>
				</div>
			
				<br/>
				<p class="col-lg-6 col-md-4">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="submit" class="btn btn-primary btn-lg">保&nbsp;&nbsp;存</button>
				</p>
		</form>
		</div>
		<!-- 修改密码结束 -->
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
//数据验证
$(document).ready(function() {
    $('#modifyPsw').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	'agencyVo.pwd': {
                validators: {
                    notEmpty: {
                        message: '旧密码不能为空'
                    }
                }
            },
            'newPwd': {
                validators: {
                    notEmpty: {
                        message: '新密码不能为空'
                    },
                    stringLength: {
                        min: 6,
                        message: '密码至少6位!'
                    }
                }
            },
            'renewPwd': {
                validators: {
                    notEmpty: {
                        message: '确认密码不能为空'
                    },
                    identical: {
                        field: 'newPwd',
                        message: '两次密码不一致'
                    }
                }
            }
        }
    });
});
</script>

</body>
</html>