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
<title>新增楼盘</title>
 	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="author" content="Muhammad Usman">

    <!-- The styles -->
	<%@include file="./JsAndCss.jsp" %>
	<!-- 省市县三级联动 -->
   	<link rel="stylesheet" href="<%=path%>/ShengShiXian/css.css" />
	<link rel="stylesheet" href="<%=path%>/ShengShiXian/form.css" />
	
	<link rel="stylesheet" href="<%=path %>/bootstrap/select2/select2.min.css" />
	
	
</head>

<body  style="background-color:#ffffff;">
	<!-- 更换经销商logo -->
	<%@ include file="./changeAgencyLogo.jsp" %>
    <!-- topbar starts -->
   	 <%@ include file="./top.jsp"%>    
    <!-- topbar ends -->
<div class="ch-container">
    <div class="row">
        <!-- left menu starts -->
        <%@ include file="./leftMenu.jsp" %>
        <!-- left menu ends -->
        <!-- content starts -->
		<div id="content" class="col-lg-10 col-sm-10">
			<div>
				<ul class="breadcrumb">
					<li><a href="<%=path%>/agency/main">首页</a></li>
					<li><a href="javacsript:void(0);">新增楼盘</a></li>
				</ul>
			</div>
			<!-- 新增楼盘开始 -->
			<form class="form-horizontal" id="buildAdd" name="buildAdd" method="post" action="<%=path %>/buildings/addBuild"  enctype="multipart/form-data">
			<div class="form-group">
	    			<label  class="col-sm-2 control-label" >楼盘名称</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<input type="text" class="form-control" name="buildingsVO.name" placeholder="请输入楼盘名称" required="required">
	   			 	</div>
  			</div>
			
			<div class="form-group has-error">
				<label class="col-xs-12 col-sm-3 col-md-3 control-label no-padding-right">所属区域</label>
				<div class="col-xs-12 col-sm-5">
						<span> 省份 </span>&nbsp;&nbsp;
						<select class="kitjs-form-suggestselect" name="sheng"></select><br/><br/>
						<span> 市 </span>&nbsp;&nbsp;&nbsp;&nbsp;
						<select class="kitjs-form-suggestselect" name="shi"></select><br/><br/>
						<span> 县/区 </span>&nbsp;
						<select class="kitjs-form-suggestselect" name="xian"></select><br/><br/>
				</div>
			</div>
			<div class="form-group">
	    			<label  class="col-sm-2 control-label" >地址</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<input type="text" class="form-control" name="buildingsVO.address" placeholder="请输入地址" required="required">
	   			 	</div>
  			</div>
			
			<div class="form-group">
	    			<label  class="col-sm-2 control-label" >占地面积</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<input type="number" class="form-control" name="buildingsVO.floor_area" placeholder="请输入占地面积" required="required">
	   			 	</div>
  			</div>
			<div class="form-group">
	    			<label  class="col-sm-2 control-label" >建筑面积</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<input type="number" class="form-control" name="buildingsVO.building_area" placeholder="请输入建筑面积" required="required">
	   			 	</div>
  			</div>
			<div class="form-group">
    			<label  class="col-sm-2 control-label" >房源类型</label>
   				<div class="col-md-6 col-sm-6 col-xs-12">
   			   		<select class="form-control" name="buildingsVO.house_type" id="house_type">
						<option>住宅</option>
						<option>别墅</option>
						<option>写字楼</option>
						<option>商品房</option>
						<option>综合体</option>
					</select>
   			 	</div>
  			</div>
			
			<div class="form-group">
    			<label  class="col-sm-2 control-label" >建筑类型</label>
   				<div class="col-md-6 col-sm-6 col-xs-12">
   			   		<select class="form-control" name="buildingsVO.building_type" id="building_type">
						  <option>哥特式建筑</option>
						  <option>巴洛克建筑</option>
						  <option>洛可可建筑</option>
						  <option>园林式建筑</option>
						  <option>办公式建筑</option>
						  <option>西班牙式建筑</option>
						  <option>中式建筑</option>
					</select>
   			 	</div>
  			</div>
			
			<div class="form-group has-success">
				<label for="inputSuccess" class="col-xs-12 col-sm-3 control-label no-padding-right">经度</label>
				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right">
						<input type="text" id="longitude" name="buildingsVO.longitude" class="width-100" />
						<i class="icon-ok-sign"></i>
					</span>
				</div>
			</div>
			<div class="form-group has-info">
				<label for="inputInfo" class="col-xs-12 col-sm-3 control-label no-padding-right">纬度</label>
				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right">
						<input type="text" id="latitude" name="buildingsVO.latitude" class="width-100" />
						<i class="icon-info-sign"></i>
					</span>
				</div>
			</div>
			<div class="form-group">
				<label for="inputError2" class="col-xs-12 col-sm-3 control-label no-padding-right">楼盘均价</label>
				<div class="col-xs-12 col-sm-5">
					<span class="input-icon block">
						<input type="text"  name="buildingsVO.avg_price" class="width-100" />1213216546465
						<i class="icon-remove-sign red"></i>
					</span>
				</div>
			</div>
			<div class="form-group has-warning">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">开发公司</label>
				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right">
						<input type="text"  name="buildingsVO.company" class="width-100" />
						<i class="icon-leaf"></i>
					</span>
				</div>
			</div>
			<div class="form-group has-error">
				<label class="col-xs-12 col-sm-3 col-md-3 control-label no-padding-right">开盘时间</label>
				<div class="col-xs-12 col-sm-5">
					<input type="date" name="buildingsVO.open_date" style="width:200px;"></input>  
				</div>
			</div>
			<div class="form-group has-error">
				<label for="inputError" class="col-xs-12 col-sm-3 col-md-3 control-label no-padding-right">总套数</label>
				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right">
						<input type="text"  name="buildingsVO.total_rooms" class="width-100" />
						<i class="icon-remove-sign"></i>
					</span>
				</div>
			</div>
			<div class="form-group has-success">
				<label for="inputSuccess" class="col-xs-12 col-sm-3 control-label no-padding-right">接待地址</label>
				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right">
						<input type="text"  name="buildingsVO.reception_address" class="width-100" />
					</span>
				</div>
			</div>
			<div class="form-group has-info">
				<label for="inputInfo" class="col-xs-12 col-sm-3 control-label no-padding-right">楼盘售楼电话</label>
				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right">
						<input type="text"  name="buildingsVO.tel" class="width-100" />
					</span>
				</div>
			</div>
			<div class="form-group">
				<label for="inputError2" class="col-xs-12 col-sm-3 control-label no-padding-right">绿化率</label>
				<div class="col-xs-12 col-sm-5">
					<span class="input-icon block">
						<input type="text"  name="buildingsVO.green_ratio" class="width-100" />
					</span>
				</div>
			</div>
			<div class="form-group has-warning">
				<label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">容积率</label>
				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right">
						<input type="text"  name="buildingsVO.plot_ratio" class="width-100" />
					</span>
				</div>
			</div>
			<div class="form-group has-error">
				<label class="col-xs-12 col-sm-3 col-md-3 control-label no-padding-right">物业公司</label>
				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right">
						<input type="text" name="buildingsVO.property_company" class="width-100" />
					</span>
				</div>
			</div>
		
			<div class="form-group has-success">
				<label for="inputSuccess" class="col-xs-12 col-sm-3 control-label no-padding-right">物业费</label>
				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right">
						<input type="text"  name="buildingsVO.property_fee" class="width-100" />
					</span>
				</div>
			</div>
			<div class="form-group has-info">
				<label for="inputInfo" class="col-xs-12 col-sm-3 control-label no-padding-right">车位数</label>
				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right">
						<input type="text" name="buildingsVO.car_station" class="width-100" />
					</span>
				</div>
			</div>
			<div class="form-group">
				<label for="inputError2" class="col-xs-12 col-sm-3 control-label no-padding-right">交通状况</label>
				<div class="col-xs-12 col-sm-5">
					<span class="input-icon block">
						<input type="text"  name="buildingsVO.traffic" class="width-100" />
					</span>
				</div>
			</div>
			<div class="form-group has-warning">
				<label  class="col-xs-12 col-sm-3 control-label no-padding-right">周边配套</label>
				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right">
						<input type="text" name="buildingsVO.equipments" class="width-100" />
						
					</span>
				</div>
			</div>
			<div class="form-group has-error">
				<label  class="col-xs-12 col-sm-3 col-md-3 control-label no-padding-right">楼盘封面</label>
				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right">
						 <input type="file"  name="logo" id="logo">
					</span>
				</div>
			</div>
			<div class="form-group has-success">
				<label  class="col-xs-12 col-sm-3 control-label no-padding-right">简介</label>
				<div class="col-xs-12 col-sm-5">
					<span class="block input-icon input-icon-right">
						<textarea class="form-control"  name="buildingsVO.intro" rows="3"></textarea>
					</span>
				</div>
			</div>
			<div class="form-group">
				<label  class="col-xs-12 col-sm-3 control-label no-padding-right">状态</label>
				<div class="col-xs-12 col-sm-5">
					<span class="input-icon block">
						<select class="form-control" name="buildingsVO.status">
							  <option>激活</option>
							  <option>冻结</option>
						</select>
					</span>
				</div>
			</div>
			<div  class="form-group has-success">
				<label for="inputError2" class="col-xs-12 col-sm-3 control-label no-padding-right"></label>
				<div class="col-xs-12 col-sm-5">	
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="submit" style="height: 25px;width: 100px" value="新增">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" style="height: 25px;width: 100px" value="清空">
				</div>
			</div>															
			</form>
			<!-- 新增楼盘结束 -->
		</div>
		<!-- content end -->
	</div>
	<!--/row-->
</div>
<!--/.fluid-container-->

<!-- 省市县三级联动 -->
<script src="<%=path%>/ShengShiXian/kit.js"></script>
<script src="<%=path%>/ShengShiXian/dom.js"></script>
<script src="<%=path%>/ShengShiXian/event.js"></script>
<script src="<%=path%>/ShengShiXian/TreeDict.js"></script>
<script src="<%=path%>/ShengShiXian/math.js"></script>
<script src="<%=path%>/ShengShiXian/form.js"></script>
<script src="<%=path%>/ShengShiXian/combobox.js"></script>
<script src="<%=path%>/ShengShiXian/suggestselect.js"></script>
<script src="<%=path%>/ShengShiXian/list.js"></script>
<script src="<%=path%>/ShengShiXian/json-data.js" charset="utf-8"></script>
<script src="<%=path%>/ShengShiXian/shengShiXian.js"></script>

<script src="<%=path %>/bootstrap/select2/select2.full.min.js"></script>
<script src="<%=path %>/bootstrap/select2/select2.min.js"></script>
<script>
$("#house_type").select2({width:"530px"});
$("#building_type").select2({width:"530px"});

</script>
<!-- 上传图片 -->
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
</script>


</body>
</html>