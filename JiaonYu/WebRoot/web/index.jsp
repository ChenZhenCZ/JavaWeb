<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>宏图软件教育官网</title>
<link href="${pageContext.request.contextPath }/web/css/index.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/web/css/bottom.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath }/web/js/jquery-1.5.2.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/web/js/tool.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/web/js/banner.js" type="text/javascript"></script>
 <script language=Javascript> 
	 function time(){
		 var now=new Date() 
		 var s=now.getFullYear()+"年"+(now.getMonth()+1)+"月"+now.getDate() +"日"+now.getHours()+"时"+now.getMinutes()+"分"+now.getSeconds()+"秒";
		 document.getElementById('date').innerHTML=s;
		 setTimeout(time,1000);
	 } 
 </script>
 <body onload="time()">
<!-- 头部 -->
<div id="header">
  <div class="top">    
     <div class="welcome">
     您好！欢迎来到宏图教育官网！  <a href="${pageContext.request.contextPath }/web/login.jsp">登录</a>|<a href="${pageContext.request.contextPath }/uersServlet?action=init">注册</a>
     </div>
	<div class="top_right">             
     <div id="date" style="float: left; line-height: 36px;padding-right: 10px;"></div>
        <span style="CURSOR: hand" onclick="window.external.addFavorite('wwww.sms98.cn')" title="宏图在线教育官网">收藏本站</span>
    </div>
  </div>
  <div class="top_nav">
    <div class="logo"><a href="#" title="宏图教育"><img src="${pageContext.request.contextPath }/web/image/logo2.jpg" alt="宏图教育" width="400" height="80"></a></div>
    <div class="search"> 
   	  <div class="xiala">
			<dl id="tdwt" class="dropdowns tdwt">
      		<dt><a href="javascript:void(0)"><span>文章</span></a></dt>
     		 <dd>
   				 <ul>
					<li><a href="javascript:void(0)">文章<span class="value">文章</span></a></li>
					<li><a href="javascript:void(0)">视频<span class="value">视频</span></a></li>
					<li><a href="javascript:void(0)">试题<span class="value">试题</span></a></li>
					<li><a href="javascript:void(0)">教材<span class="value">教材</span></a></li>
				</ul>
  			</dd>
 			</dl>
      </div>
      <form id="frm_add" name="frm_add" method="post" action="#">
        <input type="text" class="key" name="key" id="key" placeholder="搜索你感兴趣的视频...">
        <input type="hidden" name="searchtype" id="searchtype" value="文章">
        <input type="submit" class="button" name="button" id="button" value="提交">
      </form>
      <ul class="host">
      <li class="ik">热搜：</li>
      <li class="o"><a target="_blank" href="#">辅导教材</a></li>
      <li class="ik"><a target="_blank" href="#">招生信息</a></li>
      <li class="ik"><a target="_blank" href="#">成考模考</a></li>
      <li class="ik"><a target="_blank" href="#">精品课程</a></li>
      </ul>
    </div>
  </div>
  <div class="nav">
	<ul>
		<li class="n"><a href="#">首页</a></li>
		<li><a target="_self" href="#">走进宏图</a></li>
		<li><a target="_self" href="#">在线课程</a></li>
		<li><a target="_self" href="#">新闻公告</a></li>
		<li><a target="_self" href="#">一线讲师</a></li>  
		<li><a target="_self" href="#">优惠活动</a></li>                               
		<li><a target="_self" href="#">免费视频</a></li>                               
		<li><a target="_self" href="#">加入我们</a></li>
	</ul>
  </div>
