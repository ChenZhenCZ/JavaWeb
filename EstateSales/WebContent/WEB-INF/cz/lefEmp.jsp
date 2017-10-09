<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <div class="col-sm-2 col-lg-2">
            <div class="sidebar-nav">
                <div class="nav-canvas">
                    <div class="nav-sm nav nav-stacked">

                    </div>
                    <ul class="nav nav-pills nav-stacked main-menu">
                        <li class="nav-header">
						<div>
						<a href="#changeLogo" data-toggle="modal" data-target="#changeLogo">
						<img id="headicon" src="${emp.headicon}" class="img-responsive img-circle" alt="员工头像">
						</a>
						</div>
						</li>
                        <li><a class="ajax-link" href="${pageContext.request.contextPath }/staff/empindex"><i class="glyphicon glyphicon-home"></i><span> 信息中心</span></a>
                        </li>
                        <li><a class="ajax-link" href="${pageContext.request.contextPath }/sale/performanceList"><i class="glyphicon glyphicon-eye-open"></i><span> 绩效管理</span></a>
                        </li>
                        <li><a class="ajax-link" href="${pageContext.request.contextPath }/appointment/init"><i
                                    class="glyphicon glyphicon-edit"></i><span>购房预约管理</span></a></li>
                        <li  class="accordion"><a><i class="glyphicon glyphicon-list-alt"></i><span> 报表统计</span></a>
                        <ul class="nav nav-pills nav-stacked">
	                                <li><a  href="${pageContext.request.contextPath}/staff/highcharst">房屋销售情况</a></li>
	                                <li><a  href="${pageContext.request.contextPath}/appointment/appointemenEiht">户型预约情况</a></li>
	                          
                            </ul>
                        </li>
                        <li><a class="ajax-link" href="${pageContext.request.contextPath}/sale/init"><i class="glyphicon glyphicon-font"></i><span> 销售管理</span></a>
                        </li>
                        
                         <li class="accordion"><a><i class="glyphicon glyphicon-align-justify"></i><span>我的楼盘</span></a>
                       		<ul class="nav nav-pills nav-stacked">
	                                <li><a  href="${pageContext.request.contextPath}/staff/empbuilding">楼盘信息</a></li>
	                                <li><a  href="${pageContext.request.contextPath}/building/empbuildingPage">楼栋列表</a></li>
	                                <li><a  href="${pageContext.request.contextPath}/staff/buildingsMap">楼盘地图</a></li>
                            </ul>
                         </li>  
                        <li class="accordion"><a><i class="glyphicon glyphicon-align-justify"></i><span>客户管理</span></a>
                       			<ul class="nav nav-pills nav-stacked">
	 
	                                <li><a  href="${pageContext.request.contextPath }/cous/cousfeng">客户查看</a></li>
                            	</ul>
                         </li>  
                    </ul>
                </div>
            </div>
        </div>