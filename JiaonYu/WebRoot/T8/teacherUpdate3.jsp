<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>审核不通过</title>
    <script type="text/javascript">
    	function test(){
    		if(form1.reason.value==""){
    			a.innerHTML="请输入理由！";
    			return false;
    		}else{
    			return true;
    		}
    	} 
    </script>
  </head>
  <body>
  <table>
  <tr>
  <td>
  	<img src='<%=basePath%>upload/${d.headPictureUrl }'/>
  </td>
  <td>
	教学特长:${d.teacherSpecial }<br/>
	教学年龄:${d.teacherLength }<br/>
	真实学历:${d.education }<br/>
	讲师等级:${d.gradeId }
	</td>
	<td>
	银行账户:${d.accountNo }<br/>
	预留姓名:${d.accountName }<br/>
	备注内容:${d.reason }
	</td>
	教师简介:${d.teacherIntroduce }<br/>
  <form name="form1" action="<%=basePath%>teacherServlet?action=update3Save" method="post" onsubmit="return test();">
  	<input type="hidden" name="teacherId" value="${teacherId }"/><br/>
  	<input type="hidden" name="status" value="${status }">
    <input type="text" name="reason"/><br/>
  	<input type="submit" value="确定"/><br/>
  </form>
  <font id="a" color="red"></font>
  </body>
</html>
