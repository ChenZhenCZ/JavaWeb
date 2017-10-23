<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>宏图教育在线学习平台</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/css/base.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/css/about.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/css/header.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/css/ifter.css"/>
		<script type="text/javascript" src="${pageContext.request.contextPath}/web/js/jquery-1.5.2.min.js"></script>
		<link href="${pageContext.request.contextPath }/web/css/bottom.css" rel="stylesheet" type="text/css"/>
  </head>
  
  <body>
  	<jsp:include page="/web/head.jsp" flush="true"></jsp:include>
  	<div id="main">
    	<div class="leftBox">
            <jsp:include page="/web/left.jsp" flush="true"></jsp:include>
      	</div>
        <div class="rightBox">
        	<p class="news_title"><a href="${pageContext.request.contextPath}/loginAction!index.action">首页</a>&gt;管理中心</p>
            <div class="newsContent">
            	<div class="artibody">
        	        <ul>
        	        	<li>手机号码：${user.mobile}</li>
        	        	<li class="bt"><hr/></li>	
        	        	<li>用户名称：${user.usersName}</li>
        	        	<li class="bt"><hr/></li>
						<li>账户余额：${user.remainMoney}&nbsp;元
						</li>
						<li class="bt"><hr/></li>
						<li>
						<a href="<%=basePath%>uersServlet?action=up&userid=${user.userid}">	
						<input class="btn btn-primary" type="button" value="  修改资料  "></a>
						&nbsp;&nbsp;&nbsp;
						<a href="<%=basePath%>uersServlet?action=up1&userid=${user.userid}">
						<input class="btn btn-primary" type="button" value="   充值余额  "></a>
						
						</li>
                    </ul>
               </div>
          </div>
    	</div>
    </div>
    <div class="clear"></div>
    <div class="mt12"></div>
  	<jsp:include page="/web/footer.jsp" flush="true"></jsp:include>
  	
  </body>
</html>
