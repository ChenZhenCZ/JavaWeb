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
    
    <title>My JSP 'examine.jsp' starting page</title>
    
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
  <form action="${pageContext.request.contextPath }/sectionServlet?action=eve" method="post">
   <table align="center" border="1" cellpadding="1" cellspacing="1" width="100%">
    	<thead>
    		<tr>
    			<th width="200">章节名称</th>
    			<th width="300">章节介绍</th>
    			<th>是否免费</th>
    			<th>状态</th>
    			<th>审核</th>
    			<th>未通过原因</th>
    			<th>操作</th>
    		</tr>
    	</thead>
    	<c:forEach items="${con}" var="d">
		<tr height="40">
			<td width="150px">${d.sectionName }</td>
			<td>${d.sectionContent }</td>
			<td>
				<c:if test="${d.free==0}">免费</c:if>
				<c:if test="${d.free==1}">收费</c:if>
			</td>
			<td>
				<select name="status">
				<option value="0"> 未审核</option>
					<option value="1"> 已审核</option>
						<option value="2">审核未通过</option>
				
				</select>
			</td>
			<td>
				<a href="${pageContext.request.contextPath }/sectionServlet?action=video&sectionId=${d.sectionId}">试听</a>
			</td>
			<td>
				<textarea rows="4" cols="35" name="reason">审核</textarea>
			</td>
			<td>
				<input type="hidden" value="${d.sectionId }" name="sectionId" />
				<input  type="submit" value="  提交  ">
			</td>
		</tr>
		</c:forEach>
	</table>
	</form>
  </body>
</html>
