<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="bean.ProVo"%>
<%@page import="bean.CityVo"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'cityup.jsp' starting page</title>
    
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
    
   <h1 align="center">修改页面</h1>
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

  <body>
  <h1 align="center">修改城市资料</h1>
  <hr/>
  <%
  	CityVo city=(CityVo)request.getAttribute("city");
   %>
  <form name="from1" action="<%=basePath%>cityservler?cation=updateSave" method="post" onsubmit="return ckck()">
  <table border=“1” cellpadding="1" cellspacing="1" align="center">
  		 <input type="hidden" name="cityid" value="<%=city.getCityid() %>">
  	<tr>
  	<th>
  		省份名称:
  	</th>
  	<th>
  	
  	<select name="Provinceid" style="width:180px">
  	<%
  		List<ProVo> prpvoList=(List<ProVo>)request.getAttribute("provoList");
  		if(prpvoList!=null){
  		for(int i=0;i<prpvoList.size();i++){
  			ProVo p=prpvoList.get(i);
  		if(p.getProvinceid()==city.getProvinceid()){
  	 %>
  		<option  value="<%=p.getProvinceid() %>" selected="selected"><%=p.getProvincename() %></option>
  		<%
  		
  	}else{ %>
  		<option  value="<%=p.getProvinceid() %>" ><%=p.getProvincename() %></option>
  		
  	<% }
  	}
  	}
  	%>
  	</select>
  	</th>
  	</tr>
 	<tr>
 	<th>城市名称:</th>
 	<td style="width:180px"><input type="text" name="cityname" value="<%=city.getCityname() %> "></td></tr>
 	<tr>
 	<td colspan="2" align="center"><input type="submit" value="修改" ></td>
 	</tr>
  </table>
  </form>
  </body>
</html>
