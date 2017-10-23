<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>伴我考后台管理系统</title>
	<link href="${pageContext.request.contextPath }/style/style.css" rel="stylesheet" type="text/css">
	<jsp:include page="/IncludeJS.jsp"></jsp:include>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/dh.js"></script>
</head>
<body leftmargin="0" topmargin="0"  marginwidth="0" marginheight="0">
		<div class="left">
		<dl class="leftmenu">
			<dd>
			  	<div class="title">
				<span>账户管理<i></i></span>
				</div>
				<ul class="menuson">
					<li><cite></cite><a href="${pageContext.request.contextPath }/managerServlet?action=list" target="rightFrame">账户管理</a></li>
					<li><cite></cite><a href="${pageContext.request.contextPath }/uersServlet?action=list" target="rightFrame">用户管理</a></li>
				</ul>    
			</dd>
			<dd>
			  	<div class="title">
				<span>审核管理<i></i></span>
				</div>
				<ul class="menuson">
					<li><cite></cite><a href="${pageContext.request.contextPath }/teacherServlet?action=list" target="rightFrame">讲师审核</a></li>
					<li><cite></cite><a href="${pageContext.request.contextPath }//courseServlet?action=list" target="rightFrame">课程审核</a></li>
					<li><cite></cite><a href="${pageContext.request.contextPath }/sectionServlet?action=tion" target="rightFrame">视频审核</a></li>
				</ul>    
			</dd>
			<dd>
			  <div class="title">
				<span>财政管理<i></i></span>
				</div>
				
				<ul class="menuson">
					<li><cite></cite><a href="${pageContext.request.contextPath }/cashRecordSevlet?action=list" target="rightFrame">财政管理</a></li>

				</ul>    
			</dd>
	
			<dd>
			  <div class="title">
				<span>学习管理<i></i></span>
				</div>
				
				<ul class="menuson">
					<li><cite></cite><a href="exeModelAction!list.action" target="rightFrame">题型模板</a></li>
					<li><cite></cite><a href="" target="rightFrame">在线课程</a></li>
					<li><cite></cite><a href="" target="rightFrame">题型管理</a></li>  
				</ul>    
			</dd>
			<dd>
			  <div class="title">
				<span>新闻公告<i></i></span>
				</div>
				<ul class="menuson">
					<li>
						<cite></cite><a href="${pageContext.request.contextPath }/newMsgSer?action=news" target="rightFrame">新闻公告</a>
					</li>
				</ul>  
			</dd>
			<dd>
			  <div class="title">
				<span>消息查询<i></i></span>
				</div>
			</dd>
			<dd>
			  <div class="title">
				<span>广告管理<i></i></span>
				</div>
			</dd>
			<dd>
			  <div class="title">
				<span>统计报表<i></i></span>
				</div>
			</dd>
			<dd>
			  <div class="title">
				<span>用户介绍管理<i></i></span>
				</div>
			</dd>
			<dd>
			  <div class="title">
				<span>合作伙伴<i></i></span>
				</div>
			</dd>
			<dd>
			  <div class="title">
				<span>兑换码管理<i></i></span>
				</div>
			</dd>
			<dd>
			  <div class="title">
				<span>基础数据<i></i></span>
				</div>
				<ul class="menuson">
					<li><cite></cite><a href="${pageContext.request.contextPath }/poprServlet?cation=list" target="rightFrame">省份管理</a></li>
					<li><cite></cite><a href="${pageContext.request.contextPath }/cityservler?cation=list" target="rightFrame">城市管理</a></li>
					<li><cite></cite><a href="${pageContext.request.contextPath }/teacherGradeservler?cation=list" target="rightFrame">讲师等级</a></li>
				</ul>    
				
			</dd>
			<dd>
			  <div class="title">
				<span>系统日志<i></i></span>
				</div>
				<ul class="menuson">
					<li><cite></cite><a href="logAction!log.action" target="rightFrame">系统日志</a></li>
				</ul>    
				
			</dd>
		</dl>
		<div class="dl-second-slib-con"><a class="dl-second-slib" href="javascript:"></a></div>
		</div>
</body>
</html>