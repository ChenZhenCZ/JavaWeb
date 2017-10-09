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
<title>首页</title>
</head>
<body onload="index()">

<script type="text/JavaScript"> 
	function index(){
		window.location.href="http://localhost:8080/EstateSales/buildings/index";
	}
</script>
</body>
</html>