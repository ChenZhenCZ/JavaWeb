<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
     
  <body>
    <c:if test="${msg!=null}">
       	<script type="text/javascript">
       		alert("${msg}");
       	</script>
       </c:if>
    <h1 align="center">&nbsp;修改密码</h1>
   <hr/>
   <form action="${pageContext.request.contextPath }/uersServlet?action=login1" method="post" name="form1" >
   <input type="hidden" value="${userList.userid }" name="managerId"> 
   <input type="hidden" value="${userList.remainMoney }" name="Money">
  
 
   	<table align="center" border="1" width="400">
   	<tr>
   	<td align="right">用户账号:</td><td>
   	 <input name="mobile" id="mobile" autocomplete="off" type="text" value="" placeholder="用户账号">
   	</td></tr>
   	<tr><td align="right">用户密码:</td>
   	<td><input name="password" id="password" type="password" class="txt" placeholder="请输入用户密码"/></td>
   	</tr>
   	<tr><td align="right">充值金额:</td><td><input type="text" name="remainMoney"/></td></tr>
   	<tr><td align="center" colspan="2"><input type="submit" value="充值"/></td></tr>
   	</table>
  
   </form>
  </body>
</html>
