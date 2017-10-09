<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%int sum=2,sum2=2; %>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=x67gHfVD1WUEc85lSreVfFIaWajsQSZG"></script>
<div class="modal fade" id="modal-container-256532" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<div class="modal-body xxp">
				优惠活动
				</div>
				<c:if test="${buildingsVO.activity.size()<1}">
					<div class="tishi">${buildingsVO.name}没有相关优惠活动！</div>
				</c:if>
				 <c:forEach items="${buildingsVO.activity}" var="d">
				 <c:set var="nowDate" value="<%=new java.sql.Date((new java.util.Date()).getTime())%>"></c:set>
				 <c:if test="${nowDate<d.end_time}">
					<div class="coupon">
				        <div class="coupon-left">
				            <div class="coupon-inner">
				                <div class="coupon-money">
				                    <span>${d.title}</span>
				                </div>
				                <div class="coupon-condition">
				                    <p>活动地址：${d.address}<br/>活动内容：${d.content}</p>
				                </div>
				            </div>
				        </div>
				        <div class="coupon-right">
				            <div class="coupon-inner">
				                <div class="coupon-time">
				                    有效期<br>
				                    ${d.start_time}~${d.end_time}
				                </div>
				                <i class="coupon-circle top"></i>
				                <i class="coupon-circle bottom"></i>
				            </div>
				        </div>
				        <div class="coupon-light"></div>
				    </div>
				    </c:if>
				    <c:if test="${nowDate>d.end_time}">
				    	<div class="coupon coupon-diabled">
        <div class="coupon-left">
            <div class="coupon-inner">
                <div class="coupon-money">
                   <span>${d.title}</span>
                </div>
                <div class="coupon-condition">
                    <p>活动地址：${d.address}<br/>活动内容：${d.content}</p>
                </div>
            </div>
        </div>
        <div class="coupon-right">
            <div class="coupon-inner">
                <div class="coupon-time">
                   有效期<br>
					${d.start_time}~${d.end_time}
                </div>
                <i class="coupon-circle top"></i>
                <i class="coupon-circle bottom"></i>
            </div>
        </div>
        <div class="coupon-light"></div>
    </div>
				    </c:if>
				</c:forEach>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">
					关闭
				</button> 
			</div>
		</div>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-md-12 xxp2">
			<br/>
			<div id="tab_demo" class="HuiTab col-md-6">
			<div class="tabCon">
				<a title="${buildingsVO.name}（图1)">
					<img src="${buildingsVO.logo}" style="height:400px">
				</a>
			</div>
			<c:forEach items="${buildingsVO.buildingsImgSet}" var="d">
			  <div class="tabCon"><a title="${buildingsVO.name }（图<%=sum2++%>)"><img src="${d.img_path}" style="height:400px"></a></div>
			</c:forEach>
  			<br/><span>共${buildingsVO.buildingsImgSet.size()+1}张</span>
  			<div id="home-property-listing">
          		<div id="property-for-rent-slider" class="tabBar clearfix tabimg xxp2">
                	<span onmouseout="javascript:this.style.border='2px outset white';" onmouseover="javascript:this.style.border='2px outset #f0a34a';">
					<img src="${buildingsVO.logo}" title="${buildingsVO.name }（图1)">
					</span>
					<c:forEach items="${buildingsVO.buildingsImgSet}" var="d">
					 <span onmouseout="javascript:this.style.border='2px outset white';" onmouseover="javascript:this.style.border='2px outset #f0a34a';">
					  	<img src="${d.img_path}" title="${buildingsVO.name }（图<%=sum++%>)">
					 </span>
					</c:forEach>
				</div>
			</div>
  			</div>
			<div class="col-md-6">
				<section>
	                <p style="font-size:24px"><b>${buildingsVO.name}</b></p>
	                <p><b>开盘时间：</b>${buildingsVO.open_date}</p>
	                <p><b>价格：</b><span style="font-size:20px;color:red">${buildingsVO.avg_price}</span>元/m²起
	                </p>
	                <p><b>售楼电话：<span style="font-size:18px;color:red">${buildingsVO.tel}</span></b></p>
	                <p><b>主力户型：</b>
	                <c:if test="${buildingsVO.houseSet.size()<1}">
						暂无户型！
					</c:if>
	                <c:forEach items="${buildingsVO.houseSet}" var="d">
	                ${d.name}（${d.area}m²）&nbsp;&nbsp;
	                </c:forEach></p>
	                <p><b>项目地址：</b>${buildingsVO.address}（${buildingsVO.area}）
	                </p>
	                <p style="border-bottom: 1px solid #ccc;"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>
				<a id="modal-256532" title="优惠活动"  href="#modal-container-256532" role="button" data-toggle="modal">
					<i class="glyphicon glyphicon-gift">优惠活动</i></a>
				&nbsp;&nbsp;
				<span id="checkLike">
					<c:if test="${checkLike==false}">
	                      	<a href='javascript:void(0)' id='likeAdd' title='为它点赞'><i class='glyphicon glyphicon-thumbs-up' style='color:#ccc'></i>&nbsp;&nbsp;${buildingsVO.likeSet.size()}</a>
					</c:if>
					<c:if test="${checkLike==true}">
						<a href='javascript:void(0)' id='removelike' title='取消点赞'><i class='glyphicon glyphicon-thumbs-up' style='color:#f0a34a'></i>&nbsp;&nbsp;${buildingsVO.likeSet.size()}</a>
					</c:if>
				</span>
				</p>
	            <p><b>周边顾问：</b>
	            	<div class="row">
					<c:forEach items="${buildingsVO.empSet}" var="b">
					<div class="col-md-4">
						<img class="img-thumbnail" src="${b.headicon}" style="width:80;height:80px"/>
						<div class="caption">
							<strong>${b.name}</strong><br>
							<i class="glyphicon glyphicon-phone-alt"></i>&nbsp;&nbsp;${b.phone}
						</div>
					</div>
					</c:forEach>
					</div>
	          </section>
			</div>
		</div>
                <div class="col-lg-8 col-md-7">
                	<br/>
                    <section class="xxp2">
                        <div class="xxp wow slideInLeft">楼盘点评</div>
						<ul id="commentUl checkCo" class="commentList wow slideInRight">
							<li class="item cl">页码：${p.currentPage}/${p.pageCount}&nbsp;&nbsp;
                        共<span style="color:red">${p.recordCount}</span>条评论</li>
							<c:forEach items="${rows}" var="c">
						  <li class="item cl"> 
						  	<i class="avatar size-L radius">
						  	<img src="${c.user.headicon}" class="img-circle" style="width:60px;height:60px"></i>
						    <div class="comment-main">
						      <header class="comment-header">
						        <div class="comment-meta">${c.user.name}<a class="comment-author" href="#"></a> 评论于
						          <time title="${c.comment_time}" datetime="${c.comment_time}">${c.comment_time}</time>
						        </div>
						      </header>
						      <div class="comment-body">
						        <p>${c.content}</p>
						      </div>
						    </div>
						  </li>
						  </c:forEach>
						  </ul>
						<ul id="commentUl" class="commentList wow slideInRight">
						  <li class="item cl">
						  <c:if test="${p.recordCount==0}">
                        	<div class="tishi text-center">${buildingsVO.name}楼盘还没有评论哦！</div>
                          </c:if>
                          <c:if test="${p.recordCount!=0}">
