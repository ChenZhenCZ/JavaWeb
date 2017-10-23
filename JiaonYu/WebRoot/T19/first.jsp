<%@ page contentType="text/html; charset=GBK" %>
<html>
<head>
<title>
jsp1
</title>
</head>
<body bgcolor="#ffffff">
<h1>
 µœ÷URL÷ÿ–¥
</h1>
<%
String str=request.getParameter("test");
if(str!=null){
byte[] by=str.getBytes("ISO-8859-1");
String ss=new String(by);
 str=ss;
out.println(str);
}
%>
<form action="/study/urlServlet">
<input type="text"  value="" name="test"/>
<input type="submit" value="ok"/>
</form>
</body>
</html>
