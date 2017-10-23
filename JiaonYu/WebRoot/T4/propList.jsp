<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="bean.ProVo"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>省份</title>
    

  </head>
  
  <body>
    <h1 align="center">城市资料</h1>
  	<hr/>
  	<table>
  	<tr><a href="<%=basePath%>T4/propAdd.jsp">新增</a></tr>
  	</table>
  	<table align="center" border="1" cellpadding="1" cellspacing="1" width="550">
  		<tr>
  			<th>省份编号</th>
  			<th>省份名称</th>
  			<th>数据操作</th>
  		</tr>
  		<%
  		List<ProVo> propList = (List<ProVo>)request.getAttribute("propLit");
		int tnd=propList.size();
		ProVo prop=null;
		for(int i=0;i<tnd;i++){
			prop=propList.get(i);
		
  		%>
  		<tr>
  		<td align="center"><%=prop.getProvinceid() %></td>
  		<td align="center"><%=prop.getProvincename() %></td>
  		<td align="center">
		<a href="<%=basePath%>poprServlet?cation=update&provinceid=<%=prop.getProvinceid()%>">修改</a>
		<a href="<%=basePath%>poprServlet?cation=del&provinceid=<%=prop.getProvinceid()%>" onclick="javascript:if(confirm('删除确认')){return true;}else{return false;}">删除</a>
		</td>
		</tr>
		<%} %>
		</table>
  </body>
</html>
