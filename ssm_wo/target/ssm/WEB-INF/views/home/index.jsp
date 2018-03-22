<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path=request.getContextPath();
%>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>素材火www.sucaihuo.com - 主页</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <%@include file="../master/top.jsp"%>
</head>

<body>
<div id="wrapper">
    <%@include file="../master/folt.jsp"%>
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="index.html#"><i class="fa fa-bars"></i> </a>
                    <form role="search" class="navbar-form-custom" method="post" action="search_results.html">
                        <div class="form-group">
                            <input type="text" placeholder="请输入您需要查找的内容 …" class="form-control" name="top-search" id="top-search">
                        </div>
                    </form>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li>
                        <span class="m-r-sm text-muted welcome-message"><a href="index.html" title="返回首页"><i class="fa fa-home"></i></a>欢迎使用H+后台主题</span>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="index.html#">
                            <i class="fa fa-envelope"></i> <span class="label label-warning">16</span>
                        </a>
                        <ul class="dropdown-menu dropdown-messages">
                            <li>
                                <div class="dropdown-messages-box">
                                    <a href="profile.html" class="pull-left">
                                        <img alt="image" class="img-circle" src="img/a7.jpg">
                                    </a>
                                    <div class="media-body">
                                        <small class="pull-right">46小时前</small>
                                        <strong>小四</strong> 项目已处理完结
                                        <br>
                                        <small class="text-muted">3天前 2014.11.8</small>
                                    </div>
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="dropdown-messages-box">
                                    <a href="profile.html" class="pull-left">
                                        <img alt="image" class="img-circle" src="img/a4.jpg">
                                    </a>
                                    <div class="media-body ">
                                        <small class="pull-right text-navy">25小时前</small>
                                        <strong>国民岳父</strong> 这是一条测试信息
                                        <br>
                                        <small class="text-muted">昨天</small>
                                    </div>
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="text-center link-block">
                                    <a href="mailbox.html">
                                        <i class="fa fa-envelope"></i> <strong> 查看所有消息</strong>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="index.html#">
                            <i class="fa fa-bell"></i> <span class="label label-primary">8</span>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts">
                            <li>
                                <a href="mailbox.html">
                                    <div>
                                        <i class="fa fa-envelope fa-fw"></i> 您有16条未读消息
                                        <span class="pull-right text-muted small">4分钟前</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="profile.html">
                                    <div>
                                        <i class="fa fa-qq fa-fw"></i> 3条新回复
                                        <span class="pull-right text-muted small">12分钟钱</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="text-center link-block">
                                    <a href="notifications.html">
                                        <strong>查看所有 </strong>
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="login.html">
                            <i class="fa fa-sign-out"></i> 退出
                        </a>
                    </li>
                </ul>

            </nav>
        </div>
        <div class="row  border-bottom white-bg dashboard-header">
            <div class="col-sm-12">
                <blockquote class="text-warning" style="font-size:14px">您是否需要自己做一款后台、会员中心等等的，但是又缺乏html等前端知识…
                    <br>您是否一直在苦苦寻找一款适合自己的后台主题…
                    <br>您是否想做一款自己的web应用程序…
                    <br>…………
                    <h4 class="text-danger">那么，现在H+来了</h4>
                </blockquote>

                <hr>
            </div>
            <div class="col-sm-3">
                <h2>Hello,Guest</h2>
                <small>移动设备访问请扫描以下二维码：</small>
                <br>
                <br>
                <img src="img/qr_code.png" width="100%" style="max-width:264px;">
                <br>
            </div>
            <div class="col-sm-5">
                <h2>
                    素材火www.sucaihuo.com
                </h2>
                <p>H+是一个完全响应式，基于Bootstrap3.3.4最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术，她提供了诸多的强大的可以重新组合的UI组件，并集成了最新的jQuery版本(v2.1.1)，当然，也集成了很多功能强大，用途广泛的jQuery插件，她可以用于所有的Web应用程序，如<b>网站管理后台</b>，<b>网站会员中心</b>，<b>CMS</b>，<b>CRM</b>，<b>OA</b>等等，当然，您也可以对她进行深度定制，以做出更强系统。</p>
                <p>
                    <b>当前版本：</b>v2.0
                </p>
                <p>
                    <b>定价：</b><span class="label label-warning">&yen;768（不开发票）</span>
                </p>
                <br>
                <p>
                    <a class="btn btn-success btn-outline" href="http://wpa.qq.com/msgrd?v=3&uin=516477188&site=qq&menu=yes" target="_blank">
                        <i class="fa fa-qq"> </i> 联系我
                    </a>
                    <a class="btn btn-white btn-bitbucket" href="http://www.zi-han.net" target="_blank">
                        <i class="fa fa-home"></i> 访问博客
                    </a>
                </p>
            </div>
            <div class="col-sm-4">
                <h4>H+具有以下特点：</h4>
                <ol>
                    <li>完全响应式布局（支持电脑、平板、手机等所有主流设备）</li>
                    <li>基于最新版本的Bootstrap 3.3.4</li>
                    <li>提供4套不同风格的皮肤</li>
                    <li>支持多种布局方式</li>
                    <li>使用最流行的的扁平化设计</li>
                    <li>提供了诸多的UI组件</li>
                    <li>集成多款国内优秀插件，诚意奉献</li>
                    <li>提供盒型、全宽、响应式视图模式</li>
                    <li>采用HTML5 & CSS3</li>
                    <li>拥有良好的代码结构</li>
                    <li>更多……</li>
                </ol>
            </div>

        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="wrapper wrapper-content">
                    <div class="row">

                        <div class="col-lg-4">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5>联系信息</h5>

                                </div>
                                <div class="ibox-content">
                                    <p><i class="fa fa-send-o"></i> 博客：<a href="http://www.zi-han.net" target="_blank">http://www.zi-han.net</a>
                                    </p>
                                    <p><i class="fa fa-qq"></i> QQ：<a href="http://wpa.qq.com/msgrd?v=3&uin=516477188&site=qq&menu=yes" target="_blank">516477188</a>
                                    </p>
                                    <p><i class="fa fa-weixin"></i> 微信：<a href="javascript:;">zheng-zihan</a>
                                    </p>
                                    <p><i class="fa fa-credit-card"></i> 支付宝：<a href="javascript:;" class="支付宝信息">zheng-zihan@qq.com / *子涵</a>
                                    </p>
                                </div>
                            </div>
                        </div>

    </div>
</div>

<!-- Mainly scripts -->
<script src="<%=path %>/hui/js/jquery-2.1.1.min.js"></script>
<script src="<%=path %>/hui/js/bootstrap.min.js?v=3.4.0"></script>
<script src="<%=path %>/hui/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="<%=path %>/hui/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="<%=path %>/hui/js/hplus.js?v=2.2.0"></script>
<script src="<%=path %>/hui/js/plugins/pace/pace.min.js"></script>


</body>

</html>
