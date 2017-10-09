<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path= request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<title>客户分页</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
    <meta name="author" content="Muhammad Usman">

    <%@include file="./Jspscript.jsp" %>
    <link rel="stylesheet" href="<%=path%>/toastr/toastr.min.css">
 	
    <link href="<%=path%>/plugins/bootstrap/bootstrap.min.css" rel="stylesheet">
	<link href="<%=path%>/bootstrap/bootstrap-table.css" rel="stylesheet"/> 
	<script type="text/javascript" src="<%=path%>/bootstrap/dist/js/bootstrapValidator.js"></script>
	 <link rel="stylesheet" href="<%=path%>/bootstrap/dist/css/bootstrapValidator.css"/>
	<body>
	  		<!-- 更换经销商logo -->
			<%@ include file="./changeAgencyLogo.jsp" %>
			<!-- 上传电子合同 -->
			<%@ include file="./contractEmployee.jsp" %>
		    <!-- topbar starts -->
		    <%@ include file="./top.jsp" %>
		   
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
            <a href="#">客户管理</a>
        </li>
    </ul>
</div>
<div class="row">
              
         <!--按钮  -->
        <div id="toolbar" class="btn-group">
         
            <button id="btn_edit" type="button" class="btn btn-default" >
                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
            </button>
            <button id="btn_contarct" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-new-window" aria-hidden="true"></span>上传电子合同
            </button>
        </div>
                <!-- 表格 -->
                <div class="col-xs-12">
                    <table id="tb_departments" class="table table-striped table-bordered table-hover" >
                    </table>
                </div>
            </div>


</div>
	
</div><!--/.fluid-container-->

      
        <!-- 修改 -->
       <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">编辑</h4>
                </div>
                <div class="modal-body">
                   <form  id="f">
					<input type="hidden" name="con.emp.id" >
					<input type="hidden" name="con.id">
                    <div class="form-group">
                        <label for="con.name">客户名称</label>
                        <input type="text" name="con.name"  class="form-control"  placeholder="客户名称">
                    </div>
                    <div class="form-group">
                        <label for="con.gender">性别</label>
                        <select class="form-control" name="con.gender">
						  <option value="男">男</option>
						  <option value="女">女</option>
						</select>
                    </div>
                 
                    <div class="form-group">
                         <label for="con.email">客户邮箱</label>
			   			 <input type="text" name="con.email" class="form-control"  placeholder="客户邮箱" >
                    </div>
                     <div class="form-group">     
                         <label for="con.identity_id">身份证号</label>
					    <input type="text" name="con.identity_id" onkeyup="value=value.replace(/[^\d]/g,'')" class="form-control"  placeholder="身份证号" >
                    </div>
                     <div class="form-group">                  
                        <label for="con.phone">手机号码</label>
			 		    <input type="text" name="con.phone" onkeyup="value=value.replace(/[^\d]/g,'')" class="form-control"  placeholder="手机号码">
                    </div>
                    <div class="form-group">                 
                        <label for="con.address">联系地址</label>
			    		<input type="text" name="con.address" class="form-control" placeholder="联系地址">
                    </div>
                    <div class="form-group">                   
                         <label for="con.together">同购房人</label>
			   			 <input type="text" name="con.together" class="form-control"  placeholder="同购房人" >
                    </div>
                    <div class="form-group">
                         <label for="con.customer_type">客户类型</label>
						  	<select class="form-control" name="con.customer_type" >
								  <option value="已预约">已预约</option>
								  <option value="已看房">已看房</option>
								  <option value="已购房">已购房</option>
							</select>
                    </div>
                    <div class="modal-footer">
	                    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
	                    <button type="button"  class="btn btn-primary" data-dismiss="modal" id='update'><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
                   </div>
                  </form>
                </div>
            </div>
        </div>
       </div>


<script src="<%=path%>/bootstrap/bootstrap-table.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-locale-all.min.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-zh-CN.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-export.js"></script>
<script src="<%=path%>/bootstrap/tableExport.js"></script>
<script src="<%=path %>/js/formFill.js"></script>
<!-- jQuery消息提示框 -->
<script src="<%=path%>/toastr/toastr.min.js"></script>
<script src="<%=path%>/js/toastrOption.js"></script>
<script src="<%=path %>/js/table_cous.js"></script>
<script src="<%=path %>/js/cous.js"></script>
 <!-- 上传图片 -->
<script>
$('#logo').fileinput({//上传地址
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
	$('#changeLogo').on('hide.bs.modal', function () {//打开窗口
		if(imgSrc!=""){
		$("#headicon").attr('src',imgSrc)
		}
 	})
 });
</script>
 
</body>
</html>