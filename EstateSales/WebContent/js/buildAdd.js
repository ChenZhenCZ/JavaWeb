//bootstrap 数据验证
$(document).ready(function() {
    $('#buildAdd').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	'buildingsVO.name': {
                validators: {
                    notEmpty: {
                        message: '楼盘名称不能为为空'
                    }
                }
            },
            'sheng': {
                validators: {
                    notEmpty: {
                        message: '城市不能为为空'
                    }
                }
            },
            'shi': {
                validators: {
                    notEmpty: {
                        message: '市不能为为空'
                    }
                }
            },
            'xian': {
                validators: {
                    notEmpty: {
                        message: '县/区不能为为空'
                    }
                }
            },
            'buildingsVO.address': {
                validators: {
                    notEmpty: {
                        message: '地址不能为为空'
                    }
                }
            },
            'buildingsVO.floor_area': {
                validators: {
                    notEmpty: {
                        message: '占地不能为为空'
                    },
                    regexp: {
                        regexp: /^1[3|5|8]{1}[0-9]{9}$/,
                        message: '请输入数字'
                    }
            		
                }
            },
            'buildingsVO.building_area': {
                validators: {
                    notEmpty: {
                        message: '建筑面积不能为为空'
                    },
                    regexp: {
                        regexp: /^1[3|5|8]{1}[0-9]{9}$/,
                        message: '请输入数字'
                    }
                }
            },
            'buildingsVO.house_type': { 
                validators: {
                    notEmpty: {
                        message: '房源类型不能为空'
                    }
                }
            },
            'buildingsVO.building_type': {
                validators: {
                    notEmpty: {
                        message: '建筑类型不能为空'
                    },                   
                }
            },
            'buildingsVO.longitude': {
                validators: {
                    notEmpty: {
                        message: '经度不能为空'
                    },
                    regexp: {
                        regexp: /^1[3|5|8]{1}[0-9]{9}$/,
                        message: '请输入数字格式'
                    }
                }
            },          
            'buildingsVO.longitude': {
                validators: {
                    notEmpty: {
                        message: '纬度不能为空'
                    },
                    regexp: {
                        regexp: /^1[3|5|8]{1}[0-9]{9}$/,
                        message: '请输入数字格式'
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