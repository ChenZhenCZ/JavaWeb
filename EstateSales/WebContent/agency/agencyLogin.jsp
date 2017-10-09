<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>    
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML>
<html>
<head>
<title>经销商登录</title>
<link href="<%=path%>/agency/agencyLoginJS/css/style.css" rel="stylesheet" type="text/css" media="all" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<!-- -->
<script>var __links = document.querySelectorAll('a');function __linkClick(e) { parent.window.postMessage(this.href, '*');} ;for (var i = 0, l = __links.length; i < l; i++) {if ( __links[i].getAttribute('data-t') == '_blank' ) { __links[i].addEventListener('click', __linkClick, false);}}</script>
<script src="<%=path%>/agency/agencyLoginJS/js/jquery.min.js"></script>
<script>
$(document).ready(function(c) {
	$('.alert-close').on('click', function(c){
		$('.message').fadeOut('slow', function(c){
	  		$('.message').remove();
		});
	});	  
});
</script>
</head>
<body>
<!-- contact-form -->	
<div class="message warning">
<div class="inset">
	<div class="login-head">
		<h1>经销商登录</h1>
		<h3>
			<font color="yeelow">
				<s:if test="#request.msg==1">您输入的你的手机号或密码错误！</s:if>
				<s:if test="#request.msg==2">您的账号未审核,请耐心等待审核通过完后登陆！</s:if>
			</font>
		</h3>
		 		
	</div>
		<form action="/EstateSales/agency/login" method="post">
			<li>
				<input type="text"  name="agencyVo.phone"  class="text" value="请输入手机号" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '请输入账号';}"><a href="javascript:void(0);" class=" icon user"></a>
			</li>
				<div class="clear"> </div>
			<li>
				<input type="password" name="agencyVo.pwd" value="请输入密码" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '请输入密码';}"> <a href="javascript:void(0);" class="icon lock"></a>
			</li>
			<div class="clear"> </div>
			<div class="submit">
				<input type="submit"  value="登 录">
				<h4><a href="<%=path%>/agency/forgetPwd.jsp" target="_black">忘记密码?</a></h4>
			  	<div class="clear">  </div>	
			</div>
		</form>
		</div>					
	</div>
	<div class="clear"> </div>
</body>
</html>