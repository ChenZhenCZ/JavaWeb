//bootstrap 数据验证
$(document).ready(function() {
    $('#defaultForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	'user.name': {
                validators: {
                    notEmpty: {
                        message: '用户名称不能为为空'
                    },
                    stringLength: {
                        min: 2,
                        max: 30,
                        message: '用户名称应在2~30字之内!'
                    }
                }
            },
            'user.nickname': {
                validators: {
                    notEmpty: {
                        message: '我的昵称不能为为空'
                    },
                    stringLength: {
                        min: 2,
                        max: 30,
                        message: '名称应在2~15字之内!'
                    }
                }
            },
            'user.phone': {
                validators: {
                    notEmpty: {
                        message: '手机号码不能为空'
                    },
                    stringLength: {
                         min: 11,
                         max: 11,
                         message: '请输入11位手机号码'
                     },
                     regexp: {
                         regexp: /^(0|86|17951)?(13[0-9]|15[012356789]|18[0-9]|14[57])[0-9]{8}$/,
                         message: '请输入正确的手机号码格式'
                     }
                }
            },
            yzm: {
                validators: {
                    notEmpty: {
                        message: '请输入验证码'
                    }
                }
            },
            'user.birthday': {
                validators: {
                    notEmpty: {
                        message: '出生日期不能为空'
                    }
                }
            },
            'user.qq': {
                validators: {
                    notEmpty: {
                        message: 'QQ号码不能为空'
                    },
                    stringLength: {
                         min: 6,
                         max: 11,
                         message: 'QQ号码应在6~11之间'
                     }
                }
            },
            'user.wechat': {
                validators: {
                    notEmpty: {
                        message: '微信号不能为空'
                    },   
                    stringLength: {
                        min: 2,
                        max: 30,
                        message: '微信号应在2~30字之内!'
                    }
                }
            },
            'user.address': {
                validators: {
                    notEmpty: {
                        message: '地址不能为空'
                    },                   
                }
            },
            'user.email': {
                validators: {
                    notEmpty: {
                        message: '邮箱不能为空'
                    },
                    emailAddress: {
                        message: '输入的不是一个有效的电子邮件地址'
                    }
                }
            },          
            'user.pwd': {
                validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: '至少6位字母或数字!'
                    }
                }
            },
            confirmPassword: {
                validators: {
                    notEmpty: {
                        message: '确认密码不能为空'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: '至少6位字母或数字!'
                    },
                    identical: {
                        field: 'user.pwd',
                        message: '两次输入的密码不一致'
                    }
                }
            }	      
        }
    });
});
$(document).ready(function() {
    $('#f1').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
			'user.phone': {
                validators: {
                    notEmpty: {
                        message: '手机号码不能为空'
                    },
                    stringLength: {
                         min: 11,
                         max: 11,
                         message: '请输入11位手机号码'
                     },
                     regexp: {
                         regexp: /^1[3|5|8]{1}[0-9]{9}$/,
                         message: '请输入正确的手机号码'
                     }
                }
            },
    	    'user.pwd': {
                validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: '至少6位字母或数字!'
                    }	               
                }
            }
        }
    });
});
$(document).ready(function() {
    $('#changePwd').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {         
            'user.pwd': {
                validators: {
                    notEmpty: {
                        message: '旧密码不能为空'
                    },                  
                }
            },
            'user.qq': {
                validators: {
                    notEmpty: {
                        message: '新密码不能为空'
                    },
                   
                }
            },
            confirmPassword: {
                validators: {
                    notEmpty: {
                        message: '确认密码不能为空'
                    },
                    identical: {
                        field: 'user.qq',
                        message: '两次输入的密码不一致'
                    }
                }
            }	           
        }
    });
});
//手机号码控制
function isPhone() {
	var aPhone=$("#phone").val()
	var bValidate = RegExp(
			/^(0|86|17951)?(13[0-9]|15[012356789]|18[0-9]|14[57])[0-9]{8}$/).test(aPhone);
	if (bValidate) {
		$("#sub").removeAttr("disabled");
		var str="<a href='javascript:void(0);' onclick='sendYzm();'><label>发送验证码</label></a>";
		$("#tip1").html(str);
	}
	else{
		$("#tip1").html("请输入正确的手机号码格式");
		$("#tip1").css({"color":"red"});
		$("#sub").attr("disabled","disabled");
	}
}

var Tyzm="";
function sendYzm(){
	var phone = $("#phone").val();
	if(phone){
		$.post("../user/phone",
			{"user.phone":phone},
			function(data){
				if(data.controllerResult.result == "success"){
					Tyzm=data.yzm;
					$('#tip1').html(curcount+"秒后重发验证码");
					InterValObj = setInterval(setRemainTime, 1000);
					$("#tip").html();
				}else if(data.controllerResult.result == "fail"){
					$("#tip").html(data.controllerResult.message);
				}
			},
		"json");
	}
}
var InterValObj;
var curcount=60;
 function setRemainTime() {  
	    if (curcount == 0) {  
	        clearInterval(InterValObj);//停止计时器  
	        var str="<a href='javascript:void(0);' onclick='sendYzm();'><label>发送验证码</label></a>";
			$("#tip1").html(str);  
			Tyzm = ""; //清除验证码。如果不清除，过时间后，输入收到的验证码依然有效      
			$("#tip").html();
			curcount=60;
	    }  
	    else {  
	    	  curcount--;  
	    	  $("#tip1").html(curcount + "秒后可重发验证码");  
	    }  
	}  
function checkYzm(){
	if(Tyzm==""){
		$("#sub").attr("disabled","disabled");
	}else{
		var yzm = $("#yzm").val();
		if(Tyzm!=yzm){
			$("#tip").css({"color":"red"});
			$("#tip").html("验证码输入错误");
			$("#sub").attr("disabled","disabled");
		}else{
			$("#tip").css({"color":"green"});
			$("#tip").html("验证码输入正确");
			$("#sub").removeAttr("disabled");
		}
	}
}
function checkLogin(){
	var phone=$("#loginPhone").val();
	var pwd=$("#loginPwd").val();
	if(phone==''||pwd==''){
		toastr.error("密码或手机号码不能为空");
	}else{
		$.post("../user/login",
				$("#f1").serialize(),
				function(data){
				if(data.msg=='fail'){
					toastr.error("账号或密码输入错误！");
				}else{
					var ht="<span><a href='../user/home' class='btn btn-default' type='button'>个人中心</a>&nbsp;<a href='../user/exit' class='btn btn-default' type='button'>退出</a></span>"
					$("#userhome").html(ht);
					$("#login").modal("toggle");
				}
		},"json")
	}
}
