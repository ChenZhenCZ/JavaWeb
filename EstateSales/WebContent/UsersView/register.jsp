<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String path= request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">	
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>用户注册页面</title>
	<link rel="stylesheet" href="<%=path %>/bootstrap/vendor/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=path %>/bootstrap/dist/css/bootstrapValidator.min.css"/>
    <script type="text/javascript" src="<%=path %>/bootstrap/vendor/jquery/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="<%=path %>/bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=path %>/bootstrap/dist/js/bootstrapValidator.min.js"></script>                               
</head>
<body >
<div class="container">
        <div class="row">
            <!-- form: -->
            <section>
                <div class="page-header">
                    <h1 style="text-align:center" >用户注册平台</h1>
                </div>

                <div class="col-lg-8 col-lg-offset-2">
                    <form id="defaultForm" method="post" action="<%=path %>/user/register" class="form-horizontal">
                        <fieldset> 	
                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-3 col-xs-12">用户名称</label>
                                <div class="col-md-5 col-sm-6 col-xs-12">
                                    <input type="text" class="form-control" name="user.name" placeholder="请输入真实姓名"/>
                                </div>
                            </div>
							<div class="form-group">
                                <label class="control-label col-md-4 col-sm-3 col-xs-12">性别</label>
                                <div class="col-md-5 col-sm-6 col-xs-12">
                                     <label class="radio-inline">
									  	<input type="radio" name="user.gender" id="gender"  checked value="男">男
									</label>
									<label class="radio-inline">
									 	 <input type="radio" name="user.gender" id="gender" value="女">女
									</label>
	                                </div>
                            </div>
                                               
							<div class="form-group">
                                <label class="control-label col-md-4 col-sm-3 col-xs-12">登录密码</label>
                                <div class="col-md-5 col-sm-6 col-xs-12">
                                    <input type="password" class="form-control" name="user.pwd" placeholder="请输入登录密码"/>
                                </div>
                            </div>

							<div class="form-group">
                                <label class="control-label col-md-4 col-sm-3 col-xs-12">确认密码</label>
                                <div class="col-md-5 col-sm-6 col-xs-12">
                                    <input type="password" class="form-control" name="confirmPassword" placeholder="请确认密码"/>
                                </div>
                            </div>
							     
							<div class="form-group">
                                <label class="control-label col-md-4 col-sm-3 col-xs-12">手机号码</label>
                                <div class="col-lg-3 col-sm-3 col-xs-12">
                                    <input type="number" class="form-control" name="user.phone" placeholder="请输入手机号码"/>
                                </div>
								<div class="col-lg-3 col-sm-3 col-xs-12"><a ><label>发送验证码</label></a></div>
                            </div>
							<div class="form-group">
                                <label class="control-label col-md-4 col-sm-3 col-xs-12">验证码</label>
                                <div class="col-lg-3 col-sm-3 col-xs-12">
                                    <input type="text" class="form-control" name="yzm" placeholder="请输入验证码"/>
                                </div>
								<div class="col-lg-3 col-sm-3 col-xs-12"><small id="tip"></small></div>
                            </div>							      
                        <div class="form-group">
                        	<label class="control-label col-md-4 col-sm-3 col-xs-12"></label>
                            <div class="col-md-5 col-sm-6 col-xs-12">
                                <input type="submit" style="align:center;"class="btn btn-success btn-lg btn-block active">
                            </div>
                        </div>
                    </form>
                </div>
            </section>
            <!-- :form -->
        </div>
    </div>
    <!--footer-->
    <center>
	<div class="footer">
		   <p>Copyright &copy; 2016.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="房产营销平台">房产营销平台</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
	</div>
	</center>
    <!--//footer-->
     <!--输入框验证-->
	<script>
	$(document).ready(function() {
	    $('#defaultForm').bootstrapValidator({
	        message: 'This value is not valid',
	        feedbackIcons: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	            'user.name': {
	                validators: {
	                    notEmpty: {
	                        message: '用户名称不能为为空'
	                    },
	                    stringLength: {
	                        min: 3,
	                        max: 20,
	                        message: '名称应在3~20字之内!'
	                    }
	                }
	            },
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
	            },
	    	            'user.pwd': {
	                validators: {
	                    notEmpty: {
	                        message: '密码不能为空'
	                    },
	                   
	                }
	            },
	            confirmPassword: {
	                validators: {
	                    notEmpty: {
	                        message: '确认密码不能为空'
	                    },
	                    identical: {
	                        field: 'user.pwd',
	                        message: '两次输入的密码不一致'
	                    }
	                }
	            }	           
	        }
	    });
	});
	</script>
</body>
</html>