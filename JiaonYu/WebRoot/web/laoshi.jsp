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
	<title>一线讲师</title>
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
        	<p class="news_title"><a href="${pageContext.request.contextPath}/mainservlet?action=main">首页</a>&gt;一线讲师</p>
            <div class="newsContent">
            	<div class="artibody">
		<table align="center" border="1" cellpadding="1" cellspacing="1" width="45%">
			
		<div class="show_pic">   
           <div class="smallPic" >
             <ul>
             	<tr>
             	 <c:forEach items="${teacherlist}" var="s">
             	 <td>
             		<li>   	
             		<a href="${pageContext.request.contextPath }/courseServlet?action=wode3&teacherid=${s.teacherId}"><img src="${pageContext.request.contextPath }/upload/${s.headPictureUrl}" width="150"height="160"></a><br/><br/>
             		<a href="#">${s.accountName}</a>
             		</li> 
             	</td>
             	</c:forEach>  
             	</tr>           
             </ul>
       
          </div>
      </div>
			</tbody>
		</table>
		 <table align="center" border="0" cellpadding="1" cellspacing="1" width="45%">
        <tr>
        	<td>总记录数:${page.textCount }</td>
        	<td>页码:${page.pageDaen }/${page.pageCount }</td>
        	<td><a href="<%=basePath%>mainservlet?action=list&&pageInt=1&por=first">首页</a></td>
        	<td><a href="<%=basePath%>mainservlet?action=list&pageDaen=${page.pageDaen }&por=piror">上一页</a></td>
        	<td><a href="<%=basePath%>mainservlet?action=list&pageDaen=${page.pageDaen }&por=next">下一页</a></td>
        	<td><a href="<%=basePath%>mainservlet?action=list&pageDaen=${page.pageCount }&por=last">末页</a></td>
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