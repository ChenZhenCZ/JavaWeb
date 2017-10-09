// JavaScript Document
$(function(){
var timeDom = $("#time");
function timeEve(){
	if(timeDom.length==0) return false;
	var num = parseInt(timeDom.html());
	function countDown(){
		if(num<=1){
			window.location.href="../user/home";
			return false;	
		}
		window.setTimeout(function(){
			num--;
			timeDom.html(num);
			countDown();
		},1000);
	};
	countDown();
}
timeEve();
})