<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>     
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
   	
    <meta charset="utf-8">
    <title>经销商登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
    <meta name="author" content="Muhammad Usman">

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
    <script src="<%=path %>/managePlugin/bower_components/jquery/jquery.min.js"></script>
	
    <link rel="shortcut icon" href="img/favicon.ico">

</head>

<body>
<div class="ch-container">
    <div class="row">
        <div class="col-md-12 center login-header">
            <h2>密码找回</h2>
        </div>
        <!--/span-->
    </div><!--/row-->

    <div class="row">
        <div class="well col-md-5 center login-box">
        	<div class="alert alert-info">
               	<s:if test="#request.msg==null">请输您的手机号码</s:if><s:else>您的密码已经发送至您的手机</s:else>
            </div>
            <form id="agencyLogin" class="form-horizontal" action="<%=path%>/agency/forgetPwd" method="post">
                <fieldset>
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-phone red"></i></span>
                        <input type="text" class="form-control" placeholder="请输入您的手机号码" name="agencyVo.phone">
                    </div>
                    <div class="clearfix"></div><br/>
                    <p class="center col-md-5">
                        <button type="submit" class="btn btn-primary">确认</button>
                    </p>
                </fieldset>
            </form>
        </div>
        <!--/span-->
    </div><!--/row-->
</div><!--/fluid-row-->

</div><!--/.fluid-container-->

<!-- external javascript -->

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
<script type="text/javascript" src="<%=path %>/js/agencyLogin.js"></script>

</body>
</html>
    