</div>
<!-- 左侧导航 -->
<div id="left_nav" style="left: 33px; position: absolute; top: 151px;">
<h1>推荐精品课程</h1>
<div class="nav_list" id="nav_k">
	<ul><h2><img src="${pageContext.request.contextPath }/web/image/left_nav_img1.gif">C语言从入门到精通实训</h2></ul>
  	<ul><h2><img src="${pageContext.request.contextPath }/web/image/left_nav_img2.gif">SQL2005从入门到精通</h2></ul>
	<ul><h2><img src="${pageContext.request.contextPath }/web/image/left_nav_img14.gif">JAVA语言从入门到精通</h2></ul>
  	<ul><h2><img src="${pageContext.request.contextPath }/web/image/left_nav_img3.gif">JavaScript从入门到精通 </h2></ul>
  	<ul><h2><img src="${pageContext.request.contextPath }/web/image/left_nav_img4.gif">JSP从入门到精通项目实训</h2></ul>
     <ul><h2><img src="${pageContext.request.contextPath }/web/image/left_nav_img13.gif">仿QQ即时通讯教学视频</h2></ul>
	<img src="${pageContext.request.contextPath }/web/image/deli2wm.jpg" alt="" width="99%">
	<div class="qqbtnV">
		<a href="#"><div class="qqbtn"><span>客服QQ<br/>31343080</span></div></a>
		<a href="#"><div class="qqbtn"><span>客服QQ<br/>31343080</span></div></a>
		<a href="#"><div class="qqbtn"><span>客服QQ<br/>31343080</span></div></a>
		<a href="#"><div class="qqbtn"><span>客服QQ<br/>31343080</span></div></a>
	</div>
 	<div style="height: 30px;width: 100%; float: left;"></div>
</div>
 <div class="nav_list2" >
 	 	<ul>
 	<li style="font-size: 18px;">学生服务</li>
 	
 	  	<li><a href="#">教师证网上报名</a></li>
 	  	<li><a href="#">网上统考报名</a></li>
 	  	<li><a href="#">资格证网上查询</a></li>
 	  	<li><a href="#">计算机证书查询</a></li>
 	  	<li><a href="#">教育部综合查询</a></li>
 	  	<li><a href="#">学信网学籍查询</a></li>
 	  	<li><a href="#">中国人事人才网</a></li>
 	  	<li><a href="#">国家资格证证书查询</a></li>
    </ul>
 </div>
</div>
<!-- 内容部分 -->
<div id="ibody">
  <div class="body_k">
  	<div class="left">
	  <div class="banner_k" style="height: 242px;">
<div id="banner" style="height: 242px;">
    <ul id="show_pic" style="left: -694px;">
		<li><a href="javascript:void(0);" target="_blank"><img src="${pageContext.request.contextPath }/web/image/1.jpg" width="695" height="242" ></a></li>
		<li><a href="javascript:void(0);" target="_blank"><img src="${pageContext.request.contextPath }/web/image/2.png" width="694" height="242" alt="网络视频"></a></li>
		<li><a href="javascript:void(0);" target="_blank"><img src="${pageContext.request.contextPath }/web/image/3.jpg" width="694" height="286" alt="在线报名"></a></li>
    </ul>
    <ul id="icon_num">
        <li class="">1</li>
        <li class="active">2</li>
        <li class="">3</li>
        <!--<li>4</li>-->
    </ul>
