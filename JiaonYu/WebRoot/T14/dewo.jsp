<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
  	<jsp:include page="/web/head.jsp" flush="true"></jsp:include>
  	<div id="main">
    	<div class="leftBox">
            <jsp:include page="/web/left.jsp" flush="true"></jsp:include>
      	</div>
        <div class="rightBox">
        	<p class="news_title"><a href="${pageContext.request.contextPath}/mainservlet?action=main">首页</a>&gt;提现中心</p>
            <div class="newsContent">
            	<div class="artibody">
        	        <ul>
        	        	<li>手机号码：${teacher.mobile}</li>
        	        	<li class="bt"><hr/></li>	
        	        	<li>讲师名称：${teacher.usersName}</li>
        	        	<li class="bt"><hr/></li>
						<li>账户余额：${teacher.remainMoney}&nbsp;元
						</li>
						<li class="bt"><hr/></li>
						<li>
						<a href="<%=basePath%>uersServlet?action=up2&userid=${teacher.userid}">
						<input type="button" class="btn btn-primary" value="  提现余额  "></a>
						</li>
                    </ul>
                    <br/>
                  <table width="80%">
                  <tr>
                  	<th>缴费编码</th>
                  	<th>提现金额</th>
                  	<th>提现时间</th>
                  	<th>审核状态</th>
                  	<th>未通过原因</th>
                  	<th>操作</th>
                  </tr>
                  <c:forEach items="${list}" var="d">
                
                  <tr>				
                  <td align="center">${d.payRecordId}</td>
                  <td align="center">${d.payMoney }</td>
                  <td align="center">${d.cashDate }</td>
                  <td align="center">
                  	<c:if test="${d.status==0 }">未付款</c:if>
                  	<c:if test="${d.status==1 }">已付款</c:if>
                  	<c:if test="${d.status==2 }">审核未通过</c:if>
                  </td>
                  <td align="center">${d.reason }</td>
                  <td align="center"><a href="#">删除</a></td>
                  </tr>
                 </c:forEach> 
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
