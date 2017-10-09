<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path= request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="<%=path %>/toastr/toastr.min.css"/>
 <link rel="stylesheet" href="<%=path %>/bootstrap/dist/css/bootstrapValidator.min.css"/>
 
	<title>户型预约看房</title>
	
	<link rel="stylesheet" href="<%=path%>/UsersPlugin/css/houseDetail.css" />
	<%@include file="../WEB-INF/views/modelCSS.jsp" %>
</head>
<body style="padding-top: 70px; padding-bottom: 70px;">
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
						action="<%=path%>/user/appLogin" onsubmit="return checkLogin()">
						<div class="form-group">
							<label for="phone">手机号码</label>
							<input class="form-control" type="tel" name="user.phone"  value="${user.phone}"  id="phone" required="required" placeholder="请输入手机号码">
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
						<a href="<%=path%>/UsersView/forget.jsp" target="_blank" >忘记密码</a>					
					</form>
				</div>
			</div>
		</div>
	</div>
<!-- 登录注册模态框结束 -->
<!-- 在线预约开始-->
	<div id="appointment" class="modal fade" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-title">
					<h2 class="text-center">在线预约</h2>
				</div>
				<div class="modal-body">
					<form action="<%=path%>/appointment/addAppointment" id="appoint" class="form-group" method="post">
							<input type="hidden" name="appointment.house.id"  value="${houseVO.id }">
						<div class="form-group">
	                          <label class="control-label col-md-2  col-xs-12">看房时间</label>
	                          <div class="col-md-9  col-xs-12">
	                              <input type="date" class="form-control " id="app_time"  name="appointment.app_arrive_time" required="required"/>
	                          </div>
	                    </div>	
	                	<div class="clearfix"></div>
			            <br/> 
						<div class="row">
							<c:forEach var="emp"  items="${houseVO.buildings.empSet }">
								<div class="col-md-2">
									<img  width=" 100px;" height="100px;"alt="" src="${emp.headicon }" >
					                   <p align="center">
					                   		 <label class="radio-inline">
											  <input type="radio" name="appointment.emp.id" id="inlineRadio1" checked value="${emp.id }">${emp.name }
											</label>
						                </p>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="text-right">
						<button class="btn btn-info" type="submit">确定</button>
						<button class="btn btn-danger" data-dismiss="modal">取消</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 在线预约结束 -->
	<!-- 活动开始 -->
	<div class="modal fade" id="modal-container-256532" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<div class="modal-body xxp">
				优惠活动
				</div>
				<c:if test="${houseVO.buildings.activity.size()<1}">
					<div class="tishi">${houseVO.buildings.name}没有相关优惠活动！</div>
				</c:if>
				 <c:forEach items="${houseVO.buildings.activity}" var="d">
				 <c:set var="nowDate" value="<%=new java.sql.Date((new java.util.Date()).getTime())%>"></c:set>
				 <c:if test="${nowDate<d.end_time}">
					<div class="coupon">
				        <div class="coupon-left">
				            <div class="coupon-inner">
				                <div class="coupon-money">
				                    <span>${d.title}</span>
				                </div>
				                <div class="coupon-condition">
				                    <p>活动地址：${d.address}<br/>活动内容：${d.content}</p>
				                </div>
				            </div>
				        </div>
				        <div class="coupon-right">
				            <div class="coupon-inner">
				                <div class="coupon-time">
				                    有效期<br>
				                    ${d.start_time}~${d.end_time}
				                </div>
				                <i class="coupon-circle top"></i>
				                <i class="coupon-circle bottom"></i>
				            </div>
				        </div>
				        <div class="coupon-light"></div>
				    </div>
				    </c:if>
				    <c:if test="${nowDate>d.end_time}">
				    	<div class="coupon coupon-diabled">
        <div class="coupon-left">
            <div class="coupon-inner">
                <div class="coupon-money">
                   <span>${d.title}</span>
                </div>
                <div class="coupon-condition">
                    <p>活动地址：${d.address}<br/>活动内容：${d.content}</p>
                </div>
            </div>
        </div>
        <div class="coupon-right">
            <div class="coupon-inner">
                <div class="coupon-time">
                   有效期<br>
					${d.start_time}~${d.end_time}
                </div>
                <i class="coupon-circle top"></i>
                <i class="coupon-circle bottom"></i>
            </div>
        </div>
        <div class="coupon-light"></div>
    </div>
				    </c:if>
				</c:forEach>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">
					关闭
				</button> 
			</div>
		</div>
	</div>
</div>
	<!-- 活动结束 -->
