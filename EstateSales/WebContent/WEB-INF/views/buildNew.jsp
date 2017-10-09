<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path= request.getContextPath();
    int a=0;
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>楼盘详情</title>
	<%@include file="modelCSS.jsp"%>
</head>
<body onload="msg()" style="padding-top: 70px; padding-bottom: 70px">
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
								class="form-control" name="user.phone" id="phone" placeholder="请输入手机号码"/>
							 <div id="tip1">
							 <a href="javascript:void(0);" onclick="sendYzm();"><label >发送验证码</label></a>
							 </div>
						</div>
						<div class="form-group">
							<label for="yzm">验证码</label> 
							<input type="text" oninput="checkYzm();" class="form-control"  name="yzm" id="yzm" placeholder="请输入验证码"/>
							<small id="tip"></small>
						</div>

						<div class="text-right">
							<button id="sub"  class="btn btn-primary" type="submit">提交</button>
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
							<input type="hidden" name="buildsId" value="${buildingsVO.id}">
						<div class="form-group">
							<label for="phone">手机号码</label>
							<input class="form-control" type="tel" name="user.phone"  value="${user.phone}"  id="loginPhone" required="required" placeholder="请输入手机号码">
						</div>
						<div class="form-group">
							<label for="pwd">登录密码</label>
							<input class="form-control" name="user.pwd" id="loginPwd"  type="password" required="required" placeholder="请输入登录密码">
						</div>
							<div class="text-right">
							<a class="btn btn-primary" onclick="checkLogin2()">登录</a>
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
<!-- 登录注册模态框结束 -->
	
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
                        <a href="${pageContext.request.contextPath}/user/home" class="btn btn-default" type="button">个人中心</a>
                        <a href="${pageContext.request.contextPath }/user/exit" class="btn btn-default" type="button">退出</a>
                        </c:if>
                    </span>
                    <br>
                    <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2908903432&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:2908903432:51" alt="联系客服" title="联系客服"/></a>
                </div>
            </div>
        </div>
    </div>
</header>
<br/><br/><br/><br/>
<div class="container">
	<div class="row">
		<div class="pull-right">
			<a href="<%=path %>/">&#9666;万达房产</a>
			><a href="<%=path %>/">&#9666;${buildingsVO.agency.name}</a>
			><a href="<%=path %>/buildings/onebuild?buildingsVO.id=${buildingsVO.id}">${buildingsVO.name}></a></div>
		<div class="pull-left col-md-6">
		<form class="form-inline col-md-offset-0" action="${pageContext.request.contextPath }/buildings/pagebuild" style="margin-bottom:20px;">
			<div class="form-group" style="margin-top:0px positon:relative">
			    <input type="text" name="find.sosuo" value="${find.sosuo}" class="form-control"  placeholder="请输入关键字（楼盘名/地名/房源类型等）">
			</div>
			<button type="submit" class="btn btn-default">搜索</button>
		</form>
		</div>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="pull-left">
		        <p class="pull-left"><img src="${buildingsVO.logo }" style="width:80px;height:80px">
		        	<span style="font-size:30px;font-family:Microsoft Yahei;padding:20px">${buildingsVO.name}</span>
		        </p>
	        </div>
			<div class="pull-right">
	 			<p><a href="#A">${buildingsVO.commentSet.size()}条点评</a>
	 			&nbsp;&nbsp;&nbsp;&nbsp;${buildingsVO.likeSet.size()}个人已点赞</p>
				<p>
				<a href="${pageContext.request.contextPath }/agency/agency_enter.jsp" class="btn btn-default" type="button">我是房企 申请入驻</a>
				</p>
	        </div>
       </div>
	</div>
</div>
<div id="tab_demo2" class="HuiTab">
	<div class="container">
	<div class="row" style="background:#ECECFF">
	  <div class="tabBar clearfix buildnav text-center col-md-12">
		  <b>楼盘首页</b>
		  <b>楼盘详情</b>
		  <b>户&nbsp;&nbsp;型</b>
		  <a class="tabmoney" href="<%=path %>/LoanCalc/index.jsp" target="_blank"><strong>房贷计算器</strong></a>
	 </div>
	</div>
	</div>
  <div class="tabCon2"><%@include file="buildmain.jsp" %></div>
  <div class="tabCon2"><%@include file="buildmsg.jsp" %></div>
  <div class="tabCon2"><%@include file="houseList.jsp" %></div>
</div>
<%@include file="down.jsp" %>
<%@include file="modelJS.jsp" %>
<script>
var loginid='${session.user.id}';
$("#btn_sub").click(function(){
	var co=$("#co").val();
	if(co==''){
		alert("请输入评论内容哦！");
		return false;
	}
	if(loginid==''){
		alert("登录后才可以评论哦！");
		return false;
	}
	$.post("/EstateSales/comment/commentAdd",
			{"comment.user.id":loginid,"comment.buildings.id":'${buildingsVO.id}',"comment.content":co},
			function(data){
				window.location.href="http://localhost:8080/EstateSales/buildings/history?buildingsVO.id=${buildingsVO.id}"
			},"json");
	}
)
$("#likeAdd").click(function (){
	if(loginid==''){
		alert("登录后才可以点赞哦！");
		return false;
	}
	$.post("/EstateSales/like/add",
		{"like.user.id":loginid,"like.buildings.id":'${buildingsVO.id}'},
		function(data){
			var ht="<a href='javascript:void(0)' id='removelike' title='取消点赞'><i class='glyphicon glyphicon-thumbs-up' style='color:#f0a34a'></i></a>"
				$("#checkLike").html(ht);
		},"json");
})
$("#removelike").click(function (){
	alert("您确定取消点赞吗？");
	$.post("/EstateSales/like/delete",
			{"like.user.id":loginid,"like.buildings.id":'${buildingsVO.id}'},
			function(data){
				var ht="<a href='javascript:void(0)' id='likeAdd' title='为它点赞'><i class='glyphicon glyphicon-thumbs-up' style='color:#ccc'></i></a>"
					$("#checkLike").html(ht);
			},"json");
})
function checkLogin2(){
	var phone=$("#loginPhone").val();
	var pwd=$("#loginPwd").val();
	if(phone==''||pwd==''){
		toastr.error("密码或手机号码不能为空");
	}else{
		$.post("/EstateSales/user/login",
				$("#f1").serialize(),
				function(data){
				if(data.msg=='fail'){
					toastr.error("账号或密码输入错误！");
				}else{
					var ht="<span><a href='../user/home' class='btn btn-default' type='button'>个人中心</a>&nbsp;<a href='../user/exit' class='btn btn-default' type='button'>退出</a></span>"
					$("#userhome").html(ht);
					loginid=data.user.id;
					$("#login").modal("toggle");
				}
		},"json")
	}
}
</script>
</body>
</html>