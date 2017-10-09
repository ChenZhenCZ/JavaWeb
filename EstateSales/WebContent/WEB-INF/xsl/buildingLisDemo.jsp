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


<script src="<%=path%>/plugins/jquery.min.js"></script>
<link href="<%=path%>/plugins/bootstrap/bootstrap.min.css" rel="stylesheet">
<script src="<%=path%>/plugins/bootstrap/bootstrap.min.js"></script>

<link href="<%=path%>/bootstrap/bootstrap-table.css" rel="stylesheet"/> 
<script src="<%=path%>/bootstrap/bootstrap-table.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-locale-all.min.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-zh-CN.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-export.js"></script>
<script src="<%=path%>/bootstrap/tableExport.js"></script>
<!-- jQuery消息提示框 -->
<link rel="stylesheet" href="<%=path%>/toastr/toastr.min.css">
<body>
	<!-- 编辑模态框-->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">楼盘修改</h4>
	      </div>
	      <div class="modal-body">
	       	<form  id="buildUpdate">
	       		<input type="hidden" name="buildingsVO.id">
	       		<input type="hidden" name="buildingsVO.logo" >
	       		<input type="hidden" name="buildingsVO.created_time" >
	       		<input type="hidden" name="buildingsVO.status" >
				<input type="hidden" name="buildingsVO.agency.id">
				<div class="form-group">
		        	<label for="recipient-name" class="control-label">楼盘名称：</label>
		        	<input type="text" class="form-control" name="buildingsVO.name">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">所属区域：</label>
		        	<input type="text" class="form-control" name="buildingsVO.area">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">地址：</label>
		        	<input type="text" class="form-control" name="buildingsVO.address">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">占地面积：</label>
		        	<input type="text" class="form-control" name="buildingsVO.floor_area">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">建筑面积：</label>
		        	<input type="text" class="form-control" name="buildingsVO.building_area">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">房源类型：</label>
		        	<input type="text" class="form-control" name="buildingsVO.house_type">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">建筑类型：</label>
		        	<input type="text" class="form-control" name="buildingsVO.building_type">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">经度：</label>
		        	<input type="text" class="form-control" name="buildingsVO.longitude">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">纬度：</label>
		        	<input type="text" class="form-control" name="buildingsVO.latitude">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">楼盘均价：</label>
		        	<input type="text" class="form-control" name="buildingsVO.avg_price">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">开发公司：</label>
		        	<input type="text" class="form-control" name="buildingsVO.company">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">开盘时间：</label>
		        	<input type="text" class="form-control" name="buildingsVO.open_date">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">总套数：</label>
		        	<input type="text" class="form-control" name="buildingsVO.total_rooms">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">接待地址：</label>
		        	<input type="text" class="form-control" name="buildingsVO.reception_address">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">售楼电话：</label>
		        	<input type="text" class="form-control" name="buildingsVO.tel">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">绿化率：</label>
		        	<input type="text" class="form-control" name="buildingsVO.green_ratio">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">容积率：</label>
		        	<input type="text" class="form-control" name="buildingsVO.plot_ratio">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">物业公司：</label>
		        	<input type="text" class="form-control" name="buildingsVO.property_company">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">物业费：</label>
		        	<input type="text" class="form-control" name="buildingsVO.property_fee">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">车位数：</label>
		        	<input type="text" class="form-control" name="buildingsVO.car_station">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">交通状况：</label>
		        	<input type="text" class="form-control" name="buildingsVO.traffic">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">周边配套：</label>
		        	<input type="text" class="form-control" name="buildingsVO.equipments">
		        </div>
		        <div class="form-group">
		        	<label for="recipient-name" class="control-label">简介：</label>
		        	<input type="text" class="form-control" name="buildingsVO.intro">
		        </div>
		        <div class="form-group">
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        	 <a class="btn btn-primary" onclick="buildUpdate();">保&nbsp;存</a>
		        </div>
    		</form> 
	      </div>
	      <div class="modal-footer">
       		 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 编辑模态框结束 -->
	<!-- 表格开始 -->
	<div class="container" style="margin-top:100px">
        <div class="row">
            <!-- 搜索框 -->
            <div class="col-xs-3 pull-right">
                <div class="input-group">
                    <input type="text" class=" form-control" name="name" placeholder="请输入楼盘名称">
                    <span class="input-group-btn">
                        <button class="btn btn-default search" type="button">查询</button>
                    </span>
                </div>
            </div>
            <!-- toolbar工具栏 -->
	         <div id="toolbar" class="btn-group">
	         <button id="btn_add" type="button" class="btn btn-default">
	             <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
	         </button>
	         <button  class="edit btn btn-default" data-toggle="modal" data-target="#myModal">
	             <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
	         </button>
	         <button class="inOractive btn btn-default">
	             <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>冻结-激活
	         </button>
	    	 </div>
            <!-- toolbar工具栏结束 -->
            <!-- 表格 -->
            <div class="col-xs-12">
                <table id="tb" class="table table-bordered table-hover table-condensed" data-toggle="table"
					data-url="<%=path %>/buildings/buildsList" data-pagination="true" data-striped="true">
					<thead>
						<tr>
							<th data-field="state" data-radio="true"></th>
							<th data-field="name">楼盘名称</th>
							<th data-field="area">所属区域</th>
							<th data-field="address">楼盘地址</th>
							<th data-field="floor_area">占地面积</th>
							<th data-field="building_area">建筑面积</th>
							<th data-field="house_type">房源类型</th>
							<th data-field="building_type">建筑类型</th>
							<th data-field="longitude">经度</th>
							<th data-field="latitude">纬度</th>
							<th data-field="avg_price">楼盘均价</th>
							<th data-field="company">开发公司</th>
							<th data-field="open_date">开盘时间</th>
							<th data-field="total_rooms">总套数</th>
							<th data-field="reception_address">接待地址</th>
							<th data-field="open_date">售楼电话</th>
							<th data-field="green_ratio">绿化率</th>
							<th data-field="plot_ratio">容积率</th>
							<th data-field="property_company">物业公司</th>
							<th data-field="property_fee">物业费</th>
							<th data-field="car_station">车位数</th>
							<th data-field="traffic">交通状况</th>
							<th data-field="equipments">周边配套</th>
							<th data-field="intro">楼盘简介</th>
							<th data-field="status">状态</th>
						</tr>
					</thead>
				</table>
            </div>
        </div>
    </div>
    <!-- 表格结束 -->
<script src="<%=path %>/js/formFill.js"></script>
<script src="<%=path %>/js/buildsList.js"></script>
<!-- jQuery消息提示框 -->
<script src="<%=path%>/toastr/toastr.min.js"></script>
</body>
</html>
