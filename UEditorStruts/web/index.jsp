<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/10/18
  Time: 8:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
%>
<!DOCTYPE HTML>
<html>

<head>
  <meta charset="UTF-8">
  <title>ueditor demo</title>
</head>

<body>
<!-- 加载编辑器的容器 -->
<div style="width:800px; height: 600px;">
<script id="container" name="content" type="text/plain">
        初始内容
</script>
</div>
<a href="javascript:void(0);" onclick="getContent();">发布文章</a>
<!-- 配置文件 -->
<script type="text/javascript" src="<%=path %>/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="<%=path %>/ueditor/ueditor.all.js"></script>
<!-- 实例化编辑器 -->
<script type="text/javascript">
    var ue = UE.getEditor('container');

    function getContent() {
        alert(ue.getContent());
    }

</script>
</body>

</html>
