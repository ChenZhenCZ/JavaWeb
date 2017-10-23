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
    <title>用户资料表</title>
    
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
   <h1 align="center">用户资料列表</h1>
    <hr/>
    <table align="center" border="0" cellpadding="1" cellspacing="1" width="1200">
		<tr>
			<td><a href="<%=basePath%>uersServlet?action=init">新增</a></td>
		</tr>
	</table>
    <table align="center" border="1" cellpadding="1" cellspacing="1" width="1200" >
    <tr>
    <th>用户id</th>
	<th>姓名</th>
	<th>手机号码</th>
	<th>性别</th>
	<th>省份</th>
	<th>城市</th>
	<th>用户类别</th>
	<th>邮箱地址</th>
	<th>注册日期</th>
	<th>家庭地址</th>
	<th>操作</th>
    </tr>
    <c:forEach items="${userLit}" var="d">
    <tr>
    	<td>${d.userid }</td>
		<td>${d.usersName }</td>
		<td>${d.mobile }</td>
		<td>
		<c:if test="${d.sex==0}">男</c:if>
		<c:if test="${d.sex==1}">女</c:if>
		</td>
		<td>${d.provinceName }</td>
		<td>${d.cityName }</td>
		<td>
			<c:if test="${d.userType==1}">
				学生
			</c:if>
			<c:if test="${d.userType!=1}">
				讲师
			</c:if>
		</td>
		<td>${d.email }</td>
		<td>${d.registerDate }</td>
		<td>${d.homeAddress }</td>
    	<td>
    	<a href="<%=basePath%>uersServlet?action=del&userid=${d.userid }" onclick="javascript:if(confirm('删除确认')){return true;}else{return false;}">删除</a>	
   		<a href="<%=basePath%>uersServlet?action=inpwd&userid=${d.userid}">初始化密码</a>	
   	 </td>
    </tr>
    </c:forEach>
    </table>
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="1000">
    	<tr>
    		<td>总记录数:${page.textCount }</td>
    		<td>页数:${page.pageCount }</td>
    		<td>当前页:${page.pageDaen }</td>
    		<td><a href="<%=basePath%>uersServlet?action=list&pageInt=1&por=first">首页</a></td>
    		<td><a href="<%=basePath%>uersServlet?action=list&pageDaen=${page.pageCount }&por=last">末页</a></td>
    		<td><a href="<%=basePath%>uersServlet?action=list&pageDaen=${page.pageDaen }&por=next">下一页</a></td>
    		<td><a href="<%=basePath%>uersServlet?action=list&pageDaen=${page.pageDaen }&por=piror">上一页</a></td>
    	</tr>
    </table>
  </body>
</html>
