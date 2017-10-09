<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path= request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>户型列表</title>
    <%@include file="../WEB-INF/views/modelCSS.jsp" %>
    <style type="text/css">
    	ul li{
    		list-style: none;
    	}
    </style>
</head>
<body onload="msg()" style="padding-top: 70px; padding-bottom: 70px;">
<%@include file="../WEB-INF/views/nav.jsp" %>
	<div id="site-banner" class="text-center clearfix">
		<div class="container">
			<h1 class="title">Gallery</h1>
			<ol class="breadcrumb">
				<li><a href="index.html">首页</a></li>
				<li class="active">搜索</li>
			</ol>
		</div>
	</div>	
    <div class="container">
		<div class="col-md-12">
			<form action="<%=path%>/house/allHouseList">
				<div class="col-lg-10" >
				    <div class="input-group">
				      <input type="text" name="houseVO.name" value="${houseVO.name}" class="form-control" placeholder="搜索户型">
				      <span class="input-group-btn">
				        <button class="btn btn-default" type="submit">搜索</button>
				      </span>
				    </div><!-- /input-group -->
	  			</div><!-- /.col-lg-6 -->
			</form>
		 </div>
	</div>
	<br/><br/>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-7">
                     	<c:forEach items="${rows }" var="h">
                     	<div class="panel panel-default">
							  <div class="panel-body">
							   	<div class="col-lg-3">
							   		<a href="<%=path%>/house/oneHourse?houseVO.id=${h.id}"><img alt="" src="${h.logo }"></a>
							   	</div>
							   	<div class="col-lg-9">
									<ul>
										<li style="font-size:20px;"><a href="<%=path%>/house/oneHourse?houseVO.id=${h.id}"><strong>${h.buildings.name }  ${h.name }</strong></a><span style="margin-left:20px;"><strong>${h.area }m²</strong><small>(建筑面积)</small></span></li>
										<li style="margin-top:10px;">地址:<a>${h.buildings.address}</a></li>
										<li style="margin-top:8px;"><span style="color:black;">售楼电话:<a>${h.buildings.tel}</a></span><span style="margin-left:40px;">参考单价:<strong style="font-size:24px; color:red;">${h.unit_price }m²</strong></span></li>
									</ul>						   	
							   	 </div>
							  </div>
						</div>
						</c:forEach>
						<div style="margin-bottom:50px;">
				    	  <ul id="pagination" class="text-center clearfix">
			                  <li><a href="${pageContext.request.contextPath }/house/allHouseList?houseVO.name=${houseVO.name}">首页</a></li>
					          <li><a href="${pageContext.request.contextPath }/house/allHouseList?currentPage=${poj.currentPage}&opr=piror&houseVO.name=${houseVO.name}">上一页</a></li>
					          <li><a href="${pageContext.request.contextPath }/house/allHouseList?currentPage=${poj.currentPage}&opr=next&houseVO.name=${houseVO.name}">下一页</a></li>
					          <li><a href="${pageContext.request.contextPath }/house/allHouseList?currentPage=${poj.pageCount}&opr=last&houseVO.name=${houseVO.name}">末页</a></li>
			           	  </ul>
					 </div>					
             </div>
            <div class="col-lg-4 col-md-5">
                    <div id="property-sidebar">
		    <section class="widget adv-search-widget clearfix">
		        <h5 class="title hide">天下第一</h5>
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
					            <a href="<%=path%>/buildings/history?buildingsVO.id=${builds.id}"><img src="${builds.logo }" style="height:150px" alt="楼盘图片"></a>
					            <div class="property-contents">
					                <h6 class="entry-title"><a href="<%=path%>/buildings/history?buildingsVO.id=${builds.id}">${builds.name}</a></h6>
					                <span class="btn-price">${builds.avg_price }元/㎡</span>
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
		</div>              
      </div>
   </div>
</div>
<%@include file="../WEB-INF/views/down.jsp" %>
<%@include file="../WEB-INF/views/modelJS.jsp" %>
<script src="${pageContext.request.contextPath}/model/assets/js/jqueryPhoto.js"></script>

</body>
</html>

