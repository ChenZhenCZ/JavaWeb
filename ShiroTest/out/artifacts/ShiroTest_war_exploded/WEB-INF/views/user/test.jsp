<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/10/9
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Shiro 演示</title>
</head>
<body>
<shiro:authenticated>
    登录可以看见
</shiro:authenticated>
<shiro:hasAnyRoles name="role1">
    role1可以看见
</shiro:hasAnyRoles>
<shiro:hasPermission name="permission1">
    permission1权限
</shiro:hasPermission>
都可以看的内容
</body>
</html>
