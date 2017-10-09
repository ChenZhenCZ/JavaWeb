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
            	<div class='col-md-4 col-sm-6 layout-item-wrap mix a1'>
                	<article class="gallery-item property layout-item clearfix wow slideInUp">
						<figure class="feature-image">
					        <a class="clearfix zoom">
					        <img data-action="zoom" src="${buildingsVO.logo}" style="height:250px"></a>
				        </figure>
					</article>
				</div>
            <c:forEach items="${buildingsVO.buildingsImgSet}" var="d">
                <div class='col-md-4 col-sm-6 layout-item-wrap mix a2'>
                	<article class="gallery-item property layout-item clearfix wow slideInUp">
						<figure class="feature-image">
					        <a class="clearfix zoom">
					        <img data-action="zoom" src="${d.img_path}" style="height:250px"></a>
				        </figure>
					</article>
				</div>
			</c:forEach>
			</div>
		</div>
    </div>
 </div>