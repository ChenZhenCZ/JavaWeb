<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path= request.getContextPath();
%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>测试页面</title>
<!--引用百度地图API-->
	<LINK rel="stylesheet" type="text/css" href="http://www.amboedu.com/templets/style/leyuqq.css">
</head>
<body>
<<<<<<< .mine
	<div class="qqbox" id="divQQbox">
		<div class="lebg" id="contentid">
			<div class="onqq">
				<div class="qqpic">
					<a
						href="http://wpa.qq.com/msgrd?v=3&uin=1471244691&site=qq&menu=yes"
						;target=_blank;><img border="0"
						SRC='http://wpa.qq.com/pa?p=2:471662634:44' alt="TTS1"> </a>
				</div>
			</div>
		</div>
		<div class="qqfoot">
			<img src="http://www.amboedu.com/templets/style/img/leyubg3.gif"
				widht="88" height="12">
		</div>
	</div>
<script type="text/JavaScript"> 
	var tips; 
	var theTop = 70;
	var old = theTop;
	function initFloatTips() 
	{ 
	tips = document.getElementById('divQQbox');
	moveTips();
	}
	function moveTips()
	{
	   var tt=50; 
	    if (window.innerHeight) 
	    {
	   pos = window.pageYOffset 
	    }else if (document.documentElement && document.documentElement.scrollTop) {
	   pos = document.documentElement.scrollTop 
	    }else if (document.body) {
	      pos = document.body.scrollTop; 
	    }
	    //http:
	    pos=pos-tips.offsetTop+theTop; 
	    pos=tips.offsetTop+pos/10; 
	    if (pos < theTop){
	    pos = theTop;
	    }
	    if (pos != old) { 
	    tips.style.top = pos+"px";
	    tt=10;//alert(tips.style.top); 
	    }
	    old = pos;
	    setTimeout(moveTips,tt);
	}
	initFloatTips();
	if(typeof(HTMLElement)!="undefined")//给firefox定义contains()方法，ie下不起作用
	   { 
	    HTMLElement.prototype.contains=function (obj) 
	    { 
	     while(obj!=null&&typeof(obj.tagName)!="undefind"){//
	    　　 　if(obj==this) return true; 
	    　　　 　obj=obj.parentNode;
	    　　   } 
	     return false; 
	    }
	}
</script>
</body>
</html>