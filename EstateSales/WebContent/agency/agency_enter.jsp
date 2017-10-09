<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
    	String path = request.getContextPath();
    %>
<!DOCTYPE html>
<html>
<head>	
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>经销商入驻平台</title>	
    <link rel="stylesheet" href="../bootstrap/vendor/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="../bootstrap/dist/css/bootstrapValidator.css"/>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=x67gHfVD1WUEc85lSreVfFIaWajsQSZG"></script>
	</head>
<body>
<!-- 地图模态框开始 -->
	<div id="map" class="modal fade" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-title">
					<h2 class="text-center">地址</h2>
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
	<!-- 地图模态框结束 -->
    <div class="container">
        <div class="row">
            <!-- form: -->
            <section>
                <div class="page-header">
                    <h1 style="text-align:center" >经销商入驻平台</h1>
                </div>
                <div class="col-lg-8 col-lg-offset-2">
                    <form id="defaultForm" method="post" action="/EstateSales/agency/save" class="form-horizontal">
                        <fieldset> 
                            <div class="form-group">
                                <label class="col-lg-3 control-label">经销商名称</label>
                                <div class="col-lg-5">
                                    <input type="text" class="form-control" name="agencyVo.name"  placeholder="请输入公司名称" required="required"/>
                                </div>
                            </div>

							<div class="form-group">
                                <label class="col-lg-3 control-label">手机号码</label>
                                <div class="col-lg-3">
                                    <input type="text" oninput="isPhone()" class="form-control" name="agencyVo.phone" id="phone" placeholder="请输入手机号码" required="required"/>
                                </div>
								<div class="col-lg-2" id="tip1"></div>
                            </div>
							<div class="form-group">
                                <label class="col-lg-3 control-label">验证码</label>
                                <div class="col-lg-3">
                                    <input type="text" placeholder="验证码"  oninput="checkYzm();" class="form-control" id="yzm" name="yzm" required="required"/>
                                </div>
								<div class="col-lg-2"><small id="tip"></small></div>
                            </div>

							<div class="form-group">
                                <label class="col-lg-3 control-label">密码</label>
                                <div class="col-lg-5">
                                    <input type="password" class="form-control" placeholder="密码必须6位以上" name="agencyVo.pwd" required="required"/>
                                </div>
                            </div>

							<div class="form-group">
                                <label class="col-lg-3 control-label">确认密码</label>
                                <div class="col-lg-5">
                                    <input type="password" class="form-control" placeholder="确认密码" name="confirmPassword" required="required"/>
                                </div>
                            </div>

							<div class="form-group">
                                <label class="col-lg-3 control-label">负责人</label>
                                <div class="col-lg-5">
                                    <input type="text" class="form-control" placeholder="请输入负责人" name="agencyVo.leader" required="required"/>
                                </div>
                            </div>

							<div class="form-group">
                                <label class="col-lg-3 control-label">固定电话</label>
                                <div class="col-lg-5">
                                    <input type="text" class="form-control" placeholder="请输入电话" name="agencyVo.tel" required="required"/>
                                </div>
                            </div>

							<div class="form-group">
                                <label class="col-lg-3 control-label">地址</label>
                                <div class="col-lg-4">
                                    <input type="text" class="form-control" id="address" placeholder="请输入或选择地址" name="agencyVo.address" />
                                </div>
                                <div class="col-lg-1"><a href="javascript:void(0)" data-toggle="modal" data-target="#map" ><i class="glyphicon glyphicon-map-marker"></i></a></div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-lg-3 control-label">邮箱</label>
                                <div class="col-lg-5">
                                    <input type="email" class="form-control" placeholder="请输入邮箱" name="agencyVo.email" required="required"/>
                                </div>
                            </div>

							<div class="form-group">
                                <label class="col-lg-3 control-label">简介</label>
                                <div class="col-lg-5 ">
                                    <textarea placeholder="请填入简介"  rows="5" class="form-control" name="agencyVo.intro"></textarea>
                                </div>
                            </div>

                        </fieldset>
                       
                        <div class="form-group">
                            <div class="col-lg-9 col-lg-offset-4">
                                <input id="subBtn" type="submit" style="align:center" class="btn btn-primary">
                            </div>
                        </div>
                    </form>
                </div>
            </section>
        </div>
    </div>
</body>

<script type="text/javascript" src="../bootstrap/vendor/jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../bootstrap/dist/js/bootstrapValidator.js"></script>
<script src="<%=path %>/js/agencyEnter.js"></script>
<script > 
	var map = new BMap.Map("allmap");    // 创建Map实例
	map.centerAndZoom(new BMap.Point(114.98,25.82), 13);  // 初始化地图,设置中心点坐标和地图级别
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
	var geoc = new BMap.Geocoder();
	map.addEventListener("click", function(e){        
		var pt = e.point;
		geoc.getLocation(pt, function(rs){
			var addComp = rs.addressComponents;
			$("#address").val(addComp.province + " " + addComp.city + " " + addComp.district + " " + addComp.street + " " + addComp.streetNumber);
			$("#map").modal("toggle");
		});        
	});
</script>
</html>