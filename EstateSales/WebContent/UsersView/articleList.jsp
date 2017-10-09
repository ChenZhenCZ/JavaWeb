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
    <title>最新资讯</title>
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
			<!-- 用户搜索 -->
			<form action="<%=path%>/admin/allArticleList">
				<div class="col-lg-10" >
				    <div class="input-group">
				      <input type="text" name="article.title" value="${article.title}" class="form-control" placeholder="搜索资讯">
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
							   		<a href="javascript:void(0);"><img alt="无图片" src="${h.logo}"></a>
							   	</div>
							   	<div class="col-lg-9">
									<ul>
										<li style="font-size:20px;"><a href="javascript:void(0);"><strong>${h.title}</strong></a><span style="margin-left:20px;"><strong></strong><small></small></span></li>
										<li style="margin-top:10px;">摘要:<a>${h.abstracts}</a></li>
										<li style="margin-top:8px;"><span style="color:black;"><a href="${h.content_url}">文章详情</a></span><span style="margin-left:40px;"></span></li>
									</ul>						   	
							   	 </div>
							  </div>
						</div>
						</c:forEach>
						<div style="margin-bottom:50px;">
				    	  <ul id="pagination" class="text-center clearfix">
			                  <li><a href="${pageContext.request.contextPath }/admin/allArticleList?article.title=${article.title}">首页</a></li>
					          <li><a href="${pageContext.request.contextPath }/admin/allArticleList?currentPage=${poj.currentPage}&opr=piror&article.title=${article.title}">上一页</a></li>
					          <li><a href="${pageContext.request.contextPath }/admin/allArticleList?currentPage=${poj.currentPage}&opr=next&article.title=${article.title}">下一页</a></li>
					          <li><a href="${pageContext.request.contextPath }/admin/allArticleList?currentPage=${poj.pageCount}&opr=last&article.title=${article.title}">末页</a></li>
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
		                <li><a class="btn" href="#tab-2">相关房源</a></li>
		                <li><a class="btn" href="#tab-1">最新户型</a></li>
		                <li><a class="btn" href="#tab-3">帮助</a></li>
		            </ul>
		            <div id="tab-1" class="tab-content current">
		            	<c:forEach items="${houseList}" var="h">
					        <div class="property clearfix" >
					            <a href="<%=path%>/house/house/oneHourse?houseVO.id=${h.id}"><img src="${h.logo }" style="height:150px" alt="户型图片"></a>
					            <div class="property-contents">
					                <h6 class="entry-title"><a href="<%=path%>/house/house/oneHourse?houseVO.id=${h.id}">${h.name}</a></h6>
					                <span class="btn-price">${h.unit_price}元/户</span>
					                <div class="property-meta clearfix">
					                    <span><i class="glyphicon glyphicon-th-large"></i>面积：${h.area}㎡</span>
					                </div>
					            </div>
					        </div>
		        		</c:forEach>
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

