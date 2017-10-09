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
<title>销售情况</title>
 	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="author" content="Muhammad Usman">

	<!-- The styles -->
 	<%@include file="./JsAndCss.jsp" %>
 	
 	<!-- jQuery消息提示框 -->
	<link rel="stylesheet" href="<%=path%>/toastr/toastr.min.css">
 	
    <link href="<%=path%>/plugins/bootstrap/bootstrap.min.css" rel="stylesheet">
	<link href="<%=path%>/bootstrap/bootstrap-table.css" rel="stylesheet"/> 
	 <!-- 报表 -->
	 <link href="<%=path%>/highcharts/highcharts.css" rel="stylesheet"/> 
	 <script type="text/javascript" src="<%=path%>/highcharts/highcharts.js"></script>
	  <script type="text/javascript" src="<%=path%>/highcharts/highcharts-zh_CN.js"></script>
	  <script type="text/javascript" src="<%=path%>/highcharts/highcharts-3d.js"></script>
	  <script type="text/javascript" src="<%=path%>/highcharts/exporting.js"></script>
    
</head>
<body>
	<!-- 更换经销商logo -->
	<%@ include file="./changeAgencyLogo.jsp" %>
    <!-- topbar starts -->
    <%@include file="./top.jsp" %>
    <!-- topbar ends -->
    <!-- 模泰框 ：新增开始 -->
	
<div class="ch-container">
    <div class="row">
        <!-- left menu starts -->
		<%@ include file="./leftMenu.jsp" %>
        <div id="content" class="col-lg-10 col-sm-10">
        <!-- content starts -->
        <div>
		    <ul class="breadcrumb">
		        <li><a href="<%=path%>/agency/main">首页</a></li>
		        <li><a href="javascript:void(0);">销售情况</a></li>
		    </ul>
	    </div>
		  <div class="row">  
		    <div id="container" style="min-width:400px;height:400px"></div>     
          </div>
		</div>
		</div><!--/.fluid-container-->
	</div>
	<!--/row-->
<!--/.fluid-container-->


<script src="<%=path%>/bootstrap/bootstrap-table.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-locale-all.min.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-zh-CN.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-export.js"></script>
<script src="<%=path%>/bootstrap/tableExport.js"></script>

<script src="<%=path %>/js/formFill.js"></script>

<!-- jQuery消息提示框 -->
<script src="<%=path%>/toastr/toastr.min.js"></script>
<script src="<%=path%>/js/toastrOption.js"></script>

<script type="text/javascript" src="<%=path %>/bootstrap/dist/js/bootstrapValidator.js"></script>
<script src="<%=path %>/js/agencyModifyEmployeeInfo.js"></script>
<!-- 经销商上传图片 -->
<!-- 报表 -->
<script type="text/javascript">
$(function () {
	var p=${p};
	var n=${n};
	var y=${y};
    Highcharts.chart('container', {
    	chart: {
              type: 'pie',
              options3d: {
                  enabled: true,
                  alpha: 45,
                  beta: 0
              }
          },
        title: {
            text: '2017年1月-8月，万达房地产公司的房屋销售情况'
        },
        subtitle: {
            text: '点击可查看具体的版本数据，数据来源: <a href="http://localhost:8080/EstateSales/index.jsp">万达房地产网</a>.'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                depth: 35,
                dataLabels: {
                    enabled: true,
                    format: '{point.name}'
                }
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
            pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y}套</b>商品房<br/>'
        },
        series: [{
        	type:'pie',
            name: '万达房地产公司',
            colorByPoint: true,
            data: [{
                name: '已售',
                y:p,
                drilldown: '已售'
            }, {
                name: '待售',
                y:n,
                drilldown: 'Chrome'
            }, {
                name: '未售',
                y:y,
                drilldown: 'Firefox'
            }]
        }]
    });
});
</script>
<script>
$('#logo').fileinput({
    language: 'zh',
    uploadUrl: '<%=path%>/agency/uploadLogo',
    allowedFileExtensions : ['jpg', 'png','gif'],
})
var imgSrc="";
$('#logo').on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功		
	imgSrc=data.response.agencyVo.logo;
	$("#changeLogo").modal("toggle");
})
$(function () {
	$('#changeLogo').on('hide.bs.modal', function () {
		if(imgSrc!=""){
			$("#logoImg").attr('src',imgSrc)
		}
 	})
 });
 

//打开模态框 ： 修改活动图片
var activityId="";
$(function(){
	$(".modifyActivityLogo").click(function(){
		var data=$("#tb").bootstrapTable("getSelections");
		if(data.length==1){
			activityId = data[0].id; //获取选中的活动Id
			$("#activityLogo").modal();	//打开模态框
		}else{
			toastr.warning("未选中需要修改的图片!");  
		}
	})
})

//活动图片修改
$('#activitylogo').fileinput({
	language: 'zh',
    uploadUrl: '<%=path%>/activity/modifyActivityLogo',
    allowedFileExtensions : ['jpg', 'png','gif'],
    initialCaption: "请选择上传图片",
    uploadExtraData:
    	function(previewId, index) {   //额外参数的关键点
	    	var data = {
	   			activityid:activityId
	    	};
	        return data;
    }
})
$('#activitylogo').on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功		
	$("#activityLogo").modal("toggle");
	$("#tb").bootstrapTable("refresh",{url:"/EstateSales/activity/activityList"});
})
</script>
</body>
</html>