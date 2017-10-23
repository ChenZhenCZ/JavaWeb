<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'xname.jsp' starting page</title>
    
	  <script type="text/javascript">
   		function ckck(){
   		if(from1.provincename.value==""){
   			alert("请输入省份名称！");
   			from1.provincename.focus();
   			return false ;
   		}
   		return true;
   		}
   </script>
  </head>
  <% 
  	//乱码处理
	request.setCharacterEncoding("utf-8");
	//获取提交的数据
	String provinceid = request.getParameter("provinceid").trim();

	String driver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
  	String url="jdbc:sqlserver://localhost\\SQL2005:1433;databasename=textname";
  	String username="sa";
  	String password="123456";
	//1.调入驱动；
	Class.forName(driver);
	//2.连接数据库
	Connection conn = DriverManager.getConnection(url,username,password);
	//out.println("连接数据库成功.");
	//3.创建Statement对象
	Statement stmt = conn.createStatement();
	//4.执行SQL语句
	String sql = "select * from province where provinceid="+provinceid;
	String provincename = "";
	ResultSet rs = stmt.executeQuery(sql);
	if(rs.next()){
		provincename = rs.getString("provincename");
	}
	rs.close();
	stmt.close();
	conn.close();
	%>
  <body>
  <h1 align="center">新增省份资料</h1>
  <hr/>
  <form name="from1" action="T7/xname1.jsp" method="post" onsubmit="return ckck()">
  <table border="1" cellpadding="1" cellspacing="1" align="center">
  	<input type="hidden" name="provinceid" value="<%=provinceid%>">
  	<tr>
  	<td align="right">
  		省份名称:
  	</td>
  	<td>
  	<input type="text" name="provincename" value=<%=provincename %>>
  	</td>
  	<td>
  	<input type="submit" value="修改" >
  	</td>
  	</tr>
 
  </table>
  </form>
  </body>
</html>
