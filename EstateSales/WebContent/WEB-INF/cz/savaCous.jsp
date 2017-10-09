<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String path=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 	<!-- 声明当前网页使用自适应功能 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 使用viewport技术检测当前屏幕的大小，把网页的大小设置成屏幕的大小 width=device-width，把网页的绽放比例设置成未绽放-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
     <title>添加客户</title>
<!--css样式-->
<link href="<%=path %>/plugins/bootstrap/bootstrap.min.css" rel="stylesheet">
<link href="<%=path %>/plugins/css/bootstrap-table.css" rel="stylesheet">
<link href="<%=path %>/plugins/css/examples.css" rel="stylesheet">
</head>
<body>
	 <div class="container">
	 		<h1 align="center">添加客户</h1>
	 		 <p></p>
	 		<form class="form-inline" align="center" id="cousfrom" action="<%=path %>/cous/savacou" method="post">
	 		<div>
	 		<input type="hidden" name="emp.id" value="${emp.id}">
			  <div class="form-group">
			     <label>客户名称</label>
			    <input type="text" name="con.name" class="form-control" style="width: 250px">
			  </div>
			 </div>
			  <p></p>
			  <div>
			   <div  class="form-group">
			    <label>客户性别</label>
			  	<select class="form-control" name="con.gender" style="width: 250px">
					  <option value="男">男</option>
					  <option value="女">女</option>
				</select>
			  </div>
			 </div>
			 <p></p>
			  <div>
			   <div  class="form-group">
			     <label>生日日期</label>
			    <input type="date" name="con.birthday" class="form-control" style="width: 250px" >
			  </div>
			 </div>
			  <p></p>
			   <div>
			   <div  class="form-group">
			     <label>客户邮箱</label>
			    <input type="email" name="con.email" class="form-control"  style="width: 250px" >
			  </div>
			 </div>
			  <p></p>
			   <div>
			   <div  class="form-group">
			    <label>身份证号</label>
			    <input type="text" name="con.identity_id" onkeyup="value=value.replace(/[^\d]/g,'')" class="form-control"  style="width: 250px" >
			  </div>
			 </div>
			  <p></p>
			 <div>
			   <div  class="form-group">
			     <label>手机号码</label>
			    <input type="text" name="con.phone" class="form-control"  style="width: 250px">
			  </div>
			 </div>
			  <p></p>
			  <div>
			   <div  class="form-group">
			    <label>联系地址</label>
			    <input type="text" name="con.address" class="form-control"  style="width: 250px">
			  </div>
			 </div>
			  <p></p>
			 <div>
			   <div  class="form-group">
			     <label>同购房人</label>
			    <input type="text" name="con.together" class="form-control"  style="width: 250px" >
			  </div>
			 </div>
			  <p></p>
			 <div>
			   <div  class="form-group">
			     <label>客户类型</label>
			  	<select class="form-control" name="con.customer_type" style="width: 250px">
					  <option value="0">预约客户</option>
					  <option value="1">预定客户</option>
					  <option value="2">购房客户</option>
				</select>
			  </div>
			 </div>
			 <p></p>
			 <div align="center" class="form-group">
			   <button type="submit" class="btn btn-success" style="width: 100px">添  加</button>
			  </div>
			</form>
		
    </div>

</body>
<!-- js样式-->
<script src="<%=path %>/easyui/jquery.min.js"></script>
<script src="<%=path %>/plugins/bootstrap/bootstrap.min.js"></script>
<script src="<%=path %>/plugins/js/bootstrap-table.js"></script>
<script src="<%=path %>/plugins/js/bootstrap-table-zh-CN.js"></script>
<script src="<%=path %>/js/ag.js"></script>
<script src="<%=path %>/js/cous.js"></script>
<script type="text/javascript" src="<%=path %>/bootstrap/dist/js/bootstrapValidator.js"></script>
 <link rel="stylesheet" href="<%=path %>/bootstrap/dist/css/bootstrapValidator.css"/>
</html>