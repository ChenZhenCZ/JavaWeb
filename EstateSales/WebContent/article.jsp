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
<title>Insert title here</title>
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
    <div class="navbar navbar-default" role="navigation">

        <div class="navbar-inner">
            <button type="button" class="navbar-toggle pull-left animated flip">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.html"> <img alt="Charisma Logo" src="<%=path %>/managePlugin/img/logo20.png" class="hidden-xs"/>
                <span>admin</span></a>

            <!-- user dropdown starts -->
            <div class="btn-group pull-right">
                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    <i class="glyphicon glyphicon-user"></i><span class="hidden-sm hidden-xs"> admin</span>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li><a href="#">Profile</a></li>
                    <li class="divider"></li>
                    <li><a href="login.html">Logout</a></li>
                </ul>
            </div>
            <!-- user dropdown ends -->

            <!-- theme selector starts -->
            <div class="btn-group pull-right theme-container animated tada">
                <img src="<%=path%>/2.jpg">
            </div>
            <!-- theme selector ends -->

            <ul class="collapse navbar-collapse nav navbar-nav top-menu">
                <li><a href="#"><i class="glyphicon glyphicon-globe"></i>参观地点</a></li>
                <li class="dropdown">
                    <a href="#" data-toggle="dropdown"><i class="glyphicon glyphicon-star"></i>下拉菜单 <span
                            class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">活动</a></li>
                        <li><a href="#">另一个动作</a></li>
                        <li><a href="#">别的东西在这里</a></li>
                        <li class="divider"></li>
                        <li><a href="#">分离的链接</a></li>
                        <li class="divider"></li>
                        <li><a href="#">一个分离的链接</a></li>
                    </ul>
                </li>
                <li>
                    <form class="navbar-search pull-left">
                        <input placeholder="Search" class="search-query form-control col-md-10" name="query"
                               type="text">
                    </form>
                </li>
            </ul>

        </div>
    </div>
    <!-- topbar ends -->
		<div class="ch-container">
			</div>
			<!-- left menu starts -->
			<div class="col-sm-2 col-lg-2">
				<div class="sidebar-nav">
					<div class="nav-canvas">
						<div class="nav-sm nav nav-stacked"></div>
						<ul class="nav nav-pills nav-stacked main-menu">
							<li class="nav-header">
								<div>
									<img src="/EstateSales/attached/logo//97682579822389.jpg"
										class="img-responsive img-circle" alt="...">
								</div>
							</li>
							<li><a class="ajax-link" href="index.html"><i
									class="glyphicon glyphicon-home"></i><span> 信息中心</span></a></li>
							<li class="accordion"><a href="#"><i
									class="glyphicon glyphicon-edit"></i><span>文章管理</span></a>
								<ul class="nav nav-pills nav-stacked">
									<li><a href="<%=path%>/articleType.jsp">类别新增</a></li>
									<li><a href="#">文章新增</a></li>
									<li><a href="#">文章管理</a></li>
								</ul></li>
							<li><a class="ajax-link" href="form.html"><i
									class="glyphicon glyphicon-plus"></i><span>活动管理</span></a></li>
							<li><a class="ajax-link" href="chart.html"><i
									class="glyphicon glyphicon-list-alt"></i><span> 广告管理</span></a></li>
							<li><a class="ajax-link" href="typography.html"><i
									class="glyphicon glyphicon-font"></i><span> 信息推送</span></a></li>
							<li><a class="ajax-link" href="gallery.html"><i
									class="glyphicon glyphicon-picture"></i><span>活动管理</span></a></li>
						</ul>
					</div>
				</div>
			</div>
			<!--/span-->
			<!-- left menu ends -->


		<div id="content" class="col-lg-10 col-sm-10">
			<!-- content starts -->
			<a target="_blank" href="http://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&email=aQ8GG0QdGxwMKRgYRwoGBA" style="text-decoration:none;">
				<img src="http://rescdn.qqmail.com/zh_CN/htmledition/images/function/qm_open/ico_mailme_12.png"/>
			</a>
			
			<form class="form-horizontal" name="form1" action="<%=path %>/admin/articleAdd" id="newsform"
				method="post" enctype="multipart/form-data">
				<div class="form-group">
	    			<label  class="col-sm-2 control-label" >文章类别</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<select>
	   			   			<s:iterator var="t" value="#rows">
	   			   				<option value="${t.id }" >${t.name }</option>
	   			   			</s:iterator>
	   			   		</select>
	   			 	</div>
  				</div>
				<div class="form-group">
	    			<label  class="col-sm-2 control-label" >文章标题</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<input type="text" class="form-control" name="article.title" placeholder="请填写文章标题">
	   			 	</div>
  				</div>
				<div class="form-group">
	    			<label  class="col-sm-2 control-label" >文章描述</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<input type="text" class="form-control" name="article.abstracts" placeholder="请填写文章描述">
	   			 	</div>
  				</div>
				<div class="form-group">
	    			<label  class="col-sm-2 control-label" >文章图标</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<input type="file" id="logo"  class="form-control" name="logo" >
	   			 	</div>
  				</div>
					<div class="form-group">
						<div class="col-md-6 col-sm-6 col-xs-12">
							<textarea name="article.content" class="form-control"  id="msgContent" ></textarea>
						</div>
					</div>
				<div class="form-group">
	    			<label class="col-sm-2 control-label" >文章序号</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<input type="number" class="form-control" name="article.orderBy" placeholder="请填写文章序号">
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
<script type="text/javascript">
(function(){
var p = {
url:location.href,
to:'qqmail',
desc:'', /*默认分享理由(可选)*/
summary:'',/*摘要(可选)*/
title:'',/*分享标题(可选)*/
site:'',/*分享来源 如：腾讯网(可选)*/
pics:'' /*分享图片的路径(可选)*/
};
var s = [];
for(var i in p){
s.push(i + '=' + encodeURIComponent(p[i]||''));
}
document.write(["<a target='_blank' ", 'href="http://mail.qq.com/cgi-bin/qm_share?', s.join("&"), '"', ' style="cursor:pointer;text-decoration:none;outline:none"><img src="http://rescdn.qqmail.com/zh_CN/htmledition/images/function/qm_open/ico_share_02.png"/></a>'].join(""));
})();
$('#').fileinput({
    language: 'zh',
    uploadUrl: '<%=path%>/admin/articleAdd',
    allowedFileExtensions : ['jpg', 'png','gif'],
});
</script>
</body>
</html>