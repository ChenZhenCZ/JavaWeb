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

		<link rel="stylesheet" href="<%=basePath%>/buy/lanrenzhijia.css" media="all">
		<script src="<%=basePath%>/buy/jquery.min.js"></script>
		<script>
		jQuery(document).ready(function($) {
			$('.theme-login').click(function(){
				$('.theme-popover-mask').fadeIn(100);
				$('.theme-popover').slideDown(200);
			})
			$('.theme-poptit .close').click(function(){
				$('.theme-popover-mask').fadeOut(100);
				$('.theme-popover').slideUp(200);
			})
		
		})
		</script>
  </head>
  
  <body>
<div class="theme-popover" style="display: none;">
     <div class="theme-poptit">
          <a href="javascript:;" title="关闭" class="close">×</a>
          <h3>充值 只为更好学习</h3>
     </div>
     <div class="theme-popbod dform">
           <form class="theme-signin" action="${pageContext.request.contextPath }/uersServlet?action=addmoney" method="post" name="form1" >
           <input name="userid" type="hidden" value="${user.userid }"/>
           <input name="remainMoney" type="hidden" value="${user.remainMoney }"/> 
                <ol>
                     <li><h4>钱必须要有哦！</h4></li>
                     <li><strong>手机号：</strong><input class="ipt" type="text" name="moblie" value="${user.mobile }" size="20"></li>
                     <li><strong>密码：</strong><input class="ipt" type="password" name="password" size="20"></li>
                     <li><strong>金额：</strong><input class="ipt" type="text" name="addmoney" size="20"></li>
                     <li><input class="btn btn-primary" type="submit" name="submit" value=" 充 值 "></li>
                </ol>
           </form>
     </div>
</div>
<div class="theme-popover-mask" style="display: none;"></div>

  	<jsp:include page="/web/head.jsp" flush="true"></jsp:include>
  	<div id="main">
    	<div class="leftBox">
            <jsp:include page="/web/left.jsp" flush="true"></jsp:include>
      	</div>
        <div class="rightBox">
        	<p class="news_title"><a href="${pageContext.request.contextPath}/mainservlet?action=main">首页</a>&gt;管理中心</p>
            <div class="newsContent">
            	<div class="artibody">
        	        <ul>
        	        	<li>手机号码：${user.mobile}</li>
        	        	<li class="bt"><hr/></li>	
        	        	<li>用户名称：${user.usersName}</li>
        	        	<li class="bt"><hr/></li>	
        	        	<li>性别：
        	        		<c:if test="${user.sex==0}">男</c:if>
        	        		<c:if test="${user.sex==1}">女</c:if>
        	        	</li>
        	        	<li class="bt"><hr/></li>	
        	        	<li>家庭地址：${user.homeAddress}</li>
        	        	<li class="bt"><hr/></li>	
        	        	<li>邮箱地址：${user.email}</li>
        	        	<li class="bt"><hr/></li>	
        	        	<li>用户类型：
							<c:if test="${user.userType==1}">学生</c:if>
        	        		<c:if test="${user.userType==2}">老师</c:if>
						</li>
						<li class="bt"><hr/></li>
						<li>账户余额：${user.remainMoney}
						&nbsp;&nbsp;&nbsp;&nbsp;
						<a class="btn btn-primary btn-large theme-login" href="javascript:;">充值</a>
						</li>
						<li class="bt"><hr/></li>
						<li>
						<a href="<%=basePath%>uersServlet?action=up&userid=${user.userid}">	
						<input class="btn btn-primary" type="button" value="  修改资料  "></a>
					
						</li>
                    </ul>
               </div>
          </div>
    	</div>
    </div>
    <div class="clear"></div>
    <div class="mt12"></div>
  	<jsp:include page="/web/footer.jsp" flush="true"></jsp:include>
  	
  </body>
</html>
