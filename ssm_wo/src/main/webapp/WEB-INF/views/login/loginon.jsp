
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    String path=request.getContextPath();
%>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"><meta name="renderer" content="webkit">

    <title>注册</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link href="<%=path %>/hui/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="<%=path %>/hui/font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">
    <link href="<%=path %>/hui/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="<%=path %>/hui/css/animate.css" rel="stylesheet">
    <link href="<%=path %>/hui/css/style.css?v=2.2.0" rel="stylesheet">

</head>

<body class="gray-bg">

<div class="middle-box text-center loginscreen   animated fadeInDown">
    <div>
        <div>

            <h1 class="logo-name">H+</h1>

        </div>
        <h3>欢迎注册 H+</h3>
        <p>创建一个H+新账户</p>
        <form id="loginForm" class="m-t" role="form" method="post" action="<%=path%>/user/zhu">
            <div class="form-group">
                <input type="text" name="userName" class="form-control" placeholder="请输入用户名" required="">
            </div>
            <div class="form-group">
                <input type="email" name="mail" class="form-control" placeholder="电子邮箱" required="">
            </div>
            <div class="form-group">
                <input type="text" name="phone" class="form-control" placeholder="请输手机号码" required="">
            </div>
            <div class="form-group">
                <input type="password" name="pwd" class="form-control" placeholder="请输入密码" required="">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="请再次输入密码" required="">
            </div>
            <div class="form-group text-left">
                <div class="checkbox i-checks">
                    <label class="no-padding">
                        <input type="checkbox"><i></i> 我同意注册协议</label>
                </div>
            </div>
            <button type="button" class="btn btn-primary block full-width m-b" onclick="zhu();">注 册</button>
            <p class="text-muted text-center"><small>已经有账户了？</small><a href="<%=path %>/user/login">点此登录</a>
            </p>
        </form>
    </div>
</div>

<!-- Mainly scripts -->
<script src="<%=path %>/hui/js/jquery-2.1.1.min.js"></script>
<script src="<%=path %>/hui/js/bootstrap.min.js?v=3.4.0"></script>
<!-- iCheck -->
<script src="<%=path %>/hui/js/plugins/iCheck/icheck.min.js"></script>
<script>
    $(document).ready(function () {
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
    });
    function zhu(){
        $.post('/user/zhu',
            $('#loginForm').serialize(),
            function (data) {
                if (data.result === 'ok') {
                    alert(data.message);
                    window.location.href ="/user/login";
                } else {
                    alert(data.message);
                }
            },
            'json'
        )

    }
</script>


</body>

</html>

