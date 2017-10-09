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
<title>员工管理</title>
 	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="author" content="Muhammad Usman">

	<!-- The styles -->
 	<%@include file="./JsAndCss.jsp" %>
 	
 	<!-- jQuery消息提示框 -->
	<link rel="stylesheet" href="<%=path%>/toastr/toastr.min.css">
 	
    <link href="<%=path%>/plugins/bootstrap/bootstrap.min.css" rel="stylesheet">
	<link href="<%=path%>/bootstrap/bootstrap-table.css" rel="stylesheet"/> 
    
</head>
<body>
	<!-- 更换经销商logo -->
	<%@ include file="./changeAgencyLogo.jsp" %>
    <!-- topbar starts -->
    <%@include file="./top.jsp" %>
    <!-- topbar ends -->
    <!-- 模泰框 ：新增开始 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  	<div class="modal-dialog" role="document">
      <div class="modal-content">
          <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title" id="myModalLabel">新增</h4>
          </div>
          <div class="modal-body">
             <form  id="from1" >
              <div class="form-group">
                  <label for="emp.name">员工名称</label>
                  <input type="text" name="emp.name"  class="form-control"  placeholder="员工名称">
              </div>
              <div class="form-group">
                  <label for="emp.gender">性别</label>
                  <select class="form-control" name="emp.gender">
  					<option value="男">男</option>
				 	<option value="女">女</option>
				  </select>
              </div>
              <div class="form-group">
                   <label for="emp.email">邮箱</label>
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
	  			   <select class="form-control" name="emp.buildings.id">
				       <s:iterator var="t" value="#request.buildsList">
			   				<option value="${t.id}" >${t.name}</option>
		   			   </s:iterator>
				   </select>
              </div>
              <div class="form-group">     
                   <label for="emp.percent">提成百分比</label>
   				   <input type="number" name="emp.percent"  class="form-control"  placeholder="请输入提成百分比" >
              </div>
              <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>取消</button>
               <button type="button"   class="btn btn-primary" data-dismiss="modal" id="add"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>新增</button>
             </div>
            </form>
          </div>
      </div>
  	</div>
   </div>
   <!-- 模态框：新增结束 -->
   <!-- 模态框：修改开始-->
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
                 	  <option value="男" selected="selected">男</option>
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
 			 		<input type="text" name="emp.basic_salary" onkeyup="value=value.replace(/[^\d]/g,'') " ng-pattern="/[^a-zA-Z]/" class="form-control"  placeholder="基本工资" >
               </div>
               <div class="form-group">
                    <label for="emp.building_id">楼盘</label>
				  	<select class="form-control" name="emp.buildings.id">
				       <s:iterator var="t" value="#request.buildsList">
			   				<option value="${t.id}" >${t.name}</option>
		   			   </s:iterator>
				   </select>
               </div>
               <div class="form-group">     
                    <label for="emp.percent">提成百分比</label>
    				<input type="text" name="emp.percent"  class="form-control"  placeholder="请输入提成百分比" >
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
	<!-- 模态框：修改结束-->
	
<div class="ch-container">
    <div class="row">
        <!-- left menu starts -->
		<%@ include file="./leftMenu.jsp" %>
        <div id="content" class="col-lg-10 col-sm-10">
        <!-- content starts -->
        <div>
		    <ul class="breadcrumb">
		        <li><a href="<%=path%>/agency/main">首页</a></li>
		        <li><a href="javascript:void(0);">员工管理</a></li>
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
		            <button id="btn_ho" type="button" class="btn btn-default">
		                <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>激活
		            </button>
		            <button id="btn_delete" type="button" class="btn btn-default">
		                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>冻结
		            </button>
		        </div><!-- 按钮结束 -->
                <!-- 表格开始 -->
                <div class="col-xs-12">
                   <table id="tb" class="table table-bordered table-hover table-condensed" data-toggle="table"
					data-url="<%=path %>/staff/agencyList" data-pagination="true" data-striped="true">
					<thead>
						<tr>
							<th data-field="state" data-radio="true"></th>
							<th data-field="name">名称</th>
							<th data-field="gender">性别</th>
							<th data-field="email">邮箱</th>
							<th data-field="phone">手机号码</th>
							<th data-field="basic_salary">基本工资</th>
							<th data-field="percent">提成百分比</th>
							<th data-field="buildings.name">负责楼盘</th>
							<th data-field="status">状态</th>
						</tr>
					</thead>
				</table><!--表格结束 -->
                </div>
            </div>
		</div>
		</div><!--/.fluid-container-->
	</div>
	<!--/row-->
</div>
<!--/.fluid-container-->


<script src="<%=path%>/bootstrap/bootstrap-table.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-locale-all.min.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-zh-CN.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-export.js"></script>
<script src="<%=path%>/bootstrap/tableExport.js"></script>

<script src="<%=path %>/js/formFill.js"></script>

<!-- jQuery消息提示框 -->
<script src="<%=path%>/toastr/toastr.min.js"></script>
<script src="<%=path%>/js/toastrOption.js"></script>

<script type="text/javascript" src="<%=path %>/bootstrap/dist/js/bootstrapValidator.js"></script>
<script src="<%=path %>/js/agencyModifyEmployeeInfo.js"></script>
<script src="<%=path %>/js/cous.js"></script>
<!-- 经销商上传图片 -->
<script>
$('#logo').fileinput({
    language: 'zh',
    uploadUrl: '<%=path%>/agency/uploadLogo',
    allowedFileExtensions : ['jpg', 'png','gif'],
})
var imgSrc="";
$('#logo').on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功		
	imgSrc=data.response.agencyVo.logo;
	$("#changeLogo").modal("toggle");
})
$(function () {
	$('#changeLogo').on('hide.bs.modal', function () {
		if(imgSrc!=""){
			$("#logoImg").attr('src',imgSrc)
		}
 	})
 });
 

//打开模态框 ： 修改活动图片
var activityId="";
$(function(){
	$(".modifyActivityLogo").click(function(){
		var data=$("#tb").bootstrapTable("getSelections");
		if(data.length==1){
			activityId = data[0].id; //获取选中的活动Id
			$("#activityLogo").modal();	//打开模态框
		}else{
			toastr.warning("未选中需要修改的图片!");  
		}
	})
})

//活动图片修改
$('#activitylogo').fileinput({
	language: 'zh',
    uploadUrl: '<%=path%>/activity/modifyActivityLogo',
    allowedFileExtensions : ['jpg', 'png','gif'],
    initialCaption: "请选择上传图片",
    uploadExtraData:
    	function(previewId, index) {   //额外参数的关键点
	    	var data = {
	   			activityid:activityId
	    	};
	        return data;
    }
})

$('#activitylogo').on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功		
	$("#activityLogo").modal("toggle");
	$("#tb").bootstrapTable("refresh",{url:"/EstateSales/activity/activityList"});
})
</script>
</body>
</html>