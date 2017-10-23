<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="bean.CityVo"%>
<%@page import="bean.PageVo"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'cityList.jsp' starting page</title>
    

  </head>
  
  <body>
  	<h1 align="center">城市资料</h1>
  	<hr/>
  	<table>
  	<tr><a href="<%=basePath%>cityservler?cation=init">新增</a></tr>
  	</table>
  	<table align="center" border="1" cellpadding="1" cellspacing="1" width="550">
  		<tr>
  			<th>城市编号</th>
  			<th>省份名称</th>
  			<th>城市名称</th>
  			<th>数据操作</th>
  		</tr>
  		<%
  		List<CityVo> cityList = (List<CityVo>)request.getAttribute("cityLit");
  		PageVo pager =(PageVo)request.getAttribute("page");
		int tnd=cityList.size();
		CityVo city=null;
		for(int i=0;i<tnd;i++){
			city=cityList.get(i);
		
  		%>
  		<tr>
  		<td align="center"><%=city.getCityid() %></td>
  		<td align="center"><%=city.getProvincename() %></td>
  		<td align="center"><%=city.getCityname() %></td>
  		<td align="center">
		<a href="<%=basePath%>cityservler?cation=update&cityid=<%=city.getCityid()%>">修改</a>
		<a href="<%=basePath%>cityservler?cation=del&cityid=<%=city.getCityid()%>" onclick="javascript:if(confirm('删除确认')){return true;}else{return false;}">删除</a>
		</td>
		</tr>
		<%} %>
		</table>
		<table align="center" border="1" cellpadding="1" cellspacing="1" width="550">
		<tr>
		<td>总记录数:<%=pager.getTextCount() %></td>
		<td>总页数:<%=pager.getPageCount() %></td>
		<td>当前页:<%=pager.getPageDaen() %></td>
		<td><a href="<%=basePath%>cityservler?cation=list&pageDaen=1&por=first">首页</a></td>
		<td><a href="<%=basePath%>cityservler?cation=list&pageDaen=<%=pager.getPageDaen() %>&por=piror">上一页</a></td>
		<td><a href="<%=basePath%>cityservler?cation=list&pageDaen=<%=pager.getPageDaen() %>&por=next">下一页</a></td>
		<td><a href="<%=basePath%>cityservler?cation=list&pageDaen=<%=pager.getTextCount() %>&por=last">末页</a></td>
		</tr>
  	</table>
  </body>
</html>
