<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>省份资料</title>
    
	
  </head>
  
  <body>
  <h1 align="center">省份资料</h1>
  <hr/>
  <table align="center">
  	<tr><td align="right"><a href="T7/zheng.jsp">新增</a></td></tr>
  </table>
  <table align="center" border="1" cellpadding="1" cellspacing="1" width="500">
  	<thead>
  		<th align="center">省份编号</th>
  		<th align="center">省份名称</th>
  		<th align="center">操作</th>
  	</thead>
  <%
  	String driver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
  	String url="jdbc:sqlserver://localhost\\SQL2005:1433;databasename=textname";
  	String username="sa";
  	String password="123456";
  	
  	//1,调入驱动
  	Class.forName(driver);
  	//2,连接数据库
  	Connection conn =DriverManager.getConnection(url,username,password);
  	//out.println("数据库连接成功！");
  	Statement stmt=conn.createStatement();
  	//执行语句
  	String sql="select * from province";
  	ResultSet rs=stmt.executeQuery(sql);
  	//数据处理
  	int provinceid=0;
  	String provincename="";
  	while(rs.next()){
  		provinceid=rs.getInt(1);
  		provincename=rs.getString(2);
  		%>
  		<tr>
  		<td align="center"><%=provinceid %></td>
  		<td align="center"><%=provincename %></td>
  		<td align="center">
  		<a href="T7/xname.jsp?provinceid=<%=provinceid %>" >修改</a>
  		<a href="T7/san.jsp?provinceid=<%=provinceid %>" >删除</a>
  		</td>
  		 </tr>
  		<% 
  	}
  	//关闭
  	rs.close();
  	stmt.close();
  	conn.close();
   %>
   </table>
  </body>
</html>
