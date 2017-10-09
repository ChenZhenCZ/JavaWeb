<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path= request.getContextPath();
%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>消息推送</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="author" content="Muhammad Usman">
	<%@include file="./jsAndCss.jsp" %>
    <!-- jQuery -->
    <link href="<%=path%>/toastr/toastr.min.css" rel="stylesheet"/> 
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=x67gHfVD1WUEc85lSreVfFIaWajsQSZG"></script>
</head>
<body >
	<div class="container">
    <!-- topbar starts -->
    <%@ include file="./topbar.jsp" %>
    <!-- topbar ends -->
		<div class="ch-container">
			</div>
			<!-- left menu starts -->
			<%@ include file="./leftMenu.jsp" %>
			<!--/span-->
			<!-- left menu ends -->


		<div id="content" class="col-lg-10 col-sm-10">
			<div>
				<ul class="breadcrumb">
					<li><a href="<%=path%>/admin/index">首页</a></li>
					<li><a href="javacsript:void(0);">消息推送</a></li>
				</ul>
			</div>
			<!-- content starts -->
				<!-- <input type="text" name="msg" id="msg"> -->
				<textarea rows="3" cols="80" name="msg" id="msg" placeholder="请输入推送消息"></textarea>
				<br/><br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				 <button id="send" class="btn btn-success" style="width:120px;height:40px">推送</button>
			<!--/row-->
		</div>

	</div>
		<!--/.fluid-container-->
</div>
<!-- external javascript -->
<script src="<%=path %>/toastr/toastr.min.js"></script>
<script src="<%=path %>/js/toastrOption.js"></script>
<script src="<%=path %>/js/formFill.js"></script>
<script>
	$("#send").click(function(){
		msg=$("#msg").val()
		if(msg==null){
			toastr.error("请输入要推送的信息！");
			return
		}else{
			$.post("/EstateSales/admin/sendMsg",
					{"msg":msg},
					function(data){
						toastr.success('消息推送成功！');
					},"json");
		}
	})
</script>
</body>
</html>