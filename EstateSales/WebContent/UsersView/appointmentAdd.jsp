<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>用户预约</title>
<link rel="stylesheet"
	href="<%=path%>/bootstrap/vendor/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="<%=path%>/bootstrap/dist/css/bootstrapValidator.min.css" />
<script type="text/javascript"
	src="<%=path%>/bootstrap/vendor/jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/bootstrap/dist/js/bootstrapValidator.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/user.js"></script>
</head>
<body>
	<ul>
	   <li><a data-toggle="modal" data-target="#appointment" href="javascript:void(0)"><span class="glyphicon glyphicon-phone-alt"></span> 在线预约</a></li>
	</ul>				
	<!-- 在线预约开始-->
	<div id="appointment" class="modal fade" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-title">
					<h2 class="text-center">在线预约</h2>
				</div>
				<div class="modal-body">
					<form action="<%=path%>/appoointment/appointmentAdd" id="appoint"
						class="form-group" method="post">
						<div class="form-group">
                             <label class="control-label col-md-2  col-xs-12">预约时间</label>
                             <div class="col-md-9  col-xs-12">
                                 <input type="date" class="form-control" name="appoint.app_arrive_time" />
                             </div>
                        </div>	
                   		<div class="clearfix"></div>
			            <br/>                   
					  <div class="row">
					  		<div class=" col-md-2  col-md-offset-1 thumbnail" id="headicon" style="float: left;"><a href="#"><img  width=" 100px;" height="100px;"alt="" src="<%=path%>/UsersPlugin/images/img.jpg" ></a>
				                   <p align="center">
				                   		 <label class="radio-inline">
										  <input type="radio" name="inlineRadioOptions" id="inlineRadio1" checked value="张三">张三 
										</label>
					                </p>
				                  
					        </div>
					  		<div class=" col-md-2  thumbnail" id="headicon" style="float: left;"><a href="#"><img width=" 100px;" height="100px;" alt="" src="<%=path%>/UsersPlugin/images/img.jpg"></a>
				                     <p align="center">
				                   		 <label class="radio-inline">
										  <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="张三">张三 
										</label>
					                </p>
				   
					        </div>
					 		<div class=" col-md-2  thumbnail" id="headicon" style="float: left;"><a href="#"><img width=" 100px;" height="100px;" alt="" src="<%=path%>/UsersPlugin/images/img.jpg"></a>
				                     <p align="center">
				                   		 <label class="radio-inline">
										  <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="张三">张三 
										</label>
					                </p>
				   
					        </div>
					 		<div class=" col-md-2 thumbnail" id="headicon" style="float: left;"><a href="#"><img width=" 100px;" height="100px;" alt="" src="<%=path%>/UsersPlugin/images/img.jpg"></a>
				                     <p align="center">
				                   		 <label class="radio-inline">
										  <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="张三">张三 
										</label>
					                </p>
				   
					        </div>
					        		<div class=" col-md-2 thumbnail" id="headicon" style="float: left;"><a href="#"><img width=" 100px;" height="100px;" alt="" src="<%=path%>/UsersPlugin/images/img.jpg"></a>
				                     <p align="center">
				                   		 <label class="radio-inline">
										  <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="张三">张三 
										</label>
					                </p>
				   
					        </div>
					   	</div>
					  		<div class="text-right">
							<button class="btn btn-info" type="submit">确定</button>
							<button class="btn btn-danger" data-dismiss="modal">取消</button>
						</div>
				
				</form>
				</div>
			</div>
		</div>
	</div>
 <!-- 在线预约结束 -->
	</body>
</html>