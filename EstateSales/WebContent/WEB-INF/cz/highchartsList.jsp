<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path= request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

	<title>房屋销售情况</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
    <meta name="author" content="Muhammad Usman">
	<%@include file="./Jspscript.jsp" %>
    <link rel="stylesheet" href="<%=path%>/toastr/toastr.min.css">
 	
    <link href="<%=path%>/plugins/bootstrap/bootstrap.min.css" rel="stylesheet">
	<link href="<%=path%>/bootstrap/bootstrap-table.css" rel="stylesheet"/> 
	<script type="text/javascript" src="<%=path%>/bootstrap/dist/js/bootstrapValidator.js"></script>
	 <link rel="stylesheet" href="<%=path%>/bootstrap/dist/css/bootstrapValidator.css"/>
	 <!-- 报表 -->
	 <link href="<%=path%>/highcharts/highcharts.css" rel="stylesheet"/> 
	 <script type="text/javascript" src="<%=path%>/highcharts/highcharts.js"></script>
	  <script type="text/javascript" src="<%=path%>/highcharts/highcharts-zh_CN.js"></script>
	  <script type="text/javascript" src="<%=path%>/highcharts/highcharts-3d.js"></script>
	  <script type="text/javascript" src="<%=path%>/highcharts/exporting.js"></script>
	    <script type="text/javascript" src="<%=path%>/highcharts/jquery-1.8.3.min.js"></script>
	<body>
	
	  		<!-- 更换经销商logo -->
			<%@ include file="./changeAgencyLogo.jsp" %>
		    <!-- topbar starts -->
		  <%@ include file="./top.jsp" %>
  	  <div class="row">
        
        <!-- left menu starts -->
       <%@ include file="./lefEmp.jsp" %>
        <!--/span-->
        <!-- left menu ends -->

        <div id="content" class="col-lg-10 col-sm-10">
            <!-- content starts -->
            <div>
			    <ul class="breadcrumb">
			        <li>
			            <a href="<%=path%>">首页</a>
			        </li>
			        <li>
			            <a href="#">房屋销售情况</a>
			        </li>
			    </ul>
			</div>
		<div class="row">
        	<div id="container"></div>
        	<div id="sliders">
    <table>
        <tr>
            <td>α 角（内旋转角）</td>
            <td><input id="alpha" type="range" min="0" max="45" value="10"/> <span id="alpha-value" class="value"></span></td>
        </tr>
        <tr>
            <td>β 角（外旋转角）</td>
            <td><input id="beta" type="range" min="-45" max="45" value="15"/> <span id="beta-value" class="value"></span></td>
        </tr>
        <tr>
            <td>深度</td>
            <td><input id="depth" type="range" min="20" max="100" value="50"/> <span id="depth-value" class="value"></span></td>
        </tr>
    </table>
</div>
        	
         </div>
</div>
</div><!--/.fluid-container-->
<script src="<%=path%>/bootstrap/bootstrap-table.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-locale-all.min.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-zh-CN.js"></script>
<script src="<%=path%>/bootstrap/bootstrap-table-export.js"></script>
<script src="<%=path%>/bootstrap/tableExport.js"></script>
<script src="<%=path %>/js/formFill.js"></script>
<!-- jQuery消息提示框 -->
<script src="<%=path%>/toastr/toastr.min.js"></script>
<script src="<%=path%>/js/toastrOption.js"></script>    
<!-- 报表 -->
<script type="text/javascript">

$(function () {
	var p=${p};
	var n=${n};
	var y=${y};
    var chart = new Highcharts.Chart({
        chart: {
            renderTo: 'container',
            type: 'column',
            options3d: {
                enabled: true,
                alpha: 10,
                beta: 15,
                depth: 50,
                marginLeft:0,
                viewDistance:25
            }
        },
        title: {
            text: '2017年1月-8月，万达房地产公司的房屋销售情况'
        }
        ,
        xAxis: {
            categories: ['已售', '待售', '未售']
        },
        subtitle: {
            text: '点击可查看具体的版本数据，数据来源: <a href="http://localhost:8080/EstateSales/index.jsp">万达房地产网</a>.'
        },
        tooltip: {
            headerFormat: '<b>{point.key}</b><br>',
            pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y} 套商品房'
        },
        plotOptions: {
            column: {
                depth: 25
            }
        },
        series: [{
            name:'万达房地产公司',
            data: [p, n, y]
        }]
    });
    function showValues() {
        $('#alpha-value').html(chart.options.chart.options3d.alpha);
        $('#beta-value').html(chart.options.chart.options3d.beta);
        $('#depth-value').html(chart.options.chart.options3d.depth);
    }
    // Activate the sliders
    $('#sliders input').on('input change', function () {
        chart.options.chart.options3d[this.id] = this.value;
        showValues();
        chart.redraw(false);
    });
    showValues();
});
</script>
<!-- 上传图片 -->
<script>
$('#logo').fileinput({
    language: 'zh',
    uploadUrl: '<%=path%>/staff/uploadLogo',
    allowedFileExtensions : ['jpg', 'png','gif'],
})
var imgSrc="";
$('#logo').on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功		
	 imgSrc=data.response.emp.headicon;
	 $("#changeLogo").modal("toggle");
})
$(function () {
	$('#changeLogo').on('hide.bs.modal', function () {
		$("#headicon").attr('src',imgSrc)
 	})
 });
</script>
 
</body>
</html>