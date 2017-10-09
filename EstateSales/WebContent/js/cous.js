//bootstrap 数据验证

　$(function () {
    $('#cousfrom').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            'con.name': {
                validators: {
                    notEmpty: {
                        message: '名称不能为为空'
                    },
                    stringLength: {
                        min: 2,
                        max: 30,
                        message: '名称应在2~15字之内!'
                    }
                }
            },
            'con.phone': {
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
            'con.identity_id': {
                validators: {
                    notEmpty: {
                        message: '身份证号不能为空'
                    },
                    stringLength: {
                         min: 18,
                         max: 18,
                         message: '身份证号请输入18位数字'
                     },
                }
            },
            'con.address': {
                validators: {
                    notEmpty: {
                        message: '地址不能为空'
                    },                   
                }
            },
            'con.email': {
                validators: {
                    notEmpty: {
                        message: '邮箱不能为空'
                    },
                    emailAddress: {
                        message: '输入的不是一个有效的电子邮件地址'
                    }
                }
            }
        }
    });
});
$(function () {
    $('#from1').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            'emp.name': {
                validators: {
                    notEmpty: {
                        message: '名称不能为为空'
                    },
                    stringLength: {
                        min: 2,
                        max: 30,
                        message: '名称应在2~15字之内!'
                    }
                }
            },
            'emp.phone': {
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
            'emp.address': {
                validators: {
                    notEmpty: {
                        message: '地址不能为空'
                    },                   
                }
            },
            'emp.basic_salary': {
                validators: {
                    notEmpty: {
                        message: '请输入基本工资'
                    },                   
                }
            },
            'emp.email': {
                validators: {
                    notEmpty: {
                        message: '邮箱不能为空'
                    },
                    emailAddress: {
                        message: '输入的不是一个有效的电子邮件地址'
                    }
                }
            }
        }
    });
});
$(function () {
    $('#index').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            'emp.name': {
                validators: {
                    notEmpty: {
                        message: '名称不能为为空'
                    },
                    stringLength: {
                        min: 2,
                        max: 30,
                        message: '名称应在2~15字之内!'
                    }
                }
            },
            'emp.address': {
                validators: {
                    notEmpty: {
                        message: '地址不能为空'
                    },                   
                }
            },
            'emp.des': {
                validators: {
                    notEmpty: {
                        message: '请输入你的个人说明'
                    },                   
                }
            },
            'emp.qq': {
                validators: {
                    notEmpty: {
                        message: '请输入你的qq号码'
                    },                   
                }
            },
            'emp.wechat': {
                validators: {
                    notEmpty: {
                        message: '请输入你的微信号'
                    },                   
                }
            },
            'emp.email': {
                validators: {
                    notEmpty: {
                        message: '邮箱不能为空'
                    },
                    emailAddress: {
                        message: '输入的不是一个有效的电子邮件地址'
                    }
                }
            }
        }
    });
});