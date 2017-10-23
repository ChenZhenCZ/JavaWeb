<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>伴我考后台管理系统</title>
<meta name="keywords" content="">
<meta name="description" content="">
<link href="style/style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
		function checkLogin(){
			var code = form1.code.value;
			var managerPassword = form1.managerPassword.value;
			var managerAccount = form1.managerAccount.value;
			if(code==""||managerPassword==""||managerAccount=="") {
				alert("请填写完整用户名，密码和验证码");
				return false;
			}
			return true;
		}
		function refresh(){
			document.getElementById("codes").src= '${pageContext.request.contextPath }/enimg.jsp?'+Math.random();
		}
	</script>
</head>
<body>
<div class="login">
 <div class="loginC">
  <div class="login_l"><img src="images/bwkxt.png"></div>
  <div class="login_r">
  <c:if test="${msg!=null}">
  	<script type="text/javascript">
  		alert("${msg}");
  	</script>
  </c:if>
  <form action="${pageContext.request.contextPath }/managerServlet?action=longin" name="form1" method="post" onsubmit="return checkLogin();">
    <ul>
	      <li>
		      <label>用户：</label>
			  <input type="text" name="managerAccount" id="managerAccount" placeholder="输入后勤系统的用户名">			 
		  </li>
		   <li>
		      <label>密码：</label>
			  <input  type="password" name="managerPassword" id="managerPassword" placeholder="输入您设置的密码">
		  </li>
		  <li>
		      <label>验证码：</label>
			  <input type="text" name="code" id="code" placeholder="输入验证码">			 
		  </li>
		  <li>
		      <label></label>
		      <input type="submit" value="登 录" class="btn-login">
			  <div class="yzm"><img src="${pageContext.request.contextPath }/enimg.jsp" width="64" height="28" id="codes" align="top" alt="点击换一张"  onclick="refresh();"></div>
		  </li>
	  </ul>
	  </form>
  </div>
 </div>
</div>
</body>
</html>
