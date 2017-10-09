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
<title>文章类别新增</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="author" content="Muhammad Usman">

    <!-- The styles -->
    <link id="bs-css" href="<%=path %>/managePlugin/css/bootstrap-cerulean.min.css" rel="stylesheet">

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
    <link href='<%=path %>/managePlugin/css/animate.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="<%=path %>/bootstrap/dist/css/bootstrapValidator.css"/>
    <!-- jQuery -->
    <script src="<%=path %>/managePlugin/bower_components/jquery/jquery.min.js"></script>
    <link rel="shortcut icon" href="<%=path %>/managePlugin/img/favicon.ico">

</head>

<body>
	<div class="container">
 
    <!-- topbar starts -->
   	<%@ include file="./topbar.jsp" %>
    <!-- topbar ends -->
<div class="ch-container">
    <div class="row">
        
        <!-- left menu starts -->
       <%@ include file="./leftMenu.jsp" %>
        <!--/span-->
        <!-- left menu ends -->
				<div id="content" class="col-lg-10 col-sm-10">
					<!-- content starts -->
					<div>
						<ul class="breadcrumb">
							<li><a href="<%=path%>/admin/index">首页</a></li>
							<li><a href="javacsript:void(0);">文章类别新增</a></li>
						</ul>
					</div>

					<div class="row">
						<div class="box col-md-12">
							<form class="form-horizontal" id="articletype"
								action="<%=path %>/admin/addArticleType" method="post">
								<div class="form-group">
									<label for="name" class="col-sm-2 control-label"
										style="color: blue;">文章类别</label>
									<div class="col-md-6 col-sm-6 col-xs-12">
										<input type="text" class="form-control"
											name="articleType.name" placeholder="请填写文章类别"
											required="required">
									</div>
								</div>
								<div class="form-group">
									<label for="des" class="col-sm-2 control-label"
										style="color: blue;">类别简介</label>
									<div class="col-md-6 col-sm-6 col-xs-12">
										<textarea class=" form-control" name="articleType.des"
											rows="5"></textarea>
									</div>
								</div>
								<div class="form-group">
									<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 center">
										<input type="submit" class="btn btn-success btn-lg" value="提交" />
									</div>
								</div>
							</form>
						</div>
					</div>
					<!--/row-->
				</div>

			</div><!--/.fluid-container-->
</div>
<!-- external javascript -->

<script src="<%=path %>/managePlugin/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- library for cookie management -->
<script src="<%=path %>/managePlugin/js/jquery.cookie.js"></script>
<!-- calender plugin -->
<script src='<%=path %>/managePlugin/bower_components/moment/min/moment.min.js'></script>
<script src='<%=path %>/managePlugin/bower_components/fullcalendar/dist/fullcalendar.min.js'></script>
<!-- data table plugin -->
<script src='<%=path %>/managePlugin/js/jquery.dataTables.min.js'></script>

<!-- select or dropdown enhancer -->
<script src="<%=path %>/managePlugin/bower_components/chosen/chosen.jquery.min.js"></script>
<!-- plugin for gallery image view -->
<script src="<%=path %>/managePlugin/bower_components/colorbox/jquery.colorbox-min.js"></script>
<!-- notification plugin -->
<script src="<%=path %>/managePlugin/js/jquery.noty.js"></script>
<!-- library for making tables responsive -->
<script src="<%=path %>/managePlugin/bower_components/responsive-tables/responsive-tables.js"></script>
<!-- tour plugin -->
<script src="<%=path %>/managePlugin/bower_components/bootstrap-tour/build/js/bootstrap-tour.min.js"></script>
<!-- star rating plugin -->
<script src="<%=path %>/managePlugin/js/jquery.raty.min.js"></script>
<!-- for iOS style toggle switch -->
<script src="<%=path %>/managePlugin/js/jquery.iphone.toggle.js"></script>
<!-- autogrowing textarea plugin -->
<script src="<%=path %>/managePlugin/js/jquery.autogrow-textarea.js"></script>
<!-- multiple file upload plugin -->
<script src="<%=path %>/managePlugin/js/jquery.uploadify-3.1.min.js"></script>
<!-- history.js for cross-browser state change on ajax -->
<script src="<%=path %>/managePlugin/js/jquery.history.js"></script>
<!-- application script for Charisma demo -->
<script src="<%=path %>/managePlugin/js/charisma.js"></script>
<script type="text/javascript" src="<%=path %>/bootstrap/dist/js/bootstrapValidator.js"></script>
<script src="<%=path %>/js/adminLogin.js"></script>

</body>
</html>