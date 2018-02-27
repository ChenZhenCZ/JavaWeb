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
			url:'<%=path %>/teacher/pager_criteria',
			method:'post'">
		<thead>
			<tr>
				<th data-options="field:'id',width:80,checkbox:true">编号</th>
				<th data-options="field:'realName',width:100">姓名</th>
				<th data-options="field:'phone',width:100">手机号</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb" style="height: auto">
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-add" onclick="openWin('addWin');">添加</a>
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-edit" onclick="openEditWin('editWin', 'list', 'editForm', 'teacher')">修改</a>
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-edit" onclick="openClazzWin();">分配班级</a>
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-edit" onclick="openClazzInfoWin();">查看班级</a>
		<div>
			<form id="searchForm">
				<input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入教师姓名',
						required:false,
						novalidate:true" name="teacher.realName"/>
				<input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入手机号',
						required:false,
						novalidate:true" name="teacher.phone"/>
				<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearch('list', 'searchForm');">搜索</a>
			</form>
		</div>
	</div>
	
	<div id="addWin" class="easyui-window normal_win" data-options="title:'添加教师', closed:true">
		<form id="addForm">
			<table>
				<tr>
					<td>姓名</td>
					<td>
						<input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入姓名',
						required:true,
						validType:['length[2,20]'],
						novalidate:true" name="teacher.realName"/>
					</td>
				</tr>
				<tr>
					<td>手机号</td>
					<td>
						<input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入手机号',
						required:true,
						validType:['length[11,11]'],
						novalidate:true" name="teacher.phone"/>
					</td>
				</tr>
				<tr>
					<td><a class="easyui-linkbutton" onclick="save('/teacher/save', 'addForm', 'addWin', 'list');">确认</a></td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="editWin" class="easyui-window normal_win" data-options="title:'编辑教师', closed:true">
		<form id="editForm">
			<input type="hidden" name="teacher.id" />
			<table>
				<tr>
					<td>姓名</td>
					<td>
						<input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入姓名',
						required:true,
						validType:['length[2,20]'],
						novalidate:true" name="teacher.realName"/>
					</td>
				</tr>
				<tr>
					<td>手机号</td>
					<td>
						<input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入手机号',
						required:true,
						validType:['length[11,11]'],
						novalidate:true" name="teacher.phone"/>
					</td>
				</tr>
				<tr>
					<td><a class="easyui-linkbutton" onclick="edit('/teacher/update', 'editForm', 'editWin', 'list');">确认</a></td>
				</tr>
			</table>
		</form>
	</div>

	<div id="clazzWin" class="easyui-window large_win" data-options="title:'选择班级', closed:true">
		<table id="clazzList" class="easyui-datagrid"
			   data-options="
				toolbar:'#clazzTb',
				rownumbers:true,
				border:false,
				singleSelect:false,
				pagination:true,
				pageSize:10">
			<thead>
			<tr>
				<th data-options="field:'id',width:80,checkbox:true">编号</th>
				<th data-options="field:'title',width:100">名称</th>
			</tr>
			</thead>
		</table>

		<div id="clazzTb" style="height: auto">
			<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-add" onclick="confirmClazz();">确认</a>
			<div>
				<form id="clazzSearchForm">
					<input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入班级名称',
							required:false,
							novalidate:true" name="clazz.title"/>
					<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearch('clazzList', 'clazzSearchForm');">搜索</a>
				</form>
			</div>
		</div>
	</div>

	<div id="clazzInfoWin" class="easyui-window normal_win" data-options="title:'班级信息', closed:true">
		<table id="clazzInfoList" class="easyui-datagrid"
			   data-options="
				rownumbers:true,
				border:false,
				singleSelect:false,
				pagination:false,
				pageSize:10">
			<thead>
			<tr>
				<th data-options="field:'id',width:80,checkbox:true">编号</th>
				<th data-options="field:'title',width:100">名称</th>
			</tr>
			</thead>
		</table>
	</div>
</body>
<%@include file="../master/footer.jsp" %>

<script>

	function openClazzWin() {
	    var row = $("#list").datagrid("getSelected");
	    if (row) {
            openWin("clazzWin");
            var options = pagerOptions("clazzList");
            $("#clazzList").datagrid(
                {
                    url: contextPath + '/class/pager_criteria',
                    method: 'post',
                    pageSize: options.pageSize
                }
            );
        } else {
	        showInfoAlert("请选择需要分配班级的教师")
		}
	}

	function confirmClazz() {
	    var row = $("#list").datagrid("getSelected");
	    var rows = $("#clazzList").datagrid("getSelections");
	    if (rows !== null && rows.length > 0) {
	        var classIds = "";
	        for (var i = 0, len = rows.length; i < len; i++) {
	            if (classIds === "") {
	                classIds = rows[i].id;
				} else {
                    classIds = classIds + "," + rows[i].id
				}
			}
	        $.post(contextPath + "/teacher/save_class",
				{
				    'teacherId':row.id,
					'classIds':classIds
				},
				function (data) {
	            	if (data.result === "success") {
	            	    closeWin("clazzWin");
					} else {
	            	    showInfoAlert(data.message);
					}
				},
				'json'
			);
		} else {
	        showInfoAlert("请选择班级");
		}
	}

	function openClazzInfoWin() {
	    var row = $("#list").datagrid("getSelected");
	    if (row) {
	        openWin("clazzInfoWin");
            $("#clazzInfoList").datagrid(
                {
                    url: contextPath + '/teacher/class',
                    method: 'post',
					pageSize:100,
					pageNumber:1,
					queryParams:{
                        teacherId:row.id
					}
                }
            );
		} else {
	        showInfoAlert("请选择需要查看班级的教师")
		}
	}
</script>

</html>