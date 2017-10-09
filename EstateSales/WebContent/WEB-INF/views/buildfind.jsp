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
   	<title>楼盘搜索</title>
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
        	<form class="form-inline col-md-offset-0" action="${pageContext.request.contextPath }/buildings/pagebuild" method="post" style="margin-bottom:20px;">
        		<div class="col-md-9 text-left">
        			<br/>
					<div class="form-group">
				    	<input type="text" name="find.sosuo" value="${find.sosuo}" class="form-control"  placeholder="请输入关键字（楼盘名/地名/房源类型等）">
					</div>
					<button type="submit" class="btn btn-default glyphicon glyphicon-search"></button>
	            	<div class="form-group text-left col-md-9">
	            		<br/>
	            		<b>区&nbsp;&nbsp;域：</b>
					<select name="find.area" class="form-control">
						<option  value="不限">不限</option>
						<option  value="章江新区">章江新区</option>
						<option  value="蓉江新区">蓉江新区</option>
						<option  value="老城区">老城区</option>
						<option  value="开发区">开发区</option>
						<option  value="南康区">南康区</option>
						<option  value="开发区">开发区</option>
					</select>
				    <b>类&nbsp;&nbsp;型：</b>
				    <select name="find.house" class="form-control">
						<option  value="不限">不限</option>
						<option  value="住宅">住宅</option>
						<option  value="别墅">别墅</option>
						<option  value="写字楼">写字楼</option>
						<option  value="商品房">商品房</option>
						<option  value="综合体">综合体</option>
					</select>
					<b>价&nbsp;&nbsp;格：</b>
					<select name="find.price" class="form-control">
		 				<option value="不限">不限</option>
		 				<option  value="<3000">3000以下</option>
		 				<option  value="between 3000 and 4000">3000~4000</option>
		 				<option  value="between 4000 and 5000">4000~50000</option>
		 				<option  value="between 6000 and 7000">60000~7000</option>
		 				<option  value="between 8000 and 9000">8000~9000</option>
		 				<option  value="between 1000 and 12000">10000~12000</option>
		 				<option  value=">12000">12000以上</option>
					</select>
					元/㎡
					</div>
					<div class="form-group text-left col-md-4">
						<br/>
						<b>显&nbsp;&nbsp;示：</b>
						<span class="layout-view"><i class="fa fa-th selected" data-layout="4"></i> <i class="fa fa-th-large" data-layout="6"></i></span>
					</div>
				</div>
	        </form>
        </div>
    </header>
    <div class="container">
        <div class="row">
            <div id="filter-container">
            	<div class="text-left">
            		页码：${p.currentPage}/${p.pageCount}&nbsp;&nbsp;
                    共<span style="color:red">${p.recordCount}</span>条记录
                </div>
            	 <c:if test="${p.recordCount==0}">
            	 	<p class="tishi text-center">没有找到<span>"${find.sosuo}"</span>该关键字的相关房源！</p>
            	 </c:if>
            	<c:forEach items="${rows}" var="b">
                <div class='col-md-4 col-sm-6 layout-item-wrap' onclick="window.open('<%=path %>/buildings/history?buildingsVO.id=${b.id}','_self')">
                	<article class="gallery-item property layout-item clearfix wow slideInUp" onmouseout="javascript:this.style.border='2px outset white';" onmouseover="javascript:this.style.border='2px outset #f0a34a';" style="border:2px outset white">
						<figure class="feature-image">
					        <a class="clearfix zoom" href="<%=path %>/buildings/history?buildingsVO.id=${b.id}">
					        <img data-action="zoom" src="${b.logo}" style="height:250px" alt="Property Image"></a>
					        <span class="btn btn-warning btn-sale">待售</span>
				        </figure>
				        <div class="property-contents clearfix">
					        <header class="property-header clearfix">
					        	<button class="btn btn-default btn-price pull-right btn-3d" data-hover="￥${b.avg_price }"><strong>￥${b.avg_price }</strong></button>
					            <div class="pull-left">
					                <h6 class="entry-title">
					                <a href="<%=path %>/buildings/history?buildingsVO.id=${b.id}" title="查看详情">${b.name }</a></h6>
					                <span class="property-location">
					                <i class="fa fa-map-marker"></i>${b.address}<br/>(${b.open_date})</span>
					            </div>
					        </header>
					        <div class="property-meta clearfix">
					        	<span title="房源类型"><i class="glyphicon glyphicon-cloud"></i>${b.house_type }</span>
					            <span title="查看详情"><a href="<%=path %>/buildings/history?buildingsVO.id=${b.id}"><i class="glyphicon glyphicon-eye-open"></i>详情</a></span>
					            <span title="点赞人数"><i class="glyphicon glyphicon-user"></i>${b.likeSet.size() }</span>
					            <span title="浏览人数"><i class="glyphicon glyphicon-heart-empty"></i>${b.historySet.size() }</span>
					            <span title="客服电话"><i class="glyphicon glyphicon-phone-alt"></i>${b.agency.tel }</span>
					        </div>
					   </div>
					</article>
				</div>
				</c:forEach>
				</div>
            </div>
            <ul id="pagination" class="text-center clearfix">
                <li><a href="${pageContext.request.contextPath }/buildings/pagebuild?find.sosuo=${find.sosuo}&p.currentPage=1&p.opr=first">首页</a></li>
                <li><a href="${pageContext.request.contextPath }/buildings/pagebuild?find.sosuo=${find.sosuo}&p.currentPage=${p.currentPage}&p.opr=piror">上一页</a></li>
                <li><a href="${pageContext.request.contextPath }/buildings/pagebuild?find.sosuo=${find.sosuo}&p.currentPage=${p.currentPage}&p.opr=next">下一页</a></li>
                <li><a href="${pageContext.request.contextPath }/buildings/pagebuild?find.sosuo=${find.sosuo}&p.currentPage=${p.pageCount}&p.opr=last">末页</a></li>
            </ul>
        </div>
    </div>
<%@include file="down.jsp" %>
<%@include file="modelJS.jsp" %>
</body>

</html>

