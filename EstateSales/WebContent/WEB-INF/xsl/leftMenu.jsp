<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
        <div class="col-sm-2 col-lg-2">
            <div class="sidebar-nav">
                <div class="nav-canvas">
                    <div class="nav-sm nav nav-stacked">

                    </div>
                    <!-- 左部菜单条开始 -->
                    <ul class="nav nav-pills nav-stacked main-menu">
                        <li class="nav-header">
						<div>
						<a href="#changeLogo" data-toggle="modal" data-target="#changeLogo"> 	
							<img id="logoImg" src="${agencyVO.logo}" class="img-responsive img-circle" alt="房地产经销商logo">
						</a>
						</div>
						</li>
                        <li class="accordion"><a href="javascript:void(0);"><i class="glyphicon glyphicon-home"></i><span>信息中心</span></a>
                            <ul class="nav nav-pills nav-stacked">
                                <li><a href="../agency/initInfo">资料修改</a></li>
                            	<li><a href="../agency/lookInfo">资料查看</a></li>
                                <li><a href="../agency/modifyPwd">密码修改</a></li>
                            </ul>
                        </li>
                        <li class="accordion"><a href="javascript:void(0);"><i class="glyphicon glyphicon-plus"></i><span>楼盘管理</span></a>
                            <ul class="nav nav-pills nav-stacked">
                                <li><a href="../buildings/buildAdd">新增楼盘</a></li>
                                <li><a href="../buildings/list">楼盘信息管理</a></li>
                                <li><a href="../agency/buildingsMap">楼盘地图</a></li>
                            </ul>
                        </li>
                        <li class="accordion"><a class="ajax-link" href="form.html"><i class="glyphicon glyphicon-edit"></i><span>楼栋管理</span></a>
                        	<ul class="nav nav-pills nav-stacked">
                                <li><a href="../building/addBuilding">新增楼栋</a></li>
                                <li><a href="../building/buildingPage">楼栋信息管理</a></li>
                            </ul>
                        </li>
                        <li class="accordion"><a class="ajax-link" href="chart.html"><i class="glyphicon glyphicon-list-alt"></i><span> 户型管理</span></a>
                        	<ul class="nav nav-pills nav-stacked">
                                <li><a href="../house/addHouse">新增户型</a></li>
                                <li><a href="../house/list">户型信息管理</a></li>
                            </ul>
                        </li>
                        <li class="accordion"><a class="ajax-link" ><i class="glyphicon glyphicon-font"></i><span>活动管理</span></a>
                        	<ul class="nav nav-pills nav-stacked">
                                <li><a href="../activity/activityAdd">发布活动</a></li>
                                <li><a href="../activity/list">活动信息管理</a></li>
                            </ul>
                        </li>
                        <li class="accordion"><a class="ajax-link" href="gallery.html"><i class="glyphicon glyphicon-picture"></i><span>员工管理</span></a>
                        	<ul class="nav nav-pills nav-stacked">
                                <li><a href="${pageContext.request.contextPath }/staff/employeetemd">员工查看</a></li>
                            </ul>
                        </li>
                        <li class="accordion"><a class="ajax-link" href="table.html"><i class="glyphicon glyphicon-align-justify"></i><span>绩效管理</span></a>
                        	<ul class="nav nav-pills nav-stacked">
                                <li><a href="../salary/initAgencyEmpSalaryList">绩效详情</a></li>
                            </ul>
                        </li>
                        <li class="accordion"><a href="javascript:void(0);"><i class="glyphicon glyphicon-plus"></i><span>购房预约管理</span></a>
                            <ul class="nav nav-pills nav-stacked">
                                <li><a href="../appointment/initAgencyLookAppoint">预约记录</a></li>
                            </ul>
                        </li>
                        <li class="accordion"><a class="ajax-link" href="calendar.html"><i class="glyphicon glyphicon-calendar"></i><span>销售管理</span></a>
                        	<ul class="nav nav-pills nav-stacked">
                                <li><a href="../sale/initAgencyTable">销售记录</a></li>
                                <li><a href="${pageContext.request.contextPath}/staff/agencyhighcharst">销售报表</a></li>
                            </ul>
                        </li>
                        <li class="accordion"><a class="ajax-link" href="grid.html"><i class="glyphicon glyphicon-th"></i><span>客户管理</span></a>
                        	<ul class="nav nav-pills nav-stacked">
                                <li><a href="${pageContext.request.contextPath }/cous/customerList">客户查看</a></li>
                            </ul>
                        </li>
                        <li class="accordion"><a href="tour.html"><i class="glyphicon glyphicon-globe"></i><span>评价管理</span></a>
                        	<ul class="nav nav-pills nav-stacked">
                                <li><a href="../comment/initAgencylookComment">查看评价</a></li>
                            </ul>
                       	</li>
                    </ul>
                    <!-- 左部菜单条结束 -->
                </div>
            </div>
        </div>