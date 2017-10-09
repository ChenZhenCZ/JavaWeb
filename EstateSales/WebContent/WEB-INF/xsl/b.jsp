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
	<!-- jQuery -->
	<link href="<%=path%>/toastr/toastr.min.css" rel="stylesheet"/> 
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=x67gHfVD1WUEc85lSreVfFIaWajsQSZG"></script>
	
    <!-- The styles -->
	<%@include file="./JsAndCss.jsp" %>
	<!-- 省市县三级联动 -->
   	<link rel="stylesheet" href="<%=path%>/ShengShiXian/css.css" />
	<link rel="stylesheet" href="<%=path%>/ShengShiXian/form.css" />
	<!-- 下拉框 -->
	<link rel="stylesheet" href="<%=path %>/bootstrap/select2/select2.min.css" />
	
	<link rel="stylesheet" href="../bootstrap/dist/css/bootstrapValidator.css"/>
	<script type="text/javascript" src="../bootstrap/dist/js/bootstrapValidator.js"></script>
	<!-- 控制时间格式 -->
	<link rel="stylesheet" href="<%=path %>/bootstrap/bootstrap-datetimepicker.min.css">  
	<script type="text/javascript"  src="<%=path %>/bootstrap/bootstrap-datetimepicker.min.js"></script>  
</head>

<body>
	<!-- 地图找房模态框开始 -->
	<div id="map" class="modal fade" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-title">
					<h2 class="text-center">楼盘地址</h2>
				</div>
				<div class="modal-body">
					 <div class="row">
				          <div class="col-md-12"  >
				          	<div id="allmap" style="height:400px; width:560px;" >
					         </div>
				          </div>
				     </div>
			</div>
		</div>
	</div>
