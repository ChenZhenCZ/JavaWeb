<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML> 
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'video7.jsp' starting page</title>
  </head>
  <body>
  <h1>视频播放测试</h1>
  <hr/>
  <!-- 
	<OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://active.macromedia.com/flash2/cabs/swflash.cab#version=4,0,0,0" WIDTH="800" height="500">
		<PARAM NAME=movie VALUE="<%=basePath %>attached/section/T71.swf">
		<PARAM NAME=quality VALUE=high>
		<PARAM NAME="WMODE" VALUE="window">
		<EMBED src="<%=basePath %>attached/section/T71.swf" loop=false menu=false quality=high WIDTH="100%" height="500" TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash">
		</EMBED>
	</OBJECT>  
	<video src="<%=basePath %>attached/section/java01.mp4" controls="controls">  
		你的游览器不支持该播放器
	</video> 
-->
	<embed src="<%=basePath %>attdate/section/17021524428539.mp4" width="800" height="400"></embed>
  </body>
</html>
