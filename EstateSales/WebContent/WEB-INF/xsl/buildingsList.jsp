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
<title>楼盘信息管理</title>
 	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="author" content="Muhammad Usman">

    <!-- The styles -->
	<%@include file="./JsAndCss.jsp" %>
	
	<!-- jQuery消息提示框 -->
	<link rel="stylesheet" href="<%=path%>/toastr/toastr.min.css">
    
    <link href="<%=path%>/plugins/bootstrap/bootstrap.min.css" rel="stylesheet">
	<link href="<%=path%>/bootstrap/bootstrap-table.css" rel="stylesheet"/> 
	<!-- 控制时间格式 -->
	<link rel="stylesheet" href="<%=path %>/bootstrap/bootstrap-datetimepicker.min.css">  
	<script type="text/javascript"  src="<%=path %>/bootstrap/bootstrap-datetimepicker.min.js"></script>  
</head>

<body>
	<!-- 模态框：更换经销商logo -->
	<%@ include file="./changeAgencyLogo.jsp" %>
	<!-- 模态框：批量上传楼盘图片开始 -->
	<div class="modal fade" id="batchImg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">更换logo</h4>
	      </div>
	      <div class="modal-body">
	       	<form  enctype="multipart/form-data">
        		<label>请选择logo</label>
        		<input id="batchUploadImg" name="batchImg" type="file" multiple  data-min-file-count="1">
    		</form> 
	      </div>
	      <div class="modal-footer">
       		 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 模态框：批量上传楼盘图片结束 -->
	<!-- 模态框：修改楼盘图片开始 -->
	<div class="modal fade" id="modifyImg2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">更换logo</h4>
	      </div>
	      <div class="modal-body">
	       	<form  enctype="multipart/form-data">
        		<label>请选择图片</label>
        		<input id="MTKmodifyImg" name="agnecyModifyImg" type="file"  data-min-file-count="1">
    		</form> 
	      </div>
	      <div class="modal-footer">
       		 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 模态框：修改楼盘图片结束 -->
	
	<!-- 模态框：修改模态框开始-->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">楼盘修改</h4>
	      </div>
	      <div class="modal-body">
	       	<form  id="buildUpdate">
	       		<input type="hidden" name="buildingsVO.id">
	       		<input type="hidden" name="buildingsVO.logo" >
	       		<input type="hidden" name="buildingsVO.created_time" >
	       		<input type="hidden" name="buildingsVO.status" >
				<input type="hidden" name="buildingsVO.agency.id">
				<div class="form-group">
		        	<label for="recipient-name" class="control-label">楼盘名称：</label>
		        	<input type="text" class="form-control" name="buildingsVO.name" required="required">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">所属区域：</label>
		        	<input type="text" class="form-control" name="buildingsVO.area" required="required">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">地址：</label>
		        	<input type="text" class="form-control" name="buildingsVO.address" required="required">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">占地面积：</label>
		        	<input type="text" class="form-control" name="buildingsVO.floor_area" required="required">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">建筑面积：</label>
		        	<input type="text" class="form-control" name="buildingsVO.building_area" required="required">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">房源类型：</label>
		        	<input type="text" class="form-control" name="buildingsVO.house_type" required="required">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">建筑类型：</label>
		        	<input type="text" class="form-control" name="buildingsVO.building_type" required="required">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">经度：</label>
		        	<input type="text" class="form-control" name="buildingsVO.longitude" required="required">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">纬度：</label>
		        	<input type="text" class="form-control" name="buildingsVO.latitude" required="required">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">楼盘均价：</label>
		        	<input type="text" class="form-control" name="buildingsVO.avg_price" required="required">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">开发公司：</label>
		        	<input type="text" class="form-control" name="buildingsVO.company" required="required">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">开盘时间：</label>
		        	<input type="text" class="form-control  form_datetime" name="buildingsVO.open_date" required="required" readonly="readonly">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">总套数：</label>
		        	<input type="text" class="form-control" name="buildingsVO.total_rooms" required="required">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">接待地址：</label>
		        	<input type="text" class="form-control" name="buildingsVO.reception_address" required="required">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">售楼电话：</label>
		        	<input type="text" class="form-control" name="buildingsVO.tel" required="required">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">绿化率：</label>
		        	<input type="text" class="form-control" name="buildingsVO.green_ratio" required="required">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">容积率：</label>
		        	<input type="text" class="form-control" name="buildingsVO.plot_ratio" required="required">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">物业公司：</label>
		        	<input type="text" class="form-control" name="buildingsVO.property_company" required="required">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">物业费：</label>
		        	<input type="text" class="form-control" name="buildingsVO.property_fee" required="required">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">车位数：</label>
		        	<input type="text" class="form-control" name="buildingsVO.car_station" required="required">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">交通状况：</label>
		        	<input type="text" class="form-control" name="buildingsVO.traffic" required="required">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">周边配套：</label>
		        	<input type="text" class="form-control" name="buildingsVO.equipments" required="required">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">简介：</label>
		        	<input type="text" class="form-control" name="buildingsVO.intro" required="required">
		        </div>
		        <div class="form-group">
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 <a class="btn btn-primary" onclick="buildUpdate();">保&nbsp;存</a>
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
					<li><a href="javacsript:void(0);">楼盘信息管理</a></li>
				</ul>
			</div>
			<!-- 表内容开始 -->
			<div class="row">
				<!-- 表格工具栏开始 -->
		        <div id="toolbar" class="btn-group">
		        <a id="lookBuildsDetail" target='_blank' class='lookBuildsDetail btn btn-default glyphicon glyphicon-search' role='button'>查看详情</a>
		        <a href="<%=path%>/buildings/buildAdd"  class="btn btn-default">
		            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 新增
		        </a>
		        <button  class="edit btn btn-default">
		            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
		        </button>
		        <button class="inOractive btn btn-default">
		            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>冻结-激活
		        </button>
		        <button class="batchUploadImg btn btn-default">
		            <span class="glyphicon glyphicon-picture" aria-hidden="true"></span>批量添加图片
		        </button>
		        <button class="agencymodifyImg btn btn-default">
		            <span class="glyphicon glyphicon-picture" aria-hidden="true"></span>修改图片
		        </button>
		    	</div>
		    	<!-- 表格工具栏结束 -->
				<!-- 表格开始 -->
	            <div class="col-xs-12">
	                <table id="tb" class="table table-bordered table-hover table-condensed" data-toggle="table"
						data-url="<%=path %>/buildings/agencyBuildsList" data-pagination="true" data-striped="true">
						<thead>
							<tr>
								<th data-field="state" data-radio="true"></th>
								<th data-field="logo" data-formatter="logoFormatter">楼盘图片</th>
								<th data-field="name">楼盘名称</th>
								<th data-field="address">楼盘地址</th>
								<th data-field="building_area">建筑面积</th>
								<th data-field="house_type">房源类型</th>
								<th data-field="avg_price">楼盘均价</th>
								<th data-field="company">开发公司</th>
								<th data-field="total_rooms">总套数</th>
								<th data-field="status">状态</th>
							</tr>
						</thead>
					</table>
	            </div>
            	<!-- 表格结束 -->
			</div>
			<!-- 表内容结束 -->
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
<script src="<%=path %>/js/buildsList.js"></script>

