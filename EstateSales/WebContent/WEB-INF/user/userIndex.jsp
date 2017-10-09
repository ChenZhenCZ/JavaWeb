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
<title>用户首页</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="author" content="Muhammad Usman">
	<%@include file="../xsl/JsAndCss.jsp" %> 	
 	<!-- jQuery消息提示框 -->
	<link rel="stylesheet" href="<%=path%>/toastr/toastr.min.css">
    <link href="<%=path%>/plugins/bootstrap/bootstrap.min.css" rel="stylesheet">
	<link href="<%=path%>/bootstrap/bootstrap-table.css" rel="stylesheet"/> 
    <!-- The styles -->
    <style type="text/css">
	   .list {
			list-style:none;
			font-size:20px;
			font-weight:none;
			color:#708090;
		}
		.list span{
			color:#778899;
			font-weight:bold;
		}
		.list li{
			margin-top:10px;
		}
		h3{
			color:#778899; font-weight: bold;
		}
		.introduction{
			color:#708090; font-size:20px;
		}
    </style>
</head>

<body>
	
	<div>
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
                <span>用户中心</span></a>

            <!-- user dropdown starts -->
            <div class="btn-group pull-right">
                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    <i class="glyphicon glyphicon-user"></i><span class="hidden-sm hidden-xs">&nbsp;&nbsp;${session.user.name}</span>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li><a href="../user/changePwdPage">修改密码</a></li>
                    <li class="divider"></li>
                    <li><a href="../user/exit">退出登录</a></li>
                </ul>
            </div>
            <!-- user dropdown ends -->
        </div>
    </div>

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
	        <li>
	            <a href="../user/index">首页</a>
	        </li>
	        <li>
	            <a href="../user/home">用户中心</a>
	        </li>
       </ul>
	</div>

		<div class=" row">
		    <div class="col-md-3 col-sm-3 col-xs-6">
		        <a data-toggle="tooltip" title="${appointmentCount}条预约记录" class="well top-block" href="../appointment/userlistPage">
		            <i class="glyphicon glyphicon-grain blue"></i>
		            <div>预约信息</div>
		            <div>${appointmentCount}</div>
		        </a>
    		</div>
		    <div class="col-md-3 col-sm-3 col-xs-6">
	        <a data-toggle="tooltip" title="${historyCount}条浏览楼盘记录" class="well top-block" href="../history/list">
	            <i class="glyphicon glyphicon-list-alt yellow"></i>
	
	            <div>浏览楼盘记录</div>
	            <div>${historyCount}</div>
	          </a>
	    </div>
		
	    <div class="col-md-3 col-sm-3 col-xs-6">
	        <a data-toggle="tooltip" title="我点了${likeCount}赞" class="well top-block" href="../like/userlist">
	            <i class="glyphicon glyphicon-star green"></i>
	
	            <div>点赞</div>
	            <div>${likeCount}</div>
	        </a>
	    </div>

	
	    <div class="col-md-3 col-sm-3 col-xs-6">
	        <a data-toggle="tooltip" title="${commentcount}条评价" class="well top-block" href="../comment/userlist">
	            <i class="glyphicon glyphicon-comment red"></i>
	
	            <div>评价</div>
	            <div>${commentcount}</div>
	     	 </a>
	    </div>
</div>
<div class="row">
    <div class="box col-md-12">
        <div class="box-inner">
            <div class="box-header well">
                <h2><i class="glyphicon glyphicon-info-sign"></i>基本信息</h2>
            </div>
            <div class="box-content row">
                <div class=" col-md-12">
                	<div class="col-md-7">
	                   <ul class="list">
	                        <li><span>用户名称:</span> ${session.user.name}</li>
	
							<li><span>出生日期:</span> ${session.user.birthday}</li>
							 
							 <li><span>性别:</span>${session.user.gender}</li>
	
							<li><span>手机号码:</span>${session.user.phone}</li>
	
							<li><span>QQ号码:</span>${session.user.qq}</li>
							
							<li><span>微信号:</span>${session.user.wechat}</li>
	
							<li><span>Email:</span>${session.user.email}</li>
							
							<li><span>家庭住址:</span>${session.user.address}</li>		
		                 </ul>
					</div>
					<div class="col-md-5">
						<h3>兴趣爱好/简介</h3>
						  <div class="introduction">
						   	 ${session.user.introduction}
						  </div>
					</div>
					</div>
                </div>
			  </div>
            </div>
        </div>
    </div>
</div>

</div><!--/.fluid-container-->
</div>
<script>
$('#headicon').fileinput({
    language: 'zh',
    uploadUrl: '<%=path%>/user/uploadHeadicon',
    allowedFileExtensions : ['jpg', 'png','gif'],
})
var imgSrc="";
$('#headicon').on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功		
	imgSrc=data.response.user.headicon;
	$("#myModal").modal("toggle");
})
$(function () {
	$('#myModal').on('hide.bs.modal', function () {
		if(imgSrc!=""){
			$("#logoImg").attr('src',imgSrc)
		}
 	})
 });
</script>
</body>
</html>