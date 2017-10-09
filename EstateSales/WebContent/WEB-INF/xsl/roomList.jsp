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
<title>楼盘管理</title>
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
    <!-- 修改房号状态 模态框 开始-->
	<div class="modal fade" id="modifyRoomStatus" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog modal-sm" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">更改状态</h4>
	      </div>
	      <div class="modal-body">
	       	<form id="modifyStatus1">
	       		<input type="hidden" name="roomVO.id" id="roomId">
	       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		
        		状态：<select name="roomVO.sale_status" style="width:100px;hight:40px">
	   					<option value="待售">待售</option>
	   					<option value="保留">保留</option>
	   				</select>
	   				<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		
					<button  onclick="modifyStatus();" class="btn btn-primary ">保存</button>	
    		</form> 
	      </div>
	      <div class="modal-footer">
       		 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!--修改房号状态 模态框结束 -->
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
					<li><a href="javacsript:void(0);">查看房号</a></li>
				</ul>
			</div>
            <!-- 表格工具栏开始 -->
	        <div id="toolbar" class="btn-group">
	        <button class="modifyStatus btn btn-default">
	            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>房号状态修改
	        </button>
	    	</div>
	    	<!-- 表格工具栏结束 -->
			<!-- 表格开始 -->
            <div class="col-xs-12">
                <table id="tb" class="table table-bordered table-hover table-condensed" data-toggle="table"
					data-url="<%=path %>/room/roomsList" data-pagination="true" data-striped="true">
					<thead>
						<tr>
							<th data-field="state" data-radio="true"></th>
							<th data-field="hourse.name">户型名称</th>
							<th data-field="name">房号名称</th>
							<th data-field="sale_status">状态</th>
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
<script src="<%=path%>/js/roomList.js"></script>

<!-- jQuery消息提示框 -->
<script src="<%=path%>/toastr/toastr.min.js"></script>

<script>
//修改房号状态

$(function(){
	$(".modifyStatus").click(function(){
		var data=$("#tb").bootstrapTable("getSelections");
		if(data.length==1){
			if(data[0].sale_status=='已售'){
				toastr.info("已售卖的房子不能更改状态");  
			}else{
				$("#modifyStatus1").fill(data[0]);	//选中数据填入模态框
				$("#modifyRoomStatus").modal();	//打开模态框
			}
		}else{
			toastr.warning("未选中行!");  
		}
	})
})

function modifyStatus(){
	$.post("/EstateSales/room/modifyStatus", 
		$("#modifyStatus1").serialize(),
		function(data) {
			if (data.controllerResult.result == "success") {
				$("#modifyRoomStatus").modal();	//关闭模态框
				toastr.success("状态修改成功!");  
			} else {
				toastr.error("状态修改失败!"); 
			}
		}, "json"
	);
}

//关闭模态框，刷新表格数据
$('#myModal').on('hide.bs.modal', function () {
	$("#tb").bootstrapTable("refresh",{url:"/EstateSales/room/roomsList"});
	}
)

</script>
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