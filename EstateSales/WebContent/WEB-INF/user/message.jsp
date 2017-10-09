<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="<%=path%>/UsersPlugin/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="<%=path%>/UsersPlugin/assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>用户中心</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS -->   
    <link href="<%=path%>/UsersPlugin/assets/css/bootstrap.min.css" rel="stylesheet" />
	 
    <!-- Animation library for notifications   -->
    <link href="<%=path%>/UsersPlugin/assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Paper Dashboard core CSS    -->
    <link href="<%=path%>/UsersPlugin/assets/css/paper-dashboard.css" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="<%=path%>/UsersPlugin/assets/css/demo.css" rel="stylesheet" />

    <!--  Fonts and icons     -->
    <link href="<%=path%>/UsersPlugin/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!--  <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>-->
    <link href="<%=path%>/UsersPlugin/assets/css/themify-icons.css" rel="stylesheet">  
	<link rel="stylesheet" href="<%=path %>/bootstrap/dist/css/bootstrapValidator.min.css"/>
	<!--<script type="text/javascript" src="<%=path%>/js/user.js"></script>-->                               
	<link href="<%=path%>/toastr/toastr.min.css" rel="stylesheet">
</head>
<body onload="msg()">

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
				 <li>
                    <a href="<%=path%>/user/homePage">
                        <i class="ti-user"></i>
                        <p>用户资料</p>
                    </a>
                </li>
                <li class="active">
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
                    <a class="navbar-brand" href="#">修改密码</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                           <a href="/EstateSales/index.jsp" style="color:red;"> <i class="ti-home">&nbsp;返回首页</i></a>
                        </li>
                        <li class="dropdown">
                              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="ti-settings"></i>
                                 		<p>个人设置</p>
									<b class="caret"></b>
                              </a>
                              <ul class="dropdown-menu">
                                <li><a href="../user/changePwdPage">修改密码</a></li>
                                <li><a href="../user/exit">退出登录</a></li>
                              </ul>
                        </li>
						
                    </ul>

                </div>
            </div>
        </nav>


        <div class="content">
            <div class="container-fluid">
                <div class="row">
                     <div class="col-lg-12 col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">修改密码</h4>
                            </div>
                            <div class="content">
                             	<form action="<%=path%>/user/changePwd" id="changePwd" class= "form-group" method="post">
							        <div class="row">
                                        <div class="col-md-8 col-md-offset-2">
                                            <div class="form-group">
                                                <label for="pwd">旧密码</label>
                                                <input type="password" class="form-control border-input" name="user.pwd" id="pwd" placeholder="请输入旧密码">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-8 col-md-offset-2">
                                            <div class="form-group">
                                                <label for="qq">新密码</label>
                                                <input type="password" class="form-control border-input" name="user.qq" id="qq" placeholder="请输入新密码">
                                            </div>
                                        </div>
                                    </div>
									<div class="row">
                                        <div class="col-md-8 col-md-offset-2">
                                            <div class="form-group">
                                                <label for="confirmPassword">确认密码</label>
                                                <input type="password" class="form-control border-input" name="confirmPassword" id="confirmPassword" placeholder="确认新密码">
                                            </div>
                                        </div>
                                    </div>
                                   
                                    
                                    <div class="text-center">
                                        <button type="submit" class="btn btn-info btn-fill btn-wd" value="更换密码">更换密码</button>
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
	<script type="text/javascript" src="<%=path %>/bootstrap/dist/js/bootstrapValidator.min.js"></script>
	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="<%=path%>/UsersPlugin/assets/js/bootstrap-checkbox-radio.js"></script>

	<!--  Charts Plugin -->
	<script src="<%=path%>/UsersPlugin/assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="<%=path%>/UsersPlugin/assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin  
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>
	  -->
    <!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="<%=path%>/UsersPlugin/assets/js/paper-dashboard.js"></script>

	<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="<%=path%>/UsersPlugin/assets/js/demo.js"></script>
	<script src="<%=path%>/toastr/toastr.min.js"></script>
	<script src="<%=path%>/js/toastrOption.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
	    $('#changePwd').bootstrapValidator({
	        message: 'This value is not valid',
	        feedbackIcons: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {         
	            'user.pwd': {
	                validators: {
	                    notEmpty: {
	                        message: '旧密码不能为空'
	                    },                  
	                }
	            },
	            'user.qq': {
	                validators: {
	                    notEmpty: {
	                        message: '新密码不能为空'
	                    },
	                   
	                }
	            },
	            confirmPassword: {
	                validators: {
	                    notEmpty: {
	                        message: '确认密码不能为空'
	                    },
	                    identical: {
	                        field: 'user.qq',
	                        message: '两次输入的密码不一致'
	                    }
	                }
	            }	           
	        }
	    });
	});
	function msg(){
		var msg='${msg}'
		if(msg!=''){
			toastr.error(msg);
		}
	}
	</script>	
</html>
