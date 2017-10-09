var editor1;
KindEditor.ready(function(K) {
		editor1 = K.create('textarea[name="ads.content"]', {
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