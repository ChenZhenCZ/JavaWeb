<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/7
  Time: 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>登录</title>
    <%@include file="../master/header.jsp"%>
</head>
<body>
    <div style="margin:auto; width:600px; height:400px;padding-top:200px;">
        <div style="float:left;width:60%;"><img style="width:360px;height:150px;"src="<%=path%>/static/images/girl.jpg"></div>
        <div class="easyui-panel" data-options="title:'登录'" style="float:left;width:40%;">
            <form id="loginForm">
                <table>
                    <tr>
                        <td>
                            <input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入手机号',
						required:true,
						validType:['length[11,11]'],
						novalidate:true" name="phone"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="password" class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入密码',
						required:true,
						validType:['length[2,20]'],
						novalidate:true" name="pwd"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入验证码',
						required:true,
						validType:['length[2，20]'],
						novalidate:true" name="code"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           <img src="<%=path%>/code" onclick="this.src='<%=path%>/code?r=' + Math.random();"/>
                        </td>
                    </tr>
                    <tr>
                        <td><a class="easyui-linkbutton" onclick="login();">登录</a></td>
                    </tr>
                </table>
            </form>
        </div>
        <p style="clear: both;"></p>
    </div>
</body>
<%@ include file="../master/footer.jsp"%>
<script src="<%=path %>/static/js/user/user.js"></script>
</html>
