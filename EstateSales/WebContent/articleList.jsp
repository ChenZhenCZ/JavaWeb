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
<title>文章管理</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="author" content="Muhammad Usman">

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
    <link rel="stylesheet" href="<%=path %>/bootstrap/dist/css/bootstrapValidator.css"/>
    <!-- jQuery -->
    <script src="<%=path %>/managePlugin/bower_components/jquery/jquery.min.js"></script>
    <link rel="shortcut icon" href="<%=path %>/managePlugin/img/favicon.ico">
	<link href="<%=path%>/bootstrap/bootstrap-table.css" rel="stylesheet"/> 
	<link href="<%=path%>/toastr/toastr.min.css" rel="stylesheet"/> 
</head>

<body>
	<!-- 编辑模态框-->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">修改文章类别</h4>
	      </div>
	      <div class="modal-body">
	       	<form id="f" >
	       		<input type="hidden" name="articleType.id">
        		<label>文章类别名称</label>
        		<input name="articleType.name" type="text"> 
        		<label>文章类别描述</label>
        		<input type="text" name="articleType.des" >
    		</form> 
	      </div>
	      <div class="modal-footer">
       		 <button type="button" class="btn btn-success" id="update" >修改</button>
	      </div>
	    </div>
	  </div>
	</div>
<!-- 编辑模态框结束 -->
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
                <span>${admin.adminName}</span></a>

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
                <img src="">
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
    <div class="row">
        
        <!-- left menu starts -->
        <%@ include file="./WEB-INF/admin/leftMenu.jsp" %>
        <!--/span-->
        <!-- left menu ends -->
				<div id="content" class="col-lg-10 col-sm-10">
					<!-- content starts -->
					<div>
						<ul class="breadcrumb">
							<li><a href="#">首页</a></li>
							<li><a href="#">文章类别管理</a></li>
						</ul>
					</div>

					<div class="row">
						<div class="col-xs-6 pull-right">
							<div class="input-group">
								<input type="text" class=" form-control" name="name"
									placeholder="请输入名称"> <span class="input-group-btn">
									<button class="btn btn-default search" type="button">Go!</button>
								</span>
							</div>
						</div>
						<!-- 表格 -->
						<div id="toolbar" class="btn-group">
					         <button id="edit" type="button" class="btn btn-success" >
					             <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>编辑
					         </button>
					         <button id="delete" type="button" class="btn btn-danger">
					             <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
					         </button>
				    	 </div>
						<div class="col-xs-12">
							<table id="tb" class="table  table-hover" data-toggle="table" 
								data-url="<%=path %>/admin/articleList" data-pagination="true" data-striped="true"
							>
								<thead>
									<tr>
										<th data-radio="true"></th>
										<th data-field="title" >标题</th>
										<th data-field="logo"  data-formatter="logoFormatter">图标</th>
										<th data-field="abstracts">描述</th>
										<th data-field="articleType.name">类型</th>
										<th data-field="orderBy">序号</th>
										<th data-field="created_time">创建日期</th>
										<th data-field="msg_status">状态</th>
										<th data-formatter="operaFormatter" >操作</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
					<!--/row-->
				</div>

			</div><!--/.fluid-container-->
</div>
<!-- external javascript -->

<script src="<%=path%>/managePlugin/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

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
<script src="<%=path%>/bootstrap/bootstrap-table.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-locale-all.min.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-zh-CN.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-export.js"></script>
<script src="<%=path%>/bootstrap/tableExport.js"></script>
<script src="<%=path %>/toastr/toastr.min.js"></script>
<script src="<%=path %>/js/article.js"></script>
<script src="<%=path %>/js/toastrOption.js"></script>
<script src="<%=path %>/js/formFill.js"></script>
</body>
</html>