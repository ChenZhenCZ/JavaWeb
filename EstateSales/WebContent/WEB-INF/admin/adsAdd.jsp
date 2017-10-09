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
<title>广告新增</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="author" content="Muhammad Usman">
	<%@include file="./jsAndCss.jsp" %>
    <link rel="stylesheet" href="<%=path %>/bootstrap/dist/css/bootstrapValidator.css"/>
    <link rel="stylesheet" href="<%=path %>/bootstrap/select2/select2.min.css" />
    <!-- jQuery -->
    <link rel="stylesheet" href="<%=path %>/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="<%=path %>/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="<%=path %>/kindeditor/kindeditor.js"></script>
	<script charset="utf-8" src="<%=path %>/kindeditor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="<%=path %>/kindeditor/plugins/code/prettify.js"></script>
	<link href="style/style.css" rel="<%=path %>/kindeditor/stylesheet" type="text/css">
	<style>
		#sub{width:190px;height:45px;color:green;background-color:#f0fff0;
			font-size:x-large;
		}
	</style>
</head>
<body >
	<div class="container">
    <!-- topbar starts -->
    <%@ include file="./topbar.jsp" %>
    <!-- topbar ends -->
		<div class="ch-container">
			</div>
			<!-- left menu starts -->
			<%@ include file="./leftMenu.jsp" %>
			<!--/span-->
			<!-- left menu ends -->


		<div id="content" class="col-lg-10 col-sm-10">
			<div>
				<ul class="breadcrumb">
					<li><a href="<%=path%>/admin/index">首页</a></li>
					<li><a href="javacsript:void(0);">广告发布</a></li>
				</ul>
			</div>
			<!-- content starts -->
			<form class="form-horizontal" name="form1" action="<%=path %>/admin/adsAddPage" id="newsform"
				method="post" enctype="multipart/form-data">
				<div class="form-group">
	    			<label  class="col-sm-2 control-label" >广告标题</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<input type="text" class="form-control" name="ads.title" placeholder="请填写广告标题" required="required">
	   			 	</div>
  				</div>
				<div class="form-group">
	    			<label class="col-sm-2 control-label">文章图片</label>
					<div class="col-md-6 col-sm-6 col-xs-12">
						<p id="addp"></p>
						<input type="file" id="upload" style="display: none" name="logo"
							onclick="addElementImg('addp')" required="required"> <span
							class="btn btn-default btn-lg" onclick="F_Open_dialog()">
							选择图片 </span>
					</div>
  				</div>
					<div class="form-group">
					<label  class="col-sm-2 control-label" >广告内容</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<textarea name="ads.content"   class="form-control"  id="msgContent" ></textarea>
						</div>
					</div>
				<div class="form-group">
	    			<label class="col-sm-2 control-label" >广告位置</label>
	   				<div class="  col-md-6 col-sm-6 col-xs-12">
	   			   		<select id="select" name="ads.show_order">
	   			   			<option vlaue="主页轮播1">主页轮播1</option>
	   			   			<option value="主页轮播2">主页轮播2</option>
	   			   			<option value="主页轮播3">主页轮播3</option>
	   			   			<option value="副页左侧">副页左侧</option>
	   			   			<option value="副页左侧">副页左侧</option>
	   			   		</select>
	   			 	</div>
  				</div>
				<div class="form-group">
   				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 center">
   			   		<input type="submit" class="btn btn-success btn-lg" value="提交"/>
 				</div>
  			</div>
			</form>
			<!--/row-->
		</div>

	</div>
		<!--/.fluid-container-->
</div>
<!-- external javascript -->
<script type="text/javascript" src="<%=path %>/bootstrap/dist/js/bootstrapValidator.js"></script>
<script src="<%=path %>/bootstrap/select2/select2.full.min.js"></script>
<script src="<%=path %>/bootstrap/select2/select2.min.js"></script>
<script src="<%=path %>/js/adsAdd.js"></script>
</body>
</html>