<!--评论分页-->
<ul id="pagination" class="text-center clearfix">
    <li><a href="${pageContext.request.contextPath }/buildings/onebuild?p.currentPage=1&buildingsVO.id=${buildingsVO.id}&p.opr=first">首页</a></li>
    <li><a href="${pageContext.request.contextPath }/buildings/onebuild?p.currentPage=${p.currentPage}&buildingsVO.id=${buildingsVO.id}&p.opr=piror">上一页</a></li>
    <li><a href="${pageContext.request.contextPath }/buildings/onebuild?p.currentPage=${p.currentPage}&buildingsVO.id=${buildingsVO.id}&p.opr=next">下一页</a></li>
    <li><a href="${pageContext.request.contextPath }/buildings/onebuild?p.currentPage=${p.pageCount}&buildingsVO.id=${buildingsVO.id}&p.opr=last">末页</a></li>
</ul>
							</c:if>
							<c:if test="${session.user.headicon==null}">
								<i class="avatar size-L radius">
								<img src="${pageContext.request.contextPath}/model/head.png" class="img-circle" style="width:60px;height:60px"></i>
							</c:if>
							<c:if test="${session.user.headicon!=null}">
						  		<i class="avatar size-L radius">
						  		<img src="${session.user.headicon}" class="img-circle" style="width:60px;height:60px"></i>
						  	</c:if>
						    <div class="comment-main">
						      <header class="comment-header">
						        <div class="comment-meta"><a class="comment-author" href="#">${session.user.name}(我)</a> 评论于
						        </div>
						      </header>
						      <div class="comment-body">
					        	<div class="comment-text-area">
				        		<form id="commentForm" >
									<textarea style="width:100%" id="co" name="comment.content" placeholder="请输入评论内容......"></textarea>
									<a id="btn_sub" type="button" class="btn btn-default" >评论</a>
									<b style="color:red"></b>
								</form>
								</div>
						      </div>
						    </div>
						  </li>
						</ul>
                    </section>
                </div>
                <div class="col-lg-4 col-md-5">
                	<br/>
                    <div id="property-sidebar">
    <section class="widget adv-search-widget clearfix">
        <div id="advance-search-widget" class="clearfix">
        <div id="widget-tabs">
            <ul class="tab-list clearfix">
                <li><a class="btn" href="#tab-1">相关文章</a></li>
                <li><a class="btn" href="#tab-2">好房推荐</a></li>
            </ul>
            <div id="tab-1" class="tab-content current">
            <ul class="list-group listmsg">
            	<c:forEach items="${aticleList}" var="d">
			    <li class="list-group-item">
			    	<a href="${d.content_url }">${d.title}<span>${d.created_time}</span></a>
			    </li>
			   </c:forEach>
			</ul>
            </div>
             <div id="tab-2" class="tab-content current">
            	<c:forEach items="${buildingList }" var="builds">
			        <div class="property clearfix" >
			            <a href="#" class="feature-image zoom"><img data-action="zoom" src="${builds.logo }" alt="楼盘图片"></a>
			            <div class="property-contents">
			                <a href="${pageContext.request.contextPath}/buildings/history?buildingsVO.id=${builds.id}">${builds.name}</a>
			                
			            </div>
			        </div>
        		</c:forEach>
            </div>
         </div>
       </div> 
	</section>
