<%@ page contentType="text/html;charset=GB2312" %>
<html>
<title> Plugin example </title>
<body bgcolor="white">
<h3> 当前时间是 : </h3>
<jsp:plugin type="applet" code="Clock2.class" codebase="applet" jreversion="1.4" width="160" height="150" >
    <jsp:fallback>
       当前浏览器不支持plugin的 object 或 applet标签
    </jsp:fallback>
</jsp:plugin>
<p>
<h4>
<font color=red> 
上面的applet是通过JSP的plugin标签加载的
</font>
</h4>
</body>
</html>
