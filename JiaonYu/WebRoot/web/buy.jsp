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

 <script type="text/javascript">
 	function test(){
 		if(${user.remainMoney}<${course.price}){
 			z.innerHTML="余额不足,请充值!";
 			return false;
 		}else if(${user.remainMoney}>${course.price}){
 			return true;
 		}
 	}
 </script>
 <style>
*{ margin:0; padding:0;list-style: none;}
#outer {width:60%;margin:30px 15%;}
#tab {overflow:hidden;zoom:1;}
#tab li {float:left;color:red;height:30px;	cursor:pointer;	line-height:30px;padding:0 20px;}
#tab li.current {color:#000;background:#ccc;}
#content ul {line-height:25px;display:none;	margin:0 30px;padding:10px 0;}
</style>
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
 <div class="theme-popover-mask" style="display: none;"></div>
	<jsp:include page="/web/head.jsp" flush="true"></jsp:include>
<center> 
  	<table width="70%">
  		<tr>
  		<td rowspan="5" width="35%" height="40%"><img src="${course.pictureUrl}" width="300" height="250"></td>
  		<td></td><td></td>
  		</tr>
   		<tr><td width="8%"><b>课程名称:</td><td><b>${course.courseName}</td></tr>
   		<tr><td><b>课时数:</td><td><b>${course.courseCount}</td></tr>
   		<tr><td><b>价格:</td><td><b><font color="red">￥${course.price}</font></td></tr>
		<tr><td></td><td>
		<c:if test="${course.chargeType==0}">
		<a class="btn btn-primary btn-large theme-login" href="javascript:;"><font size="3">立 即 学 习</font></a>
		</c:if>
		<c:if test="${course.chargeType==1}">
		<a class="btn btn-primary btn-large theme-login" href="javascript:;"><font size="3">立 即 购 买</font></a>
		<a class="btn btn-primary btn-large theme-login" href="javascript:;"><font size="3">加入my课程</font></a>
		</c:if>
		</td>
		</tr>
		</table>
	</center>
	<div id="outer">
    <ul id="tab">
        <li class="current"><font  face="楷体" size="5">课程介绍</font></li>
        <li><font  face="楷体" size="5">课程目录</font></li>
        <li><font  face="楷体" size="5">讲师信息</font></li>
        <li><font  face="楷体" size="5">学生评价</font></li>
        <li><font  face="楷体" size="5">学生提问</font></li>
    </ul>
    <div id="content">
        <ul style="display:block;">
        <b>${course.introduce }
        </ul>
        <ul>
         <table width="90%">
    	<tr>
    	<th width="10%"><font  face="楷体">章节名称</font></th>
    	<th width="10%"><font  face="楷体">收费状态</font></th>
    	<th width="10%"><font  face="楷体">课时</font></th>
    	<th width="25%"><font  face="楷体">操作</font></th>
    	</tr>
    	<c:forEach items="${sectionList}" var="d">
    	<c:if test="${d.free==0}">
		<tr>
			<td align="center">${d.sectionName }</td>
			<td align="center">
			<font  face="楷体">
				<c:if test="${d.free==1}">收费</c:if>
				<c:if test="${d.free==0}">免费</c:if>
				</font>
			</td>
			<td align="center"><font  face="楷体">45分钟</font></td>
			<td align="center">
				<font  face="楷体"><a href="${pageContext.request.contextPath }/sectionServlet?action=video&sectionId=${d.sectionId}">试学</a></font>
			</td>
		</tr>
		</c:if>
		</c:forEach>
		</table>
        </ul>
        <ul>
           <a href="http://www.lanrenzhijia.com/js/css3">css3</a>
        </ul>
        <ul>
        			
        <form action="${pageContext.request.contextPath }/eval?action=add"  method="post">
        <input type="hidden" name="userid" value="${user.userid }"/>
			<input type="hidden" name="courseid" value="${course.courseId }"/>
			<input type="hidden" name="name" value="${user.usersName }"/>
        	<table width="80%">
        	<tr>
        		<th><font  face="楷体" size="3">评级</font></th>
        		<td>
        		 <font  face="楷体" color="red">
        		<input name="Fruit"  type="radio" value="0" />好评
        		<input name="Fruit"  type="radio" value="1" />中评
        		<input name="Fruit"  type="radio" value="2" />差评
        		</font>
        		</td>
        	</tr>
        	<tr>
        	<th><font  face="楷体" size="3">评价内容</font></th>
        	<td>
        	<textarea rows="6" cols="80" name="txet"></textarea>
        	</td>
        	</tr>
        	<tr align="center"><td colspan="3"><br/><input class="btn btn-primary" type="submit" value="  提  交  "></td></tr>
        	</table>
        </form>
        <br/>
        <table width="80%" class="btn btn-primary" align="left">
        <tr>
        
        <th> <font  face="楷体" size="3">评级</font></th>
        <th><font  face="楷体" size="3">评价内容</font></th>
        <th><font  face="楷体" size="3">评价人</font></th>
        <th><font  face="楷体" size="3">时间</font></th>
        
        </tr>
        <c:forEach items="${list}" var="d">
        <tr>
        <td align="center">
        <font  face="楷体" color="red">
        <c:if test="${d.evalLevel==0}">好评</c:if>
        <c:if test="${d.evalLevel==1}">中评</c:if>
        <c:if test="${d.evalLevel==2}">差评</c:if>
        </font>
        </td>
        <td align="center"><font  face="楷体">${d.evalContent}</font></td>
        <td align="center"><font  face="楷体">${d.username}</font></td>
        <td align="center"><font  face="楷体">${d.evalDate}</font></td>
        </tr>
       </c:forEach >
        </table>						
        </ul>
        <ul>
        <form action="${pageContext.request.contextPath }/forumServlet?action=add"  method="post">
          <input type="hidden" name="userid" value="${user.userid }"/>
			<input type="hidden" name="teacherId" value="${course.teacherId }"/>
			<input type="hidden" name="courseid" value="${course.courseId }"/>
        	<table >
        		<tr><td><textarea rows="6" cols="80" name="txet"></textarea></td></tr>
        		
        		<tr><tr align="center"><td colspan="2"><font  face="楷体"><br><input  class="btn btn-primary" type="submit" value="  提  问  "><font  face="楷体"></td></tr>
        	</table>
        </form>
        </ul>
    </div>
