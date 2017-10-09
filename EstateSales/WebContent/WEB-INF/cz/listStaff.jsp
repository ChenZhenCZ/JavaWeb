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
  <title>员工分页</title>
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
		            <button id="btn_add" type="button" class="btn btn-default" >
		                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
		            </button>
		            <button id="btn_edit" type="button" class="btn btn-default" data-modal="true" target="">
		                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
		            </button>
		             <button id="btn_pwd" type="button" class="btn btn-default" data-modal="true" target="">
		                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>初始化密码
		            </button>
		            <button id="btn_delete" type="button" class="btn btn-default">
		                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
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
        <!-- 新增 -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">新增</h4>
                </div>
                <div class="modal-body">
                   <form action="<%=path %>/staff/updataStaff" id="from1" method="post">
                    <div class="form-group">
                        <label for="emp.name">员工名称</label>
                        <input type="text" name="emp.name"  class="form-control"  placeholder="客户名称">
                    </div>
                    <div class="form-group">
                        <label for="emp.gender">性别</label>
                        <select class="form-control" name="emp.gender">
						  <option value="男">男</option>
						  <option value="女">女</option>
						</select>
                    </div>
                    <div class="form-group">
                         <label for="con.email">邮箱</label>
			   			 <input type="email" name="emp.email" class="form-control"  placeholder="邮箱" >
                    </div>
                     <div class="form-group">                  
                        <label for="emp.phone">手机号码</label>
			 		    <input type="text" name="emp.phone" class="form-control"  placeholder="手机号码">
                    </div>
                    <div class="form-group">                 
                        <label for="emp.address">联系地址</label>
			    		<input type="text" name="emp.address" class="form-control" placeholder="联系地址">
                    </div>
                    <div class="form-group">                   
                         <label for="emp.basic_salary">基本工资</label>
			   			 <input type="text" name="emp.basic_salary" class="form-control"  placeholder="基本工资" >
                    </div>
                    <div class="form-group">
                         <label for="emp.building_id">楼盘</label>
						  	<select class="form-control" name="emp.building_id" >
								  <option value="0">楼盘1</option>
								  <option value="1">楼盘2</option>
								  <option value="2">楼盘3</option>
							</select>
                    </div>
                    <div class="form-group">     
                         <label for="emp.des">个人说明</label>
					    <input type="text" name="emp.des"  class="form-control"  placeholder="个人说明" >
                    </div>
                    <div class="modal-footer">
	                    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
	                    <button type="submit"   class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
                   </div>
                  </form>
                </div>
            </div>
        </div>
        </div>
   
       <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">编辑</h4>
                </div>
                <div class="modal-body">
                   <form  id="f" >
					<input type="hidden" name="emp.id" >
					<input type="hidden" name="con.id">
                    <div class="form-group">
                        <label for="emp.name">员工名称</label>
                        <input type="text" name="emp.name"  class="form-control"  placeholder="客户名称">
                    </div>
                    <div class="form-group">
                        <label for="emp.gender">性别</label>
                        <select class="form-control" name="emp.gender">
						  <option value="男">男</option>
						  <option value="女">女</option>
						</select>
                    </div>
                    <div class="form-group">
                         <label for="con.email">邮箱</label>
			   			 <input type="text" name="emp.email" class="form-control"  placeholder="邮箱" >
                    </div>
                     <div class="form-group">                  
                        <label for="emp.phone">手机号码</label>
			 		    <input type="text" name="emp.phone" class="form-control"  placeholder="手机号码">
                    </div>
                    <div class="form-group">                 
                        <label for="emp.address">联系地址</label>
			    		<input type="text" name="emp.address" class="form-control" placeholder="联系地址">
                    </div>
                    <div class="form-group">                   
                         <label for="emp.basic_salary">基本工资</label>
			   			 <input type="text" name="emp.basic_salary" class="form-control"  placeholder="基本工资" >
                    </div>
                    <div class="form-group">
                         <label for="emp.building_id">楼盘</label>
						  	<select class="form-control" name="emp.building_id" >
								  <option value="0">楼盘1</option>
								  <option value="1">楼盘2</option>
								  <option value="2">楼盘3</option>
							</select>
                    </div>
                    <div class="form-group">     
                         <label for="emp.des">个人说明</label>
					    <input type="text" name="emp.des"  class="form-control"  placeholder="个人说明" >
                    </div>
                    <div class="modal-footer">
	                    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
	                    <button type="button"  class="btn btn-primary" data-dismiss="modal" id="update"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>修改</button>
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
<script src="<%=path %>/js/table_staff.js"></script>
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