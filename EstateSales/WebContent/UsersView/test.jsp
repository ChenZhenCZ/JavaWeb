<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String path= request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">	
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>用户注册页面</title>
	<link rel="stylesheet" href="<%=path %>/plugins/bootstrap/bootstrap.min.css"/>
    <script type="text/javascript" src="<%=path %>/bootstrap/vendor/jquery/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="<%=path %>/plugins/bootstrap/bootstrap.min.js"></script>
<<<<<<< .mine

	<link rel="stylesheet" href="<%=path %>/bootstrap/bootstrap-datetimepicker.min.css">  
||||||| .r271
    <script type="text/javascript" src="<%=path %>/plugins/js/bootstrap-table-zh-CN.js"></script>  
	<link rel="stylesheet" href="<%=path %>/bootstrap/bootstrap-datetimepicker.min.css">  
=======
  	<link rel="stylesheet" href="<%=path %>/bootstrap/bootstrap-datetimepicker.min.css">  
>>>>>>> .r278
	<script type="text/javascript"  src="<%=path %>/bootstrap/bootstrap-datetimepicker.min.js"></script>  
                               
</head>
<body >
<div class="form-group row">
    <div class="left col-xs-3 text-right">
        <label for="">*时间:</label>
    </div>
    <div class="right col-xs-6 text-left">
        <div class="input-group">
          <input type="text" class="form-control form_datetime" id="addtime" name="addtime"  placeholder="请选择时间" readonly="readonly">
          </div>
    </div>
</div>
<script>
  $('.form_datetime').datetimepicker({
	    minView: "month", //选择日期后，不会再跳转去选择时分秒 
	    locale:'en', //设置语言
	    format: 'yyyy-mm-dd',//设置时间格式
	    todayBtn:  1,
	    startDate: new Date(),
	   //endDate: '2017-12-30',	//开始时间  endDate 结束时间
	    autoclose: 1,//当选择一个日期之后是否立即关闭此日期时间选择器。
	});
</script>   
</body>
</html>