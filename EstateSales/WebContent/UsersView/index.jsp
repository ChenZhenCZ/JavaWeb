<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path= request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <%@include file="../WEB-INF/views/modelCSS.jsp" %>
    <script src="<%=path%>/js/echarts.js"></script>
   <title>首页</title>	     
<body onload="msg()" style="padding-top: 70px; padding-bottom: 70px;">
<%@include file="../WEB-INF/views/nav.jsp" %>
<div class="main-slider-wrapper clearfix">
    <div id="main-slider">
        <div class="slide"><img src="<%=path%>/model/assets/images/slider/1.jpg" alt="Slide"></div>
        <div class="slide"><img src="<%=path%>/model/assets/images/slider/2.jpg" alt="Slide"></div>
        <div class="slide"><img src="<%=path%>/model/assets/images/slider/3.jpg" alt="Slide"></div>
        <div class="slide"><img src="<%=path%>/model/assets/images/slider/4.jpg" alt="Slide"></div>
    </div>
    <div id="slider-contents">
        <div class="container text-center">
            <div class="jumbotron">
                <h1>找到你梦想的房子</h1>
                <div class="contents clearfix">
                    <p>如果你的梦想设计一个新的家庭的充分利用独特的地理位置和土地,你爱的观点</p>
                </div>
                <a class="btn btn-warning btn-lg btn-3d" data-hover="找房子" href="<%=path%>/buildings/pagebuild" role="button">找房子</a>
                <a class="btn btn-default btn-border btn-lg" href="<%=path%>/agency/agency_enter.jsp" role="button" target="_blank">卖房子</a>
            </div>
        </div>
    </div>
</div>
<br/>
<div class="container">
	<div class="row">
		<div id="key" class="HuiTab col-md-4 col-sm-12">
			  <div class="tabBar tabkey clearfix text-center" style="padding:10px 0;">
			  	<a><span class="tabkey2">卖房</span></a>
				<a href="#customer"><span class="tabkey3">找客户</span></a>
				<a href=" <%=path%>/agency/agency_enter.jsp" target="_blank"><span class="tabkey3">我要卖房</span></a>
				<a href="<%=path%>/admin/allactivityList"><span class="tabkey3">找活动</span></a>
			  </div>
		 </div>
			<div id="tab_demo1" class="col-md-4 col-sm-12">
			  <div class="tabBar tabfind clearfix text-center" style="padding:20px 0;">
			  	<span>买新房</span>
			  	<span>新房型</span>
			  	<span>房产快讯</span>
			  	<span>最新活动</span>
			  </div>
			  <div class="tabCon">
			  	<form class="form-inline col-md-offset-0" action="${pageContext.request.contextPath }/buildings/pagebuild" method="post" style="margin-bottom:20px;">
					<div class="form-group" style="margin-top:0px positon:relative">
				    	<input type="text" name="find.sosuo" class="form-control"  placeholder="请输入关键字（楼盘名/地名/房源类型等）">
					</div>
					<button type="submit" class="btn btn-default glyphicon glyphicon-search"></button>
				</form>
			  </div>
			  <div class="tabCon">
			  	<form class="form-inline col-md-offset-0" style="margin-bottom:20px;" action="<%=path%>/house/allHouseList" method="post">
					<div class="form-group" style="margin-top:0px positon:relative">
					    <input type="text" name="houseVO.name" class="form-control"  placeholder="请输入户型关键字">
					</div>
					<button type="submit" class="btn btn-default glyphicon glyphicon-search"></button>
				</form>
			  </div>
			  <div class="tabCon">
			  	<form class="form-inline col-md-offset-0" style="margin-bottom:20px;" action="<%=path%>/admin/allArticleList" method="post">
					<div class="form-group" style="margin-top:0px positon:relative">
					    <input type="text" name="article.title" class="form-control"  placeholder="搜索关键字">
					</div>
					<button type="submit" class="btn btn-default glyphicon glyphicon-search"></button>
				</form>
			  </div>
			   <div class="tabCon">
			  	<form action="<%=path%>/admin/allactivityList" class="form-inline col-md-offset-0" style="margin-bottom:20px;">
					<div class="form-group" style="margin-top:0px positon:relative">
					    <input type="text" class="form-control"  placeholder="查找最新活动" name="activity.title" value="${activity.title}" class="form-control">
					</div>
					<button type="submit" class="btn btn-default glyphicon glyphicon-search"></button>
				</form>
			  </div>
		</div>
		<div id="key" class="col-md-4 col-sm-12">
			  <div class="tabBar tabkey clearfix text-center" style="padding:10px 10px;">
			  	<a><span class="tabkey2">买房</span></a>
				<a href="<%=path%>/buildings/pagebuild"><span class="tabkey3">新房</span></a>
				<a href="<%=path%>/admin/allArticleList"><span class="tabkey3">最新楼迅</span></a>
				<a href="<%=path%>/LoanCalc/index.jsp" target="_blank"><span class="tabkey3">房贷计算器</span></a>
			  </div>
		</div>
	</div>
	<hr/>
