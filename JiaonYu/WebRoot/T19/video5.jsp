<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'video5.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<OBJECT width="1000" height="600">
  	  	<param name="movie" value="<%=basePath %>vedio/201701161138229126.avi" />
        <param name="quality" value="high" />
        <param name="wmode" value="opaque" />
		<embed src="<%=basePath %>vedio/201701161138229126.avi" quality="high" type="application/x-shockwave-flash" width="1000" height="600"></embed>
	</OBJECT>
  </body>
</html>
