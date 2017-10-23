<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int a=0;
String img=basePath+"/images/teacherlist2.gif";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>教师资料</title>
  </head>
  
  <body>
  <center>
  <table border='4'>
  <tr>
    <c:forEach items="${teacherList}" var="d">
    <%a++;if(a==5){%>
    <td>
	<img id="img" src="<%=img %>" width="120" hight="120"></img>
    </td>
    <%}else{%>
    <td>
    <a href="<%=basePath%>teacherServlet?action=audit&teacherid=${d.teacherId }">
    <img src='<%=basePath%>/upload/${d.headPictureUrl}' width="120" hight="120"/></a><br/>
		<c:if test="${d.status==0}">
		未审核
		</c:if>
		<c:if test="${d.status==1}">
		审核通过
		</c:if>
		<c:if test="${d.status==2}">
		审核未通过
		</c:if>
		<c:if test="${d.status==3}">
		封号
		</c:if>
		</td>
    <%}
    if(a%3==0){ %>
    </tr>
    <tr>
    <%} %>
	</c:forEach>
	</tr>
	  </table>
		
  </body>
</html>
