<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
    String path = request.getContextPath();
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
	<%@include file="../master/header.jsp" %>
</head>
<body>
	<table id="list" class="easyui-datagrid"
		data-options="
			toolbar:'#tb',
			rownumbers:true,
			border:false,
			singleSelect:true,
			pagination:true,
			pageSize:10,
			url:'<%=path %>/login_log/pager_criteria',
			method:'post'">
		<thead>
			<tr>
				<th data-options="field:'id',width:80,checkbox:true">编号</th>
				<th data-options="field:'phone',width:100">用户名</th>
				<th data-options="field:'loginTime',width:150,formatter:formatDate">登录时间</th>
				<th data-options="field:'loginIp',width:100">登录IP</th>
				<th data-options="field:'isOnline',width:100,formatter:formatLoginStatus">登录状态</th>
				<th data-options="field:'logoutTime',width:150,formatter:formatDate">退出时间</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb" style="height: auto">
		<div>
			<form id="searchForm">
				<input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入用户名',
						required:false,
						novalidate:true" name="phone"/>
				<input class="easyui-datetimebox easyui-validatebox" data-options="prompt:'请输入最大登录时间',
						required:false,
						novalidate:true" name="loginTime"/>
				<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearch('list', 'searchForm');">搜索</a>
				<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearchAll('list', 'searchForm');">搜索所有</a>
			</form>
		</div>
	</div>
</body>
<%@include file="../master/footer.jsp" %>

<script>
	$(function() {

        setPagination("list");

    });

	function formatLoginStatus(value, row, index) {
		return value === 0 ? "离线" : "在线";
    }
</script>

</html>