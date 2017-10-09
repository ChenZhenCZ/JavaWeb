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
						<img src="../1.jpg" class="img-responsive img-circle" alt="...">
						</div>
						</li>
                        <li><a class="ajax-link" href="../admin/index"><i class="glyphicon glyphicon-home"></i><span> 首页</span></a>
                        </li>
                         <li><a class="ajax-link" href="../agency/agencyListPage"><i class="glyphicon glyphicon-globe"></i><span>经销商管理</span></a>
                        </li>
                         <li><a class="ajax-link" href="../user/listPage"><i class="glyphicon glyphicon-user"></i><span>用户管理</span></a>
                        </li>
                        <li class="accordion">
                            <a href="javascript:void(0);"><i class="glyphicon glyphicon-road"></i><span>楼盘管理</span></a>
                            <ul class="nav nav-pills nav-stacked">
                                <li><a href="../buildings/allBuildsListPage">楼盘列表</a></li>
                                <li><a href="../buildings/buildsMap">楼盘地图</a></li>
                            </ul>
                        </li>
                        <li class="accordion">
                            <a href="javascript:void(0);"><i class="glyphicon glyphicon-edit"></i><span>文章管理</span></a>
                            <ul class="nav nav-pills nav-stacked">
                                <li><a href="../admin/article">文章新增</a></li>
                                <li><a href="../admin/articleListPage">文章管理</a></li>
                            </ul>
                        </li>
                        <li class="accordion">
                            <a href="javascript:void(0);"><i class="glyphicon glyphicon-list"></i><span>文章类别管理</span></a>
                            <ul class="nav nav-pills nav-stacked">
                                <li><a href="../admin/atricleType">文章类别新增</a></li>
                                <li><a href="../admin/articleTypeListPage">文章类别管理</a></li>
                            </ul>
                        </li>
                        <li class="accordion">
                            <a href="javascript:void(0);"><i class="glyphicon glyphicon-plus"></i><span>活动管理</span></a>
                            <ul class="nav nav-pills nav-stacked">
                                <li><a href="../activity/addAdminActivityPage">活动新增</a></li>
                                <li><a href="../activity/adminActiviList">活动列表</a></li>
                            </ul>
                        </li>
                        <li><a class="ajax-link" href="../admin/sendMsgPage"><i class="glyphicon glyphicon-user"></i><span>消息推送</span></a>
                    </ul>
                </div>
            </div>
        </div>