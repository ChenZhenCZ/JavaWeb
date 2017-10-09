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
<title>客户查看</title>
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
	<!-- 修改活动图片开始 -->
	<div class="modal fade" id="activityLogo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">更换logo</h4>
	      </div>
	      <div class="modal-body">
	       	<form  enctype="multipart/form-data">
        		<label>请选择logo</label>
        		<input id="activitylogo" name="activitylogo" type="file">
    		</form> 
	      </div>
	      <div class="modal-footer">
       		 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 修改活动图片结束 -->
    <!-- topbar starts -->
    <%@include file="./top.jsp" %>
    <!-- topbar ends -->
<div class="ch-container">
    <div class="row">
        <!-- left menu starts -->
		<%@ include file="./leftMenu.jsp" %>
        <!-- left menu ends -->
    <div id="content" class="col-lg-10 col-sm-10">
        <!-- content starts -->
            <div>
		    <ul class="breadcrumb">
		        <li><a href="#">首页</a></li>
		        <li><a href="javascript:void(0);">客户管理</a></li>
		    </ul>
			</div>
  		<div class="row">  
        <!--按钮  -->
        <div id="toolbar" class="btn-group">
            <button id="btn_edit" type="button" class="btn btn-default" >
                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
            </button>
            <button id="btn_jihuo" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>激活
            </button>
            <button id="btn_delete" type="button" class="btn btn-default">
                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>冻结
            </button>
        </div>
            <!-- 表格 -->
            <table id="tb_departments" class="table table-bordered table-hover table-condensed" data-toggle="table"
					data-url="<%=path %>/cous/agencyList" data-pagination="true" data-striped="true">
					<thead>
						<tr>
							<th data-field="state" data-radio="true"></th>
							<th data-field="name">客户姓名</th>
							<th data-field="emp.name">所属员工</th>
							<th data-field="gender">性别</th>
							<th data-field="birthday">生日</th>
							<th data-field="email">邮箱</th>
							<th data-field="phone">手机号</th>
							<th data-field="identity_id">身份证号</th>
							<th data-field="address">联系地址</th>
							<th data-field="customer_type">客户类型</th>
							<th data-field="together">共同购房人</th>
							<th data-field="created_time" data-formatter="formatDate">创建时间</th>
							<th data-field="status">状态</th>
						</tr>
					</thead>
				</table>
         </div>
		</div>
		</div><!--/.fluid-container-->
	</div>
	<!--/row-->
<!--/.fluid-container-->
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
			 		    <input type="text" name="con.phone" class="form-control"  placeholder="手机号码">
                    </div>
                    <div class="form-group">                 
                        <label for="con.address">联系地址</label>
			    		<input type="text" name="con.address" class="form-control" placeholder="联系地址">
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

<script type="text/javascript" src="<%=path %>/bootstrap/dist/js/bootstrapValidator.js"></script>
<script src="<%=path %>/js/table_agencycustomer.js"></script>
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
 

function formatDate(value) {
    if (value == undefined || value == null || value == '') {
        return "";
    } else {
        var date = new Date(value); // 获取js的Date对象
        var year = date.getFullYear().toString();
        var month = (date.getMonth() + 1);
        var day = date.getDate().toString();
        var hour = date.getHours().toString();
        var minutes = date.getMinutes().toString();
        var seconds = date.getSeconds().toString();
        if (month < 10) {
            month = "0" + month;
        }
        if (day < 10) {
            day = "0" + day;
        }
        return year + "-" + month + "-" + day;
    }
}


</script>
</body>
</html>