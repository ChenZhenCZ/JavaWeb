<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
    	String path = request.getContextPath();
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<%=path %>/comment/add" method="post">
		<input type="text" name="content" />
		<input type="text" name="comment.buildings_id" />
		<input type="text" name="comment.comment_time" />
		<input type="text" name="comment.user_id" />
		<input type="submit" />
	</form>
</body>
</html>