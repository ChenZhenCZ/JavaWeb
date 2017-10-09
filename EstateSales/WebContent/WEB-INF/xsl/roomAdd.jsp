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
<title>新增房号</title>
 	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="author" content="Muhammad Usman">

    <!-- The styles -->
	<%@include file="./JsAndCss.jsp" %>
	
</head>

<body>
	<!-- 更换经销商logo -->
	<%@ include file="./changeAgencyLogo.jsp" %>
    <!-- topbar starts -->
    <%@ include file="./top.jsp"%>
    <!-- topbar ends -->
    <!-- 新增房号 模态框 开始-->
	<div class="modal fade" id="addRoom" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">更换logo</h4>
	      </div>
	      <div class="modal-body">
	       	<form id="room">
	       		<!-- 楼栋Id -->
	       		<input type="hidden" name="room.buildingId" value="${request.building.id}"> 
	       		<!-- 楼栋名称 -->
	       		<input type="hidden"  id="buildingName" name="room.buildingName" value="${request.building.name}">
        		<!-- 户型号 -->
        		<input type="hidden" name="room.houseNumber"  id="houseNumber">
        		选择户型：<select name="room.houseId">
		   					<s:iterator var="t" value="#request.hourseList">
		   					<option value="${t.id}">${t.name}</option>
		   					</s:iterator>
		   				</select>
		   				<br/><br/>		
		   		楼层：<input type="text" readonly="readonly" name="room.firstFloor" value="1">
					到
					<input type="text" readonly="readonly" name="room.lastFloor" value="${request.building.total_floor}">
					<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
					<button  onclick="createRooms();" class="btn btn-primary">生成房号</button>	
    		</form> 
	      </div>
	      <div class="modal-footer">
       		 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!--新增房号 模态框结束 -->
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
					<li><a href="javacsript:void(0);">添加房号</a></li>
				</ul>
			</div>
			<!-- 循环出该栋楼的每层户数 -->
			<h3><font color="bulue">${request.building.name}</font>栋总共有<font color="bulue">${request.building.total_floor}</font>层,每层有 <font color="bulue">${request.building.floor_rooms}</font>户</h3>
			<s:bean name="org.apache.struts2.util.Counter" id="counter">
			    <s:param name="first" value="1" />
			    <s:param name="last"  value="#request.building.floor_rooms"/>
			    <s:iterator>
			    	<button  type="button" value="0<s:property/>" class="getRoomNumber btn btn-success  btn-lg " data-toggle="modal" data-target="#addRoom">户数<s:property/></button>
			    </s:iterator>
			</s:bean>
		</div>
		<!-- content end -->
	</div>
	<!--/row-->
</div>
<!--/.fluid-container-->
<script>
//获取房号
$(".getRoomNumber").each(function(){
	$(this).click(function (){
		var houseNumber = $(this).val();
		$("#houseNumber").attr('value',houseNumber);
	})
})
</script>

<script>
function createRooms(){
	$.post("/EstateSales/room/save", 
		$("#room").serialize(),
		function(data) {
			if (data.controllerResult.result == "fail") {
				$("#addRoom").modal('toggle');	//关闭模态框
				alert("该房号已经生成,不能再次生成");  
			}
			if(data.controllerResult.result == "success"){
				$("#addRoom").modal('toggle');	//关闭模态框
				alert("房号生成成功！");  
			}
		}, "json"
	);
}
</script>

<!-- 上传图片 -->
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
<script>

</script>
</body>
</html>