</div>                </div>

 <div class="col-lg-12 col-md-12">
 	<section class="xxp2">
 		<div class="xxp wow slideInLeft">楼盘地图</div>
 		<div style="width: col-md-12; height: 500px; border: #ccc solid 1px;"
				id="allmap"></div>
 	</section>
 	<br/>
 	<section class="xxp2">
       <div class="xxp wow slideInLeft">${buildingsVO.agency.name}</div>
       <div class="row wow slideInRight">
           <div class="col-md-12">
                  <div class="row" style="padding:0 50px">
                  	  <div class="col-md-4">
                      	<img src="${pageContext.request.contextPath }/model/assets/images/property/3.jpg" style="width:125px;height:110px">
                      	<strong><br/><i title="法人" class="glyphicon glyphicon-user"></i>${buildingsVO.agency.leader}</strong>
                      	<strong><br/> <i title="地址" class="fa fa-map-marker"></i>${buildingsVO.agency.address}
                       <br/><i title="手机" class="fa fa-phone"></i>${buildingsVO.agency.phone}
                       <br/><i title="邮箱" class="fa fa-envelope"></i>${buildingsVO.agency.email}
                       <br/><i title="电话" class="fa fa-fax"></i>${buildingsVO.agency.tel}</strong>
                      </div>
                      <div class=" col-md-4">
                      	<p><strong>公司简介：</strong>${buildingsVO.agency.intro}</p>
                      </div>
                  </div>
               </div>
           </div>
   </section>
 </div>
            </div>
        </div>
<script src="${pageContext.request.contextPath }/plugins/bootstrap-popover.js"></script>
<script src="${pageContext.request.contextPath }/plugins/bootstrap-tooltip.js"></script>
    <script>
    //地图js
var map = new BMap.Map("allmap");    // 创建Map实例
map.centerAndZoom(new BMap.Point(114.98,25.82), 12);  // 初始化地图,设置中心点坐标和地图级别
map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
map.setCurrentCity("赣州");          // 设置地图显示的城市 此项是必须设置的
map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
function myFun(result){
	var cityName = result.name;
	map.setCenter(cityName);
}
var myCity = new BMap.LocalCity();
myCity.get(myFun);
var opts = {
		width : 400,     // 信息窗口宽度
		height: 200,     // 信息窗口高度
		enableMessage:true//设置允许信息窗发送短息
	   };
	  var lng=${buildingsVO.longitude}
	  var lat=${buildingsVO.latitude}
	  var title='${buildingsVO.name}';
	  var logo='${buildingsVO.logo}';
	  var c='${buildingsVO.intro}';
	var marker = new BMap.Marker(new BMap.Point(lng,lat));  // 创建标注
	var content = "<h4 style='margin:0 0 5px 0;padding:0.2em 0'>"+title+"</h4>" + 
	"<img style='float:right;margin:4px' id='imgDemo' src='"+logo+"' width='139' height='104'/>" + 
	"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>"+c+"</p>" + 
	"</div>";
	map.addOverlay(marker);               // 将标注添加到地图中
	addClickHandler(content,marker);
function addClickHandler(content,marker){
	marker.addEventListener("click",function(e){
		openInfo(content,e)}
	);
}
function openInfo(content,e){
	var p = e.target;
	var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
	var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象 
	map.openInfoWindow(infoWindow,point); //开启信息窗口
}

//点赞

</script>