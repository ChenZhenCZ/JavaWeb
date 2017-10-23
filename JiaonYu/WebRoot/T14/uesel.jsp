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
    
    <title>My JSP 'uesel.jsp' starting page</title>
    
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
    <h1 align="center">用户管理</h1>
    <hr/>
    <form action="uersServlet?action=add" name="form1" method="post">
    	<table border="1" width="500">
    	<tr>
    		<td>省份：</td>
    		<td>
    		<select name="">
    		<c:forEach items="${proList}" var="d">
    		<c:if test="${d.provinceid==provinceid}"></c:if>
    			<option value="${d.provinceId}" selected="selected">${d.provincename}</option>
    		</c:forEach>
    		<c:if test="${d.provinceid!=provinceid}"></c:if>
    			<option value="${d.provinceId}" >${d.provincename}</option>
    		</c:forEach>
    		</select>

			</td>
    		<td><Font color="red">&nbsp;&nbsp;</Font></td>
    	</tr>
    	<tr>
    		<td>城市：</td>
    		<td>
    			<select name="">
    			<c:forEach items="${cityList}" var="d">
    			<option>${d.cityid}</option>
    		</c:forEach>
    		</select>
    		</td>
    		<td><Font color="red">&nbsp;&nbsp;</Font></td>
    	</tr>
    	<tr>
    		<td>手机号码：</td>
    		<td><input type="text" name=""/></td>
    		<td><Font color="red">*必填</Font></td>
    	</tr>
    	<tr>
    		<td>登录密码：</td>
    		<td><input type="password" name=""/></td>
    		<td><Font color="red">*必填</Font></td>
    	</tr>
    	<tr>
    		<td>真实姓名：</td>
    		<td><input type="text" name=""/></td>
    		<td><Font color="red">*必填</Font></td>
    	</tr>
    	<tr>
    		<td>性别：</td>
    		<td>
    		<input type="radio" value="0"name="" checked="checked">男
    		<input type="radio" value="1"name="">女
    		</td>
    		<td><Font color="red">&nbsp;&nbsp;</Font></td>
    	</tr>
    	<tr>
    		<td>家庭地址：</td>
    		<td><input type="text" name=""/></td>
    		<td><Font color="red">&nbsp;&nbsp;</Font></td>
    	</tr>
    	<tr>
    		<td>电子邮箱：</td>
    		<td><input type="text" name=""/></td>
    		<td><Font color="red">&nbsp;&nbsp;</Font></td>
    	</tr>
    	<tr height="120">
    	<td colspan="3">
    		<input type="submit" value="提交">
    		</td>
    	</tr>
    	</table>
    </form>
  </body>
</html>