<!-- jQuery消息提示框 -->
<script src="<%=path%>/toastr/toastr.min.js"></script>
<!-- 经销商更换logo -->
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
 
  
 //打开模态框 ： 批量上传楼盘图片
var buildId="";
$(function(){
	$(".batchUploadImg").click(function(){
		var data=$("#tb").bootstrapTable("getSelections");
		if(data.length==1){
			buildId = data[0].id; //获取选中的活动Id
			$("#batchImg").modal();	//打开模态框
		}else{
			toastr.warning("未选中需要添加图片的楼盘!");  
		}
	})
})
 
 $('#batchUploadImg').fileinput({
    language: 'zh',
    uploadUrl: '<%=path%>/buildings/batchUploadImg',
    allowedFileExtensions : ['jpg', 'png','gif'],
    uploadExtraData:
    	function(previewId, index) {   //额外参数的关键点
	    	var data = {
	   			buildId:buildId
	    	};
	        return data;
    }
})
$('#batchUploadImg').on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功		
	$("#batchUploadImg").fileinput('reset');
})
$(function () {
	$('#batchImg').on('hide.bs.modal', function () {
		  //清空文件框的预览图片
 	})
 });
 
 //修改楼盘图片
var buildsId="";
$(function(){
	$(".agencymodifyImg").click(function(){
		var data=$("#tb").bootstrapTable("getSelections");
		if(data.length==1){
			buildsId = data[0].id; //获取选中的活动Id
			$("#modifyImg2").modal();	//打开模态框
		}else{
			toastr.warning("未选中需要修改图片的楼盘!");  
		}
	})
})

$('#MTKmodifyImg').fileinput({
   language: 'zh',
   uploadUrl: '<%=path%>/buildings/modifyBuildingImg',
   allowedFileExtensions : ['jpg', 'png','gif'],
   uploadExtraData:
   	function(previewId, index) {   //额外参数的关键点
    	var data = {
   			buildsId:buildsId
    	};
        return data;
   }
})

$('#MTKmodifyImg').on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功		
	$("#tb").bootstrapTable("refresh",{url:"/EstateSales/buildings/agencyBuildsList"});
	$("#modifyImg2").modal('toggle');	//关闭模态框
})
</script>
<!--控制时间格式-->
<script>
  $('.form_datetime').datetimepicker({
	    minView: "month", //选择日期后，不会再跳转去选择时分秒 
	    locale:'en', //设置语言
	    format: 'yyyy-mm-dd',//设置时间格式
	    todayBtn:  1,
	    startDate: new Date(),
	   //endDate: '2017-12-30',	//开始时间  endDate 结束时间
	    autoclose: 1,//当选择一个日期之后是否立即关闭此日期时间选择器。
	});
</script>  
</body>
</html>