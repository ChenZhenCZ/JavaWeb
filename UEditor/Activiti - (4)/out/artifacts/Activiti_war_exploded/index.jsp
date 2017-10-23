<%--
  Created by IntelliJ IDEA.
  com.gs.activiti.User: Administrator
  Date: 2017/10/16
  Time: 9:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
%>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
    <a href="<%=path %>/activiti/deploy/leave_process_complex">部署请假流程</a>

    <a href="<%=path %>/activiti/to_leave">我要请假</a>
  </body>
</html>
