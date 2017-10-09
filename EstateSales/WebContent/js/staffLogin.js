$(document).ready(function() {
    $('#from1').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	'emp.phone': {
                validators: {
                    notEmpty: {
                        message: '账号不能为空'
                    }
                }
            },
            'emp.pwd': {
                validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    }
                }
            }
        }
    });
});