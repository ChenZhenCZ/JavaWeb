<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'manList.jsp' starting page</title>
    
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
    <h1 align="center">管理员资料</h1>
    <hr/>
    <c:if test="${msg!=null}">
   		<script type="text/javascript">
   			alert("${msg}");
   		</script>
    </c:if>
    <table align="center" border="0" cellpadding="1" cellspacing="1" width="1200">
		<tr>
			<td><a href="<%=basePath%>/T11/manlong.jsp">新增</a></td>
		</tr>
	</table>
    <table align="center" border="1" cellpadding="1" cellspacing="1" width="1000" >
    <tr>
    <th width="80">管理员Id</th>
    <th width="80">管理员账户</th>
    <th width="80">管理员姓名</th>
    <th width="80">性别</th>
    <th width="80">权限</th>
    <th width="80">联系方式</th>
    <th width="80">数据操作</th>
    </tr>
    <c:forEach items="${ManagerLit}" var="d">
    <tr>
    	<td>${d.managerId}</td>
    	<td>${d.managerAccount }</td>
    	<td>${d.managerName }</td>
    	<td>
    	<c:if test="${d.sex==0 }">男</c:if>
    	<c:if test="${d.sex==1 }">女</c:if>
    	</td>
    	<td>
    	<c:if test="${d.statu==1}">启用</c:if>
    	
    	<c:if test="${d.statu==0}">禁用</c:if>
    	</td>
    	<td>${d.contact }</td>
    	<td>
    	<a href="<%=basePath%>managerServlet?action=up&managerId=${d.managerId}">修改</a>	
   		<a href="<%=basePath%>managerServlet?action=inpwd&managerId=${d.managerId}">初始化密码</a>	
   		<c:if test="${d.statu==1}">
			<a href="<%=basePath%>managerServlet?action=status&status=0&managerId=${d.managerId }">禁用</a>
		</c:if>
		<c:if test="${d.statu==0}">
			<a href="<%=basePath%>managerServlet?action=status&status=1&managerId=${d.managerId }">启用</a>
		</c:if>
   	 </td>
    </tr>
    </c:forEach>
    </table>
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="1000">
    	<tr>
    		<td>总记录数:${page.textCount }</td>
    		<td>页数:${page.pageCount }</td>
    		<td>当前页:${page.pageDaen }</td>
    		<td><a href="<%=basePath%>managerServlet?action=list&pageInt=1&por=first">首页</a></td>
    		<td><a href="<%=basePath%>managerServlet?action=list&pageDaen=${page.pageCount }&por=last">末页</a></td>
    		<td><a href="<%=basePath%>managerServlet?action=list&pageDaen=${page.pageDaen }&por=next">下一页</a></td>
    		<td><a href="<%=basePath%>managerServlet?action=list&pageDaen=${page.pageDaen }&por=piror">上一页</a></td>
    	</tr>
    </table>
  </body>
</html>