</div>
<!-- html代码end -->
<script src="./buy2/jquery.min.js"></script>
<script>
	$(function(){
		window.onload = function()
		{
			var $li = $('#tab li');
			var $ul = $('#content ul');
						
			$li.mouseover(function(){
				var $this = $(this);
				var $t = $this.index();
				$li.removeClass();
				$this.addClass('current');
				$ul.css('display','none');
				$ul.eq($t).css('display','block');
			})
		}
	});
</script>
<%if(session.getAttribute("user")==null){%>
<div class="theme-popover" style="display: none;">
  <div class="theme-poptit">
  <a href="javascript:;" title="关闭" class="close">×</a>
  <h3>登录 是一种态度</h3>
  </div>
  <div class="theme-popbod dform">
	<form class="theme-signin" name="loginform" action="${pageContext.request.contextPath }/uersServlet?action=login" method="post">
     <ol>
       <li><h4>你必须先登录！</h4></li>
       <li><strong>手机号：</strong><input class="ipt" type="text" name="mobile" size="20"></li>
       <li><strong>密码：</strong><input class="ipt" type="password" name="password" size="20"></li>
       <li>
       <div class="theme-poptit">
       <input class="btn btn-primary" type="submit" name="submit" value=" 登 录 ">
       <a href="javascript:;" title="关闭" class="close">退出</a>
       </div>
       </li>		
     </ol>
	</form>
  </div>
</div>
<%}else{%>
<div class="theme-popover" style="display: none;">
  <div class="theme-poptit">
  <a href="javascript:;" title="关闭" class="close">×</a>
  <h3>生成订单</h3>
  </div>
  <div class="theme-popbod dform">
	<form class="theme-signin" name="loginform" action="<%=basePath%>payRecordServlet?action=addSave" method="post" onsubmit="return test();">
     <ol>
	<input type="hidden" name="userid" value="${user.userid }"/>
	<input type="hidden" name="courseid" value="${course.courseId }"/>
	<input type="hidden" name="remainMoney" value="${user.remainMoney}"/>
		课程名称:${course.courseName}
	<br/>付款方式:余额支付
	<br/>付款人:<input type="hidden" name="payer" value="${user.usersName}">${user.usersName}
	<br/>订单号:<input type="hidden" name="orderNumber" value="91441">
	<br/>缴费状态:正在付款...
	<br/>优惠券金额:<input type="hidden" name="discountMoney" value="1">
	<br/>价格:<input type="hidden" name="payMoney" value="${course.price}"><b><font color="red">￥${course.price}</font>
    <br/><font id="z" color="red"></font><br/>
       <div class="theme-poptit">
       <input class="btn btn-primary" type="submit" name="submit" value="生 成 订 单">
       <a href="javascript:;" title="关闭" class="close">退出支付</a>
        </div>		
     </ol>
	</form>
  </div>
</div>
<%} %>
<div class="theme-popover-mask" style="display: none;"></div>
<div class="clear"></div>
    <div class="mt12"></div>
  	<jsp:include page="/web/footer.jsp" flush="true"></jsp:include>
</body>
</html>