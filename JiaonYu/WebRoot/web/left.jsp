<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="lc">
	<p>管理中心</p>
   	<div class="lc_Menu" id="lc_Menu">
        <div aid="1" class="on"><a href="${pageContext.request.contextPath }/web/webCenter.jsp">我的资料</a></div>
        <div aid="1" class="on"><a href="${pageContext.request.contextPath }/courseServlet?action=wode1">去买课程</a></div>
        <c:if test="${user.userType==1}">
        <div aid="1" class="on"><a href="${pageContext.request.contextPath }/forumServlet?action=list&id=${user.userid}">我的提问</a></div>
         </c:if>
        <div aid="1" class="on"><a href="${pageContext.request.contextPath }/T14/wode.jsp">我的账号</a></div>
           <div aid="1" class="on"><a href="${pageContext.request.contextPath }/payRecordServlet?action=pay&id=${user.userid}">购买记录</a></div>
        <div aid="1" class="on"><a href="${pageContext.request.contextPath }/couponRecordServlet?action=list1">优 惠 券</a></div>
        <c:if test="${user.userType==1}">
        	<div aid="1" class="on"><a href="${pageContext.request.contextPath }/teacherServlet?action=init">申请讲师</a></div>
        </c:if>
        <c:if test="${user.userType==2}">
	        <div aid="1" class="on"><a href="${pageContext.request.contextPath }/T10/courseAdd.jsp?userid=${user.userid}">发布课程</a></div>
	        <div aid="1" class="on"><a href="${pageContext.request.contextPath }/courseServlet?action=wode&teacherid=${user.userid}">我的课程</a></div>
	        <div aid="1" class="on"><a href="${pageContext.request.contextPath }/newMsgSer?action=add">发布公告</a></div>
	        <div aid="1" class="on"><a href="${pageContext.request.contextPath }/forumServlet?action=list1&id=${user.userid}">老师答疑</a></div>
	         <div aid="1" class="on"><a href="${pageContext.request.contextPath }/couponRecordServlet?action=list">发布优惠券</a></div>
	        <div aid="1" class="on"><a href="${pageContext.request.contextPath }/cashRecordSevlet?action=cash&teacherId=${user.userid}">申请提现</a></div>
        </c:if>
        <div aid="1" class="on"><a href="${pageContext.request.contextPath }/uersServlet?action=exit">安全退出</a></div>
   	</div>
</div>