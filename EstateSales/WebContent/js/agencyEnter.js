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
        	'agencyVo.name': {
                validators: {
                    notEmpty: {
                        message: '经销商名称不能为空'
                    },
                    stringLength: {
                        min: 3,
                        max: 30,
                        message: '名称应在3~30字之内!'
                    }
                }
            },
            'agencyVo.phone': {
                validators: {
                    notEmpty: {
                        message: '手机号不能为空'
                    },
                    stringLength: {
                        min: 11,
                        max: 11,
                        message: '手机号码应为11位'
                    },
                    regexp: {
                        regexp: /^1[3|5|8]{1}[0-9]{9}$/,
                        message: '请输入正确的手机号码'
                    }
                }
            },
            
            'agencyVo.leader': {
                validators: {
                    notEmpty: {
                        message: '负责人名称不能为空'
                    },
                    stringLength: {
                        min: 2,
                        max: 30,
                        message: '名称应在2~15字之内!'
                    }
                }
            },
            'agencyVo.tel': {
                validators: {
                    notEmpty: {
                        message: '固定电话不能为空'
                    },
                    stringLength: {
                         min: 7,
                         max: 7,
                         message: '电话是7位数哦！'
                     },
                     regexp: {
                         regexp: /^[0-9]*[1-9][0-9]*$/,
                         message: '请输入正确的电话号码'
                     }
                }
            },
            'agencyVo.logo': {
                validators: {
                    notEmpty: {
                        message: '商标不能为空'
                    },                   
                }
            },
            'agencyVo.address': {
                validators: {
                    notEmpty: {
                        message: '地址不能为空'
                    },                   
                }
            },
            'agencyVo.email': {
                validators: {
                    notEmpty: {
                        message: '邮箱不能为空'
                    },
                    emailAddress: {
                        message: '输入的不是一个有效的电子邮件地址'
                    }
                }
            },          
            'agencyVo.pwd': {
                validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    },
                    stringLength:{
                    	min:6,
                    	message:'密码最少为6位'
                    }
                }
            },
            'yzm': {
                validators: {
                    notEmpty: {
                        message: '请输入验证码'
                    },
                    regexp: {
                        regexp: /^[0-9]*[1-9][0-9]*$/,
                        message: '验证码格式错误'
                    }
                }
            },
            confirmPassword: {
                validators: {
                    notEmpty: {
                        message: '确认密码不能为空'
                    },
                    identical: {
                        field: 'agencyVo.pwd',
                        message: '两次输入的密码不一致'
                    }
                }
            },
			

            ages: {
                validators: {
                    lessThan: {
                        value: 100,
                        inclusive: true,
                        message: 'The ages has to be less than 100'
                    },
                    greaterThan: {
                        value: 10,
                        inclusive: false,
                        message: 'The ages has to be greater than or equals to 10'
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
		$("#subBtn").removeAttr("disabled");
		var str="<a href='javascript:void(0);' onclick='sendYzm();'><label>发送验证码</label></a>";
		$("#tip1").html(str);
	}
	else{
		$("#tip1").html("请输入正确的手机号码格式");
		$("#tip1").css({"color":"red"});
		$("#subBtn").attr("disabled","disabled");
	}
}

var Tyzm="";
function sendYzm(){
	var phone = document.getElementById("phone").value;
	if(phone){
		$.post("/EstateSales/agency/phone",
			{"phone":phone},
			function(data){
				if(data.controllerResult.result == "success"){
					Tyzm=data.phoneYzm;
					$('#tip1').html(curcount+"秒后重发验证码");
					InterValObj = setInterval(setRemainTime, 1000);
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
	    }  
	    else {  
	    	  curcount--;  
	    	  $("#tip1").html(curcount + "秒后可重发验证码");  
	    }  
	}  

function checkYzm(){
	if(Tyzm==""){
		$("#subBtn").attr("disabled","disabled");
	}else{
		var yzm = document.getElementById("yzm").value;
		if(Tyzm!=yzm){
			$("#tip").css({"color":"red"});
			$("#tip").html("验证码输入错误");
			$("#subBtn").attr("disabled","disabled");
		}else{
			$("#tip").css({"color":"green"});
			$("#tip").html("验证码输入正确");
			$("#subBtn").removeAttr("disabled");
		}
	}
}