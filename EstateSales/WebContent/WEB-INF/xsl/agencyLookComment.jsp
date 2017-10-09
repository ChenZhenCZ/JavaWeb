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
<title>楼盘评价</title>
 	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="author" content="Muhammad Usman">

	<!-- The styles -->
 	<%@include file="./JsAndCss.jsp" %>
 	
 	<!-- jQuery消息提示框 -->
	<link rel="stylesheet" href="<%=path%>/toastr/toastr.min.css">
    <link href="<%=path%>/plugins/bootstrap/bootstrap.min.css" rel="stylesheet">
	<link href="<%=path%>/bootstrap/bootstrap-table.css" rel="stylesheet"/> 
    
</head>
<body>
	<!-- 更换经销商logo -->
	<%@ include file="./changeAgencyLogo.jsp" %>
    <!-- topbar starts -->
    <%@ include file="./top.jsp"%>    
    <!-- topbar ends -->
<div class="ch-container">
    <div class="row">
        <!-- left menu starts -->
		<%@ include file="./leftMenu.jsp" %>
        <!-- left menu ends -->
        <!-- content starts -->
		<div id="content" class="col-lg-10 col-sm-10">
			<div>
				<ul class="breadcrumb">
					<li><a href="<%=path%>/agency/main">首页</a></li>
					<li><a href="javacsript:void(0);">查看评价</a></li>
				</ul>
			</div>
			<!-- 搜索框 -->
            <div class="col-xs-4 pull-left">
                <div class="input-group">
                    <input type="text" class=" form-control" name="name" placeholder="请输入楼盘名称">
                    <span class="input-group-btn">
                        <button class="btn btn-default search" type="button">查询</button>
                    </span>
                </div>
            </div>
            <!-- 搜索框结束 -->
			<!-- 表格开始 -->
            <div class="col-xs-12">
                <table id="tb" class="table table-bordered table-hover table-condensed" data-toggle="table"
					data-url="<%=path %>/comment/agencyLookComment" data-pagination="true" data-striped="true">
					<thead>
						<tr>
							<th data-field="state" data-radio="true"></th>
							<th data-field="buildings.name">评价楼盘</th>
							<th data-field="user.name">用户姓名</th>
							<th data-field="content">评价内容</th>
							<th data-field="comment_time" data-formatter="formatDate">评价时间</th>
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
<script src="<%=path%>/js/agencyLookComment.js"></script>

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