<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path= request.getContextPath();
%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>员工登录界面</title>
<link href="<%=path %>/toastr/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path %>/toastr/css/font-awesome.min.css" rel="stylesheet">

<style type="text/css">
	.form-bg{
		padding: 2em 0;
	}
	.form-horizontal{
		background: #fff;
		padding-bottom: 40px;
		border-radius: 15px;
		text-align: center;
	}
	.form-horizontal .heading{
		display: block;
		font-size: 35px;
		font-weight: 700;
		padding: 35px 0;
		border-bottom: 1px solid #f0f0f0;
		margin-bottom: 30px;
	}
	.form-horizontal .form-group{
		padding: 0 40px;
		margin: 0 0 25px 0;
		position: relative;
	}
	.form-horizontal .form-control{
		background: #f0f0f0;
		border: none;
		border-radius: 20px;
		box-shadow: none;
		padding: 0 20px 0 45px;
		height: 40px;
		transition: all 0.3s ease 0s;
	}
	.form-horizontal .form-control:focus{
		background: #e0e0e0;
		box-shadow: none;
		outline: 0 none;
	}
	.form-horizontal .form-group i{
		position: absolute;
		top: 12px;
		left: 60px;
		font-size: 17px;
		color: #c8c8c8;
		transition : all 0.5s ease 0s;
	}
	.form-horizontal .form-control:focus + i{
		color: #00b4ef;
	}
	.form-horizontal .fa-question-circle{
		display: inline-block;
		position: absolute;
		top: 12px;
		right: 60px;
		font-size: 20px;
		color: #808080;
		transition: all 0.5s ease 0s;
	}
	.form-horizontal .fa-question-circle:hover{
		color: #000;
	}
	.form-horizontal .main-checkbox{
		float: left;
		width: 20px;
		height: 20px;
		background: #11a3fc;
		border-radius: 50%;
		position: relative;
		margin: 5px 0 0 5px;
		border: 1px solid #11a3fc;
	}
	.form-horizontal .main-checkbox label{
		width: 20px;
		height: 20px;
		position: absolute;
		top: 0;
		left: 0;
		cursor: pointer;
	}
	.form-horizontal .main-checkbox label:after{
		content: "";
		width: 10px;
		height: 5px;
		position: absolute;
		top: 5px;
		left: 4px;
		border: 3px solid #fff;
		border-top: none;
		border-right: none;
		background: transparent;
		opacity: 0;
		-webkit-transform: rotate(-45deg);
		transform: rotate(-45deg);
	}
	.form-horizontal .main-checkbox input[type=checkbox]{
		visibility: hidden;
	}
	.form-horizontal .main-checkbox input[type=checkbox]:checked + label:after{
		opacity: 1;
	}
	.form-horizontal .text{
		float: left;
		margin-left: 7px;
		line-height: 20px;
		padding-top: 5px;
		text-transform: capitalize;
	}
	.form-horizontal .btn{
		float: right;
		font-size: 14px;
		color: #fff;
		background: #00b4ef;
		border-radius: 30px;
		padding: 10px 25px;
		border: none;
		text-transform: capitalize;
		transition: all 0.5s ease 0s;
	}
	@media only screen and (max-width: 479px){
		.form-horizontal .form-group{
			padding: 0 25px;
		}
		.form-horizontal .form-group i{
			left: 45px;
		}
		.form-horizontal .btn{
			padding: 10px 20px;
		}
	}
</style>
</head>
<script type="text/javascript">
	
</script>
<body background="<%=path %>/agency/agencyLoginJS/images/bg.jpg"><script src="demos/googlegg.js"></script>
<div class="demo form-bg">
		 <s:if test="#request.msg!=null">
			    <div class="alert alert-danger"><span>${msg }</span></div>
		    </s:if>
		
		<div class="container">
		<div class="row">
			<div class="col-md-offset-3 col-md-6">
				<form class="form-horizontal"  id="from1" action="<%=path %>/staff/emplogin" method="post">
					<span class="heading">员工登录</span>
					<div class="form-group">
						<input type="text" class="form-control" id="inputEmail3" id="inputPassword3" name="emp.phone" placeholder="手机号码">
						<i class="fa fa-user"></i>
					</div>
					<div class="form-group help">
						<input type="password" class="form-control" name="emp.pwd" placeholder="密码">
						<i class="fa fa-lock"></i>
						<a href="#" class="fa fa-question-circle"></a>
					</div>
					<div class="form-group">
						<div class="main-checkbox">
							<input type="checkbox" value="None" id="checkbox1" name="check"/>
							<label for="checkbox1"></label>
						</div>
						<span class="text">记住我</span>
						<button type="submit" class="btn btn-default">立刻登录</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';color:#ffffff">
<p>万达房地产公司：万达房地产是家居网络平台,提供及时的房地产新闻资讯内容,为楼盘提供网上浏览、业主论坛和社区网站</p>
<p>来源：<a href="index.jsp" target="_blank">万达房地产</a></p>
</div>
</body>
<script type="text/javascript" src="<%=path %>/bootstrap/vendor/jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="<%=path %>/bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path %>/bootstrap/dist/js/bootstrapValidator.js"></script>
<script src="<%=path %>/js/staffLogin.js"></script>
<script type="text/javascript" src="<%=path %>/toastr/toastr.min.js"></script>

 <link rel="stylesheet" href="<%=path %>/toastr/toastr.min.css"/>
 <script src="<%=path %>/js/toastrOption.js"></script>
</html>