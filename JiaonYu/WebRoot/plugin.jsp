<%@ page contentType="text/html;charset=GB2312" %>
<html>
<title> Plugin example </title>
<body bgcolor="white">
<h3> ��ǰʱ���� : </h3>
<jsp:plugin type="applet" code="Clock2.class" codebase="applet" jreversion="1.4" width="160" height="150" >
    <jsp:fallback>
       ��ǰ�������֧��plugin�� object �� applet��ǩ
    </jsp:fallback>
</jsp:plugin>
<p>
<h4>
<font color=red> 
�����applet��ͨ��JSP��plugin��ǩ���ص�
</font>
</h4>
</body>
</html>
