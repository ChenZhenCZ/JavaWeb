<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="bean.ManagerVo"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="style/style.css" rel="stylesheet" type="text/css">
	
	<script type="text/javascript">
		function exit(){
			top.location.href="login.jsp";
		}
	</script>
</head>
<body leftmargin="0" topmargin="0"  marginwidth="0" marginheight="0">
<%
	ManagerVo manager = (ManagerVo)session.getAttribute("manager");
 %>
<%
/*
	if(ContextUtils.getUserInfo()==null)
	{
		response.sendRedirect("index.jsp");
	}
	*/
 %>
	<div class="header">
		<div class="topleft">
		 <a href="" target="_parent"><img src="images/logo2.png" title="伴我考自学考试" /></a>
		</div>
		<div class="topright">
		 <li><span><img src="images/peo.png"></span><a href="javascript:void(0);" target="_parent"><%=manager.getManagerName() %></a></li>
		 <li><span><img src="images/Set.png"></span><a href="${pageContext.request.contextPath}/T11/modifyPwd.jsp" target="rightFrame">修改密码</a></li>
		 <li><span><img src="images/exit.png"></span><a href="javascript:void(0);" onclick="exit();">退出</a></li>
		</div>
	</div>
</body>
</html>