<!-- 导航条开始 -->
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
                        <li><a href="<%=path%>/index.jsp">首页</a></li>
                        <li><a href="${pageContext.request.contextPath }/buildings/findBuildsList">热销楼盘</a></li>
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
                    <span>
                    	<c:if test="${session.user==null}">
                       	<button data-toggle="modal" data-target="#login" class="btn btn-default">登录</button>
                        <button data-toggle="modal" data-target="#register" class="btn btn-default">注册</button>
                        </c:if>
                        <c:if test="${session.user!=null}">
                        <a href="${pageContext.request.contextPath }/user/home" class="btn btn-default" type="button">个人中心</a>
                        <a href="${pageContext.request.contextPath }/user/exit" class="btn btn-default">退出</a>
                        </c:if>  
                        <br>
                    <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2908903432&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:2908903432:51" alt="联系客服" title="联系客服"/></a>
                    </span>
                </div>
            </div>
        </div>
    </div>
</header>
<br/><br/><br/>
<!-- 导航条结束 -->
<div id="property-single">
        <div class="container">
            <div class="row">
				<div class="col-md-12">
					<section class="property-meta-wrapper common">
					<div class="row">
					<div class=" col-lg-6 col-md-6 col-sm-12  thumbnail">
						<img alt="" src="${houseVO.logo }">
					</div>
					<div class="col-lg-6 col-md-6 col-sm-12">
						<ul>
							<li><h2 style="color: red;">${houseVO.buildings.name }</h2></li> 

							<li><span>户型名称:</span>${houseVO.name }</li>

							<li><span>所属楼盘:</span>${houseVO.buildings.name }</li>

							<li><span>建筑面积:</span>${houseVO.area }㎡</li>

							<li><span>参考单价:</span>${houseVO.unit_price}￥</li>

							<li class="status"><span>销售状态:</span> 待售</li>
							<li style="color:green;">
								<a href="<%=path%>/buildings/history?buildingsVO.id=${houseVO.buildings.id}"><span>楼盘详情</span></a>
								<a href="javascript:void(0)" data-toggle="modal" data-target="#modal-container-256532" ><span>最新活动</span></a>
								<a href="<%=path%>/house/calc?houseVO.id=${houseVO.id}" target="_blank"><span>贷款计算</span></a>
							</li>
							<li style="color: red;"><span>${houseVO.buildings.name }等你来</span></li>
						</ul>
						<c:if test="${checkApp ==false}">
							<button id="appbtn" style="margin-left:60px;" class="btn btn-warning btn-lg" ><span class="glyphicon glyphicon-phone-alt"></span>&nbsp;&nbsp;在线预约 </button>
						</c:if>
						<c:if test="${checkApp ==true}">
							<button id="appbtn" style="margin-left:60px;" class="btn btn-warning btn-lg"  disabled="disabled"><span class="glyphicon glyphicon-phone-alt"></span>&nbsp;&nbsp;&nbsp;已预约 </button>
						</c:if>
						</div>
					</div>
                    </section>
				</div>
                <div class="col-lg-8 col-md-7">
                     <section class="property-contents common">
                      <ul>
						<li><h2 style="color:#5f5f5f; "><strong>${houseVO.name }户型解析</strong></h2></li>
						<li>${houseVO.intro }</li>
					</ul>
                    </section>
                    <section class="property-single-features common clearfix">
                       <div class="xxp">所属楼盘基本设施</div>
                        <ul class="property-single-features-list clearfix">
                            <li>占地面积：${houseVO.buildings.floor_area }㎡</li>
                            <li>建筑面积：${houseVO.buildings.building_area }㎡</li>
                            <li>房源类型：${houseVO.buildings.house_type }</li>
							<li>绿化率：${houseVO.buildings.green_ratio }%</li>
							<li>容积率：${houseVO.buildings.plot_ratio }%</li>
							<li>物业费：${houseVO.buildings.property_fee }￥</li>
							<li >车位数：${houseVO.buildings.car_station }</li>
							<li>交通情况：${houseVO.buildings.traffic }</li>
							<li>经纬度：${houseVO.buildings.longitude }°,${houseVO.buildings.latitude }°</li>
							<li>周边配套：${houseVO.buildings.equipments }</li>
							<li>建筑类型：${houseVO.buildings.building_type }</li>														
							<li>物业公司：${houseVO.buildings.property_company }</li>
                        </ul>
                    </section>
                </div>
                <div class="col-lg-4 col-md-5">
                    <div id="property-sidebar">
		    <section class="widget adv-search-widget clearfix">
		        <div id="advance-search-widget" class="clearfix">
		        <div id="widget-tabs">
		            <ul class="tab-list clearfix">
		                <li><a class="btn" href="#tab-1">最新文章</a></li>
		                <li><a class="btn" href="#tab-2">相关房源</a></li>
		                <li><a class="btn" href="#tab-3">帮助</a></li>
		            </ul>
		            <div id="tab-1" class="tab-content current">
		            	<ul>
		            		<c:forEach items="${aticleList }" var="a">
			            		<li><a href="${a.content_url }" target="_blank">${a.title }</a></li>
		            		</c:forEach>
		            	</ul>
		            </div>
		            <div id="tab-2" class="tab-content current">
		            	<c:forEach items="${buildingList }" var="builds">
					        <div class="property clearfix" >
					            <a href="<%=path %>/buildings/history?buildingsVO.id=${builds.id}" ><img data-action="zoom" src="${builds.logo }" alt="楼盘图片"></a>
					            <div class="property-contents">
					                <h6 class="entry-title"><a href="<%=path %>/buildings/history?buildingsVO.id=${builds.id}">${builds.name}</a></h6>
					                <span class="btn-price">${builds.avg_price }</span>
					                <div class="property-meta clearfix">
					                    <span><i class="glyphicon glyphicon-eye-open"></i> ${builds.historySet.size()}</span>
					                    <span><i class="fa fa-bed"></i>${builds.total_rooms }</span>
					                    <span><i class="glyphicon glyphicon-heart-empty"></i>${builds.likeSet.size()}</span>
					                    <span><i class="fa fa-cab"></i> ${builds.car_station }</span>
					                </div>
					            </div>
					        </div>
		        		</c:forEach>
		            </div>
		            <div id="tab-3" class="tab-content current"></div>
		         </div>
		       </div> 
			</section>
		   <!-- 广告投放区 -->
		 </div>              
   	   </div>
     </div>
     <div>
     	 <div class="container">
        <div class="row">
            <div id="filter-container">
            <section>
                      <div class="container">
							<div class="row">
								<div class="col-lg-12 col-md-12 col-sm-12 thumbnail">
									<img  style="width:auto;height: auto;"alt="" src="<%=path%>/UsersPlugin/images/ad1.jpg">
								</div>
							</div>
						</div>
                    </section>
            	<c:forEach items="${houseSet}" var="h">
                <div class='col-md-4 col-sm-6 layout-item-wrap mix a1'>
                	<article class="gallery-item property layout-item clearfix wow slideInUp">
						<figure class="feature-image">
					        <a class="clearfix zoom" href="<%=path%>/house/house/oneHourse?houseVO.id=${h.id}">
					        <img data-action="zoom" src="${h.logo }"  style="height: 250px;" alt="Property Image"></a>
					        <span class="btn btn-warning btn-sale">待售</span>
				        </figure>
				        <div class="property-contents clearfix">
					        <header class="property-header clearfix">
					            <div class="pull-left">
					                <h6 class="entry-title">
					                <a href="<%=path%>/house/house/oneHourse?houseVO.id=${h.id}"">${h.name }</a></h6>
					                <span class="property-location" style="font-size:20px;">${h.area } ㎡</span>
					             </div>
					            <a href="<%=path%>/house/house/oneHourse?houseVO.id=${h.id}""><button class="btn btn-default btn-price pull-right btn-3d" data-hover="${h.unit_price }/㎡"><strong>${h.unit_price }/㎡</strong></button></a>
					        </header>
					        <div class="property-meta clearfix">
					            <span><a href="<%=path%>/house/house/oneHourse?houseVO.id=${h.id}" title="查看详情"><i class="glyphicon glyphicon-eye-open"></i>详情</a></span>
					            <span><a href="<%=path%>/house/house/oneHourse?houseVO.id=${h.id}" title="预约人数"><i class="glyphicon glyphicon-user"></i>${h.appointmentSet.size() }人已预约</a></span>
					            <span title="通讯电话"><i class="glyphicon glyphicon-phone-alt"></i>${houseVO.buildings.agency.tel}</span>
					        </div>
					   </div>
					</article>
				</div>
				</c:forEach>
				</div>
            </div>
        </div>
    </div>
     </div>
   </div>
 <%@include file="../WEB-INF/views/down.jsp" %>