</div>
	<!-- 地图找房模态框开始 -->
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
			<div class="form-group">
	    			<label  class="col-sm-2 control-label" >地址</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<input type="text" class="form-control" name="buildingsVO.address" placeholder="请输入地址" required="required">
	   			 	</div>
  			</div>
			
			<div class="form-group">
	    			<label  class="col-sm-2 control-label" >占地面积</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<input type="text" class="form-control" name="buildingsVO.floor_area" placeholder="请输入占地面积" required="required">
	   			 	</div>
  			</div>
			<div class="form-group">
	    			<label  class="col-sm-2 control-label">建筑面积</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<input type="text" class="form-control" name="buildingsVO.building_area" placeholder="请输入建筑面积" required="required">
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
			
			<div class="form-group">
	    			<label  class="col-lg-1 col-sm-2 col-lg-offset-1 control-label" >经度</label>
	   				<div class=" col-md-2 col-sm-3 col-xs-6">
	   			   		<input id="lng" type="text" class="form-control" name="buildingsVO.longitude" placeholder="请输入经度" required="required">
	   			 	</div>
	   			 	<label  class="col-lg-1 col-sm-2 control-label" >纬度</label>
	   				<div class="col-md-2 col-sm-3 col-xs-6">
	   			   		<input id="lat" type="text" class="form-control" name="buildingsVO.latitude"  placeholder="请输入纬度" required="required">
	   			 	</div>
	   			 	<a href="javascript:void(0)" data-toggle="modal" data-target="#map" ><i class="glyphicon glyphicon-map-marker"></i>地图找房</a>
  			</div>
  			<div class="form-group">
	    			<label  class="col-sm-2 control-label" >楼盘均价</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<input type="text" class="form-control" name="buildingsVO.avg_price" placeholder="请输入楼盘均价" required="required">
	   			 	</div>
  			</div>
			<div class="form-group">
	    			<label  class="col-sm-2 control-label" >开发公司</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<input type="text" class="form-control" name="buildingsVO.company" placeholder="请输入开发公司" required="required">
	   			 	</div>
  			</div>
			<div class="form-group">
	    			<label  class="col-sm-2 control-label" >开盘时间</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<input type="text" class="form-control form_datetime" name="buildingsVO.open_date" placeholder="请输入开盘时间" required="required" readonly="readonly">
	   			 	</div>
  			</div>
			<div class="form-group">
	    			<label  class="col-sm-2 control-label" >总套数</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<input type="text" class="form-control" name="buildingsVO.total_rooms" placeholder="请输入总套数" required="required">
	   			 	</div>
  			</div>
			
			<div class="form-group">
	    			<label  class="col-sm-2 control-label" >接待地址</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<input type="text" class="form-control" name="buildingsVO.reception_address" placeholder="请输入接待地址" required="required">
	   			 	</div>
  			</div>
			<div class="form-group">
	    			<label  class="col-sm-2 control-label" >售楼电话</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<input type="text" class="form-control" name="buildingsVO.tel" placeholder="请输入售楼电话" required="required">
	   			 	</div>
  			</div>
			
			<div class="form-group">
	    			<label  class="col-sm-2 control-label" >绿化率</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<input type="text" class="form-control" name="buildingsVO.green_ratio" placeholder="请输入绿化率" required="required">
	   			 	</div>
  			</div>
  			<div class="form-group">
	    			<label  class="col-sm-2 control-label" >容积率</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<input type="text" class="form-control" name="buildingsVO.plot_ratio" placeholder="请输入容积率" required="required">
	   			 	</div>
  			</div>
			
			<div class="form-group">
	    			<label  class="col-sm-2 control-label" >物业公司</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<input type="text" class="form-control" name="buildingsVO.property_company" placeholder="请输入物业公司" required="required">
	   			 	</div>
  			</div>
			
			<div class="form-group">
	    			<label  class="col-sm-2 control-label" >物业费</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<input type="text" class="form-control" name="buildingsVO.property_fee " placeholder="请输入物业费" required="required">
	   			 	</div>
  			</div>
			
			<div class="form-group">
	    			<label  class="col-sm-2 control-label" >车位数</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<input type="text" class="form-control" name="buildingsVO.car_station" placeholder="请输入车位数" required="required">
	   			 	</div>
  			</div>
			
			<div class="form-group">
	    			<label  class="col-sm-2 control-label" >交通状况</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<input type="text" class="form-control" name="buildingsVO.traffic" placeholder="请输入交通状况" required="required">
	   			 	</div>
  			</div>
			 
			<div class="form-group">
	    			<label  class="col-sm-2 control-label" >周边配套</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<input type="text" class="form-control" name="buildingsVO.equipments" placeholder="请输入周边配套" required="required">
	   			 	</div>
  			</div>
			
			<div class="form-group">
	    			<label  class="col-sm-2 control-label" >楼盘封面</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<div class="col-md-6 col-sm-6 col-xs-12">
				   		  <p id="addp"></p>
						  <input type="file" id="upload" style="display:none" name="logo" onclick="addElementImg('addp')" required="required" >
						  <span  class="btn btn-default btn-lg"  onclick="F_Open_dialog()">
						  		选择图片
						  </span>
		   			 	</div>
	   			 	</div>
  			</div>
						
			<div class="form-group">
	    			<label  class="col-sm-2 control-label" >楼盘简介</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<textarea class="form-control"  name="buildingsVO.intro" rows="3" required="required" placeholder="请输入楼盘简介"></textarea>
	   			 	</div>
  			</div>
			
			<div class="form-group">
	    			<label  class="col-sm-2 control-label" >状态</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<select class="form-control" name="buildingsVO.status" id="status">
							  <option>激活</option>
							  <option>冻结</option>
						</select>
	   			 	</div>
  			</div>
			
			<div class="form-group">
	    			<label  class="col-sm-2 control-label" >所属区域</label>
	   				<div class="col-md-6 col-sm-6 col-xs-12">
	   			   		<span> 省份 </span>&nbsp;
						<select class="kitjs-form-suggestselect" name="sheng" id="sheng" required="required"></select><br/><br/>
						<span> 市 </span>&nbsp;&nbsp;&nbsp;&nbsp;
						<select class="kitjs-form-suggestselect" name="shi" id="shi" required="required"></select><br/><br/>
						<span> 县/区 </span>
						<select class="kitjs-form-suggestselect" name="xian" id="xian" required="required" ></select><br/><br/>
	   			 	</div>
  			</div>
			<div  class="form-group has-success">
				<label for="inputError2" class="col-xs-12 col-sm-3 control-label no-padding-right"></label>
				<div class="col-xs-12 col-sm-5">	
					&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;
					<input type="submit" class="btn btn-success btn-lg" style="width:200px" value="保存">
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
<!-- 地图找房 -->
<!-- external javascript -->
<script src="<%=path %>/toastr/toastr.min.js"></script>
<script src="<%=path %>/js/toastrOption.js"></script>
<script src="<%=path %>/js/formFill.js"></script>
<script>
	var map = new BMap.Map("allmap");    // 创建Map实例
	map.centerAndZoom(new BMap.Point(114.98,25.82), 12);  // 初始化地图,设置中心点坐标和地图级别
	map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
	map.setCurrentCity("赣州");          // 设置地图显示的城市 此项是必须设置的
	map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
	function myFun(result){
		var cityName = result.name;
		map.setCenter(cityName);
	}
	var myCity = new BMap.LocalCity();
	myCity.get(myFun);
