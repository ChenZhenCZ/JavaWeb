<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>教师资料修改</title>
  </head>
  <body>
  <form action="<%=basePath%>teacherServlet?action=updateSave" method="post" onsubmit="return test();">
  	<input type="hidden" name="teacherId" value="${teacher.teacherId }"/><br/>
  	教师简介:<input type="text" name="teacherIntroduce" value="${teacher.teacherIntroduce }"/><br/>
  	教师特长:<input type="text" name="teacherSpecial" value="${teacher.teacherSpecial }"/><br/>
  	教龄:<input type="text" name="teacherLength" value="${teacher.teacherLength }"/><br/>
  	学历:<input type="text" name="education" value="${teacher.education }"/><br/>
  	头像:<input type="text" name="headPictureUrl" value="${teacher.headPictureUrl }"/><br/>
  	银行账户:<input type="text" name="accountNo" value="${teacher.accountNo }"/><br/>
  	开户人姓名:<input type="text" name="accountName" value="${teacher.accountName }"/><br/>
  	<input type="submit" value="保存"/><br/>
  </form>
  </body>
</html>
