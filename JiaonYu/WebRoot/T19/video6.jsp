<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${section.sectionName}</title>
</head>
<body>
<h1 align="center">${section.sectionName}</h1>
<hr color="red"/>
<center>
	<embed src="<%=basePath %>${section.sectionUrl}" width="1100" height="540"></embed>
</center>
</body>
</html>