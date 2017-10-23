<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>新闻资讯</title>
	<jsp:include page="/IncludeJS.jsp"></jsp:include>
	 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/css/base.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/css/news.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/web/css/header.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/web/js/jquery-1.5.2.min.js"></script>
	<link href="${pageContext.request.contextPath }/web/css/bottom.css" rel="stylesheet" type="text/css"/>
  </head>
  
  <body>
   <table class=' formMiddle formMiddle432' style='' cellpadding='0' cellspacing='0'><tr>
<td class='formMiddleLeft formMiddleLeft432'></td>
<td class='formMiddleCenter formMiddleCenter432 ' valign='top'>
<div class='formMiddleContent formMiddleContent432' tabStyle='0'>
<div class='photoList'>
<div class='clearfloat'></div>
<div id='photoForms432' class='photoForms' picWidth='160' picHeight='160'>
<div photoName='金牌讲师陈老师'linkType='1' photoDisc='' photoId='92' class='photoForm' style='margin-left:10px;margin-right:10px;padding-left:0px;padding-right:0px;margin-top:5px;margin-bottom:5px;padding-top:0px;padding-bottom:0px;' faiWidth='160' faiHeight='106'>
<div id='photoListABUIABACGAAgmMi4swUon-rhsAQwpgQ47gI'  class='imgDiv'>
<table cellpadding='0' cellspacing='0'>
<tr>
<td>
<a hidefocus='true' href="pod.jsp?id=92&_php=2_432_3" target='_blank'>
<img class='photoImg' src='upload/201702150909222805.jpg' alt='金牌讲师陈老师'  />
</a>
</td>
</tr>
</table>
</div>
  </body>
</html>
