<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/9/7
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
</head>
<%
    String path=request.getContextPath();
%>
<body>
<form action="/uers/vo" method="post">
    <input type="text" name="name">
    <input type="password" name="password">
    <input type="submit" value="登录">
</form>
<a href="<%=path%>/uers/del/5">删除</a>
</body>
</html>