</div>
<div class="container">
	<div class="row">
		<div id="tab_demo" class="HuiTab col-md-12">
				<div class="tabBar clearfix tabone text-center">
					<span>金牌顾问</span> <span>最新楼盘</span> <span>实力房企</span>
				</div>
				<div class="tabCon">
					<c:forEach items="${empBySalary}" var="es">
						<div class="col-lg-4 col-md-6">
							<img src="${es.emp.headicon}" alt="照片" style="height: 250px">
							<div class="property-contents">
								<header class="property-header clearfix">
									<div class="pull-left">
										<h6>${es.emp.name}</h6>
										<c:if test="${es.emp.intro==null }">
											<p>我很害羞，没说什么！</p>
										</c:if>
										<c:if test="${es.emp.intro!=null }">
											<p>${es.emp.intro}</p>
										</c:if>
									</div>
								</header>
								<div class="property-meta clearfix">
									<span><a href="javascript:void(0)" title="预约人数"><i
											class="glyphicon glyphicon-user"></i>预约:${es.emp.appointmentSet.size()}</a></span>
									<span><a href="javascript:void(0)" title="业绩"><i
											class="glyphicon glyphicon-plus"></i>业绩:${es.emp.saleSet.size() }</a></span>
									<span title="通讯电话"><i
										class="glyphicon glyphicon-phone-alt"></i>号码:${es.emp.phone }</span>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="tabCon">
					<div id="property-for-rent-slider">
						<c:forEach items="${newbuildsList}" var="nb">
							<div class="col-lg-4 col-md-6">
								<article class="property clearfix">
									<figure class="feature-image">
										<a
											href="<%=path %>/buildings/history?buildingsVO.id=${nb.id}">
											<img src="${nb.logo }" alt="楼盘图片" style="height: 250px">
										</a>
									</figure>
									<div class="property-contents">
										<header class="property-header clearfix">
											<div class="pull-left">
												<h6 class="entry-title">
													<a href="<%=path %>/buildings/history?buildingsVO.id=${nb.id}">${nb.name }</a>
												</h6>
												<span class="property-location"><i
													class="fa fa-map-marker"></i>${nb.address }</span>
											</div>
											<button class="btn btn-default btn-price pull-right btn-3d"
												data-hover="￥${nb.avg_price }">
												<strong>￥${nb.avg_price }</strong>
											</button>
										</header>
										<div class="property-meta clearfix">
											<span><a
												href="<%=path %>/buildings/history?buildingsVO.id=${nb.id}"
												title="查看详情"><i class="glyphicon glyphicon-eye-open"></i>详情</a></span>
											<span><a href="#" title="点赞人数"><i
													class="glyphicon glyphicon-user"></i>点赞：${nb.likeSet.size() }</a></span>
											<span><a href="#" title="浏览人数"><i
													class="glyphicon glyphicon-heart-empty"></i>点击：${nb.historySet.size() }</a></span>
											<span title="通讯电话"><i
												class="glyphicon glyphicon-phone-alt"></i>客服：${nb.agency.tel }</span>
										</div>
									</div>
								</article>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="tabCon">
					<c:forEach items="${agencyList}" var="al">
							<div class="col-lg-4 col-md-6">
								<article class="property clearfix">
									<figure class="feature-image">
										<img src="${al.logo }" alt="商标" style="height: 250px">
									</figure>
									<div class="property-contents">
										<header class="property-header clearfix">
											<div class="pull-left">
												<h6 class="entry-title">
													${al.name }
												</h6>
												<span class="property-location"><i
													class="fa fa-map-marker"></i>${al.address }</span>
											</div>
										</header>
										<div class="property-meta clearfix">
											<span><i class="glyphicon glyphicon-bookmark"></i>${al.leader }</span>
											<span><a href="#" title=""><i
													class="glyphicon glyphicon-road"></i>楼盘：${al.buildingsSet.size()}个</a></span>
											<span><a href="#" title="员工人数"><i
													class="glyphicon glyphicon-user"></i>员工：${al.empSet.size()}人</a></span>
											<span title="通讯电话"><i
												class="glyphicon glyphicon-phone-alt"></i>电话：${al.tel }</span>
										</div>
									</div>
								</article>
							</div>
						</c:forEach>
				</div>
		</div>
	</div>
