<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path= request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<title>楼栋列表</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
    <meta name="author" content="Muhammad Usman">
	<%@include file="./Jspscript.jsp" %>
    <link rel="stylesheet" href="<%=path%>/toastr/toastr.min.css">
 	
    <link href="<%=path%>/plugins/bootstrap/bootstrap.min.css" rel="stylesheet">
	<link href="<%=path%>/bootstrap/bootstrap-table.css" rel="stylesheet"/> 
	<script type="text/javascript" src="<%=path%>/bootstrap/dist/js/bootstrapValidator.js"></script>
	 <link rel="stylesheet" href="<%=path%>/bootstrap/dist/css/bootstrapValidator.css"/>
	<body>
	
	  		<!-- 更换经销商logo -->
			<%@ include file="./changeAgencyLogo.jsp" %>
		    <!-- topbar starts -->
		  <%@ include file="./top.jsp" %>
    <div class="row">
        
        <!-- left menu starts -->
       <%@ include file="./lefEmp.jsp" %>
        <!--/span-->
        <!-- left menu ends -->

        <div id="content" class="col-lg-10 col-sm-10">
            <!-- content starts -->
            <div>
    <ul class="breadcrumb">
        <li>
            <a href="<%=path%>">首页</a>
        </li>
        <li>
            <a href="#">楼栋列表</a>
        </li>
    </ul>
</div>
	<div class="row">
          <!-- 表格工具栏开始 -->
	        <div id="toolbar" class="btn-group">
	        <a id="lookRooms" target='_blank' class='lookRooms btn btn-default glyphicon glyphicon-home' role='button'>查看房号</a>
	    	</div>
      		<!--查询 开始-->
			<div class="col-xs-5 pull-left">
                <div class="input-group">
                    <input type="text" class="form-control" name="name" placeholder="请输入楼盘名称">
                    <span class="input-group-btn">
                        <button class="btn btn-primary search" type="button">查询</button>
                    </span>
                </div>
            </div>
           
            <div class="col-xs-12">
               <table id="tb" class="table table-bordered table-hover table-condensed" data-toggle="table"
				data-url="<%=path %>/building/empbuildingList" data-pagination="true" data-striped="true">
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
       </div>
</div>
</div><!--/.fluid-container-->
        
<script src="<%=path%>/bootstrap/bootstrap-table.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-locale-all.min.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-zh-CN.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-export.js"></script>
<script src="<%=path%>/bootstrap/tableExport.js"></script>
<script src="<%=path %>/js/formFill.js"></script>
<!-- jQuery消息提示框 -->
<script src="<%=path%>/toastr/toastr.min.js"></script>
<script src="<%=path%>/js/toastrOption.js"></script>  
<script src="<%=path%>/js/empbuildingList.js"></script> 
 <!-- 上传图片 -->
<script>
$('#logo').fileinput({
    language: 'zh',
    uploadUrl: '<%=path%>/staff/uploadLogo',
    allowedFileExtensions : ['jpg', 'png','gif'],
})
var imgSrc="";
$('#logo').on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功		
	 imgSrc=data.response.emp.headicon;
	 $("#changeLogo").modal("toggle");
})
$(function () {
	$('#changeLogo').on('hide.bs.modal', function () {
		$("#headicon").attr('src',imgSrc)
 	})
 });
</script>
 
</body>
</html>