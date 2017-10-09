<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/9/8
  Time: 9:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="<%=path %>/upload/up" method="post" enctype="multipart/form-data">
    <input type="file" name="file" />
    <input type="submit" />
</form>
</body>
</html>
