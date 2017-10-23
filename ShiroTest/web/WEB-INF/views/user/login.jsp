<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/10/9
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登录</title>
</head>
<%
    String path=request.getContextPath();
%>
<body>
<form action="<%=path%>/user/login" method="post">
    手机号码： <input type="text" name="name">
    登录密码： <input type="password" name="password">
    <input type="submit"  value="登录">
</form>

</body>
</html>
