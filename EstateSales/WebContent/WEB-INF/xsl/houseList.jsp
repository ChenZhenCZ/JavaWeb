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
<title>户型信息管理</title>
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
	<!-- 修改活动图片开始 -->
	<div class="modal fade" id="houseLogo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">更换logo</h4>
	      </div>
	      <div class="modal-body">
	       	<form  enctype="multipart/form-data">
        		<label>请选择logo</label>
        		<input id="houseImg" name="houselogo" type="file">
    		</form> 
	      </div>
	      <div class="modal-footer">
       		 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 修改活动图片结束 -->
	
	<!-- 修改 模态框开始-->
	<div class="modal fade" id="modifyhouse" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">户型修改</h4>
	      </div>
	      <div class="modal-body">
	       	<form  id="houseUpdate">
	       		<input type="hidden" name="houseVO.id">
	       		<input type="hidden" name="houseVO.logo">
	       		<input type="hidden" name="houseVO.status">
	       		<input type="hidden" name="houseVO.buildings.id">
	       		<input type="hidden" name="houseVO.created_time">
				<div class="form-group">
		        	<label for="recipient-name" class="control-label">户型名称：</label>
		        	<input type="text" class="form-control" name="houseVO.name" required="required">
		        </div>
		         <div class="form-group">
		        	<label for="recipient-name" class="control-label">面积：</label>
		        	<input type="text" class="form-control" name="houseVO.area" required="required">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">参考单价：</label>
		        	<input type="text" class="form-control" name="houseVO.unit_price" required="required">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">简介：</label>
		        	<input type="text" class="form-control" name="houseVO.intro" required="required">
		        </div>
		        <div class="form-group">
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 <a class="btn btn-primary" onclick="houseUpdate();">保&nbsp;存</a>
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
        <!-- content starts -->
		<div id="content" class="col-lg-10 col-sm-10">
			<div>
				<ul class="breadcrumb">
					<li><a href="<%=path%>/agency/main">首页</a></li>
					<li><a href="javacsript:void(0);">户型信息管理</a></li>
				</ul>
			</div>
            <!-- 表格工具栏开始 -->
	        <div id="toolbar" class="btn-group">
	        <a href="<%=path%>/house/addHouse"  class="btn btn-default">
	            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
	        </a>
	        <button  class="edit btn btn-default">
	            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
	        </button>
	        <button class="inOractive btn btn-default">
	            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>冻结-激活
	        </button>
	        <button class="modifyHouseLogo btn btn-default">
	            <span class="glyphicon glyphicon-picture" aria-hidden="true"></span>修改封面
	        </button>
	        <a id="lookhouseDetail" target='_blank' class='lookhouseDetail btn btn-default glyphicon glyphicon-search' role='button'>查看详情</a>
	    	</div>
	    	<!-- 表格工具栏结束 -->
	    	<!--查询 开始-->
			<div class="col-xs-4 pull-left">
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
					data-url="<%=path %>/house/houseList" data-pagination="true" data-striped="true">
					<thead>
						<tr>
							<th data-field="state" data-radio="true"></th>
							<th data-field="logo" data-events="logoEvents" data-formatter="logoFormatter">户型封面</th>
							<th data-field="buildings.name">楼盘名称</th>
							<th data-field="name">户型名称</th>
							<th data-field="area">面积</th>
							<th data-field="unit_price">参考单价</th>
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
<script src="<%=path%>/js/houseList.js"></script>

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
 

//打开模态框 ： 修改活动图片
var houseId="";
$(function(){
	$(".modifyHouseLogo").click(function(){
		var data=$("#tb").bootstrapTable("getSelections");
		if(data.length==1){
			houseId = data[0].id; //获取选中的活动Id
			$("#houseLogo").modal();	//打开模态框
		}else{
			toastr.warning("未选中需要修改的图片!");  
		}
	})
})

//活动图片修改
$('#houseImg').fileinput({
	language: 'zh',
    uploadUrl: '<%=path%>/house/modifyHouseLogo',
    allowedFileExtensions : ['jpg', 'png','gif'],
    initialCaption: "请选择上传图片",
    uploadExtraData:
    	function(previewId, index) {   //额外参数的关键点
	    	var data = {
	    			houseId:houseId
	    	};
	        return data;
    }
})

$('#houseImg').on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功		
	$("#houseLogo").modal("toggle");
	$("#tb").bootstrapTable("refresh",{url:"/EstateSales/house/houseList"});
})
</script>
</body>
</html>