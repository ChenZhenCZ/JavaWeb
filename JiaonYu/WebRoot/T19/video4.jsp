<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<script src="swfobject.js" type="text/javascript"></script>
</head>
<body>
<div id="flashcontent"></div>
</body>
<script type="text/javascript">
// 加载flash，参数依次是（flash路径，flash对象id，宽，高,FlashPlayer需要的版本号,Flash资源的背景色）


	var att = { data:"images/flvplayer.swf", width:"821", height:"482" };
	var par = { wmode:"opaque", flashvers: "8",BufferTime=3"};
	var id = "flashcontent";
	var myObject = swfobject.createSWF(att, par, dotId);
	
   	//var so = new SWFObject("../video/T56.swf", "flash", "400", "100%", "8", "#336699"); 
// 画面质量，默认为"high"。 需要说明的是，如果质量设为较低，低版本浏览器可能有错位现象
   //so.addParam("quality", "low");
// 解决低版本浏览器中弹出层被flash遮挡的问题
   //so.addParam("wmode", "transparent");

//这里是给Flash添加内联参数
   //so.addVariable("variable1", "value1");
   //so.addVariable("variable2", "value2");
   //so.addVariable("variable3", "value3");
//这里是给Flash添加FlashVar，这是以FlashVar的方式给Flash的Root添加变量，对于Number型变量在Flash端需要 做类型转换。
   //so.addVariable("variable1", getQueryParamValue("variable1"));
   //so.addVariable("variable2", getQueryParamValue("variable2"));
//这里是至关重要的一个地方，flash就是显示在id为flashcontent的标签下。
   //so.write("flashcontent");

</script>
</html>