<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/10/16
  Time: 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>请假</title>
</head>
<body>
    <form action="<%=path %>/activiti/leave" method="post">
        <input type="number" name="days" />
        <input type="text" name="reason" />
        <input type="submit" value="提交请假"/>
    </form>
</body>
</html>
