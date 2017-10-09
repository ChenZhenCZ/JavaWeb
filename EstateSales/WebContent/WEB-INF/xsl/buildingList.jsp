<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path= request.getContextPath();
%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>楼栋管理</title>
 	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="author" content="Muhammad Usman">
    
   	<%@include file="./JsAndCss.jsp" %>
    
    <!-- jQuery消息提示框 -->
	<link rel="stylesheet" href="<%=path%>/toastr/toastr.min.css">
    
    <link href="<%=path%>/plugins/bootstrap/bootstrap.min.css" rel="stylesheet">
	<link href="<%=path%>/bootstrap/bootstrap-table.css" rel="stylesheet"/> 
    
</head>
<body>
	<!-- 更换经销商logo -->
	<%@ include file="./changeAgencyLogo.jsp" %>
	<!-- 修改模态框开始-->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">活动修改</h4>
	      </div>
	      <div class="modal-body">
	       	<form  id="activityUpdate">
	       		<input type="hidden" name="activityVO.id">
	       		<input type="hidden" name="activityVO.logo">
	       		<input type="hidden" name="activityVO.status">
	       		<input type="hidden" name="activityVO.buildings.id">
				<div class="form-group">
		        	<label for="recipient-name" class="control-label">活动标题：</label>
		        	<input type="text" class="form-control" name="activityVO.title" required="required">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">活动内容：</label>
		        	<input type="text" class="form-control" name="activityVO.content" required="required">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">活动地址：</label>
		        	<input type="text" class="form-control" name="activityVO.address" required="required">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">开始时间：</label>
		        	<input type="text" class="form-control" name="activityVO.start_time" required="required">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">结束时间：</label>
		        	<input type="text" class="form-control" name="activityVO.end_time" required="required">
		        </div>
		        <div class="form-group">
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 <a class="btn btn-primary" onclick="activityUpdate();">保&nbsp;存</a>
		        </div>
    		</form> 
	      </div>
	      <div class="modal-footer">
       		 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 修改模态框结束 -->
	
    <!-- topbar starts -->
     <%@ include file="./top.jsp"%>    
    <!-- topbar ends -->
<div class="ch-container">
    <div class="row">
        <!-- left menu starts -->
		<%@ include file="./leftMenu.jsp" %>
        <!-- left menu ends -->
        <!-- 模态框：修改开始 -->
        <div class="modal fade" id="modifybuilding" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">楼栋修改</h4>
		      </div>
		      <div class="modal-body">
		       	<form  id="buildingUpdate">
		       		<input type="hidden" name="buildingVO.id">
		       		<input type="hidden" name="buildingVO.buildings.id">
		       		<input type="hidden" name="buildingVO.created_time" >
		       		<input type="hidden" name="buildingVO.status">
					<div class="form-group">
			        	<label for="recipient-name" class="control-label">楼栋名称：</label>
			        	<input type="text" class="form-control" name="buildingVO.name">
			        </div>
			        <div class="form-group">
			        	<label for="recipient-name" class="control-label">总层数：</label>
			        	<input type="text" class="form-control" name="buildingVO.total_floor">
			        </div>
			        <div class="form-group">
			        	<label for="recipient-name" class="control-label">电梯数：</label>
			        	<input type="text" class="form-control" name="buildingVO.total_lift">
			        </div>
			         <div class="form-group">
			        	<label for="recipient-name" class="control-label">每层户数：</label>
			        	<input type="text" class="form-control" name="buildingVO.floor_rooms">
			        </div>
			        <div class="form-group">
			        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			        	 <a class="btn btn-primary" onclick="buildingUpdate();">保&nbsp;存</a>
			        </div>
	    		</form> 
		      </div>
		      <div class="modal-footer">
	       		 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		      </div>
		    </div>
		  </div>
		</div>
        <!-- 模态框：修改结束 -->
        <!-- content starts -->
		<div id="content" class="col-lg-10 col-sm-10">
			<div>
				<ul class="breadcrumb">
					<li><a href="<%=path%>/agency/main">首页</a></li>
					<li><a href="javacsript:void(0);">楼栋管理</a></li>
				</ul>
			</div>
            <!-- 表格工具栏开始 -->
	        <div id="toolbar" class="btn-group">
	        <a href="<%=path%>/building/addBuilding"  class="btn btn-default">
	            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
	        </a>
	        <button  class="edit btn btn-default">
	            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
	        </button>
	        <button class="inOractive btn btn-default">
	            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>冻结-激活
	        </button>
	        <a id="lookRooms" target='_blank' class='lookRooms btn btn-default glyphicon glyphicon-home' role='button'>查看房号</a>
	        <a id="url" target='_blank' class='addRoom btn btn-default glyphicon glyphicon-home' role='button'>生成房号</a>
	    	</div>
	    	<!-- 表格工具栏结束 -->
	    	<!--查询 开始-->
			<div class="col-xs-5 pull-left">
                <div class="input-group">
                    <input type="text" class="form-control" name="name" placeholder="请输入楼盘名称">
                    <span class="input-group-btn">
                        <button class="btn btn-primary search" type="button">查询</button>
                    </span>
                </div>
            </div>
            <!-- 查询结束 -->
			<!-- 表格开始 -->
            <div class="col-xs-12">
                <table id="tb" class="table table-bordered table-hover table-condensed" data-toggle="table"
					data-url="<%=path %>/building/buildingList" data-pagination="true" data-striped="true">
					<thead>
						<tr>
							<th data-field="state" data-radio="true"></th>
							<th data-field="buildings.name">楼盘名称</th>
							<th data-field="name">楼栋名称</th>
							<th data-field="total_floor">总层数</th>
							<th data-field="floor_rooms">每层户数</th>
							<th data-field="total_room">总户数</th>
							<th data-field="total_lift">电梯数</th>
							<th data-field="status">状态</th>
						</tr>
					</thead>
				</table>
            </div>
           	<!-- 表格结束 -->
		</div>
		<!-- content end -->
	</div>
	<!--/row-->
</div>
<!--/.fluid-container-->


<script src="<%=path%>/bootstrap/bootstrap-table.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-locale-all.min.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-zh-CN.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-export.js"></script>
<script src="<%=path%>/bootstrap/tableExport.js"></script>

<script src="<%=path %>/js/formFill.js"></script>
<script src="<%=path %>/js/buildingList.js"></script>
<!-- jQuery消息提示框 -->
<script src="<%=path%>/toastr/toastr.min.js"></script>
<script src="<%=path%>/js/toastrOption.js"></script>
<!-- 经销商上传图片 -->
<script>
$('#logo').fileinput({
    language: 'zh',
    uploadUrl: '<%=path%>/agency/uploadLogo',
    allowedFileExtensions : ['jpg', 'png','gif'],
})
var imgSrc="";
$('#logo').on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功		
	imgSrc=data.response.agencyVo.logo;
	$("#changeLogo").modal("toggle");
})
$(function () {
	$('#changeLogo').on('hide.bs.modal', function () {
		if(imgSrc!=""){
			$("#logoImg").attr('src',imgSrc)
		}
 	})
 });
</script>
</body>
</html>