</div>
      </div>
      <!-- news start -->
      <div class="news_k">
      		<img src="${pageContext.request.contextPath }/web/image/news_img.jpg" width="324" height="239">
        <div class="news_wz">
           	<h1><a href="javascript:void(0);" target="_blank">【秒杀】游戏开发工程师高薪就业课程>></a></h1>
            	<p>【红帽】红帽认证签约保过班>><a href="javascript:void(0);" target="_blank"> &lt;&lt;点击咨询&gt;&gt; </a></p>
                <div class="new_list">
               	  <ul>
                  <li><i>•</i> <a target="_blank" href="javascript:void(0);">大数据工程师40天速成路线图（Java+Hadoop）</a></li>
						   <li><i>•</i> <a target="_blank" href="javascript:void(0);">Excel从入门到VBA高级工程师学习路线图</a></li>
						   <li><i>•</i> <a target="_blank" href="javascript:void(0);">CCIE课程套餐（CCNA/CCNP/CCIE入门到精通）</a></li>
						   <li><i>•</i> <a target="_blank" href="javascript:void(0);">备战2016软考网络工程师10套真题详解套餐（最新、最全）</a></li>
				</ul>
                </div>
                <div class="more">
                <a href="#">更多>></a></div>
                
            </div>
       </div>
      </div>
  <!-- 右侧开始 -->
  <div class="right">
  <!-- manber -->
	  <div class="manber_k">
      	<div style="float:left;padding-top:25px;padding-left:15px;width:80;"><img src="${pageContext.request.contextPath }/web/image/manber.jpg" width="60"></div>
        <div style="float:right; width:150px;padding-right:10px;">
	        <img style="padding-top:5px;" src="${pageContext.request.contextPath }/web/image/img/teacherBtn.png" width="100%">
	        <a href="${pageContext.request.contextPath }/web/login.jsp"><img style="padding-top:5px;" src="${pageContext.request.contextPath }/web/image/img/studentBtn.png" width="100%"></a>
        </div>        	
	  </div>
	  <div class="gongao">
	  	<h1>最新公告</h1>
	    	<ul>
	           <li><i>•</i> <a target="_blank" href="javascript:void(0);">【秒杀】Python工程师高端课程</a></li>
			   <li><i>•</i> <a target="_blank" href="javascript:void(0);">【首发】用人工智能认识猫狗?</a></li>
			   <li><i>•</i> <a target="_blank" href="javascript:void(0);">【五折】软考套餐-网工终极解密</a></li>
			   <li><i>•</i> <a target="_blank" href="javascript:void(0);">【资料】大数据8800元免费资料</a></li>
			   <li><i>•</i> <a target="_blank" href="javascript:void(0);">【免费】Linux架构师高端课程</a></li>
			</ul>
	        <div class="more">
	    <a href="#">更多>></a></div>           
	  </div>	 
	  <img style="padding-top: 12px;" src="${pageContext.request.contextPath }/web/image/img/ad.jpg" width="100%" height="180px">
    </div>
    <div class="clear"></div>
  <!-- rongyu -->
  <div class="rongyu_k"  style="height: 380px;">
  <h1>在线课程<a href="<%=basePath%>mainservlet?action=list&pageDaen=${page.pageDaen }&por=next">更多&gt;&gt;</a></h1>
  <div class="show_pic">   
           <div class="smallPic" >
             <ul>
             	<c:forEach items="${courselist}" var="s">
             		<li>   
             			<a href="${pageContext.request.contextPath }/listServlet?action=course&courseId=${s.courseId}"><img src="${s.pictureUrl}" width="100"height="80"><br/><br/>
             			<a href="${pageContext.request.contextPath }/sectionServlet?action=list1&courseId=${s.courseId}">${s.courseName}--${s.oneWord}</a>
             		</li>
             	</c:forEach>
                  
             </ul>
          </div>
      </div>
  </div>
    <div class="rongyu_k"  style="height: 380px;">
  <h1>一线实战老师<a href="<%=basePath%>mainservlet?action=list&pageDaen=${page.pageDaen }&por=next">更多&gt;&gt;</a></h1>
  <div class="show_pic">   
           <div class="smallPic" >
             <ul>
             	 <c:forEach items="${teacherlist}" var="s">
             		<li>   	
             			<a href="${pageContext.request.contextPath }/courseServlet?action=wode3&teacherid=${s.teacherId}"><img src="${pageContext.request.contextPath }/upload/${s.headPictureUrl}" width="150"height="160"></a><br/><br/>
             			<a href="#">${s.accountName}</a>
             		</li> 
             	</c:forEach>             
             </ul>
       
          </div>
      </div>
  </div>

  </div>
  <div style="height:20px;width: 100%;float: left;" ></div>
  
</div>
<div class="clear"></div>
<jsp:include page="/web/footer.jsp"></jsp:include>
<script type="text/Javascript">
	function addCookie() {　 // 加入收藏
　　　　if (document.all) {
　　　　	window.external.addFavorite('http://www.sms98.cn', '房地产销售系统');
　　　　}
　　　　else if (window.sidebar) {
　　　　	window.sidebar.addPanel('房地产销售系统','http://www.sms98.cn', "");
　　　　}
　　}　
</script>
<script type="text/javascript">
//banner 图片切换
banner_show(694);
	$(document).ready(function(){
	//web下滑效果
	var scrtime;
 	
	function show(){
		scrtime = setInterval(function(){
		var $ul = $(".userName");
		var liHeight = $ul.find("li:last").height();
		$ul.animate({marginTop : liHeight+1 +"px"},694,function(){
			$ul.find("li:last").prependTo($ul)
			$ul.find("li:first").hide();
			$ul.css({marginTop:0});
			$ul.find("li:first").fadeIn(1000);
		});	
		},2500);
	}
	show();
	$(".w678 li a").hover(function(){
		$(this).children("h5").show();
		},function(){
			$(this).children("h5").hide();	
		})
	});	
</script>
</body>
</html>