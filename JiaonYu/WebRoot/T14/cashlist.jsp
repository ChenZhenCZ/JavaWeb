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
    
    <title>审核提现</title>
    
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
   	<form action="${pageContext.request.contextPath }/cashRecordSevlet?action=update" method="post">
   	<div>
   		<table width="80%">
   			<th>缴费编码</th>
   			<th>讲师编码</th>
   			<th>提现金额</th>
   			<th>平台收入金额</th>
   			<th>提现时间</th>
   			<th>审核</th>
   			<th>未通过原因</th>
   			<th>操作</th>
   		<c:forEach items="${cashlist}" var="d">
   		<tr>
   			<td>${d.payRecordId }<input type="hidden" value="${d.payRecordId }" name="payRecordId"></td>
   			<td>${d.teacherId }<input type="hidden" value="${d.teacherId }" name="teacherId"></td>
   			<td>${d.payMoney }<input type="hidden" value="${d.payMoney }" name="payMoney"></td>
   			<td>10</td>
   			<td>${d.cashDate }</td>
   			<td>
   				<select name="status">
   					<option value="0">未审核</option>
   					<option  value="1">已审核</option>
   					<option  value="2">审核未通过</option>
   				</select>
   			</td>
   			<td>
   				<textarea rows="2" cols="30" name="reason"></textarea>
   			</td>
   			<td><input type="submit" value=" 提交 "></td>
   		</tr>
   		</c:forEach>
   		</table>
   	</div>
   	
   	
   	
   	</form>
  </body>
</html>
