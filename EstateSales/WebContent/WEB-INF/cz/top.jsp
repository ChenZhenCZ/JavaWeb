<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <div class="navbar navbar-default" role="navigation">

        <div class="navbar-inner">
            <button type="button" class="navbar-toggle pull-left animated flip">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath }/index.jsp"> <img alt="Charisma Logo" src="${pageContext.request.contextPath }/managePlugin/img/favicon.ico" class="hidden-xs"/>
                <span><font size="2">${emp.agency.name}</font></span></a>

            <!-- user dropdown starts -->
            <div class="btn-group pull-right">
                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    <i class="glyphicon glyphicon-user"></i><span class="hidden-sm hidden-xs">${emp.name}</span>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li><a href="${pageContext.request.contextPath }/staff/exit">退出登录</a></li>
                </ul>
            </div>
            <!-- user dropdown ends -->

            <!-- theme selector starts -->
            <div class="btn-group pull-right theme-container animated tada">
             	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">密码修改</button>
            </div>
            <!-- theme selector ends -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="exampleModalLabel">员工密码修改</h4>
			      </div>
			      <div class="modal-body">
			         <form  action="${pageContext.request.contextPath }/staff/updata" id="emp"  method="post">
			          <div class="form-group">
			          	<input type="hidden" name="emp.id" value="${emp.id}">
			            <label for="recipient-name"  class="control-label">旧密码:</label>
			            <input type="password" name="emp.des" class="form-control" id="recipient-name">
			          </div>
			          <div class="form-group">
			            <label for="message-text" class="control-label">新密码:</label>
			             <input type="password" name="emp.pwd" class="form-control" id="recipient-name">
			          </div>
			            <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				        <button type="submit" class="btn btn-primary">确认</button>
				      </div>
				      </form>
			           </div>
				    </div>
			      
			  </div>
			</div>
        </div>
    </div>
<script type="text/javascript" src="${pageContext.request.contextPath }/bootstrap/dist/js/bootstrapValidator.js"></script>
<script>
$(function () {
    $('#emp').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            'emp.des': {
                validators: {
                    notEmpty: {
                        message: '密码不能为为空'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: '密码应在6~15字之内!'
                    }
                }
            }, 
            'emp.pwd': {
                validators: {
                	  notEmpty: {
                          message: '密码不能为为空'
                      },
                      stringLength: {
                          min: 6,
                          max: 30,
                          message: '密码应在6~15字之内!'
                      }
                }
            }
        }
    });
});
</script>