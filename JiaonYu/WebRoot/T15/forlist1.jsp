<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
 <%
 String userid=request.getParameter("userid");
 System.out.print(userid);
  %>
  <body>
    <c:if test="${msg!=null}">
       	<script type="text/javascript">
       		alert("${msg}");
       	</script>
       </c:if>
  	<jsp:include page="/web/head.jsp" flush="true"></jsp:include>
  	<div id="main">
    	<div class="leftBox">
            <jsp:include page="/web/left.jsp" flush="true"></jsp:include>
      	</div>
        <div class="rightBox">
        	<p class="news_title"><a href="${pageContext.request.contextPath}/loginAction!index.action">首页</a>&gt;我的课程</p>
            <div class="newsContent">
            	<div class="artibody">
            	 <form name="form1"  action="${pageContext.request.contextPath }/forumServlet?action=up" method="post" >
        	      <input type="hidden" name="userid" value="<%=userid %>"> 
        	     <table>
        	 	 <c:forEach items="${forlist}" var="d">
        	   		<tr><td align="right">${d.forumid }学生的提问:</td><td>${d.content }</td><td>提问时间:&nbsp;&nbsp; ${d.forumdate }</td></tr>
        	   		<tr><td align="right">${user.usersName }老师回复:</td><td><textarea cols="60" rows="4" name="text"></textarea></td>
        	   		<td colspan="2">&nbsp;&nbsp;<input type="submit" value="回复">
        	   		<input type="hidden"  name="usersName" value="${user.usersName }老师回复"/>
        	 		<input type="hidden"  name="forumid"  value="${d.forumid }"/>
        	 	 	<input  type="hidden" name="id"      value="${user.userid}">
        	 	 	</td>
        	   		</tr>
        	    	</c:forEach>
        	       </table>
                </form>
               </div>
          </div>
    	</div>
    </div>
    <div class="clear"></div>
    <div class="mt12"></div>
  	<jsp:include page="/web/footer.jsp" flush="true"></jsp:include>
  </body>
</html>
