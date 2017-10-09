//bootstrap 数据验证
$(document).ready(function() {
    $('#agencyLogin').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	'agencyVo.phone': {
                validators: {
                    notEmpty: {
                        message: '手机号不能为为空'
                    },
                }
            },
            'agencyVo.pwd': {
                validators: {
                    notEmpty: {
                        message: '负责人名称不能为为空'
                    },
                }
            }
        }
    });
});
