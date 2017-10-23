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
        	       <table>
        	       <tr>
        	       	<th>课程图片</th>
    				<th>课程名称</th>
    				<th>课时</th>
    				<th>单价</th>
    				<th>折后价</th>
    				<th>发布状态</th>
    				<th>是否收费</th>
    				<th>审核状态</th>
    				<th>操作</th>
        	    
        	  <c:forEach items="${courseList}" var="d">
        	      
				<tr height="40">
					<td width="130px">
						<img src="${pageContext.request.contextPath }/${d.pictureUrl}" width="135"  height="100"/>
					</td>
					<td width="120px" align="center">${d.courseName }</td>
					<td align="center">${d.courseCount }</td>
					<td align="center">${d.price }</td>
					<td align="center">${d.discount }</td>
					<td align="center">
						<c:if test="${d.effective==0}">未发布</c:if>
						<c:if test="${d.effective==1}">已发布</c:if>
						<c:if test="${d.effective==2}">停售</c:if>
					</td>
					<td align="center">
						<c:if test="${d.chargeType==0}">免费</c:if>
						<c:if test="${d.chargeType==1}">收费</c:if>
					</td align="center">
					<td align="center">
						<c:if test="${d.status==0}">未审核</c:if>
						<c:if test="${d.status==1}">已审核</c:if>
						<c:if test="${d.status==2}">审核未通过</c:if>
					</td>
					<td align="center">
					<c:if test="${d.status==1}">
						<a href="${pageContext.request.contextPath }/sectionServlet?action=list&courseId=${d.courseId}">添加章节</a>
						<c:if test="${d.effective==0}">
							<a href="${pageContext.request.contextPath }/courseServlet?action=up2&courseId=${d.courseId}">发布</a>
						</c:if>
						<c:if test="${d.effective==1}">
							<a href="${pageContext.request.contextPath }/courseServlet?action=up&courseId=${d.courseId}">停售</a>
						</c:if>
					</c:if>
					<c:if test="${d.status==0}">
						<a href="${pageContext.request.contextPath }/courseServlet?action=list&courseId=${d.courseId}">审核</a>
					</c:if>
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
