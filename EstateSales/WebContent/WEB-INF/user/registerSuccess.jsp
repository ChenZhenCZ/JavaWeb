<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link href="<%=path%>/UsersPlugin/build/css/notice.css" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="<%=path%>/UsersPlugin/build/js/jquery-1.7.1.min.js"></script>
	<title>修改密码成功页面</title>
</head>
<body>
	<div class="min">
	
		<div class="min-msg">
				<h2>恭喜您注册成功,请前往首页登录</h2>
			<p class="one">
				<span id="time">10</span> 秒后为您跳转到首页登录<a href="<%=path %>/index.jsp">&#9666;&nbsp;&nbsp;&nbsp;&nbsp;前往首页</a>
		    </p>		    
			</div>
	</div>
	<div class="btm">
		<ul class="logo">
			<li>24小时服务热线</li>
			<li><strong>400-105-5555</strong></li>
		</ul>
	</div>
	<script type="text/javascript">
	$(function(){
		var timeDom = $("#time");
		function timeEve(){
			if(timeDom.length==0) return false;
			var num = parseInt(timeDom.html());
			function countDown(){
				if(num<=1){
					window.location.href="../user/index";
					return false;	
				}
				window.setTimeout(function(){
					num--;
					timeDom.html(num);
					countDown();
				},1000);
			};
			countDown();
		}
		timeEve();
		})
	
	</script>
</body>
</html>
