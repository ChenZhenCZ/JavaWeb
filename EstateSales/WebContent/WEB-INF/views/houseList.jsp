<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="blog-listing" class="grid-style">
    <header class="section-header text-center" style="background:white">
        <div class="container">
 		<br/>
 		<div class="pull-left">
 			<div class="controls text-left" data-wow-duration="1s"></div>
        </div>
            <div class="pull-right">
                <p class="pull-left layout-view"> 显示: <i class="fa fa-th selected" data-layout="4"></i> <i class="fa fa-th-large" data-layout="6"></i></p>
            </div>
        </div>
    </header>
    <div class="container">
        <div class="row">
            <div id="filter-container">
            <c:if test="${buildingsVO.houseSet.size()<1}">
        	<div class="text-center tishi">${buildingsVO.name}楼盘未发布户型哦</div>
        	</c:if>
            <c:forEach items="${buildingsVO.houseSet}" var="d">
                <div class='col-md-4 col-sm-6 layout-item-wrap mix a1'>
                	<article class="gallery-item property layout-item clearfix wow slideInUp">
						<figure class="feature-image">
					        <a href="${pageContext.request.contextPath }/house/house/oneHourse?houseVO.id=${d.id}" >
					        <img src="${d.logo}" style="height:250px"></a>
					        <h4><a href="${pageContext.request.contextPath }/house/house/oneHourse?houseVO.id=${d.id}" title="详情">${d.name}&nbsp;&nbsp;&nbsp;&nbsp;${d.area}（面积）</a></h4>
				        </figure>
					</article>
				</div>
			</c:forEach>
			</div>
		</div>
    </div>
 </div>