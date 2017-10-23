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
	<title>买课记录</title>
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
        	<p class="news_title"><a href="${pageContext.request.contextPath}/mainservlet?action=main">首页</a>&gt;买课记录</p>
            <div class="newsContent">
            	<div class="artibody">
		<table align="center" border="1" cellpadding="1" cellspacing="1" width="45%">
			<thead>
			<tr>
				<th align="center">课程图标</th>
				<th align="center">课程名称</th>
				<th align="center">课程介绍</th>
				<th align="center">购买价格</th>
				<th align="center">购买状态</th>
				<th align="center">购买时间</th>
				<th align="center">课时</th>
				<th align="center">操作</th>
			</tr>
			</thead>
			<tbody>
				<c:forEach  items="${paylist}"  var="d">
					<tr>
						<td><img src="${d.cou.pictureUrl}" height="80" width="150"/></td>
						<td align="center">${d.cou.courseName}</td>
						<td>${d.cou.introduce }</td>
						<td align="center">${d.cou.price}</td>
						<td align="center">
						<c:if test="${d.pay.payStatus==0}">未支付</c:if>
						<c:if test="${d.pay.payStatus==1}">已支付</c:if>
						</td>
						<td align="center">
						${d.pay.payDate}
						</td>
						<td align="center">${d.cou.courseCount}</td>
						<td align="center"><a href="${pageContext.request.contextPath }/sectionServlet?action=list1&courseId=${d.cou.courseId}">学习</a></td>
					</tr>
				</c:forEach>
			</tbody>
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