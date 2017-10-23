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
    
    <title>My JSP 'teachup.jsp' starting page</title>
    
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
   <hr/>
    <script type="text/javascript">
   		function ckck(){
   		if(from1.gradePercent.value==""){
   			alert("请输入分成比例！");
   			from1.provincename.focus();
   			return false ;
   		}
   		return true;
   		}
   </script>

  <body>
  <h1 align="center">修改城市资料</h1>
  <hr/>
  <%
  	TeacherGrade grade=(TeacherGrade)request.getAttribute("grade");
   %>
  <form name="from1" action="<%=basePath%>teacherGradeservler?cation=updateSave" method="post" onsubmit="return ckck()">
  <table border=“1” cellpadding="1" cellspacing="1" align="center">
  		 <input type="hidden" name="gradeid" value="<%=grade.getGradeid() %>">
  	<tr>
  	<th>
  		讲师等级:
  	</th>
  	<td style="width:180px"><input type="text" name="gradename" value="<%=grade.getGradename() %> "></td>
  	</tr>
 	<tr>
 	<th>分成比例:</th>
 	<td style="width:180px"><input type="text" name="gradePercent" value="<%=grade.getGradePercent() %> "></td></tr>
 	<tr>
 	<td colspan="2" align="center"><input type="submit" value="修改" ></td>
 	</tr>
  </table>
  </form>
  </body>
</html>
