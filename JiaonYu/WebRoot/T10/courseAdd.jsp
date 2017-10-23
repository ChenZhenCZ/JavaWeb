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
    <title>发布课程</title>
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
  	 <script type="text/javascript">
		function check(){
			if(form1.courseName.value=="")
			{
				alert("请输入课程名称");
				form1.courseName.focus();
				return false;
			}
			if(form1.oneWord.value=="")
			{
				alert("请输入一句话");
				form1.oneWord.focus();
				return false;
			}
			return true;
		}
	</script>
	<jsp:include page="/web/head.jsp" flush="true"></jsp:include>
  	<div id="main">
    	<div class="leftBox">
            <jsp:include page="/web/left.jsp" flush="true"></jsp:include>
      	</div>
    <div class="rightBox">
    <p class="news_title"><a href="${pageContext.request.contextPath}/mainservlet?action=main">首页</a>&gt;我的课程</p>
            <div class="newsContent">
            	<div class="artibody">
    <form name="form1" action="${pageContext.request.contextPath }/courseServlet?action=add" id="newsform" method="post" enctype="multipart/form-data" onsubmit="return check();">
			<input type="hidden" name="courseId"  value="<%=userid %>">
				 <table cellpadding="0" cellspacing="0" width="800" style="margin: 0 auto">
	 				<tr height="30">
	 					<th align="right" width="90">课程名称</th>
	 					<td><input type="text" name=courseName   style="width:20%"/></td>
	 				</tr>
	 				<tr height="30">
	 					<th align="right">一句话</th>
	 					<td><input type="text" name="oneWord"   style="width:80%"/></td>
	 				</tr>
	 				<tr height="30">
	 					<th align="right">图片网址</th>
	 					<td><input type="file"  name="file1"/></td>
	 				</tr>
	 				<tr height="30">
	 					<th align="right">发布人</th>
	 					<td><input type="text" name="replayUsername"   style="width:30%"/></td>
	 				</tr><tr height="30">
	 					<th align="right">课时数</th>
	 					<td><input type="text" name="courseCount"   style="width:30%"/></td>
	 				</tr>
	 				</tr><tr height="30">
	 					<th align="right">价格</th>
	 					<td><input type="text" name="price"   style="width:30%"/></td>
	 				</tr>
	 				</tr><tr height="30">
	 					<th align="right">折扣</th>
	 					<td><input type="text" name="discount"   style="width:30%"/></td>
	 				</tr>
	 				<tr height="30">
	 					<th align="right">收费类型</th>
	 					<td>
	 						<select name="chargeType"  style="width:155px">
								<option value="0" selected="selected">0-免费</option>
								<option value="1">1-会员</option>
							</select>
	 					</td>
	 				</tr>
	 				<tr><td valign="top"><br></td><td valign="top"><br></td></tr><tr>
	 					<th align="right">课程介绍</th>
	 					<td>
	 					  <textarea name="introduce"    style="width:100%;height:80px;"> </textarea>
	 					</td>

	 				</tr>
	 				<tr height="30">
	 					<th align="right">排序</th>
	 					<td><input type="text" name="seq"   style="width:155px"/><font size="2" color="red">大号排前</font></td>
	 				</tr>
	 				<tr height="30">
	 					<th align="right">状态</th>
	 					<td>
						<select name="effective"  style="width:155px">
							<option value="1" selected="selected">1-有效</option>
							<option value="0">0-无效</option>
						</select>
						</td>
	 				</tr>
	 				<tr height="30">
	 					<td>
	 						<input type="hidden" name="status" value="0"/>
	 					</td>
	 				</tr>
	 				<tr>
	 				<td><input type="hidden" name="reason" value=" "/></td>
	 				</tr>
	 				<tr>
	 					<td></td>
	 					<th align="center"><input type="submit" value="  发  布  " name="isEmpty"></th>
	 				</tr>
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
