<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>新增</title>
   <script type="text/javascript">
   		function ckck(){
   		if(from1.provincename.value==""){
   			alert("请输入省份名称！");
   			from1.provincename.focus();
   			return false ;
   		}
   		return true;
   		}
   </script>
  </head>
  
  <body>
  <h1 align="center">新增省份资料</h1>
  <hr/>
  <form name="from1" action="T7/zeng.jsp" method="post" onsubmit="return ckck()">
  <table border=“1” cellpadding="1" cellspacing="1" align="center">
  	<tr>
  	<td align="right">
  		省份名称:
  	</td>
  	<td>
  	<input type="text" name="provincename">
  	</td>
  	<td>
  	<input type="submit" value="新增" >
  	</td>
  	</tr>
 
  </table>
  </form>
  </body>
</html>
