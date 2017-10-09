$(function(){
$.Huitab("#tab_demo .tabBar span","#tab_demo .tabCon","current","mousemove","1")
$.Huitab("#tab_demo1 .tabBar span","#tab_demo1 .tabCon","current","mousemove","1")
$.Huitab("#tab_demo2 .tabBar b","#tab_demo2 .tabCon2","current","click","0")
$.Huitab("#tab_demo4 .tabBar span","#tab_demo4 .tabCon","current","mousemove","0")
$.Huitab("#tab_demo5 .tabBar span","#tab_demo5 .tabCon","current","mousemove","0")
$.Huitab("#tab_demo6 .tabBar span","#tab_demo6 .tabCon","current","mousemove","0")
$.Huitab("#tab_demo7 .tabBar span","#tab_demo7 .tabCon","current","mousemove","0")
$.Huitab("#key .tabBar span","#key .tabCon","current","mousemove","0")
});
jQuery.Huitab =function(tabBar,tabCon,class_name,tabEvent,i){
	var $tab_menu=$(tabBar);
	  // ��ʼ������
	  $tab_menu.removeClass(class_name);
	  $(tabBar).eq(i).addClass(class_name);
	  $(tabCon).hide();
	  $(tabCon).eq(i).show();
	  
	  $tab_menu.bind(tabEvent,function(){
	  	$tab_menu.removeClass(class_name);
	      $(this).addClass(class_name);
	      var index=$tab_menu.index(this);
	      $(tabCon).hide();
	      $(tabCon).eq(index).show()})}