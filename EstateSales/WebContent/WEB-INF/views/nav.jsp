<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  	<div id="page-loader">
    <div class="loaders">
        <img src="${pageContext.request.contextPath }/model/assets/images/loader/3.gif" alt="First Loader">
        <img src="${pageContext.request.contextPath }/model/assets/images/loader/4.gif" alt="First Loader">
    </div>
</div>
<header id="site-header" class="navbar-fixed-top">
    <div id="site-header-top">
        <div class="container">
            <div class="row">
				
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <figure id="site-logo">
                    <a href="index.html">
                    <img src="${pageContext.request.contextPath }/model/assets/images/logo.png" alt="Logo"></a>
                </figure>
            </div>
            <div class="col-md-6 col-sm-8">
                <nav id="site-nav" class="nav navbar-default">
                    <ul class="nav navbar-nav" style="font-family:微软雅黑;font-size:22px">
                        <li><a href="${pageContext.request.contextPath }/">首页</a></li>
                        <li><a href="${pageContext.request.contextPath }/buildings/pagebuild">热销楼盘</a></li>
                        <li><a href="${pageContext.request.contextPath }/house/allHouseList">热门户型</a></li>
                        <li><a href="${pageContext.request.contextPath }/admin/allArticleList">最新资讯</a></li>
                        <li>
                        	<a href="#" class="dropdown-toggle" data-toggle="dropdown"> 经销商</a>
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath }/agency/agency_enter.jsp" target="_blank"><i class="fa fa-sign-in" aria-hidden="true"></i> 入驻</a></li>
								<li><a href="${pageContext.request.contextPath }/agency/agencyLogin.jsp" target="_blank"><i class="fa fa-address-book-o" aria-hidden="true"></i> 登录</a></li>
								<li><a href="${pageContext.request.contextPath }/empLogin.jsp" target="_blank"><i class="fa fa-bookmark-o" aria-hidden="true"></i> 员工登录</a></li>
							</ul>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="col-md-3 col-sm-4">
                <div class="contact-in-header clearfix">
                    <i class="fa fa-mobile"></i>
                    <span id="userhome">
                    	<c:if test="${session.user==null}">
                       	<button data-toggle="modal" data-target="#login" class="btn btn-default">登录</button>
                        <button data-toggle="modal" data-target="#register" class="btn btn-default">注册</button>
                        </c:if>
                        <c:if test="${session.user!=null}">
                        <a href="${pageContext.request.contextPath }/user/home" class="btn btn-default" type="button">个人中心</a>
                        <a href="${pageContext.request.contextPath }/user/exit" class="btn btn-default">退出</a>
                        </c:if>  
                    </span>
                    <br>
                    <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2908903432&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:2908903432:51" alt="联系客服" title="联系客服"/></a>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- 登录注册模态框开始 -->
	<div id="register" class="modal fade" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-title">
					<h2 class="text-center">注 册</h2>
				</div>
				<div class="modal-body">
					<form class="form-group" id="defaultForm"  method="post"
						action="${pageContext.request.contextPath }/user/register">
						<div class="form-group">
							<label for="name">用户名</label>
							<input class="form-control" type="text" name="user.name" placeholder="请输入真实的姓名">
						</div>
						<div class="form-group">
							<label for="pwd">登录密码</label> 
							<input class="form-control"type="password" name="user.pwd" placeholder="至少6位字母或数字">
						</div>
						<div class="form-group">
							<label for="confirmPassword">再次输入密码</label> 
							<input class="form-control" type="password" name="confirmPassword" id="confirmPassword" placeholder="至少6位字母或数字">
						</div>
						<div class="form-group">
							<label for="phone">手机号码</label>
							 <input type="text"
								class="form-control" name="user.phone" id="phone" oninput="isPhone()" placeholder="请输入手机号码"/>
							 <div id="tip1">
							 <a href="javascript:void(0);" onclick="sendYzm();"><label >发送验证码</label></a>
							 </div>
						</div>
						<div class="form-group">
							<label for="yzm">验证码</label> 
							<input type="text" oninput="checkYzm();" class="form-control"  name="yzm" id="yzm" required="required" placeholder="请输入验证码"/>
							<small id="tip"></small>
						</div>

						<div class="text-right">
							<button id="sub" class="btn btn-primary" type="submit">提交</button>
							<button class="btn btn-danger" data-dismiss="modal">取消</button>
						</div>
						<a href="" data-toggle="modal" data-dismiss="modal"
							data-target="#login">已有账号？点我登录</a>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 登录窗口 -->
	<div id="login" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-title">
					<h2 class="text-center">登 录</h2>
				</div>
				<div class="modal-body">
						<form class="form-group" id="f1"  method="post"
						action="${pageContext.request.contextPath }/user/login">
			
						<div class="form-group">
							<label for="phone">手机号码</label>
							<input class="form-control" type="tel" name="user.phone"  value="${user.phone}"  id="loginPhone" required="required" placeholder="请输入手机号码">
						</div>
						<div class="form-group">
							<label for="pwd">登录密码</label>
							<input class="form-control" name="user.pwd" id="loginPwd"  type="password" required="required" placeholder="请输入登录密码">
						</div>
							<div class="text-right">
							<a class="btn btn-primary" onclick="checkLogin()">登录</a>
							<button class="btn btn-danger" data-dismiss="modal">取消</button>
						</div>
							<a href="${pageContext.request.contextPath }/UsersView/forget.jsp" target="_blank" >忘记密码</a>					
					</form>
				</div>
			</div>
		</div>
	</div>
<!-- 登录注册模态框结束 -->
<script type="text/javascript">
function showNotice() {   
    Notification.requestPermission(function (perm) {  
        if (perm == "granted") {  
            var notification = new Notification("这是一个通知撒:", {  
                dir: "auto",  
                lang: "hi",  
                tag: "testTag",  
                icon: "https://static.cnblogs.com/images/adminlogo.gif",  
                body: "通知content"  
            });  
        }  
    })  
}  
</script>

<script type="text/javascript">
		var webSocket = 
			new WebSocket('ws://localhost:8080/EstateSales/websocket');

		webSocket.onerror = function(event) {
			onError(event)
			console.log(event);
		};

		webSocket.onopen = function(event) {
			onOpen(event)
			//start();
		};
		webSocket.onclose=function(event){
			//alert("连接已关闭");
		}
		webSocket.onmessage = function(event) {
			onMessage(event)
		};

		function onMessage(event) {
			alert(event.data);
			 setMessageInnerHTML(event.data); 
		}

		function onOpen(event) {
			document.getElementById('messages').innerHTML 
				= 'Connection established';
		}

		function onError(event) {
			alert(event.data);
		}

		function start() {
			webSocket.send('hello');
			return false;
		}
	</script>
	
	