//获取鼠标选取的坐标
	map.addEventListener("click",function(e){
	alert(e.point.lng + "," + e.point.lat);
	$("#lng").val(e.point.lng);
	$("#lat").val(e.point.lat);
	$("#map").modal("toggle");
});
</script>

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
$("#sheng").select2({width:"530px"});
$("#shi").select2({width:"530px"});
$("#sheng").select2({width:"530px"});
$("#status").select2({width:"530px"});

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
<script>
var i=true;
function addElementImg(obj) {
		if(i){
			var ul = document.getElementById(obj);
			var img = document.createElement("img");
			img.setAttribute("id", "newImg");
			img.setAttribute("style", "width:300px;height:200px");
			img.src = "";
			ul.appendChild(img);
			i=false;
			var input = document.getElementById("upload");
			var $img = $('#newImg');
			input.addEventListener('change',readFile,false);
			function readFile(){
				var file=this.files[0];
				var $file = $(this);
				var fileObj = $file[0];
				var windowURL = window.URL || window.webkitURL;
				var dataURL;
				dataURL = windowURL.createObjectURL(fileObj.files[0]);
				$img.attr('src',dataURL);
			}
		}
	}
	function F_Open_dialog(){ 
		document.getElementById("upload").click(); 
	} 
</script>
<!--控制时间格式-->
<script>
  $('.form_datetime').datetimepicker({
	    minView: "month", //选择日期后，不会再跳转去选择时分秒 
	    locale:'en', //设置语言
	    format: 'yyyy-mm-dd',//设置时间格式
	    todayBtn:  1,
	    startDate: new Date(),
	   //endDate: '2017-12-30',	//开始时间  endDate 结束时间
	    autoclose: 1,//当选择一个日期之后是否立即关闭此日期时间选择器。
	});
