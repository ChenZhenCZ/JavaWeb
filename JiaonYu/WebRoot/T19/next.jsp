<%@ page contentType="text/html; charset=GBK" %>
<html>
<head>
<title>
next
</title>
</head>
<body bgcolor="#ffffff">
<h1>
���յ�����Ϣ���£�
</h1>
<%
String userid=request.getParameter("userid");
String username=request.getParameter("username");
String password=request.getParameter("password");
out.println("userid:"+userid+"<br>");
out.println("username:"+username+"<br>");
out.println("password:"+password);

%>
</body>
</html>
