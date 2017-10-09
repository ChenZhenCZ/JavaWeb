<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/9/8
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<%
  String path=request.getContextPath();
%>
<body>
<form id="amdin_re">
    <input type="text" name="name">
    <input type="password" name="password">
    <input type="button" value="登录" onclick="rek();">
</form>
</body>
<script src="<%=path%>/js/jquery.min.js"></script>
<script>
    function rek() {
        $.post(
            "<%=path%>/amdin/re1",
            $('#amdin_re').serialize(),
            function (data) {

                if (data.result="success"){
                        alert("注册成功！")
                }else {
                    alert("失败")
                }
            }
            ,
            "json"
        );
    }

</script>
</html>
