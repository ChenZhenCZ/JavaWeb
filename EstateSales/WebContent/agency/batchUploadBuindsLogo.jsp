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
<title>经销商主页</title>
 	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    
    <!-- The styles -->
    <link href="<%=path %>/managePlugin/css/charisma-app.css" rel="stylesheet">
    <link href='<%=path %>/managePlugin/bower_components/fullcalendar/dist/fullcalendar.css' rel='stylesheet'>
    <link href='<%=path %>/managePlugin/bower_components/fullcalendar/dist/fullcalendar.print.css' rel='stylesheet' media='print'>
    <link href='<%=path %>/managePlugin/bower_components/chosen/chosen.min.css' rel='stylesheet'>
    <link href='<%=path %>/managePlugin/bower_components/colorbox/example3/colorbox.css' rel='stylesheet'>
    <link href='<%=path %>/managePlugin/bower_components/responsive-tables/responsive-tables.css' rel='stylesheet'>
    <link href='<%=path %>/managePlugin/bower_components/bootstrap-tour/build/css/bootstrap-tour.min.css' rel='stylesheet'>
	<link href='<%=path %>/managePlugin/bower_components/bootstrap/dist/css/bootstrap.min.css' rel='stylesheet'>
    <link href='<%=path %>/managePlugin/css/jquery.noty.css' rel='stylesheet'>
    <link href='<%=path %>/managePlugin/css/noty_theme_default.css' rel='stylesheet'>
    <link href='<%=path %>/managePlugin/css/elfinder.min.css' rel='stylesheet'>
    <link href='<%=path %>/managePlugin/css/elfinder.theme.css' rel='stylesheet'>
    <link href='<%=path %>/managePlugin/css/jquery.iphone.toggle.css' rel='stylesheet'>
    <link href='<%=path %>/managePlugin/css/uploadify.css' rel='stylesheet'>
    <!-- jQuery -->
    <script src="<%=path %>/managePlugin/bower_components/jquery/jquery.min.js"></script>
    <link rel="shortcut icon" href="<%=path %>/managePlugin/img/favicon.ico">
   
    <!-- jQuery -->
    <script src="<%=path %>/managePlugin/bower_components/jquery/jquery.min.js"></script>
    <link rel="shortcut icon" href="<%=path %>/managePlugin/img/favicon.ico">
	
	<!-- 图片上传 -->	
    <link rel="stylesheet" type="text/css" href="<%=path%>/logoUpload/css/default.css">
    <link href="<%=path%>/logoUpload/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
    <script src="<%=path%>/logoUpload/js/fileinput.js" type="text/javascript"></script>
    <!--简体中文-->
    <script src="<%=path%>/logoUpload/js/locales/zh.js" type="text/javascript"></script>
</head>

<body>
	<!-- 模态框 开始-->
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
	<!-- 模态框结束 -->
	
	<a href="#batchImg" data-toggle="modal" data-target="#batchImg">批量上传图片</a>

<script src="<%=path%>/managePlugin/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="<%=path %>/managePlugin/bower_components/chosen/chosen.jquery.min.js"></script>

<!-- 上传图片 -->
<script>
$('#batchUploadImg').fileinput({
    language: 'zh',
    uploadUrl: '<%=path%>/buildings/batchUploadImg',
    allowedFileExtensions : ['jpg', 'png','gif'],
})

$('#batchUploadImg').on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功		
	//$("#batchUploadImg").fileinput('reset');  //清空文件框图片
	//$("#batchImg").modal("toggle");
	alert("图片上传完成！");
})

</script>
</body>
</html>