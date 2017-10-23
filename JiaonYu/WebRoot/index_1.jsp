<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
  <%
  	/*
  		include指令：
  			1.包含的文件类型：jsp,html,文本，java程序段。
  			2.把包含的内容原样拷贝到指令所在的地方；
			3.file属性的值不能是变量URL，后不能加任何参数。
			4.所指的路径必须是相对于此JSP的网页的路径。
			5.文件中要避免有<html></html><body></body>
		jsp:include动作元素
			1.元素允许你包含动态和静态文件。
			2.指令能自行判断被包含的文件是动态还是静态文件。
			3.若是静态文件，内容直接加到JSP网页中
			4.若是动态文件，被包含的文件也会被JSP引擎编译执行。
			5.page的值是一个URL（页面名称）
			6.可以传参数
				<jsp:param name="变量名称" value="变量的值"/>
			7.flush=(true|false)属性：如果所包含的页面内容发送变化时，自动更新到当前页面
				flush="false"默认值，不会自动刷新
				flush="true"自动刷新
			

  	*/
  
   %>
  	<!-- @ include file="T3/head.html" % -->
  	<jsp:include page="T3/head.jsp" flush="true">
  		<jsp:param name="username" value="admin"></jsp:param>
  		<jsp:param name="password" value="1234"/>
  	</jsp:include>
  	  <h1>页面变量的值如下：</h1>
     pageContext=<%=pageContext.getAttribute("pageContext") %><br/>
     request=<%=request.getAttribute("request") %><br/>
     session=<%=session.getAttribute("session") %><br/>
     application=<%=application.getAttribute("application") %><br/>
  	
    <h1>九九乘法表</h1>
    <hr>
    <%
    	int i,j;
    	for(i=1;i<=9;i++){
    		for(j=1;j<=i;j++){
    			out.print(i+"*"+j+"="+(i*j) +"&nbsp;&nbsp;&nbsp;&nbsp;");
    		}
    		out.println("<br/>");
    	}
    
     %>
    
  </body>
</html>
