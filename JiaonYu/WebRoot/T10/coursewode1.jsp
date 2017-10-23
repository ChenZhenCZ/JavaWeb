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
        	<p class="news_title"><a href="${pageContext.request.contextPath}/mainservlet?action=main">首页</a>&gt;我的课程</p>
            <div class="newsContent">
            	<div class="artibody">
            	 <form name="form1" enctype="multipart/form-data" action="<%=basePath%>teacherServlet?action=add" method="post" onsubmit="return check">
        	      <input type="hidden" name="userid" value="<%=userid %>"> 
        	       <table width="100%">
        	       <c:forEach items="${courseList}" var="d">
        	       <tr>
    				<th>课程名称 &nbsp;&nbsp;${d.courseName }</th>
        	    	<th>课程介绍</th>
				<tr height="40">
					<td width="130px" rowspan="1">
						<img src="${pageContext.request.contextPath }/${d.pictureUrl}" width="150" height="100"/>
					</td>
					<td valign="top">
					&nbsp;&nbsp;&nbsp;&nbsp;${d.introduce }
					</td>
  					</tr>
  					<tr>
  					<th>课时 ${d.courseCount }</th>
    				<th>&nbsp;&nbsp;是否收费&nbsp;&nbsp;
    				<c:if test="${d.chargeType==0}">免费</c:if>
					<c:if test="${d.chargeType==1}">收费</c:if>
    				</th>
    				<td align="center">
					<c:if test="${d.chargeType==0}">
						<a href="${pageContext.request.contextPath }/sectionServlet?action=list1&courseId=${d.courseId}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学习</a>
						</c:if>
					<c:if test="${d.chargeType==1}">
						<a href="${pageContext.request.contextPath }/listServlet?action=course&courseId=${d.courseId}">买课</a>
					</c:if>
					</td>
  					</tr>
  					<tr>
  					<th colspan="8"><hr/></th>
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
