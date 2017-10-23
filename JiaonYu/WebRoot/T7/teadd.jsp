<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'teadd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <hr/>
    <script type="text/javascript">
   		function ckck(){
   		if(from1.provincename.value==""){
   			alert("请输入城市名称！");
   			from1.provincename.focus();
   			return false ;
   		}
   		return true;
   		}
   </script>
   <h1 align="center">新增省份资料</h1>
  <hr/>
  <form name="from1" action="<%=basePath%>teacherGradeservler?cation=add" method="post" onsubmit="return ckck()">
  <table border=“1” cellpadding="1" cellspacing="1" align="center">
  	<tr>
 	<th>讲师等级:</th>
 		<td>
 		<select name="gradename" style="width:180px">
  		<option  value="认证讲师">认证讲师</option>
  		<option  value="中级讲师">中级讲师</option>
  		<option  value="高级讲师">高级讲师</option>
  		<option  value="特级讲师">特级讲师</option>
  		<option  value="金牌讲师">金牌讲师</option>
  		</select>
 		</td>
 	</tr>
	<tr>
  	<th>
  		分成比例:
  	</th>
  	<th>
  	<select name="gradePercent" style="width:180px">
  	<option  value="0.5">0.5</option>
  	<option  value="0.6">0.6</option>
  	<option  value="0.7">0.7</option>
  	<option  value="0.8">0.8</option>
  	<option  value="0.9">0.9</option>
  	</select>
  	</th>
  	</tr>
 	<tr>
 	<td colspan="2" align="center"><input type="submit" value="新增" ></td>
 	</tr>
  </table>
  </form>
  </body>
</html>
