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
  <body>
    <c:if test="${msg!=null}">
       	<script type="text/javascript">
       		alert("${msg}");
       	</script>
       </c:if>
  	<jsp:include page="/web/head.jsp" flush="true"></jsp:include>
  	  <table width="85%" >
       <tr height="50"   >
           <th  width="350" align="right">
        	   头像<img src="${pageContext.request.contextPath }/upload/${teacherList.headPictureUrl}" height="100"/>
    	     <br><b>讲师名称:&nbsp;&nbsp;</b>${teacherList.accountName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	    </th>
    	    <td align="left">
    	    <b>
        	 <b> &nbsp;教学特长:&nbsp;&nbsp;</b>${teacherList.teacherSpecial}<br><br>
    			<b>&nbsp;学历:&nbsp;&nbsp;</b>${teacherList.education}<br><br>
    		<b>&nbsp;教龄:&nbsp;&nbsp;</b>${teacherList.teacherLength}<br>
    	    <td>
    	<tr>
    	
        </table>
          
  	<div id="main">
        	<p class="news_title"><a href="${pageContext.request.contextPath}/loginAction!index.action">首页</a>&gt;我的课程</p>
           		 <div class="newsContent">
            		<div class="artibody">
    	 
        	    <table width="80%">
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
						<img src="${pageContext.request.contextPath }/${d.pictureUrl}" height="100"/>
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
					<c:if test="${d.chargeType==0}">
						<a href="${pageContext.request.contextPath }/sectionServlet?action=list1&courseId=${d.courseId}">学习</a>
						</c:if>
					<c:if test="${d.chargeType==1}">
						<a href="${pageContext.request.contextPath }/courseServlet?action=list&courseId=${d.courseId}">买课</a>
					</c:if>
					<c:if test="${d.status==0}">
						<a href="${pageContext.request.contextPath }/courseServlet?action=list&courseId=${d.courseId}">审核</a>
					</c:if>
					</td>
  					</tr>
        	      </c:forEach>
        	       </table>
               </div>
          </div>
    	</div>
    <div class="clear"></div>
    <div class="mt12"></div>
  	<jsp:include page="/web/footer.jsp" flush="true"></jsp:include>
  </body>
</html>
