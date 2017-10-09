$(document).ready(function() {
    $('#from1').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	'admin.adminName': {
                validators: {
                    notEmpty: {
                        message: '账号不能为空'
                    }
                }
            },
            'admin.adminPwd': {
                validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    }
                }
            }
        }
    });
});
$(document).ready(function() {
    $('#articletype').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	'articleType.name': {
                validators: {
                    notEmpty: {
                        message: '类别不能为空'
                    }
                }
            },
            'articleType.des': {
                validators: {
                    notEmpty: {
                        message: '描述不能为空'
                    }
                }
            }
        }
    });
});
var editor1;
KindEditor.ready(function(K) {
		editor1 = K.create('textarea[name="article.content"]', {
		cssPath : '/EstateSales/kindeditor/plugins/code/prettify.css',
		uploadJson : '/EstateSales/kindeditor/jsp/upload_json.jsp',
		fileManagerJson : '/EstateSales/kindeditor/jsp/file_manager_json.jsp',
		allowFileManager : true,
		afterCreate : function() {
			var self = this;
			K.ctrl(document, 13, function() {
				self.sync();
				document.forms['newsform'].submit();
			});
			K.ctrl(self.edit.doc, 13, function() {
				self.sync();
				document.forms['newsform'].submit();
			});
		//	k.show({height:"600px"});
		}
	});
	prettyPrint();
});
$("#select").select2({width:"450px"});
var i=true;
function addElementImg(obj) {
		if(i){
			var ul = document.getElementById(obj);
			var img = document.createElement("img");
			img.setAttribute("id", "newImg");
			img.setAttribute("style", "width:450px;height:250px");
			img.src = "";
			ul.appendChild(img);
			i=false;
			var input = document.getElementById("upload");
			var $img = $('#newImg');
			input.addEventListener('change',readFile,false);
			function readFile(){
				var file=this.files[0];
				var $file = $(this);
				var fileObj = $file[0];
				var windowURL = window.URL || window.webkitURL;
				var dataURL;
				dataURL = windowURL.createObjectURL(fileObj.files[0]);
				$img.attr('src',dataURL);
			}
		}
	}
	function F_Open_dialog(){ 
		document.getElementById("upload").click(); 
	} 