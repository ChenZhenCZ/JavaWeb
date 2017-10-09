<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path= request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   	<title>户型列表</title>
    <%@include file="modelCSS.jsp" %>
</head>
<body onload="msg()" style="padding-top: 70px; padding-bottom: 70px;">
<%@include file="nav.jsp" %>
<div id="site-banner" class="text-center clearfix">
	<div class="container">
		<h1 class="title">Gallery</h1>
		<ol class="breadcrumb">
			<li><a href="index.html">首页</a></li>
			<li class="active">搜索</li>
		</ol>
	</div>
</div>
<div id="blog-listing" class="grid-style">
    <header class="section-header text-center" style="background:white">
        <div class="container">
        	<form class="form-inline col-md-6 col-md-offset-0" style="margin-bottom:20px;">
        	 <div class="form-group" style="margin-top:0px positon:relative">
			    <input type="text" class="form-control"  placeholder="搜索户型">
			  </div>
			  <button type="submit" class="btn btn-default">搜索</button>
			  <span>
            	<a href="#" title="地图找房"><i class="glyphicon glyphicon-map-marker"></i>地图找房</a>
            	<a href="#" title="房贷计算器" style="margin-left:5px"><i class="glyphicon glyphicon-calendar"></i>房贷计算器</a>
            </span>
		</form>
 		<br/>
 		<div class="pull-left">
 			 <div class="controls text-left" data-wow-duration="1s">
            	<b>区&nbsp;&nbsp;域</b>
                <span class="control active" data-filter="all">全赣州</span>
                <span class="control" data-filter=".a1">章贡区</span>
                <span class="control" data-filter=".a2">于都</span>
                <span class="control" data-filter=".a3">兴国</span>
                <span class="control" data-filter=".a4">宁都</span>
            </div>
            <div class="controls text-left" data-wow-duration="1s">
            	<b>价&nbsp;&nbsp;格</b>
                <span class="control active" data-filter="all">全部</span>
                <span class="control" data-filter=".a1">4000以下</span>
                <span class="control" data-filter=".a2">4000~6000</span>
                <span class="control" data-filter=".a3">6000~10000</span>
                <span class="control" data-filter=".a4">10000~15000</span>
                <span class="control" data-filter=".a5">15000以上</span>
                <b>￥/㎡</b>
            </div>
            <div class="controls text-left" data-wow-duration="1s">
            	<b>类&nbsp;&nbsp;型</b>
                <span class="control active" data-filter="all">全部</span>
                <span class="control" data-filter=".a1">类型1</span>
                <span class="control" data-filter=".a2">类型2</span>
                <span class="control" data-filter=".a3">类型3</span>
                <span class="control" data-filter=".a4">类型4</span>
                <span class="control" data-filter=".a5">类型5</span>
                <span class="control" data-filter=".a6">类型6</span>
            </div>
        </div>
            <div class="pull-right">
                <p class="pull-left layout-view"> 显示: <i class="fa fa-th selected" data-layout="4"></i> <i class="fa fa-th-large" data-layout="6"></i></p>
            </div>
        </div>
    </header>
    <div class="container">
        <div class="row">
            <div id="filter-container">
                <div class='col-md-4 col-sm-6 layout-item-wrap mix a1'>
                	<article class="gallery-item property layout-item clearfix wow slideInUp">
						<figure class="feature-image">
					        <a class="clearfix zoom" href="single-property.html">
					        <img data-action="zoom" src="<%=path%>/model/assets/images/property/1.jpg" alt="Property Image"></a>
					        <span class="btn btn-warning btn-sale">状态</span>
				        </figure>
				        <div class="property-contents clearfix">
					        <header class="property-header clearfix">
					            <div class="pull-left">
					                <h6 class="entry-title">
					                <a href="single-property.html">楼盘名</a></h6>
					                <span class="property-location">
					                <i class="fa fa-map-marker"></i>地址</span>
					            </div>
					            <button class="btn btn-default btn-price pull-right btn-3d" data-hover="￥389.000"><strong>￥389.000</strong></button>
					        </header>
					        <div class="property-meta clearfix">
					            <span><a href="#" title="查看详情"><i class="glyphicon glyphicon-eye-open"></i>详情</a></span>
					            <span><a href="#" title="预约看房"><i class="glyphicon glyphicon-user"></i>预约</a></span>
					            <span><a href="#" title="收藏楼盘"><i class="glyphicon glyphicon-heart-empty"></i>1000</a></span>
					            <span title="通讯电话"><i class="glyphicon glyphicon-phone-alt"></i>15270743950</span>
					        </div>
					   </div>
					</article>
				</div>
				<div class='col-md-4 col-sm-6 layout-item-wrap mix a2'>
					<article class="gallery-item property layout-item clearfix wow slideInUp">
						<figure class="feature-image">
					        <a class="clearfix zoom" href="single-property.html">
					        <img data-action="zoom" src="<%=path%>/model/assets/images/property/2.jpg" alt="Property Image"></a>
					        <span class="btn btn-warning btn-sale">状态</span>
				        </figure>
				        <div class="property-contents clearfix">
					        <header class="property-header clearfix">
					            <div class="pull-left">
					                <h6 class="entry-title">
					                <a href="single-property.html">楼盘名</a></h6>
					                <span class="property-location">
					                <i class="fa fa-map-marker"></i>地址</span>
					            </div>
					            <button class="btn btn-default btn-price pull-right btn-3d" data-hover="￥389.000"><strong>￥389.000</strong></button>
					        </header>
					        <div class="property-meta clearfix">
					            <span><a href="#" title="查看详情"><i class="glyphicon glyphicon-eye-open"></i>详情</a></span>
					            <span><a href="#" title="预约看房"><i class="glyphicon glyphicon-user"></i>预约</a></span>
					            <span><a href="#" title="收藏楼盘"><i class="glyphicon glyphicon-heart-empty"></i>1000</a></span>
					            <span title="通讯电话"><i class="glyphicon glyphicon-phone-alt"></i>15270743950</span>
					        </div>
					   </div>
					</article>
				</div>
				<div class='col-md-4 col-sm-6 layout-item-wrap mix a3'>
					<article class="gallery-item property layout-item clearfix wow slideInUp">
				       <figure class="feature-image">
					        <a class="clearfix zoom" href="single-property.html">
					        <img data-action="zoom" src="<%=path%>/model/assets/images/property/3.jpg" alt="Property Image"></a>
					        <span class="btn btn-warning btn-sale">状态</span>
				        </figure>
				        <div class="property-contents clearfix">
					        <header class="property-header clearfix">
					            <div class="pull-left">
					                <h6 class="entry-title">
					                <a href="single-property.html">楼盘名</a></h6>
					                <span class="property-location">
					                <i class="fa fa-map-marker"></i>地址</span>
					            </div>
					            <button class="btn btn-default btn-price pull-right btn-3d" data-hover="￥389.000"><strong>￥389.000</strong></button>
					        </header>
					        <div class="property-meta clearfix">
					            <span><a href="#" title="查看详情"><i class="glyphicon glyphicon-eye-open"></i>详情</a></span>
					            <span><a href="#" title="预约看房"><i class="glyphicon glyphicon-user"></i>预约</a></span>
					            <span><a href="#" title="收藏楼盘"><i class="glyphicon glyphicon-heart-empty"></i>1000</a></span>
					            <span title="通讯电话"><i class="glyphicon glyphicon-phone-alt"></i>15270743950</span>
					        </div>
					   </div>
					</article>
				</div>
				<div class='col-md-4 col-sm-6 layout-item-wrap mix a4'>
					<article class="gallery-item property layout-item clearfix wow slideInUp">
				           <figure class="feature-image">
					        <a class="clearfix zoom" href="single-property.html">
					        <img data-action="zoom" src="<%=path%>/model/assets/images/property/4.jpg" alt="Property Image"></a>
					        <span class="btn btn-warning btn-sale">状态</span>
				        </figure>
				        <div class="property-contents clearfix">
					        <header class="property-header clearfix">
					            <div class="pull-left">
					                <h6 class="entry-title">
					                <a href="single-property.html">楼盘名</a></h6>
					                <span class="property-location">
					                <i class="fa fa-map-marker"></i>地址</span>
					            </div>
					            <button class="btn btn-default btn-price pull-right btn-3d" data-hover="￥389.000"><strong>￥389.000</strong></button>
					        </header>
					        <div class="property-meta clearfix">
					            <span><a href="#" title="查看详情"><i class="glyphicon glyphicon-eye-open"></i>详情</a></span>
					            <span><a href="#" title="预约看房"><i class="glyphicon glyphicon-user"></i>预约</a></span>
					            <span><a href="#" title="收藏楼盘"><i class="glyphicon glyphicon-heart-empty"></i>1000</a></span>
					            <span title="通讯电话"><i class="glyphicon glyphicon-phone-alt"></i>15270743950</span>
					        </div>
					   </div>
					</article>
				</div>
				<div class='col-md-4 col-sm-6 layout-item-wrap mix a5'>
					<article class="gallery-item property layout-item clearfix wow slideInUp">
				            <figure class="feature-image">
					        <a class="clearfix zoom" href="single-property.html">
					        <img data-action="zoom" src="<%=path%>/model/assets/images/property/5.jpg" alt="Property Image"></a>
					        <span class="btn btn-warning btn-sale">状态</span>
				        </figure>
				        <div class="property-contents clearfix">
					        <header class="property-header clearfix">
					            <div class="pull-left">
					                <h6 class="entry-title">
					                <a href="single-property.html">楼盘名</a></h6>
					                <span class="property-location">
					                <i class="fa fa-map-marker"></i>地址</span>
					            </div>
					            <button class="btn btn-default btn-price pull-right btn-3d" data-hover="￥389.000"><strong>￥389.000</strong></button>
					        </header>
					        <div class="property-meta clearfix">
					            <span><a href="#" title="查看详情"><i class="glyphicon glyphicon-eye-open"></i>详情</a></span>
					            <span><a href="#" title="预约看房"><i class="glyphicon glyphicon-user"></i>预约</a></span>
					            <span><a href="#" title="收藏楼盘"><i class="glyphicon glyphicon-heart-empty"></i>1000</a></span>
					            <span title="通讯电话"><i class="glyphicon glyphicon-phone-alt"></i>15270743950</span>
					        </div>
					   </div>
					</article>
				</div>
				<div class='col-md-4 col-sm-6 layout-item-wrap mix a6'>
					<article class="gallery-item property layout-item clearfix wow slideInUp">
				            <figure class="feature-image">
					        <a class="clearfix zoom" href="single-property.html">
					        <img data-action="zoom" src="<%=path%>/model/assets/images/property/6.jpg" alt="Property Image"></a>
					        <span class="btn btn-warning btn-sale">状态</span>
				        </figure>
				        <div class="property-contents clearfix">
					        <header class="property-header clearfix">
					            <div class="pull-left">
					                <h6 class="entry-title">
					                <a href="single-property.html">楼盘名</a></h6>
					                <span class="property-location">
					                <i class="fa fa-map-marker"></i>地址</span>
					            </div>
					            <button class="btn btn-default btn-price pull-right btn-3d" data-hover="￥389.000"><strong>￥389.000</strong></button>
					        </header>
					        <div class="property-meta clearfix">
					            <span><a href="#" title="查看详情"><i class="glyphicon glyphicon-eye-open"></i>详情</a></span>
					            <span><a href="#" title="预约看房"><i class="glyphicon glyphicon-user"></i>预约</a></span>
					            <span><a href="#" title="收藏楼盘"><i class="glyphicon glyphicon-heart-empty"></i>1000</a></span>
					            <span title="通讯电话"><i class="glyphicon glyphicon-phone-alt"></i>15270743950</span>
					        </div>
					   </div>
					</article>
				</div>
				<div class='col-md-4 col-sm-6 layout-item-wrap mix a7'>
					<article class="gallery-item property layout-item clearfix wow slideInUp">
				            <figure class="feature-image">
					        <a class="clearfix zoom" href="single-property.html">
					        <img data-action="zoom" src="<%=path%>/model/assets/images/property/7.jpg" alt="Property Image"></a>
					        <span class="btn btn-warning btn-sale">状态</span>
				        </figure>
				        <div class="property-contents clearfix">
					        <header class="property-header clearfix">
					            <div class="pull-left">
					                <h6 class="entry-title">
					                <a href="single-property.html">楼盘名</a></h6>
					                <span class="property-location">
					                <i class="fa fa-map-marker"></i>地址</span>
					            </div>
					            <button class="btn btn-default btn-price pull-right btn-3d" data-hover="￥389.000"><strong>￥389.000</strong></button>
					        </header>
					        <div class="property-meta clearfix">
					            <span><a href="#" title="查看详情"><i class="glyphicon glyphicon-eye-open"></i>详情</a></span>
					            <span><a href="#" title="预约看房"><i class="glyphicon glyphicon-user"></i>预约</a></span>
					            <span><a href="#" title="收藏楼盘"><i class="glyphicon glyphicon-heart-empty"></i>1000</a></span>
					            <span title="通讯电话"><i class="glyphicon glyphicon-phone-alt"></i>15270743950</span>
					        </div>
					   </div>
					</article>
				</div>
				<div class='col-md-4 col-sm-6 layout-item-wrap mix a8'>
					<article class="gallery-item property layout-item clearfix wow slideInUp">
				           <figure class="feature-image">
					        <a class="clearfix zoom" href="single-property.html">
					        <img data-action="zoom" src="<%=path%>/model/assets/images/property/8.jpg" alt="Property Image"></a>
					        <span class="btn btn-warning btn-sale">状态</span>
				        </figure>
				        <div class="property-contents clearfix">
					        <header class="property-header clearfix">
					            <div class="pull-left">
					                <h6 class="entry-title">
					                <a href="single-property.html">楼盘名</a></h6>
					                <span class="property-location">
					                <i class="fa fa-map-marker"></i>地址</span>
					            </div>
					            <button class="btn btn-default btn-price pull-right btn-3d" data-hover="￥389.000"><strong>￥389.000</strong></button>
					        </header>
					        <div class="property-meta clearfix">
					          	<span><a href="#" title="查看详情"><i class="glyphicon glyphicon-eye-open"></i>详情</a></span>
					            <span><a href="#" title="预约看房"><i class="glyphicon glyphicon-user"></i>预约</a></span>
					            <span><a href="#" title="收藏楼盘"><i class="glyphicon glyphicon-heart-empty"></i>1000</a></span>
					            <span title="通讯电话"><i class="glyphicon glyphicon-phone-alt"></i>15270743950</span>
					        </div>
					   </div>
					</article>
				</div>
				<div class='col-md-4 col-sm-6 layout-item-wrap mix a9'>
					<article class="gallery-item property layout-item clearfix wow slideInUp">
				            <figure class="feature-image">
					        <a class="clearfix zoom" href="single-property.html">
					        <img data-action="zoom" src="<%=path%>/model/assets/images/property/9.jpg" alt="Property Image"></a>
					        <span class="btn btn-warning btn-sale">状态</span>
				        </figure>
				        <div class="property-contents clearfix">
					        <header class="property-header clearfix">
					            <div class="pull-left">
					                <h6 class="entry-title">
					                <a href="single-property.html">楼盘名</a></h6>
					                <span class="property-location">
					                <i class="fa fa-map-marker"></i>地址</span>
					            </div>
					            <button class="btn btn-default btn-price pull-right btn-3d" data-hover="￥389.000"><strong>￥389.000</strong></button>
					        </header>
					        <div class="property-meta clearfix">
					            <span><a href="#" title="查看详情"><i class="glyphicon glyphicon-eye-open"></i>详情</a></span>
					            <span><a href="#" title="预约看房"><i class="glyphicon glyphicon-user"></i>预约</a></span>
					            <span><a href="#" title="收藏楼盘"><i class="glyphicon glyphicon-heart-empty"></i>1000</a></span>
					            <span title="通讯电话"><i class="glyphicon glyphicon-phone-alt"></i>15270743950</span>
					        </div>
					   </div>
					</article>
				</div>                
				</div>
            </div>
            <ul id="pagination" class="text-center clearfix">
                <li><a href="#">首页</a></li>
                <li><a href="#">上一页</a></li>
                <li><a href="#">下一页</a></li>
                <li><a href="#">尾页</a></li>
            </ul>
        </div>
    </div>
<%@include file="down.jsp" %>
<%@include file="modelJS.jsp" %>
</body>

</html>

