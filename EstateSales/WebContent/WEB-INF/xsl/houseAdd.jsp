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
<title>新增户型</title>
 	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="author" content="Muhammad Usman">

    <!-- The styles -->
	<%@include file="./JsAndCss.jsp" %>
	<link rel="stylesheet" href="<%=path%>/toastr/toastr.min.css">
	
	<link rel="stylesheet" href="../bootstrap/dist/css/bootstrapValidator.css"/>
	<script type="text/javascript" src="../bootstrap/dist/js/bootstrapValidator.js"></script>
	
	<!-- jQuery消息提示框 -->
	<link rel="stylesheet" href="<%=path%>/agency/sweetAlert/sweetalert.css">
	<script src="<%=path%>/agency/sweetAlert/sweetalert-dev.js"></script>
	
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
					<li><a href="javacsript:void(0);">新增户型</a></li>
				</ul>
			</div>
			<!--户型添加开始 -->
			<form class="form-horizontal form-bordered" method="post" action="<%=path %>/house/save" id="form1"  enctype="multipart/form-data">
				<div class="form-group" id="div2">
				  <label class="col-sm-3 control-label">选择楼盘：</label>
				  <div class="col-sm-4">
				   <select name="houseVO.buildings.id" >  
				        <s:iterator var="t" value="#request.buildingList">
				  	   		<option value="${t.id}" >${t.name }</option>   
				  		</s:iterator>
				   </select>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group">
	  				<label class="col-sm-3 control-label">户型名称：</label>
					<div class="col-sm-1 col-xs-1 col-lg-1 col-md-1">
						<select name="houseName.shi">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</div>
					<label  class="col-sm-1 col-xs-1 col-lg-1 col-md-1" >室</label>
					
					<div class="col-sm-1 col-xs-1 col-lg-1 col-md-1">
						<select name="houseName.ting">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</div>
					<label  class="col-sm-1 col-xs-1 col-lg-1 col-md-1">厅</label>
					
					<div class="col-sm-1 col-xs-1 col-lg-1 col-md-1">
						<select name="houseName.chu">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</div>
					<label  class="col-sm-1 col-xs-1 col-lg-1 col-md-1">厨</label>
					
					<div class="col-sm-1 col-xs-1 col-lg-1 col-md-1">
						<select name="houseName.wei">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</div>
					<label  class="col-sm-1 col-xs-1 col-lg-1 col-md-1">卫</label>
				</div>

				<div class="form-group" id="div5">
				  <label class="col-sm-3 control-label">面积：</label>
				  <div class="col-sm-4">
					<input type="text" id="area" name="houseVO.area" placeholder="输入面积" data-placement="right" title="请输入面积" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>

				<div class="form-group" id="div6">
				  <label class="col-sm-3 control-label">参考单价：</label>
				  <div class="col-sm-4">
					<input type="text" id="unit_price" name="houseVO.unit_price" placeholder="输入您的单价" data-placement="right" title="输入您的单价" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group">
                    <label class="col-lg-3 control-label">简介:</label>
                    <div class="col-lg-4 ">
                        <textarea placeholder="请填入简介"  rows="5" class="form-control" name="houseVO.intro"></textarea>
                    </div>
                </div>
				
				<div class="form-group" id="div3">
				  <label class="col-sm-3 control-label">户型封面：</label>
				  <div class="col-sm-4">
					<p id="addp"></p>
					  <input type="file" id="upload" style="display:none" name="houseImg" onclick="addElementImg('addp')">
					  <span  class="btn btn-default btn-lg"  onclick="F_Open_dialog()">
					  		选择图片
					  </span>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group">
				  <label class="col-sm-3 control-label"></label>
				  <div class="col-sm-7">
						<button type="submit" class="btn btn-success btn-lg"  style="width:200px">保  存</button>
				  </div>
				</div>
				<br/>
			  </form>
			<!-- 户型添加结束 -->
		</div>
		<!-- content end -->
	</div>
	<!--/row-->
</div>
<!--/.fluid-container-->
<script>
var i=true;
function addElementImg(obj) {
		if(i){
			var ul = document.getElementById(obj);
			var img = document.createElement("img");
			img.setAttribute("id", "newImg");
			img.setAttribute("style", "width:300px;height:200px");
			img.src = "";
			ul.appendChild(img);
			i=false;
			var input = document.getElementById("upload");
			var $img = $('#newImg');
			input.addEventListener('change',readFile,false);
			function readFile(){
				var file=this.files[0];
				var $file = $(this);
				var fileObj = $file[0];
				var windowURL = window.URL || window.webkitURL;
				var dataURL;
				dataURL = windowURL.createObjectURL(fileObj.files[0]);
				$img.attr('src',dataURL);
			}
		}
	}
	function F_Open_dialog(){ 
		document.getElementById("upload").click(); 
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
$(document).ready(function() {
    $('#form1').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	'houseVO.name': {
                validators: {
                    notEmpty: {
                        message: '户型名称不能为空'
                    }
                }
            },
            'houseImg': {
                validators: {
                    notEmpty: {
                        message: '户型封面不能为空'
                    }
                }
            },
            'houseVO.intro': { 
                validators: {
                    notEmpty: {
                        message: '户数简介不能为空'
                    }
                }
            },
            'houseVO.area': {  
                validators: {
                    notEmpty: {
                        message: '户型面积不能为空'
                    },
                    regexp: {
                        regexp: /^\d+(\.\d+)?$/,
                        message: '请输入正确的户型面积格式 如：100.5'
                    }
                }
            },
            'houseVO.unit_price': {  
                validators: {
                    notEmpty: {
                        message: '参考单价'
                    },
                    regexp: {
                        regexp: /^\d+(\.\d+)?$/,
                        message: '请输入正确的单价格式 如：780000.5'
                    }
                }
            }
        }
    });
});
</script>
<s:if test="msg==1">
	<script>
		swal("该户型已存在哦！","","error");
	</script>
</s:if>
</body>
</html>