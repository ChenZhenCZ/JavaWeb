<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/10/10
  Time: 19:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    String path = request.getContextPath();
%>
<head>
    <title>权限分配</title>
    <link href="<%=path %>/plugins/bootstrap/bootstrap.min.css" rel="stylesheet"/>
    <link href="<%=path %>/plugins/select2/select2.min.css" rel="stylesheet"/>
    <link href="<%=path %>/plugins/select2/select2-bootstrap.min.css" rel="stylesheet"/>
    <link href="<%=path%>/plugins/zTree/zTreeStyle/zTreeStyle.css" rel="stylesheet" />
</head>
<body class="container">
<div class="row">
    <div class="col-lg-2">
        <select id="role" name="role" class="form-control select2"></select>
    </div>
</div>
<div class="row">
    <div class="col-lg-12">
        <ul id="pTree" class="ztree"></ul>
    </div>
</div>
<div class="row">
    <div class="col-lg-12">
        <a href="javascript:void(0);" onclick="" class="btn btn-primary">保存权限</a>
    </div>
</div>
</body>
<script src="<%=path %>/plugins/jquery.min.js"></script>
<script src="<%=path %>/plugins/bootstrap/bootstrap.min.js"></script>
<script src="<%=path %>/plugins/select2/select2.min.js"></script>
<script src="<%=path %>/plugins/zTree/jquery.ztree.all.min.js"></script>
<script>
    var setting = {
        check: {
            enable: true
        },
        data: { // 树的数据的形式
            simpleData: {
                enable: true,
                idKey: "id", // id编号命名
                pIdKey: "pId", // 父id编号命名
                rootId: 0
            }
        },
        async: {
            enable: true,
            url: '<%=path %>/permission/by_module',
            method: 'post',
            autoParam: ["id=mid"]
        }
    };
    $(function(){
        //去获取角色名称
        $.get("<%=path %>/role/all",
            function (data) {
                $("#role").select2(
                    {
                        data:data,
                        placeholder:'请选择',
                        allowClear:false
                    }
                );
            }, "json"
        );
        $.get("<%=path %>/module/all",
            function (data) {
                $.fn.zTree.init($('#pTree'), setting, data);
            }, "json"
        );
    });
</script>
</html>