</div>
<div class="container">
	<hr/>
	<div class="row">
		<div class="col-md-3">
			<img src="<%=path%>/model/assets/images/g/g3.jpg" style="height: 440px">
		</div>
		<div id="tab_demo7" class="HuiTab col-md-6">
		  <div class="tabBar tabtwo clearfix text-center">
		  <span>热卖</span><span>最新优惠</span><span>最新开盘</span><span>楼市走向</span></div>
		  <div class="tabCon">
		  	<c:forEach items="${hotbuildsList}" var="hd">
				<div class="col-lg-4 col-md-6">
					<article class="property clearfix">
						<figure class="feature-image">
							<a href="<%=path %>/buildings/history?buildingsVO.id=${hd.id}">
								<img src="${hd.logo }" alt="楼盘图片" style="height: 80px">
							</a>
						</figure>
						<div class="property-contents">
							<header class="property-header clearfix">
								<div class="pull-left" style="height: 50px">
									<h6 class="entry-title">
										<a href="<%=path %>/buildings/history?buildingsVO.id=${hd.id}">${hd.name }</a>
									</h6>
									<span class="property-location"><i
										class="fa fa-map-marker"></i>${hd.address }</span>
								</div>
							</header>
						</div>
					</article>
				</div>
			</c:forEach>
		  </div>
		  <div class="tabCon">
			<c:forEach items="${discountList}" var="dl">
				<div class="col-lg-4 col-md-6">
					<article class="property clearfix">
						<figure class="feature-image">
							<a href="<%=path %>/buildings/history?buildingsVO.id=${dl.id}">
								<img src="${dl.logo }" alt="楼盘图片" style="height: 80px">
							</a>
						</figure>
						<div class="property-contents">
							<header class="property-header clearfix">
								<div class="pull-left" style="height: 50px">
									<h6 class="entry-title">
										<a href="<%=path %>/buildings/history?buildingsVO.id=${dl.id}">${dl.name }</a>
									</h6>
									<span class="property-location"><i
										class="fa fa-map-marker"></i>${dl.address }</span>
								</div>
							</header>
						</div>
					</article>
				</div>
			</c:forEach>
		 </div>
		 <div class="tabCon">
			<c:forEach items="${buildsListByTime}" var="btime">
				<div class="col-lg-4 col-md-6" >
					<article class="property clearfix">
						<figure class="feature-image">
							<a href="<%=path %>/buildings/history?buildingsVO.id=${btime.id}">
								<img src="${btime.logo }" alt="楼盘图片" style="height: 80px">
							</a>
						</figure>
						<div class="property-contents">
							<header class="property-header clearfix">
								<div class="pull-left" style="height: 50px">
									<h6 class="entry-title">
										<a href="<%=path %>/buildings/history?buildingsVO.id=${btime.id}">${btime.name }</a>
									</h6>
									<span class="property-location"><i
										class="fa fa-map-marker"></i>${btime.address}</span>
								</div>
							</header>
						</div>
					</article>
				</div>
			</c:forEach>
		 </div>
		 <div class="tabCon">
		 	<div id="main" style="width:600px;height:400px;"></div>
		 </div>
		   <div class="tabBar tabtwo clearfix text-center">
		</div>
	</div>
	<div class="col-md-3">
		  <div class="text-left" style="font-family:微软雅黑;border-bottom:2px solid #6c98e1">
		  </div>
		  <div>
		  	<ul class="list-group listmsg">
		  		<c:forEach items="${aticleList}" var="a">
		    		<li class="list-group-item"><a href="${a.content_url }" target="_blank">${a.title }</a></li>
		    	</c:forEach>
			</ul>
			</div>
		</div>
