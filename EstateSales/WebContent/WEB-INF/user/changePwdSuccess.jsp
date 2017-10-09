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
	<script type="text/javascript" src="<%=path%>/UsersPlugin/build/js/notice.js"></script>
	<title>修改密码成功页面</title>
</head>
<body>
	<div class="min">
	
		<div class="min-msg">
				<h2>恭喜您修改密码成功,请妥善保管</h2>
			<p class="one">
				<span id="time">10</span> 秒后为您跳转到用户中心<a href="../user/home">&#9666;用户中心</a>
		    </p>
			<p>你还可以选择返回首页<a href="<%=path %>/index.jsp">&#9666;返回首页</a></p>
		</div>
	</div>
	<div class="btm">
		<ul class="logo">
			<li>24小时服务热线</li>
			<li><strong>400-105-5555</strong></li>
		</ul>
	</div>
</body>
</html>
