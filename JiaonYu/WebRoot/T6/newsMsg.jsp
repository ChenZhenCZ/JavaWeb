<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
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
		<jsp:include page="/web/head.jsp" flush="true"></jsp:include>
		<div id="main">
    	<div class="leftBox">
      	</div>
        <div class="rightBox">
        	<p class="news_title"><a href="${pageContext.request.contextPath}/mainservlet?action=main">首页</a>&gt;新闻公告</p>
            <div class="newsContent">
            	<div class="artibody">
		<table align="center" border="1" cellpadding="1" cellspacing="1" width="45%">
			<thead>
			<tr>
				<th align="center">图标</th>
				<th align="center">新闻名称</th>
				<th align="center">预览</th>
				<th align="center">发布人</th>
				<th align="center">发布时间</th>
				<th align="center">类别</th>
			</tr>
			</thead>
			<tbody>
				<c:forEach  items="${NewMsgList}"  var="d">
					<tr>
						<td><img src="${d.imageUrl}" height="50"/></td>
						<td>${d.msgName}</td>
						<td><a href="${pageContext.request.contextPath}/${d.msgContentUrl}" target="_blank" onclick="javascript:void(0);">预览</a></td>
						<td>${d.publishUsername}</td>
						<td>${d.publishDate}</td>
						<td>
						<c:if test="${d.effective==0}">通知</c:if>
						<c:if test="${d.effective==1}">公告</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		 <table align="center" border="0" cellpadding="1" cellspacing="1" width="45%">
        <tr>
        	<td>总记录数:${page.textCount }</td>
        	<td>页码:${page.pageDaen }/${page.pageCount }</td>
        	<td><a href="<%=basePath%>newMsgSer?action=list&&pageInt=1&por=first">首页</a></td>
        	<td><a href="<%=basePath%>newMsgSer?action=list&pageDaen=${page.pageDaen }&por=piror">上一页</a></td>
        	<td><a href="<%=basePath%>newMsgSer?action=list&pageDaen=${page.pageDaen }&por=next">下一页</a></td>
        	<td><a href="<%=basePath%>newMsgSer?action=list&pageDaen=${page.pageCount }&por=last">末页</a></td>
        </tr>
        </table>
            </div>
          </div>
    	</div>
    </div>
    <div class="clear"></div>
    <div class="mt12"></div>
  	<jsp:include page="/web/footer.jsp" flush="true"></jsp:include>
	</body>
</html>