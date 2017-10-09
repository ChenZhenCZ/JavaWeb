<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
	String path= request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta  http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>主页·面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
    <meta name="author" content="Muhammad Usman">
	 <%@ include file="./Jspscript.jsp" %>
	  <link rel="stylesheet" href="<%=path%>/toastr/toastr.min.css">
 	
   <link rel="stylesheet" href="<%=path%>/toastr/toastr.min.css">
 	
    <link href="<%=path%>/plugins/bootstrap/bootstrap.min.css" rel="stylesheet">
	<link href="<%=path%>/bootstrap/bootstrap-table.css" rel="stylesheet"/> 
	<script type="text/javascript" src="<%=path%>/bootstrap/dist/js/bootstrapValidator.js"></script>
	 <link rel="stylesheet" href="<%=path%>/bootstrap/dist/css/bootstrapValidator.css"/>
	<script type="text/javascript" src="<%=path%>/bootstrap/dist/js/bootstrapValidator.js"></script>
	 <link rel="stylesheet" href="<%=path%>/bootstrap/dist/css/bootstrapValidator.css"/>
</head>

<body>
 	<!-- 更换经销商logo -->
	<%@ include file="./changeAgencyLogo.jsp" %>
    <!-- tops -->
  	<%@ include file="./top.jsp" %>
    <!-- topbar ends -->
<div class="ch-container">
    <div class="row">
        
        <!-- left menu starts -->
       <%@ include file="./lefEmp.jsp" %>
        <!--/span-->
        <!-- left menu ends -->

        <div id="content" class="col-lg-10 col-sm-10">
            <!-- content starts -->
            <div>
    <ul class="breadcrumb">
        <li>
            <a href="<%=path%>">首页</a>
        </li>
        <li>
            <a href="#">信息中心</a>
        </li>
    </ul>
</div>

<div class="row">
    <div class="box col-md-12">
        <div class="box-inner">
            <div class="box-header well">
                <h2><i class="glyphicon glyphicon-info-sign"></i>基本信息</h2> 
            </div>
           
                <div class="col-lg-7 col-md-12">
               	
                  	<h4>员工名称 : ${emp.name}
                  	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal1" data-whatever="@mdo">编辑资料</button>
                  	</h4>
                  	<h4>邮箱 : ${emp.email}</h4>
                  	<h4>qq : ${emp.qq}</h4>
                  	<h4>性别 : ${emp.gender}</h4>
                  	<h4>个人说明 : ${emp.des}</h4>
                  	<h4>基本工资 : ${emp.basic_salary}￥</h4>
                  	<h4>地址 : ${emp.address}</h4>
                  	<h4>工作经验描述 : ${emp.exp}</h4>
                  	<h4>工作时间 : ${emp.created_time}</h4>
                  	<h4>负责的楼盘 : ${emp.buildings.name}</h4>
                  	<h4>所属经销商 : ${emp.agency.name}</h4>

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
                    <script async src="<%=path %>/pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
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
	<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="exampleModalLabel">员工信息修改</h4>
		      </div>
		      <div class="modal-body">
		      	<form action="<%=path %>/staff/updataindex" id="index" method="post">
			          <div class="form-group">
			          <input type="hidden" name="emp.phone" value="${emp.phone}"/>
			          	<input type="hidden" name="emp.id" value="${emp.id}"/>
			       		<input type="hidden" name="emp.pwd" value="${emp.pwd}"/>
			            <label for="recipient-name"  class="control-label">员工名称:</label>
			            <input type="text" name="emp.name" value="${emp.name}" class="form-control" id="recipient-name">
			          </div>
			          <div class="form-group">
			            <label for="message-text" class="control-label">邮箱:</label>
			             <input type="text" name="emp.email"  value="${emp.email}" class="form-control" id="recipient-name">
			          </div>
			           <div class="form-group">
			            <label for="message-text" class="control-label">微信号:</label>
			             <input type="text" name="emp.wechat"  value="${emp.wechat}" class="form-control" id="recipient-name">
			          </div>
			          <div class="form-group">
			            <label for="message-text" class="control-label">qq:</label>
			             <input type="text" name="emp.qq"  value="${emp.qq}" class="form-control" id="recipient-name">
			          </div>
			          <div class="form-group">
			            <label for="message-text" class="control-label">性别:</label>
			            <select class="form-control" name="emp.gender"  value="${emp.gender}" style="width: 250px">
							  <option value="男">男</option>
							  <option value="女">女</option>
						</select>
			          </div>
			          <div class="form-group">
			            <label for="message-text" class="control-label">地址:</label>
			             <input type="text" name="emp.address"  value="${emp.address}" class="form-control" id="recipient-name">
			          </div>
			          <div class="form-group">
			            <label for="message-text" class="control-label">个人说明:</label>
			             <input type="text" name="emp.des"  value="${emp.des}" class="form-control" id="recipient-name">
			          </div>
			           <div class="form-group">
			            <label for="message-text" class="control-label">工作经验描述:</label>
			          	<textarea class="form-control" name="emp.exp"  value="${emp.exp}" rows="3"></textarea>
			          </div>
			          <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				        <button type="submit" class="btn btn-primary">确认</button>
				      </div>
			          	</form>
			           </div>
				    </div>
		  </div>
		</div>
</div><!--/.fluid-container-->

<script type="text/javascript" src="<%=path %>/bootstrap/dist/js/bootstrapValidator.js"></script>
<script src="<%=path %>/js/cous.js"></script>

<!-- 上传图片 -->
<script>
$('#logo').fileinput({
    language: 'zh',
    uploadUrl: '<%=path%>/staff/uploadLogo',
    allowedFileExtensions : ['jpg', 'png','gif'],
})
var imgSrc="";
$('#logo').on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功		
	 imgSrc=data.response.emp.headicon;
	 $("#changeLogo").modal("toggle");
})
$(function () {
	$('#changeLogo').on('hide.bs.modal', function () {
		if(imgSrc!=""){
		$("#headicon").attr('src',imgSrc)
		}	
	})
 });
</script>

</body>
</html>
