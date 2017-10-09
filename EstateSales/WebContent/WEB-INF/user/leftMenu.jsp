<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">更换头像</h4>
	      </div>
	      <div class="modal-body">
	       	<form  enctype="multipart/form-data">
        		<label>请选择头像</label>
        		<input id="headicon" name="headicon" type="file">
    		</form> 
	      </div>
	      <div class="modal-footer">
       		 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	      </div>
	    </div>
	  </div>
	</div> 
	<div class="col-sm-2 col-lg-2">
            <div class="sidebar-nav">
                <div class="nav-canvas">
                    <div class="nav-sm nav nav-stacked">

                    </div>
                    <ul class="nav nav-pills nav-stacked main-menu">
                        <li class="nav-header">
						<div>
					  		<a href="#myModal" data-toggle="modal" data-target="#myModal" > 	
							     <img id="logoImg"src="${session.user.headicon}" style="width: 120px;height:120px;"class="img-responsive img-circle" alt="还没有头像">
						    </a>
						</div>
						</li>
                        <li><a class="ajax-link" href="../user/index"><i class="glyphicon glyphicon-home"></i><span> 首页</span></a></li>
                        
                        <li><a class="ajax-link" href="../user/home"><i class="glyphicon glyphicon-list-alt"></i><span>用户信息</span></a></li>
                        
                        <li><a class="ajax-link" href="../user/homePage"><i class="glyphicon glyphicon-edit"></i><span>修改用户资料</span></a> </li>         
               			
               			<li><a class="ajax-link" href="../user/changePwdPage"><i class="glyphicon glyphicon-cog"></i><span> 更改密码</span></a></li>
                      	    
                        <li><a class="ajax-link" href="../appointment/userlistPage"><i class="glyphicon glyphicon-check"></i><span>用户预约信息</span></a> </li>         
               			             	
                      	<li><a class="ajax-link"href="../history/list"><i class="glyphicon glyphicon-list"></i><span>浏览楼盘记录</span></a></li>
                                       			
               			<li><a class="ajax-link" href="../comment/userlist"><i class="glyphicon glyphicon-comment"></i><span> 我的评价</span></a></li>
                        
                        <li><a class="ajax-link" href="../like/userlist"><i class="glyphicon glyphicon-thumbs-up"></i><span>我的点赞</span></a></li>
                     </ul>
                </div>
            </div>
        </div>