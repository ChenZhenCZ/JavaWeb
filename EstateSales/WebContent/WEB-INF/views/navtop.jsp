<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section>
<div class="container">
	<div id="customer" class="row">
		<div class="xxp">圈内业主</div>
		<c:forEach items="${appList}" var="ap">
		<div class="col-lg-4 col-md-6">
			<article class="property clearfix">
				<figure class="feature-image">
						<img src="${ap.customer.headicon}" alt="业主照片" style="height: 250px">
				</figure>
				<div class="property-contents">
					<header class="property-header clearfix">
						<div class="pull-left">
							<h6 class="entry-title">
								<a href="single-property.html">${ap.customer.name }</a>
							</h6>
							<span class="property-location"><i
								class="fa fa-map-marker"></i>${ap.house.name}</span>
						</div>
						<a  class="btn btn-default btn-price pull-right btn-3d" type="button"
							data-hover="￥${ap.house.unit_price}">
							<strong>￥${ap.house.unit_price}</strong>
						</a>
					</header>
					<div class="property-meta clearfix">
						<span><a
							href="${pageContext.request.contextPath }/house/oneHourse?houseVO.id=${ap.house.id}"
							title="查看详情"><i class="glyphicon glyphicon-eye-open"></i>详情</a></span>
						<span><a href="#" title="楼盘"><i
								class="glyphicon glyphicon-user"></i>楼盘:${ap.emp.buildings.name}</a></span>
						<span><a href="#" title="户型面积"><i
								class="glyphicon glyphicon-heart-empty"></i>面积:${ap.house.area}</a></span>
						<span title="通讯电话"><i
							class="glyphicon glyphicon-phone-alt"></i>客服：${hl.buildings.agency.tel }</span>
					</div>
				</div>
			</article>
		</div>
		</c:forEach>
	</div>
</div>
</section>