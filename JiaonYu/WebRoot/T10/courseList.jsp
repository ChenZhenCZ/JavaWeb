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
    
    <title>课程</title>
    

  </head>
  
  <body>
   <h1 align="center">课程信息</h1>
   <hr/>
   <body>
        <table align="center" border="0" cellpadding="1" cellspacing="1" width="100%">
        <tr>
        	<td>总记录数:${page.textCount }</td>
        	<td>页码:${page.pageDaen }/${page.pageCount }</td>
        	<td><a href="<%=basePath%>courseServlet?action=list&&pageInt=1&por=first">首页</a></td>
        	<td><a href="<%=basePath%>courseServlet?action=list&pageDaen=${page.pageDaen }&por=piror">上一页</a></td>
        	<td><a href="<%=basePath%>courseServlet?action=list&pageDaen=${page.pageDaen }&por=next">下一页</a></td>
        	<td><a href="<%=basePath%>courseServlet?action=list&pageDaen=${page.pageCount }&por=last">末页</a></td>
        </tr>
        </table>

		<table align="center" border="1" cellpadding="1" cellspacing="1" width="100%">
			<tr>
				<th align="center">图标</th>
				<th align="center">课程名称</th>
				<th align="center">一句话</th>
				<th align="center">课程介绍</th>
				<th align="center">课时数</th>
				<th align="center">价格</th>
				<th align="center">折扣</th>
				<th align="center">发布人</th>
				<th align="center">发布时间</th>
				<th align="center">收费类型</th>
				<th align="center">状态</th>
				<th align="center">审核</th>
				<th align="center">未通过原因</th>
				<th align="center">排序</th>
			</tr>
				<c:forEach  items="${courseList}"  var="d">
					<tr>
						<td align="center"><a href="${pageContext.request.contextPath }/courseServlet?action=seve&courseId=${d.courseId }">
						<img src="${d.pictureUrl}" height="80"/>
						</a>
						</td>
						<td align="center">${d.courseName}</td>
						<td align="center">${d.oneWord}</td>
						<td align="center">${d.introduce }</td>
						<td align="center">${d.courseCount}</td>
						<td align="center">${d.price}</td>
						<td align="center">${d.discount}</td>
						<td align="center">${d.replayUsername}</td>
						<td align="center">${d.replayDate}</td>
						<td align="center">
						<c:if test="${d.chargeType==0}">免费</c:if>
						<c:if test="${d.chargeType==1}">会员</c:if>
						</td>
						<td align="center">
						<c:if test="${d.effective==0}">无效</c:if>
						<c:if test="${d.effective==1}">有效</c:if>
						</td>
						<td align="center">
						<c:if test="${d.status==0}">未审核</c:if>
						<c:if test="${d.status==1}">已审核</c:if>
						<c:if test="${d.status==2}">审核未通过</c:if>
						</td>
						<td align="center">${d.reason}</td>
						<td align="center">${d.seq}</td>
					</tr>
				</c:forEach>
		</table>
	</body>
   
  </body>
</html>
