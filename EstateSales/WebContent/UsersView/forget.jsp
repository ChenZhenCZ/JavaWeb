<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>     
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>忘记密码</title>
<link rel="stylesheet" href="<%=path %>/bootstrap/vendor/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=path %>/bootstrap/dist/css/bootstrapValidator.min.css"/>
    <script type="text/javascript" src="<%=path %>/bootstrap/vendor/jquery/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="<%=path %>/bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=path %>/bootstrap/dist/js/bootstrapValidator.min.js"></script>                               

</head>
<body>
	<div class="container">
		<div class="row">
			<!-- form: -->
			<section>
			<div class="page-header">
				<h1 style="text-align: center;	">忘记密码</h1>
			</div>
				
                <div class="col-lg-8 col-lg-offset-2">
  				<form  method="post" id="forgetPwd" action="<%=path %>/user/forgetPwd"
					class="form-horizontal">
					<fieldset>
						<div class="form-group">
                                <label class="control-label col-md-4 col-sm-3 col-xs-12">手机号码</label>
                                <div class="col-md-5 col-sm-6 col-xs-12">
                                    <input type="text" class="form-control" name="user.phone" placeholder="请输入手机号码"/>
                                </div>
                            </div>
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-3 col-xs-12"></label>
							<div class="col-md-5 col-sm-6 col-xs-12">
								<input type="submit" value="重置密码" style="align: center;"
									class="btn btn-info btn-lg btn-block active">
							</div>
						</div>	
						<p style="text-align: center; color:#798899;font-size:20px;">初始化密码已发送至您的手机，请妥善保管并及时更改密码</p>
				</form>
			</div>
			</section>
			<!-- :form -->
		</div>
	</div>
	<!--输入框验证-->
	<script>
		$(document).ready(function() {
			$('#forgetPwd').bootstrapValidator({
				message : 'This value is not valid',
				feedbackIcons : {
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {					
					'user.phone': {
		                validators: {
		                    notEmpty: {
		                        message: '手机号码不能为空'
		                    },
		                    stringLength: {
		                         min: 11,
		                         max: 11,
		                         message: '请输入11位手机号码'
		                     },
		                     regexp: {
		                         regexp: /^1[3|5|8]{1}[0-9]{9}$/,
		                         message: '请输入正确的手机号码'
		                     }
		                }
		            }		
				}
			});
		});
	</script>
</body>
</html>