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
<title>管理员登陆</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
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
    <link href='<%=path %>/managePlugin/css/jquery.noty.css' rel='stylesheet'>
    <link href='<%=path %>/managePlugin/css/noty_theme_default.css' rel='stylesheet'>
    <link href='<%=path %>/managePlugin/css/elfinder.min.css' rel='stylesheet'>
    <link href='<%=path %>/managePlugin/css/elfinder.theme.css' rel='stylesheet'>
    <link href='<%=path %>/managePlugin/css/jquery.iphone.toggle.css' rel='stylesheet'>
    <link href='<%=path %>/managePlugin/css/uploadify.css' rel='stylesheet'>
    <link href='<%=path %>/managePlugin/css/animate.min.css' rel='stylesheet'>
	<link rel="stylesheet" href="<%=path %>/bootstrap/vendor/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%=path %>/bootstrap/dist/css/bootstrapValidator.css"/>
    <!-- jQuery -->
    <script src="<%=path %>/managePluginbower_components/jquery/jquery.min.js"></script>
    <link rel="shortcut icon" href="<%=path %>/managePluginimg/favicon.ico">
</head>

<body background="<%=path %>/agency/agencyLoginJS/images/bg.jpg" >
<div class="ch-container">
    <div class="row">
        
    <div class="row">
        <div class="col-md-12 center login-header">
            <h2 style="color: white;">欢迎您登陆管理员后台</h2>
        </div>
        <!--/span-->
    </div><!--/row-->

    <div class="row">
        <div class="well col-md-5 center login-box">
               <s:if test="#request.msg==null">
		            <div class="alert alert-info">请输入密码和账号</div>
		       </s:if>
		       <s:else>
		       	<div class="alert alert-danger"><span>${msg }</span></div>
		       </s:else>
            <form class="form-horizontal" id="from1" action="<%=path %>/admin/login" method="post">
                <fieldset>
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user red"></i></span>
                        <input type="text" class="form-control" name="admin.adminName" placeholder="请输入账号" autofocus>
                    </div>
                    <div class="clearfix"></div><br>

                    <div class="input-group input-group-lg">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock red"></i></span>
                        <input type="password" class="form-control" name="admin.adminPwd" placeholder="请输入密码">
                    </div>
                    <div class="clearfix"></div>
                    <p class="center col-md-5">
                        <button type="submit" class="btn btn-primary"> 登&nbsp;陆 </button>
                    </p>
                </fieldset>
            </form>
        </div>
        <!--/span-->
    </div><!--/row-->
</div><!--/fluid-row-->

</div><!--/.fluid-container-->

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
<script type="text/javascript" src="<%=path %>/bootstrap/vendor/jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="<%=path %>/bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path %>/bootstrap/dist/js/bootstrapValidator.js"></script>
<script src="<%=path %>/js/adminLogin.js"></script>

</body>
</html>