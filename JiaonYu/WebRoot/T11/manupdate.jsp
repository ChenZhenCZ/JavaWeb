<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'manupdate.jsp' starting page</title>
    
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
  <h1 align="center">修改管理员资料</h1>
  <hr/>				
  <form name="form1" method="post" action="<%=basePath%>/managerServlet?action=update" >
  <input type="hidden" name="managerId" value="${manager.managerId}">
  <table align="center" border="1" width="600">
  <tr>
  <th>管理员账户:</th>
  <td><input type="text" name="managerAccount" value="${manager.managerAccount }"></td>
  </tr>
  <tr>
  <th>管理员姓名:</th>
  <td><input type="text" name="managerName" value="${manager.managerName }"></td>
  </tr>
  <tr>
  <th>性别</th>
  <td>
  <c:if test="${manager.sex==0}"> 
  <input type="radio"  name="sex" value="0" checked="checked">男
   <input type="radio"  name="sex" value="1">女
  </c:if>
   <c:if test="${manager.sex==1}"> 
  <input type="radio"  name="sex" value="0" >男
   <input type="radio"  name="sex" value="1" checked="checked">女
  </c:if>
  </td>
  </tr>
  <tr>
  <th>联系方式</th>
  <td><input type="text" name="contact" value="${manager.contact }"></td>
  </tr>
  <tr>
  <td colspan="2" align="center" ><input type="submit" value="提交"></td>
  </tr>
  </table>
  
  </form>
  </body>
</html>
