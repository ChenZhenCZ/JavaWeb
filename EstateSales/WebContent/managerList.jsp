<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>管理员列表</title>
  </head>
  <body>
    <h1 align="center">管理员列表</h1>
    <hr/>
    <table align="center" border="1" cellpadding="1" cellspacing="1" width="300">
    	<thead>
    		<th>管理员编号</th>
    		<th>管理员姓名</th>
    	</thead>
    	<s:iterator var="d" value="#request.managerList">
			<tr>
				<td>${d.id }</td>
				<td>${d.name }</td>
			</tr>
		</s:iterator>
        </table>
        <table align="center" border="0" cellpadding="1" cellspacing="1" width="500">
        <tr>
        	<td>总记录数:${pager.recordCount}</td>
        	<td>页码:${pager.currentPage}/${pager.pageCount}</td>
        	<td><a href="<%=path%>/manager/manager?action=list&currentPage=1&opr=first">首页</a></td>
        	<td><a href="<%=path%>/manager/manager?action=list&currentPage=${pager.currentPage}&opr=piror">上一页</a></td>
        	<td><a href="<%=path%>/manager/manager?action=list&currentPage=${pager.currentPage}&opr=next">下一页</a></td>
        	<td><a href="<%=path%>/manager/manager?action=list&currentPage=${pager.pageCount}&opr=last">末页</a></td>
        </tr>
        </table>
  </body>
</html>