</div>
</div>
<div class="container">
	<div class="xxp wow slideInRight">热门户型</div>
	<div class="row">
	<div id="property-for-rent-slider">
	<c:forEach items="${houseList}" var="hl">
		<div class="col-lg-4 col-md-6">
			<article class="property clearfix">
				<figure class="feature-image">
					<a
						href="<%=path%>/house/oneHourse?houseVO.id=${hl.id}">
						<img src="${hl.logo }" alt="户型图片" style="height: 250px">
					</a>
				</figure>
				<div class="property-contents">
					<header class="property-header clearfix">
						<div class="pull-left">
							<h6 class="entry-title">
								<a href="<%=path%>/house/oneHourse?houseVO.id=${hl.id}">${hl.name }</a>
							</h6>
							<span class="property-location"><i
								class="fa fa-map-marker"></i>${hl.buildings.name}</span>
						</div>
						<a href="<%=path%>/house/oneHourse?houseVO.id=${hl.id}" class="btn btn-default btn-price pull-right btn-3d" type="button"
							data-hover="￥${hl.unit_price}">
							<strong>￥${hl.unit_price}</strong>
						</a>
					</header>
					<div class="property-meta clearfix">
						<span><a
							href="<%=path%>/house/oneHourse?houseVO.id=${hl.id}"
							title="查看详情"><i class="glyphicon glyphicon-eye-open"></i>详情</a></span>
						<span><a href="#" title="预约人数"><i
								class="glyphicon glyphicon-user"></i>预约:${hl.appointmentSet.size()}</a></span>
						<span><a href="#" title="户型面积"><i
								class="glyphicon glyphicon-heart-empty"></i>面积:${hl.area}</a></span>
						<span title="通讯电话"><i
							class="glyphicon glyphicon-phone-alt"></i>客服：${hl.buildings.agency.tel }</span>
					</div>
				</div>
			</article>
		</div>
		</c:forEach>
		</div>
	</div>
</div>

	<%@include file="../WEB-INF/views/navtop.jsp" %>
<%@include file="../WEB-INF/views/down.jsp" %>
<a href="#top" id="scroll-top"><i class="fa fa-angle-up"></i></a>
<%@include file="../WEB-INF/views/modelJS.jsp" %>
</body>
<script >
var myChart = echarts.init(document.getElementById('main'));
var price=new Array();
var time=new Array();
price=${buildsAvg};
time=${buildTime};
option = {
	    title: {
	        text: '近年来楼市走向',
	        subtext: '数据来自网络'
	    },
	    tooltip: {
	        trigger: 'axis'
	    },
	    toolbox: {
	        show: true,
	        feature: {
	            dataZoom: {
	                yAxisIndex: 'none'
	            },
	            dataView: {readOnly: false},
	            magicType: {type: ['line', 'bar']},
	            restore: {},
	            saveAsImage: {}
	        }
	    },
	    xAxis:  {
	        type: 'category',
	        boundaryGap: false,
	        data: time
	    },
	    yAxis: {
	        type: 'value',
	    },
	    series: [
	        {
	            name:'最高价',
	            type:'line',
	            data:price,
	            markPoint: {
	                data: [
	                    {type: 'max', name: '最大值'},
	                    {type: 'min', name: '最小值'}
	                ]
	            },
	            markLine: {
	                data: [
	                    {type: 'average', name: '平均值'}
	                ]
	            }
	        }
	    ]
	};

myChart.setOption(option);

$.smallBox({  
    title : title,  
    content : "<b>"+content+"</b> <span style='text-align:right; font-size:12px'><i class='fa fa-times'> 点击关闭</span>",  
    color : "#CC0033",  
    icon: "fa fa-exclamation-circle bounce animated",  
    sound: "disabled",  
    timeout : 3000  
    });   
</script>
</html>
