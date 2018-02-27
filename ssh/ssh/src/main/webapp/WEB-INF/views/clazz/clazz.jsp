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
			url:'<%=path %>/class/pager_criteria',
			method:'post'">
		<thead>
			<tr>
				<th data-options="field:'id',width:80,checkbox:true">编号</th>
				<th data-options="field:'title',width:100">名称</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb" style="height: auto">
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-add" onclick="openWin('addWin');">添加</a>
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-edit" onclick="openEditWin('editWin', 'list', 'editForm', 'clazz')">修改</a>
		<div>
			<form id="searchForm">
				<input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入班级名称',
						required:false,
						novalidate:true" name="clazz.title"/>
				<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearch('list', 'searchForm');">搜索</a>
			</form>
		</div>
	</div>
	
	<div id="addWin" class="easyui-window normal_win" data-options="title:'添加班级', closed:true">
		<form id="addForm">
			<table>
				<tr>
					<td>名称</td>
					<td>
						<input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入名称',
						required:true,
						validType:['length[2,20]'],
						novalidate:true" name="clazz.title"/>
					</td>
				</tr>
				<tr>
					<td><a class="easyui-linkbutton" onclick="save('/class/save', 'addForm', 'addWin', 'list');">确认</a></td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="editWin" class="easyui-window normal_win" data-options="title:'编辑班级', closed:true">
		<form id="editForm">
			<input type="hidden" name="clazz.id" />
			<table>
				<tr>
					<td>名称</td>
					<td>
						<input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入名称',
						required:true,
						validType:['length[2,20]'],
						novalidate:true" name="clazz.title"/>
					</td>
				</tr>
				<tr>
					<td><a class="easyui-linkbutton" onclick="edit('/class/update', 'editForm', 'editWin', 'list');">确认</a></td>
				</tr>
			</table>
		</form>
	</div>
	
</body>
<%@include file="../master/footer.jsp" %>

</html>