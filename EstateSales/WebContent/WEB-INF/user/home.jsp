<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="<%=path%>/UsersPlugin/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="<%=path%>/UsersPlugin/assets/img/favicon.png">
	<link rel="stylesheet" href="<%=path %>/bootstrap/dist/css/bootstrapValidator.min.css"/>
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>用户中心</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <link href="<%=path%>/UsersPlugin/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="<%=path%>/UsersPlugin/assets/css/animate.min.css" rel="stylesheet"/>
    <link href="<%=path%>/UsersPlugin/assets/css/paper-dashboard.css" rel="stylesheet"/>
   <link href="<%=path%>/UsersPlugin/assets/css/demo.css" rel="stylesheet" />
    <link href="<%=path%>/UsersPlugin/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
   <!-- <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>-->
    <link href="<%=path%>/UsersPlugin/assets/css/themify-icons.css" rel="stylesheet">
    <!-- 图片上传 -->
    <link rel="stylesheet" type="text/css" href="<%=path%>/logoUpload/css/default.css">
    <link href="<%=path%>/logoUpload/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
	
</head>
<body>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">更换头像</h4>
	      </div>
	      <div class="modal-body">
	       	<form  enctype="multipart/form-data">
        		<label>请选择头像</label>
        		<input id="headicon" name="headicon" type="file">
    		</form> 
	      </div>
	      <div class="modal-footer">
       		 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	      </div>
	    </div>
	  </div>
	</div>
 <div class="wrapper">
	<div class="sidebar" data-background-color="white" data-active-color="danger">

    <!--
		Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
		Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
	-->

    	<div class="sidebar-wrapper">
            <div class="logo">
               <h2><strong style="color:#aaa;"> 个人信息</strong></h2>
             </div>

            <ul class="nav">
				 <li class="active">
                    <a href="<%=path%>/user/homePage">
                        <i class="ti-user"></i>
                        <p>用户资料</p>
                    </a>
                </li>
                <li>
                    <a href="<%=path%>/user/changePwdPage">
                        <i class="ti-settings"></i>
                        <p>修改密码</p>
                    </a>
                </li>
               
                <li>
                    <a href="table.html">
                        <i class="ti-check-box"></i>
                        <p>已预约信息</p>
                    </a>
                </li>
                <li>
                    <a href="typography.html">
                        <i class="ti-pencil-alt"></i>
                        <p>修改预约信息</p>
                    </a>
                </li>
				 <li>
                    <a href="typography.html">
                        <i class="ti-trash"></i>
                        <p>取消预约</p>
                    </a>
                </li>
                <li>
                    <a href="icons.html">
                        <i class="ti-list"></i>
                        <p>预约历史记录</p>
                    </a>
                </li>
                <li>
                   <a href="<%=path%>/history/listPage">
                       <i class="ti-menu"></i>
                        <p>浏览楼盘纪录</p>
                    </a>
                </li>
				 <li>
                    <a href="maps.html">
                        <i class="ti-menu-alt"></i>
                        <p>已购房纪录</p>
                    </a>
                </li>
                <li>
                    <a href="notifications.html">
                        <i class="ti-comment"></i>
                        <p>我的评价</p>
                    </a>
                </li>
				 <li>
                    <a href="notifications.html">
                        <i class="ti-themify-favicon"></i>
                        <p>我的留言</p>
                    </a>
                </li>
            </ul>
    	</div>
    </div>

    <div class="main-panel">
		<nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar bar1"></span>
                        <span class="icon-bar bar2"></span>
                        <span class="icon-bar bar3"></span>
                    </button>
                    <a class="navbar-brand" href="#">用户资料</a>
                </div>
                <div class="collapse navbar-collapse">
                   <ul class="nav navbar-nav navbar-right">
                        <li>
                           <a href="/EstateSales/index.jsp" style="color:red;"><i class="ti-home">&nbsp;返回首页 </i></a>
                        </li>
                        <li class="dropdown">
                              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="ti-settings"></i>
                                 		<p>个人设置</p>
									<b class="caret"></b>
                              </a>
                              <ul class="dropdown-menu">
                                <li><a href="<%=path%>/user/changePwdPage">修改密码</a></li>
                                <li><a href="#">退出登录</a></li>
                              </ul>
                        </li>
						
                    </ul>

                </div>
            </div>
        </nav>


        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-4 col-md-5">
                        <div class="card card-user">
                            <div class="image">
                                <img src="<%=path%>/UsersPlugin/assets/img/background.jpg"  alt="..."/>
                            </div>
                            <div class="content">
                                <div class="author">
                                  <a href="#myModal" data-toggle="modal" data-target="#myModal" > 	
							          <img id="logoImg"  class="avatar border-white" src="${session.user.headicon}" class="img-responsive img-circle" alt="还没有头像">
						           </a>
				                  <h4 style="color:#aaa;text-align: center;"class="title">${session.user.nickname}</h4>
                                </div>
                                <br/>
                                	<ul>
		                                <li><span>用户名称:</span> ${session.user.name}</li>
		
										<li><span>出生日期:</span> ${session.user.birthday}</li>
										 
										 <li><span>性别:</span>${session.user.gender}</li>
			
										<li><span>手机号码:</span>${session.user.phone}</li>
			
										<li><span>QQ号码</span>${session.user.qq}</li>
										
										<li><span>微信号:</span>${session.user.wechat}</li>
			
										<li><span>Email:</span>${session.user.email}</li>
			
			
										<li><span>家庭住址:</span>${session.user.address}</li>
			
									</ul>
	                            </div>
                            <hr>
                            
                        </div>
                        <div class="card">
                            <div class="header">
                                <h4 class="title">兴趣爱好/简介</h4>
                            </div>
                            <div class="content">
                              ${session.user.introduction}
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-7">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">修改资料</h4>
                            </div>
                            <div class="content">
                             	<form action="<%=path%>/user/update" id="defaultForm" method="post">
						      	    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>用户名称</label>
                                                <input type="text" class="form-control border-input" name="user.name" value="${session.user.name}">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>我的昵称</label>
                                                <input type="text" class="form-control border-input" name="user.nickname" value="${session.user.nickname}">
                                            </div>
                                        </div>
                                    </div>
                                     <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>性别</label>
                                                <s:if test='#session.user.gender=="男"'>
                                                	<label class="radio-inline">
												  		<input type="radio" name="user.gender"  checked value="男">男
													</label>
													<label class="radio-inline">
												 	 	<input type="radio" name="user.gender"  value="女">女
													</label>
                                                </s:if>
                                                <s:else>
                                                	<label class="radio-inline">
												  		<input type="radio" name="user.gender" value="男" >男
													</label>
													<label class="radio-inline">
												 	 	<input type="radio" name="user.gender"  value="女" checked value="女">女
													</label>
                                                </s:else>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="col-md-2">生日</label>
                                               
			                                       <input type="date" class="form-control border-input" name="user.birthday" value="${session.user.birthday}">
                                         
											</div>
                                        </div>
                                    </div>

                                   <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>手机号码</label>
                                                <input type="text" class="form-control border-input" name="user.phone" value="${session.user.phone}">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>QQ号码</label>
                                                <input type="text" class="form-control border-input" name="user.qq" value="${session.user.qq}" >
                                            </div>
                                        </div>
                                    </div>
                                       <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>微信号</label>
                                                <input type="text" class="form-control border-input" name="user.wechat" value="${session.user.wechat}">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Email</label>
                                                <input type="text" class="form-control border-input" name="user.email" value="${session.user.email}">
                                            </div>
                                        </div>
                                    </div>
                                
                                      <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>家庭住址</label>
                                                <input type="text" class="form-control border-input" name="user.address" value="${session.user.address}">
                                            </div>
                                        </div>
                                    </div>
									    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>兴趣爱好/简介</label>
                                                <textarea class="form-control border-input" name="user.introduction" rows="3" cols="">${session.user.introduction}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text-center">
                                        <button type="submit" class="btn btn-info btn-fill btn-wd">保存修改</button>
                                    </div>
                                    <div class="clearfix"></div>
                                </form>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>


        <footer class="footer">
            <div class="container-fluid">
                <nav class="pull-left">
                    <ul>

                        <li>
                            <a href="#">
                                Creative Tim
                            </a>
                        </li>
                        <li>
                            <a href="http://blog.creative-tim.com">
                               Blog
                            </a>
                        </li>
                        <li>
                            <a href="#/license">
                                Licenses
                            </a>
                        </li>
                    </ul>
                </nav>
				<div class="copyright pull-right">
                    &copy; <script>document.write(new Date().getFullYear())</script>, made with <i class="fa fa-heart heart"></i> by <a href="#">Creative Tim</a>. More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
                </div>
            </div>
        </footer>

    </div>
</div>


</body>

    <!--   Core JS Files   -->
    <script src="<%=path%>/UsersPlugin/assets/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="<%=path%>/UsersPlugin/assets/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="<%=path%>/UsersPlugin/assets/js/bootstrap-checkbox-radio.js"></script>

	<!--  Charts Plugin -->
	<script src="<%=path%>/UsersPlugin/assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="<%=path%>/UsersPlugin/assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
   <!-- <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>  -->

    <!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="<%=path%>/UsersPlugin/assets/js/paper-dashboard.js"></script>

	<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="<%=path%>/UsersPlugin/assets/js/demo.js"></script>
	<script type="text/javascript" src="<%=path %>/bootstrap/dist/js/bootstrapValidator.min.js"></script>                               
	<script type="text/javascript" src="<%=path%>/js/user.js"></script>
    <!-- 图片上传 -->
    <script src="<%=path%>/logoUpload/js/fileinput.js" type="text/javascript"></script>
    <!--简体中文-->
    <script src="<%=path%>/logoUpload/js/locales/zh.js" type="text/javascript"></script>
	<!-- 上传图片 -->
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
		$("#logoImg").attr('src',imgSrc)
 	})
 });
</script>
</html>
