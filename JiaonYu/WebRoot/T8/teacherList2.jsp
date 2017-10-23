<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>教师资料</title>
    <script type="text/javascript">
    	function test(){
    		if(form1.reason.value==""){
    			alert("请输入理由");
    			a.innerHTML="请输入理由！"
    			return false;
    		}
    		return true;
    	}
    </script>
  </head>
  
  <body>
  <table width="100%">
  <tr>
    <c:forEach items="${teacherList}" var="d">
    <td width="25%" height="50%" bgcolor="#5CACEE">
    		<img src='<%=basePath%>upload/${d.headPictureUrl }'/>
			<br/>
			教师简介:${d.teacherIntroduce }<br/>
			教学特长:${d.teacherSpecial }<br/>
			教学年龄:${d.teacherLength }<br/>
			真实学历:${d.education }<br/>
			审核状态:<c:if test="${d.status==0}">
			未审核
			</c:if>
			<c:if test="${d.status==1}">
			审核通过
			</c:if>
			<c:if test="${d.status==2}">
			审核未通过
			</c:if>
			<c:if test="${d.status==3}">
			封号
			</c:if><br/>
			银行账户:${d.accountNo }<br/>
			预留姓名:${d.accountName }<br/>
			${d.gradeId }<br/>
			备注内容:${d.reason }<br/>
			<a href="<%=basePath%>teacherServlet?action=update3Save&teacherId=${d.teacherId }&status=1&reason=">审核通过</a>
			<a href="<%=basePath%>teacherServlet?action=update3&teacherId=${d.teacherId }&status=2">审核不通过</a>
			<br/>
			<a href="<%=basePath%>teacherServlet?action=update3Save&teacherId=${d.teacherId }&status=1&reason=">启用</a>
			<a href="<%=basePath%>teacherServlet?action=update3&teacherId=${d.teacherId }&status=3">封号</a>
		</td>
	</c:forEach>
	</tr>
	</table>
		总记录数:${p.recordCount}
		页码:${p.currentPage}/${p.pageCount}
		<a href="<%=basePath%>teacherServlet?action=list&currentPage=1&opr=first">首页</a>
		<a href="<%=basePath%>teacherServlet?action=list&currentPage=${p.currentPage}&opr=piror">上一页</a>
		<a href="<%=basePath%>teacherServlet?action=list&currentPage=${p.currentPage}&opr=next">下一页</a>
		<a href="<%=basePath%>teacherServlet?action=list&currentPage=${p.pageCount}&opr=last">末页</a>
		<a href="<%=basePath%>/T8/teacherAdd.jsp">新增</a>
  </body>
</html>
