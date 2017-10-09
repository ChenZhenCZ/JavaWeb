<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path= request.getContextPath();
%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员首页</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="author" content="Muhammad Usman">

    <!-- The styles -->
    <%@include file="./jsAndCss.jsp" %>
    <!-- jQuery -->
</head>

<body>
	<div class="container">
 
    <!-- topbar starts -->
   <%@ include file="./topbar.jsp" %>
    <!-- topbar ends -->
<div class="ch-container">
    <div class="row">
        
        <!-- left menu starts -->
        <%@ include file="./leftMenu.jsp" %>
        <!--/span-->
        <!-- left menu ends -->

        <div id="content" class="col-lg-10 col-sm-10">
            <!-- content starts -->
            <div>
    <ul class="breadcrumb">
        <li>
            <a href="#">首页</a>
        </li>
        <li>
            <a href="#">信息中心</a>
        </li>
    </ul>
</div>
<div class=" row">
    <div class="col-md-3 col-sm-3 col-xs-6">
        <a data-toggle="tooltip" title="6 new members." class="well top-block" href="../agency/agencyListPage">
            <i class="glyphicon glyphicon-globe blue"></i>
            <div>经销商</div>
            <div>${agencyCount }</div>
            <span class="notification">${agencyCount }</span>
        </a>
    </div>

    <div class="col-md-3 col-sm-3 col-xs-6">
        <a data-toggle="tooltip" title="4 new buildings" class="well top-block" href="../buildings/allBuildsListPage">
            <i class="glyphicon glyphicon-road green"></i>
            <div>楼盘信息</div>
            <div>${buildCount}</div>
            <span class="notification green">${buildCount}</span>
        </a>
    </div>

    <div class="col-md-3 col-sm-3 col-xs-6">
        <a data-toggle="tooltip" title="34 new user" class="well top-block" href="../user/listPage">
            <i class="glyphicon glyphicon-shopping-heart "></i>
            <div>用户信息</div>
            <div>${userCount }</div>
            <span class="notification yellow">${userCount }</span>
        </a>
    </div>

    <div class="col-md-3 col-sm-3 col-xs-6">
        <a data-toggle="tooltip" title="$25 new sales" class="well top-block" href="#">
            <i class="glyphicon glyphicon-envelope red"></i>
            <div>成交记录</div>
            <div>$25</div>
            <span class="notification red">$12</span>
        </a>
    </div>
</div>

<div class="row">
    <div class="box col-md-12">
        <div class="box-inner">
            <div class="box-header well">
                <h2><i class="glyphicon glyphicon-info-sign"></i>基本信息</h2>

                <div class="box-icon">
                    <a href="#" class="btn btn-setting btn-round btn-default"><i
                            class="glyphicon glyphicon-cog"></i></a>
                    <a href="#" class="btn btn-minimize btn-round btn-default"><i
                            class="glyphicon glyphicon-chevron-up"></i></a>
                    <a href="#" class="btn btn-close btn-round btn-default"><i
                            class="glyphicon glyphicon-remove"></i></a>
                </div>
            </div>
            <div class="box-content row">
                <div class="col-lg-7 col-md-12">
                   

                    
                </div>
                <!-- Ads, you can remove these -->
                <div class="col-lg-5 col-md-12 hidden-xs center-text">
                    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                    <!-- Charisma Demo 4 -->
                    <ins class="adsbygoogle"
                         style="display:inline-block;width:336px;height:280px"
                         data-ad-client="ca-pub-5108790028230107"
                         data-ad-slot="9467443105"></ins>
                    <script>
                        (adsbygoogle = window.adsbygoogle || []).push({});
                    </script>
                </div>

                <div class="col-lg-5 col-md-12 visible-xs center-text">
                    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                    <!-- Charisma Demo 5 -->
                    <ins class="adsbygoogle"
                         style="display:inline-block;width:250px;height:250px"
                         data-ad-client="ca-pub-5108790028230107"
                         data-ad-slot="8957582309"></ins>
                    <script>
                        (adsbygoogle = window.adsbygoogle || []).push({});
                    </script>
                </div>
                <!-- Ads end -->

            </div>
        </div>
    </div>
</div>

</div><!--/.fluid-container-->
</div>
</body>
</html>