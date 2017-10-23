<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="bean.TeacherGrade"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'teachList.jsp' starting page</title>
    
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
   	<h1 align="center">讲师等级资料</h1>
  	<hr/>
  	<table align="center" border="1" cellpadding="1" cellspacing="1" width="550">
  		<tr>
  			<th>教师编号</th>
  			<th>教师等级</th>
  			<th>分成比例</th>
  			<th>数据操作</th>
  		</tr>
  		<%
  		List<TeacherGrade> gradeList = (List<TeacherGrade>)request.getAttribute("gradeLit");
		int tnd=gradeList.size();
		TeacherGrade grade=null;
		for(int i=0;i<tnd;i++){
			grade=gradeList.get(i);
		
  		%>
  		<tr>
  		<td align="center"><%=grade.getGradeid() %></td>
  		<td align="center"><%=grade.getGradename() %></td>
  		<td align="center"><%=grade.getGradePercent() %></td>
  		<td align="center">
		<a href="<%=basePath%>teacherGradeservler?cation=update&gradeid=<%=grade.getGradeid()%>">修改</a>
		<a href="<%=basePath%>teacherGradeservler?cation=del&gradeid=<%=grade.getGradeid()%>" onclick="javascript:if(confirm('删除确认')){return true;}else{return false;}">删除</a>
		<a href="<%=basePath%>T7/teadd.jsp">新增</a>
		</td>
		</tr>
  		<%} %>
  	</table>
  </body>
</html>
