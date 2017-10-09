<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="<%=path%>/UsersPlugin/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="<%=path%>/UsersPlugin/assets/img/favicon.png">
	<link href="<%=path%>/plugins/bootstrap/bootstrap.min.css" rel="stylesheet">
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>用户中心</title>
	<style type="text/css">
		body{margin:0;padding:0;font:14px/1.6 Arial,Sans-serif;}
		a:link,a:visited{color:#007ab7;text-decoration:none;}
	</style>
</head>
<body>
	<div>
		<h1 style="text-align: center; margin-top:100px;"><strong>恭喜您修改密码成功</strong></h1>
		 <p class="link" style="text-align: center; font-size:24px;">
	        <a href="<%=path %>/index.jsp">&#9666;返回首页</a>
	        <a href="javascript:history.go(-1);">&#9666;返回上一页</a>
	    </p>
    </div>
</body>
</html>
