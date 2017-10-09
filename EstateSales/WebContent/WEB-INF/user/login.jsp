<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <!-- 注册窗口 -->
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
							<input class="form-control" type="text" name="user.name"  placeholder="请输入真实的姓名">
						</div>
						<div class="form-group">
							<label for="pwd">登录密码</label> 
							<input class="form-control"type="password" name="user.pwd"  placeholder="至少6位字母或数字">
						</div>
						<div class="form-group">
							<label for="confirmPassword">再次输入密码</label> 
							<input class="form-control" type="password" name="confirmPassword" id="confirmPassword" placeholder="至少6位字母或数字">
						</div>
						<div class="form-group">
							<label for="phone">手机号码</label>
							 <input type="text"
								class="form-control" name="user.phone"  placeholder="请输入手机号码"/>
							 <div id="tip1">
							 <a href="javascript:void(0);" onclick="sendYzm();"><label >发送验证码</label></a>
							 </div>
						</div>
						<div class="form-group">
							<label for="yzm">验证码</label> 
							<input type="text" onblur="checkYzm();" class="form-control"  name="yzm" id="yzm" placeholder="请输入验证码"/>
							<small id="tip"></small>
						</div>

						<div class="text-right">
							<button class="btn btn-primary" type="submit">提交</button>
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
					<form class="form-group" id="login" method="post"
						action="${pageContext.request.contextPath }/user/login" onsubmit="return checkLogin()">
						<div class="form-group">
							<label for="phone">手机号码</label>
							<input class="form-control" type="tel" name="user.phone" value="${user.phone}"  id="phone" required="required" placeholder="请输入手机号码">
						</div>
						<div class="form-group">
							<label for="pwd">登录密码</label>
							<input class="form-control" name="user.pwd" id="pwd" value="${user.pwd}" type="password" required="required" placeholder="请输入登录密码">
						</div>
							<div class="text-right">
							<button class="btn btn-primary" type="submit">登录</button>
							<button class="btn btn-danger" data-dismiss="modal">取消</button>
						</div>
						<a href="" data-toggle="modal" data-dismiss="modal"
							data-target="#register">还没有账号？点我注册</a>
						<a href="${pageContext.request.contextPath }/UsersView/forget.jsp" target="_blank" >忘记密码</a>
					
					</form>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
function msg(){//登录错误，返回提示信息
	var msg='${msg}';
	if(msg!=''){
		toastr.error(msg);
	}
}
</script>
