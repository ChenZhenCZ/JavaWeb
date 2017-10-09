//bootstrap 数据验证
$(document).ready(function() {
    $('#modify').bootstrapValidator({
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
                        message: '经销商名称不能为为空'
                    },
                    stringLength: {
                        min: 3,
                        max: 30,
                        message: '名称应在3~30字之内!'
                    }
                }
            },
            'agencyVo.leader': {
                validators: {
                    notEmpty: {
                        message: '负责人名称不能为为空'
                    },
                    stringLength: {
                        min: 2,
                        max: 30,
                        message: '名称应在2~15字之内!'
                    }
                }
            },
            'agencyVo.phone': {
                validators: {
                    notEmpty: {
                        message: '电话号码不能为空'
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