$("#likeAdd").click(function (){
	
	
	
})
$("#likeRemove").click(function (){
	$.post("/EstateSales/like/delete",
			{"like.user.id":'${session.user.id}',"like.buildings.id":'${buildVO.id}'},
			function(data){
				
			},"json");
})