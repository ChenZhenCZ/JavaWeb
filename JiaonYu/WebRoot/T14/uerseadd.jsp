u <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户管理</title>
   <script type="text/javascript">
    	function check(){
    		if(form1.mobile.value==""){
    			alert("请输入手机号码。");
    			form1.mobile.focus();
    			return false;
    		}
    		if(form1.password.value==""){
    			alert("请输入登录密码。");
    			form1.password.focus();
    			return false;
    		}
    		if(form1.password.value!=form1.cfgpwd.value){
    			alert("登录密码余确认密码不一致。");
    			form1.cfgpwd.focus();
    			return false;
    		}
    		return true;
    	}
    	function changeProv(provinceid){
    		location.href="<%=basePath%>uersServlet?action=init&provinceId="+provinceid;
    	}
    </script>

  </head>
  
  <body>
    <h1 align="center">用户管理</h1>
    <hr/>
    <c:if test="${msg !=null}">
    <h1 align="center"><Font color="red">${msg }</Font></h1>
    </c:if>	
     <form name="form1" action="<%=basePath%>uersServlet?action=add" method="post" onsubmit="return check();">
    	<table align="center" border="1" cellpadding="1" cellspacing="1" width="500">
		<tr height="40">
			<td align="right">省份名称：</td>
			<td>
				<select name="provinceId" style="width:150px" onchange="changeProv(this.value);">
					<c:forEach items="${proList}" var="d">
						<c:if test="${d.provinceid == provinceid}">
							<option value="${d.provinceid}" selected="selected">${d.provincename}</option>
						</c:if>
						<c:if test="${d.provinceid != provinceid}">
							<option value="${d.provinceid}">${d.provincename}</option>
						</c:if>
					</c:forEach>
				</select>
			</td>
			<td>&nbsp;</td>
		</tr>
		<tr height="40">
			<td align="right">城市名称：</td>
			<td>
				<select name="cityId" style="width:150px">
					<c:forEach items="${cityList}" var="d">
						<option value="${d.cityid}">${d.cityname}</option>
					</c:forEach>
				</select>
			</td>
			<td>&nbsp;</td>
		</tr>
		<tr height="40">
			<td align="right">手机号码：</td>
			<td>
				<input type="text" name="mobile" style="width:155px"/>
			</td>
			<td><font size="2" color="red">*必填</font></td>
		</tr>
		<tr>
			<td align="right">登录密码</td>
			<td><input type="password" name="password"  style="width:155px"></td>
			<td><font size="2" color="red">*必填</font></td>
		</tr>
		<tr>
			<td align="right">确认密码</td>
			<td><input type="password" name="cfgpwd"  style="width:155px"></td>
			<td><font size="2" color="red">*必填</font></td>
		</tr>
		<tr>
			<td align="right">真实姓名</td>
			<td><input type="text" name="userName"  style="width:155px"></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td align="right">性别</td>
			<td>
			<input type="radio" name="sex" value="0" checked="checked">男
			<input type="radio" name="sex" value="1">女
			</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td align="right">家庭地址</td>
			<td><input type="text" name="homeAddress"  style="width:155px"></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td align="right">电子邮件</td>
			<td><input type="text" name="email"  style="width:155px"></td>
			<td>&nbsp;</td>
		</tr>
		<tr height="40">
			<td colspan="3" align="center"><input type="submit" value=" 保 存 "></td>
		</tr>
	</table>
    </form>
  </body>
</html>