<%@include file="../WEB-INF/views/modelJS.jsp" %>
<script src="${pageContext.request.contextPath}/model/assets/js/jqueryPhoto.js"></script>
<script type="text/javascript" src="<%=path %>/bootstrap/dist/js/bootstrapValidator.min.js"></script>                               
<script src="<%=path %>/toastr/toastr.min.js"></script>
<script src="<%=path %>/js/toastrOption.js"></script>
<script type="text/javascript" src="<%=path %>/js/user.js"></script>
<script >
app_date();
function formatDate() {
        var date = new Date(); // 获取js的Date对象
        var year = date.getFullYear().toString();
        var month = (date.getMonth() + 1);
        var day = date.getDate().toString();
        var hour = date.getHours().toString();
        var minutes = date.getMinutes().toString();
        var seconds = date.getSeconds().toString();
        if (month < 10) {
            month = "0" + month;
        }
        if (day < 10) {
            day = "0" + day;
        }
        return year + "-" + month + "-" + day;
}
function app_date(){
	$("#app_time").attr("min",formatDate());
	$("#app_time").val(formatDate());
}
	$(function(){
		$("#appbtn").click(function(){
			var user='${session.user}';
			if(user==''){
				toastr.info("登陆后才能预约，请先登陆！");
			}else{
				$("#appointment").modal();
			}
		})
	})
</script>
</body>
</html>