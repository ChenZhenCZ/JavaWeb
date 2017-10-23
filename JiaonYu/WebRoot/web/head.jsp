<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
	<div id="topinfo">
        <div class="topinfo_con">
            <div class="top_left">
            	您好！欢迎来到宏图教育官网！<a href="${pageContext.request.contextPath}/web/login.jsp">登录</a> 
            </div>
        </div>   
    </div>
	<div id="header">
        <div class="mainHeader">
        	<div class="left_mh">
            	<img src="${pageContext.request.contextPath}/web/image/logo2.jpg" width="300" height="80" alt="培考网官网">  
            </div>
        </div>
        <div id="nav">
            <ul class="nav_list">
				<li class="n"><a href="${pageContext.request.contextPath}/mainservlet?action=main">首页</a></li>
				<li><a target="_self" href="http://www.htit-china.com/">走进宏图</a></li>
				<li><a target="_self" href="${pageContext.request.contextPath }/courseServlet?action=wode1">在线课程</a></li>
				<li><a target="_self" href="${pageContext.request.contextPath }/newMsgSer?action=list">新闻公告</a></li>
				<li><a target="_self" href="${pageContext.request.contextPath }/mainservlet?action=list">一线讲师</a></li>  
				<li><a target="_self" href="${pageContext.request.contextPath }/couponRecordServlet?action=list1">优惠活动</a></li>                               
				<li><a target="_self" href="${pageContext.request.contextPath }/courseServlet?action=wode2">免费视频</a></li>                               
				<li><a target="_self" href="http://www.htit-china.com/">加入我们</a></li>
            </ul>
        </div>
    </div>   