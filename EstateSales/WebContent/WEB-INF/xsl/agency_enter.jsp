<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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

    <script type="text/javascript" src="../bootstrap/vendor/jquery/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../bootstrap/dist/js/bootstrapValidator.js"></script>
</head>
<body>
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
                                    <input type="text" class="form-control" name="agencyVo.name" />
                                </div>
                            </div>

							<div class="form-group">
                                <label class="col-lg-3 control-label">手机号码</label>
                                <div class="col-lg-3">
                                    <input type="text" class="form-control" name="agencyVo.phone" id="phone"/>
                                </div>
								<div class="col-lg-2" id="tip1"><a href="javascript:void(0);" onclick="sendYzm();"><label>发送验证码</label></a></div>
                            </div>
							<div class="form-group">
                                <label class="col-lg-3 control-label">验证码</label>
                                <div class="col-lg-3">
                                    <input type="text"  oninput="checkYzm();" class="form-control" id="yzm" name="yzm" />
                                </div>s
								<div class="col-lg-2"><small id="tip"></small></div>
                            </div>

							<div class="form-group">
                                <label class="col-lg-3 control-label">密码</label>
                                <div class="col-lg-5">
                                    <input type="password" class="form-control" name="agencyVo.pwd" />
                                </div>
                            </div>

							<div class="form-group">
                                <label class="col-lg-3 control-label">确认密码</label>
                                <div class="col-lg-5">
                                    <input type="password" class="form-control" name="confirmPassword" />
                                </div>
                            </div>

							<div class="form-group">
                                <label class="col-lg-3 control-label">负责人</label>
                                <div class="col-lg-5">
                                    <input type="text" class="form-control" name="agencyVo.leader" />
                                </div>
                            </div>

							<div class="form-group">
                                <label class="col-lg-3 control-label">固定电话</label>
                                <div class="col-lg-5">
                                    <input type="text" class="form-control" name="agencyVo.tel" />
                                </div>
                            </div>

							<div class="form-group">
                                <label class="col-lg-3 control-label">地址</label>
                                <div class="col-lg-5">
                                    <input type="text" class="form-control" name="agencyVo.address" />
                                </div>
                            </div>

							<div class="form-group">
                                <label class="col-lg-3 control-label">简介</label>
                                <div class="col-lg-5 ">
                                    <textarea  rows="5" class="form-control" name="agencyVo.intro"></textarea>
                                </div>
                            </div>

                        </fieldset>
                       
                        <div class="form-group">
                            <div class="col-lg-9 col-lg-offset-4">
                                <input type="submit" style="align:center" class="btn btn-primary">
                            </div>
                        </div>
                    </form>
                </div>
            </section>
        </div>
    </div>
</body>
<script src="<%=path %>/js/agencyEnter.js"></script>
</html>