<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'manlong.jsp' starting page</title>
    
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
   <h1 align="center">管理员注册页面</h1>
   <hr/>
   <form name="form1" action="<%=basePath%>/managerServlet?action=add" method="post">
   		管理员账户:<input type="text" name="managerAccount" ><br/>
   		管理员密码:<input type="password" name="managerPassword" ><br/>
   		管理员姓名:<input type="text" name="managerName" ><br/>
   		性别:<input type="radio"  name="sex" value="0" checked="checked">男
   			<input type="radio"  name="sex" value="1">女<br/>
   		联系方式:<input type="text" name="contact"><br/>
   		<input type="submit" value="提交">
   </form>
  </body>
</html>