</script>  
<script>
$(document).ready(function() {
    $('#buildAdd').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	'buildingsVO.name': {
                validators: {
                    notEmpty: {
                        message: '楼盘名称不能为空'
                    }
                }
            },
            'buildingsVO.address': {
                validators: {
                    notEmpty: {
                        message: '地址不能为空'
                    }
                }
            },
            'buildingsVO.floor_area': {
                validators: {
                    notEmpty: {
                        message: '占地面积不能为空'
                    },
                    greaterThan: {
                        value: 0,
                        inclusive: false,
                        message: '请输入0~9之间的数字且占地面积必须大于零哦！'
                    }
                }
            },
            'buildingsVO.building_area': {
                validators: {
                    notEmpty: {
                        message: '建筑面积不能为空'
                    },
                    greaterThan: {
                        value: 0,
                        inclusive: false,
                        message: '请输入0~9之间的数字且建筑面积必须大于零哦！'
                    }
                }
            },
            'buildingsVO.longitude': {
                validators: {
                    notEmpty: {
                        message: '经度不能为空'
                    },    
                    regexp: {
                        regexp: /^\d+(\.\d+)?$/,
                        message: '经度格式错误'
                    }
                }
            },
            'buildingsVO.latitude': {
                validators: {
                    notEmpty: {		
                        message: '纬度不能为空'
                    },  
                    regexp: {
                        regexp: /^\d+(\.\d+)?$/,
                        message: '纬度格式错误'
                    }
                }
            },
            
            'buildingsVO.avg_price': {
                validators: {
                    notEmpty: {
                        message: '楼盘均价不能为空'
                    },      
                    greaterThan: {
                        value: 0,
                        inclusive: false,
                        message: '请输入0~9之间的数字且楼盘均价必须大于零哦！'
                    }
                }
            },
            'buildingsVO.company': {
                validators: {
                    notEmpty: {
                        message: '开发公司不能为空'
                    },                   
                }
            },
            'buildingsVO.open_date': {
                validators: {
                    notEmpty: {
                        message: '开盘时间不能为空'
                    },                   
                }
            },
            'buildingsVO.total_rooms': { 
                validators: {
                    notEmpty: {
                        message: '总套数不能为空'
                    },     
                    greaterThan: {
                        value: 0,
                        inclusive: false,
                        message: '请输入0~9之间的数字且总套数必须大于零哦！'
                    }
                }
            },
            'buildingsVO.reception_address': {
                validators: {
                    notEmpty: {
                        message: '接待地址不能为空'
                    },                   
                }
            },
            'buildingsVO.tel': {
                validators: {
                    notEmpty: {
                        message: '售楼电话不能为空'
                    },                  
                    stringLength: {
                        min: 7,
                        max: 7,
                        message: '电话为7位数哦!'
                    },
                    regexp: {
                        regexp: /^[0-9]*[1-9][0-9]*$/,
                        message: '请输入正确的号码格式'
                    }
                }
            },
            'buildingsVO.green_ratio': {
                validators: {
                    notEmpty: {
                        message: '绿化率不能为空'
                    },  
                    regexp: {
                        regexp: /^\d+(\.\d+)?$/,
                        message: '请输入正确的绿化率格式：如51.23'
                    }
                }
            },
            'buildingsVO.plot_ratio': {
                validators: {
                    notEmpty: {
                        message: '容积率不能为空'
                    },   
                    regexp: {
                        regexp: /^\d+(\.\d+)?$/,
                        message: '请输入正确的容积率格式：如2.5'
                    }
                }
            },
            'buildingsVO.property_company': { 
                validators: {
                    notEmpty: {
                        message: '物业公司不能为空'
                    },                   
                }
            },
            'buildingsVO.property_fee': { 
                validators: {
                    notEmpty: {
                        message: '物业费不能为空'
                    },  
                    regexp: {
                        regexp: /^\d+(\.\d+)?$/,
                        message: '请输入正确的物业费格式 如：500.5'
                    }
                }
            },
            'buildingsVO.car_station': {  
                validators: {
                    notEmpty: {
                        message: '车位数不能为空'
                    },      
                    greaterThan: {
                        value: 0,
                        inclusive: false,
                        message: '请输入0-9之间的数字且车位数必须大于零哦！'
                    }
                }
            },
            'buildingsVO.traffic': {  
                validators: {
                    notEmpty: {
                        message: '交通状况不能为空'
                    },                   
                }
            },
            'buildingsVO.equipments': {  
                validators: {
                    notEmpty: {
                        message: '周边配套不能为空'
                    },                   
                }
            },
            'logo': {  
                validators: {
                    notEmpty: {
                        message: '楼盘图片不能为空'
                    },                   
                }
            },
            'buildingsVO.intro': {  
                validators: {
                    notEmpty: {
                        message: '楼盘简介不能为空'
                    },                   
                }
            },
            'sheng': {  
                validators: {
                    notEmpty: {
                        message: '省份不能为空'
                    },                   
                }
            },
            'shi': {  
                validators: {
                    notEmpty: {
                        message: '市不能为空'
                    },                   
                }
            },
            'xian': {  
                validators: {
                    notEmpty: {
                        message: '县不能为空'
                    },                   
                }
            }
        }
    });
});
</script>
</body>
</html>