<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改密码</title>

  </head>
  
  <body>
   <h1 align="center">&nbsp;修改密码</h1>
   <hr/>
   <form action="<%=basePath%>managerServlet?action=mopwd" method="post" name="form1" >
   <input type="hidden" value="${manager.managerId }" name="managerId"> 
   	<table align="center" border="1" width="400">
   	<tr><td align="right">旧密码:</td><td><input type="password" name="onpwd"/></td></tr>
   	<tr><td align="right">修改密码:</td><td><input type="password" name="newpwd"/></td></tr>
   	<tr><td align="right">确认密码:</td><td><input type="password" name="olpwd"/></td></tr>
   	<tr><td align="center" colspan="2"><input type="submit" value="提交"/></td></tr>
   	</table>
   	
   </form>
  </body>
</html>
