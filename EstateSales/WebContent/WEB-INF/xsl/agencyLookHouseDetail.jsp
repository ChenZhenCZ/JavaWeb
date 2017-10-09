<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path= request.getContextPath();
%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>经销商主页</title>
 	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="author" content="Muhammad Usman">
	
	<%@ include file="./JsAndCss.jsp" %>
	
	<title>户型详情</title>
	<link rel="stylesheet" href="<%=path%>/UsersPlugin/css/houseDetail.css" />
	<%@include file="../views/modelCSS.jsp"%>
	<style type="text/css">
		ul li span{
			margin-left:22px;
			font-size:20px;
		}
	</style>
</head>

<body>
	<!-- 更换经销商logo -->
	<%@ include file="./changeAgencyLogo.jsp" %>
    <!-- topbar starts -->
    <%@ include file="./top.jsp" %>
    <!-- topbar ends -->
	<div class="ch-container">
    <div class="row">
        <!-- left menu starts -->
        <div class="col-sm-2 col-lg-2">
            <div class="sidebar-nav">
                <div class="nav-canvas">
                    <div class="nav-sm nav nav-stacked">

                    </div>
                    <!-- 左部菜单条开始 -->
                    <ul class="nav nav-pills nav-stacked main-menu">
                        <li class="nav-header">
						<div>
						<a href="#changeLogo" data-toggle="modal" data-target="#changeLogo"> 	
							<img id="logoImg" src="${agencyVO.logo}" class="img-responsive img-circle" alt="房地产经销商logo">
						</a>
						</div>
						</li>
                        <li class="accordion"><a href="javascript:void(0);"><i class="glyphicon glyphicon-home"></i><span style="font-size:16px;margin-left:12px;">信息中心</span></a>
                            <ul class="nav nav-pills nav-stacked">
                                <li><a href="../agency/initInfo">资料修改</a></li>
                            	<li><a href="../agency/lookInfo">资料查看</a></li>
                                <li><a href="../agency/modifyPwd">密码修改</a></li>
                            </ul>
                        </li>
                        <li class="accordion"><a href="javascript:void(0);"><i class="glyphicon glyphicon-plus"></i><span style="font-size:16px;margin-left:12px;">楼盘管理</span></a>
                            <ul class="nav nav-pills nav-stacked">
                                <li><a href="../buildings/buildAdd">新增楼盘</a></li>
                                <li><a href="../buildings/list">楼盘信息管理</a></li>
                                <li><a href="../agency/buildingsMap">楼盘地图</a></li>
                            </ul>
                        </li>
                        <li class="accordion"><a class="ajax-link" href="form.html"><i class="glyphicon glyphicon-edit"></i><span style="font-size:16px;margin-left:12px;">楼栋管理</span></a>
                        	<ul class="nav nav-pills nav-stacked">
                                <li><a href="../building/addBuilding">新增楼栋</a></li>
                                <li><a href="../building/buildingPage">楼栋信息管理</a></li>
                            </ul>
                        </li>
                        <li class="accordion"><a class="ajax-link" href="chart.html"><i class="glyphicon glyphicon-list-alt"></i><span style="font-size:16px;margin-left:12px;"> 户型管理</span></a>
                        	<ul class="nav nav-pills nav-stacked">
                                <li><a href="../house/addHouse">新增户型</a></li>
                                <li><a href="../house/list">户型信息管理</a></li>
                            </ul>
                        </li>
                        <li class="accordion"><a class="ajax-link" href="javascript:void(0);"><i class="glyphicon glyphicon-font"></i><span style="font-size:16px;margin-left:12px;">活动管理</span></a>
                        	<ul class="nav nav-pills nav-stacked">
                                <li><a href="../activity/activityAdd">发布活动</a></li>
                                <li><a href="../activity/list">活动信息管理</a></li>
                            </ul>
                        </li>
                        <li class="accordion"><a class="ajax-link" href="gallery.html"><i class="glyphicon glyphicon-picture"></i><span style="font-size:16px;margin-left:12px;">员工管理</span></a>
                        	<ul class="nav nav-pills nav-stacked">
                                <li><a href="${pageContext.request.contextPath }/staff/employeetemd">员工查看</a></li>
                            </ul>
                        </li>
                        <li class="accordion"><a class="ajax-link" href="table.html"><i class="glyphicon glyphicon-align-justify"></i><span style="font-size:16px;margin-left:12px;">绩效管理</span></a>
                        	<ul class="nav nav-pills nav-stacked">
                                <li><a href="../salary/initAgencyEmpSalaryList">绩效详情</a></li>
                            </ul>
                        </li>
                        <li class="accordion"><a href="javascript:void(0);"><i class="glyphicon glyphicon-plus"></i><span style="font-size:16px;margin-left:12px;">购房预约管理</span></a>
                            <ul class="nav nav-pills nav-stacked">
                                <li><a href="../appointment/initAgencyLookAppoint">预约记录</a></li>
                            </ul>
                        </li>
                        <li class="accordion"><a class="ajax-link" href="calendar.html"><i class="glyphicon glyphicon-calendar"></i><span style="font-size:16px;margin-left:12px;">销售管理</span></a>
                        	<ul class="nav nav-pills nav-stacked">
                                <li><a href="../sale/initAgencyTable">销售记录</a></li>
                                <li><a href="${pageContext.request.contextPath}/staff/agencyhighcharst">销售报表</a></li>
                            </ul>
                        </li>
                        <li class="accordion"><a class="ajax-link" href="grid.html"><i class="glyphicon glyphicon-th"></i><span style="font-size:16px;margin-left:12px;">客户管理</span></a>
                        	<ul class="nav nav-pills nav-stacked">
                                <li><a href="${pageContext.request.contextPath }/cous/customerList">客户查看</a></li>
                            </ul>
                        </li>
                        <li class="accordion"><a href="tour.html"><i class="glyphicon glyphicon-globe"></i><span style="font-size:16px;margin-left:12px;">评价管理</span></a>
                        	<ul class="nav nav-pills nav-stacked">
                                <li><a href="../comment/initAgencylookComment">查看评价</a></li>
                            </ul>
                       	</li>
                    </ul>
                    <!-- 左部菜单条结束 -->
                </div>
            </div>
        </div>
        <!-- left menu ends -->
        <!-- content starts -->
		<div id="content" class="col-lg-10 col-sm-10">
			<div>
				<ul class="breadcrumb">
					<li><a href="<%=path%>/agency/main">首页</a></li>
					<li><a hef="javascript:void(0);">户型详情</a>
				</ul>
			</div>
			<!--户型详情开始 -->
			<div id="property-single">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<section class="property-meta-wrapper common">
								<div class="row">
									<div class=" col-lg-6 col-md-6 col-sm-12 ">
										<img src="${houseVO.logo }" style="height: 580; width: 500">
									</div>
									<div class="col-lg-6 col-md-6 col-sm-12">
										<ul>
											<li><h2 style="color: red;">${houseVO.buildings.name }</h2></li>
											<li><span>户型名称:</span>${houseVO.name }</li>
											<li><span>所属楼盘:</span>${houseVO.buildings.name }</li>
											<li><span>建筑面积:</span>${houseVO.area }㎡</li>
											<li><span>参考单价:</span>${houseVO.unit_price}￥</li>
											<li class="status"><span>销售状态:</span> 待售</li>
											<li style="color: green;"><span>楼盘详情</span><span>最新活动</span><span>贷款计算</span></li>
										</ul>
										<c:if test="${checkApp ==false}">
											<div id="appbtn" style="margin-left: 60px;"
												class="btn btn-warning btn-lg">
												<span class="glyphicon glyphicon-leaf"></span>&nbsp;&nbsp;该户型未被预约
											</div>
										</c:if>
										<c:if test="${checkApp ==true}">
											<div id="appbtn" style="margin-left: 60px;"
												class="btn btn-warning btn-lg">
												<span class="glyphicon glyphicon-ok"></span>&nbsp;&nbsp;&nbsp;该户型已预约
											</div>
										</c:if>
									</div>
								</div>
							</section>
						</div>
						<div class="col-md-12">
							<section class="property-meta-wrapper common">
								<div class=" col-lg-6 col-md-6 col-sm-12 ">
									<ul>
										<li><h2 style="color: #5f5f5f;">
												<strong>${houseVO.name }户型解析</strong>
											</h2></li>
										<li>${houseVO.intro }</li>
									</ul>
								</div>
								<div class="xxp">所属楼盘基本设施</div>
								<ul class="property-single-features-list clearfix">
									<li>占地面积：${houseVO.buildings.floor_area }㎡</li>
									<li>建筑面积：${houseVO.buildings.building_area }㎡</li>
									<li>房源类型：${houseVO.buildings.house_type }</li>
									<li>绿化率：${houseVO.buildings.green_ratio }%</li>
									<li>容积率：${houseVO.buildings.plot_ratio }%</li>
									<li>物业费：${houseVO.buildings.property_fee }￥</li>
									<li>车位数：${houseVO.buildings.car_station }</li>
									<li>交通情况：${houseVO.buildings.traffic }</li>
									<li>经纬度：${houseVO.buildings.longitude }°,${houseVO.buildings.latitude }°</li>
									<li>周边配套：${houseVO.buildings.equipments }</li>
									<li>建筑类型：${houseVO.buildings.building_type }</li>
									<li>物业公司：${houseVO.buildings.property_company }</li>
								</ul>
							</section>
						</div>
					</div>
				</div>
			</div>
			<!-- 户型详情结束 -->
		</div>
		<!-- content end -->
	</div>
	<!--/row-->
</div>
<!--/.fluid-container-->

<!-- 上传图片 -->
<script>
$('#logo').fileinput({
    language: 'zh',
    uploadUrl: '<%=path%>/agency/uploadLogo',
    allowedFileExtensions : ['jpg', 'png','gif'],
})
var imgSrc="";
$('#logo').on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功		
	imgSrc=data.response.agencyVo.logo;
	$("#changeLogo").modal("toggle");
})
$(function () {
	$('#changeLogo').on('hide.bs.modal', function () {
		if(imgSrc!=""){
			$("#logoImg").attr('src',imgSrc)
		}
 	})
 });
</script>
</body>
</html>