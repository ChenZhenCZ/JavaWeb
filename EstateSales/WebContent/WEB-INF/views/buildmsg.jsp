<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="row">
		<br/>
		<div class="col-md-8">
		<section class="property-single-features clearfix">
         <div class="xxp wow slideInLeft">基本信息</div>
          <ul class="zz clearfix wow slideInRight">
          	<li>楼盘均价：${buildingsVO.avg_price}元/m²</li>
          	<li>用户点评：【${buildingsVO.commentSet.size()}条点评】<br/></li>
          	<li>房源类型：${buildingsVO.house_type}</li>
          	<li>建筑类型：${buildingsVO.building_type}</li>
          	<li>环线位置：暂无资料</li>
          	<li>开发商：${buildingsVO.agency.name}</li>
          	<li>项目地址：${buildingsVO.address}（${buildingsVO.area}）</li>
          	<li>物业公司：${buildingsVO.property_company}</li>
          </ul>
        </section>
		<section class="property-single-features clearfix">
			<div class="xxp wow slideInLeft">销售信息</div>
			<ul class="zz clearfix wow slideInRight">
				<li>楼盘优惠：暂无</li>
		 		<li>开盘时间：${buildingsVO.open_date}</li>
				<li>售楼地址：${buildingsVO.reception_address}</li>
				<li>咨询电话：${buildingsVO.tel}</li>
				<li>物业费：${buildingsVO.property_fee}</li>
		    </ul>
		</section>
		<section class="property-single-features clearfix">
			<div class="xxp wow slideInLeft">楼盘规划</div>
			<ul class="zz clearfix wow slideInRight">
		 		<li>占地面积：${buildingsVO.floor_area}</li>
				<li>建筑面积：${buildingsVO.building_area}</li>
				<li>经纬度：(${buildingsVO.longitude},${buildingsVO.latitude})</li>
				<li>总套数：${buildingsVO.total_rooms}</li>
				<li>绿化率：${buildingsVO.green_ratio}</li>
				<li>容积率：${buildingsVO.plot_ratio}</li>
				<li>车位数：${buildingsVO.car_station}</li>
				<li>交通情况：${buildingsVO.traffic}</li>
				<li>周边配套：${buildingsVO.equipments}</li>
		    </ul>
		</section>
		 <section class="property-contents">
             <div class="xxp wow slideInLeft">楼盘简介</div>
            <ul class="zz clearfix wow slideInRight">
            	<li>${buildingsVO.intro}</li>
            </ul>
         </section>
        </div>
        <div class="col-md-4">
        <img src="${pageContext.request.contextPath }/model/assets/images/g/g1.jpg">
        </div>
	</div>
</div>