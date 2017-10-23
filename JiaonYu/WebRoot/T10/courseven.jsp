<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>课程审核</title>
    
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
   <form action="<%=basePath%>courseServlet?action=seveup" method="post" name="form1">
  	<input type="hidden" name="courseId" value="${course.courseId }">
   	<table align="center" border="1" cellpadding="o" cellspacing="0" width="850" align="center">
   		<tr>
   			<td width="300px" align="center">图标<td>
   			<td colspan="3">
   			<img src="${course.pictureUrl}" height="100"/>
   			</td>
   		</tr>
   		<tr>
   			<td width="300px" height="30" align="center">课程名称<td>
   			<td >${course.courseName}</td>
   		</tr>
   		<tr >
   			<td width="300px" height="30" align="center">课程介绍<td>
   			<td>${course.introduce }</td>
   		</tr>
   		<tr>
   			<td width="300px" height="30" align="center">课时数<td>
   			<td>${course.courseCount}</td>
   			</tr >
   			<tr >
   			<td width="300px" height="30" align="center">价格<td>
   			<td>${course.price}</td>
   		</tr>
   		<tr>
   			<td width="300px" height="30" align="center">发布人<td>
   			<td>${course.replayUsername}</td>
   			<tr>
   			</tr >
   			<td  width="300px" height="30" align="center">收费类型<td>
   			<td height="30">
   			<c:if test="${course.chargeType==0}">免费</c:if>
			<c:if test="${course.chargeType==1}">会员</c:if>
   			</td>
   		</tr>
   		<tr>
   			<td  width="300px" height="40" align="center">审核<td>
   			<td colspan="3">
   			<select name="status" height="40">
   				<option value="0">未审核</option>
   				<option value="1">已审核</option>
   				<option value="2">审核未通过</option>
   			</select>
   			</td>
   		</tr>
   		<tr>
   			<td  width="300px" height="40" align="center">未通过原因<td>
   			<td>
   				<textarea rows="8" cols="100"  name="reason"></textarea>
   			</td>
   		</tr>
   		<tr height="30"><td colspan="3" align="center"><input type="submit" value="提交"/></td></tr>
   	</table>
   </form>
  </body>
</html>
