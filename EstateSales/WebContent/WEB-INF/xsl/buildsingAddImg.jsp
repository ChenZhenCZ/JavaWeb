<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>批量新增楼盘图片</title>

<link href='<%=path %>/managePlugin/bower_components/bootstrap/dist/css/bootstrap.min.css' rel='stylesheet'> 
<link href='<%=path %>/managePlugin/css/uploadify.css' rel='stylesheet'>
<!-- jQuery -->
<script src="<%=path %>/managePlugin/bower_components/jquery/jquery.min.js"></script>

<!-- 图片上传 -->	
<link rel="stylesheet" type="text/css" href="<%=path%>/logoUpload/css/default.css">
<link href="<%=path%>/logoUpload/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
<script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>  
<script src="<%=path%>/logoUpload/js/fileinput.js" type="text/javascript"></script>
<!--简体中文-->
<script src="<%=path%>/logoUpload/js/locales/zh.js" type="text/javascript"></script>
<!--繁体中文-->
<script src="<%=path%>/logoUpload/js/locales/zh-TW.js" type="text/javascript"></script>

</head>
<body>
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">更换logo</h4>
	      </div>
	      <div class="modal-body">
	       	<form  enctype="multipart/form-data" >
        		<label>请选择logo</label>
        		<input id="logo" name="logo" type="file"  multiple>
    		</form> 
	      </div>
	      <div class="modal-footer">
       		 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<a href="#myModal" data-toggle="modal" data-target="#myModal">模态框</a>	


<script src="<%=path %>/managePlugin/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- multiple file upload plugin -->
<script src="<%=path %>/managePlugin/js/jquery.uploadify-3.1.min.js"></script>

<!-- 上传图片 -->
<script>
$('#logo').fileinput({
    language: 'zh',
    uploadUrl: '<%=path%>/buildings/batchAddImg',
    allowedFileExtensions : ['jpg', 'png','gif'],
})
var imgSrc="";
$('#logo').on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功		
	imgSrc=data.response.agencyVo.logo;
})
$(function () {
	$('#myModal').on('hide.bs.modal', function () {
		$("#logoImg").attr('src',imgSrc)
 	})
 });

</script>
</body>
</html>