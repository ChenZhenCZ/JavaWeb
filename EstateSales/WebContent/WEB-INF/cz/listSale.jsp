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

<title>销售记录</title>
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
            <a href="#">销售记录</a>
        </li>
    </ul>
</div>
<div class="row">
        
       <!--按钮  -->
          <div id="toolbar" class="btn-group">
             <button id="btn_xiang" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span>查看详情
            </button>
            <button id="btn_ziliao" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>完善资料
            </button>
        </div>
                <!-- 表格 -->
                <div class="col-xs-12">
                    <table id="tb_departments" class="table table-striped table-bordered table-hover" >
                    </table>
                </div>
            </div>


</div>
	
</div><!--/.fluid-container-->
 <!-- 修改 -->
       <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">修改资料</h4>
                </div>
                <div class="modal-body">
                   <form  id="f">
					<input type="hidden" name="sale.id">
					<input type="hidden" name="sale.room.building_id" value="${emp.buildings.id }" >
                    <div class="form-group">
                        <label for="appointment.name">客户名称</label>
                        <input type="text" name="sale.customer.name"  class="form-control"  placeholder="客户名称" disabled>
                    </div>
                    <div class="form-group">
                        <label for="appointment.name">销售单价</label>
                        <input type="text" name="sale.unit_price"  class="form-control"  placeholder="单价" >
                    </div>
                     <div class="form-group">
                        <label for="appointment.name">房号</label>
                        <input type="text" name="sale.room.name"  class="form-control"  placeholder="房号" >
                    </div>
                    <div class="form-group">
                         <label for="appointment.app_status">销售折扣</label>
						  	<select class="form-control" name="sale.discount">
								  <option value="0.95">0.95</option>
								  <option value="0.9">0.9</option>
								  <option value="0.88">0.88</option>
								  <option value="0.85">0.85</option>
								   <option value="1">无折扣</option>
							</select>
                    </div>
                    <div class="modal-footer">
	                    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
	                    <button type="button"  class="btn btn-primary" data-dismiss="modal" id='update'><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
                   </div>
                  </form>
                </div>
            </div>
        </div>
       </div>
<script src="<%=path%>/bootstrap/bootstrap-table.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-locale-all.min.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-zh-CN.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-export.js"></script>
<script src="<%=path%>/bootstrap/tableExport.js"></script>
<script src="<%=path %>/js/formFill.js"></script>
<!-- jQuery消息提示框 -->
<script src="<%=path%>/toastr/toastr.min.js"></script>
<script src="<%=path%>/js/toastrOption.js"></script>
<script src="<%=path %>/js/table_sale.js"></script>
<script src="<%=path %>/js/cous.js"></script>
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
		if(imgSrc!=""){
		$("#headicon").attr('src',imgSrc)
		}
 	})
 });
</script>
 
</body>
</html>