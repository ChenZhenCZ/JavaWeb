class BstpTable{
    constructor(obj) {
        this.obj=obj;
    }
    inint(searchArgs){
         //---先销毁表格 ---
         this.obj.bootstrapTable('destroy');  
         //---初始化表格,动态从服务器加载数据--- 
         this.obj.bootstrapTable({
            //【发出请求的基础信息】
            method: 'post',
            contentType: "application/x-www-form-urlencoded",
            //【查询设置】
            /* queryParamsType的默认值为 'limit' ,在默认情况下 传给服务端的参数为：offset,limit,sort
                              设置为 ''  在这种情况下传给服务器的参数为：pageSize,pageNumber */
            queryParamsType:'', 
            queryParams: function queryParams(params) {  
              var param = {  
                  pageNumber: params.pageNumber,    
                  pageSize: params.pageSize
              }; 
              for(var key in searchArgs){
                  param[key]=searchArgs[key] 
              }  
              return param;                   
            }, 
            
            //【其它设置】
            locale:'zh-CN',//中文支持
            pagination: true,//是否开启分页（*）
            pageNumber:1,//初始化加载第一页，默认第一页
            pageSize: 5,//每页的记录行数（*）
            showToggle:true,//显示试图切换
            toolbar:"#toolbar",
            pageList: [5,10,15],//可供选择的每页的行数（*）
            sidePagination: "server", //分页方式：client客户端分页，server服务端分页（*）
            showRefresh:true,//刷新按钮
            showColumns:true,
            showExport: true,//显示导出按钮  
            exportDataType: "basic",//导出类型 
            clickToSelect:true,
            //【样式设置】
            height: 420,//table的高度
            //按需求设置不同的样式：5个取值代表5中颜色['active', 'success', 'info', 'warning', 'danger'];
            rowStyle: function (row, index) {
                var style = "";
                if (row.name=="小红") {style='success';}
                return { classes: style }
            }
        })
     }
}
function logoFormatter(value,row,index){
	return "<img src='"+row.logo+"' width='50' height='50'  class=' img-responsive img-circle' alt='图标'>";
}
var bstpTable=new BstpTable($("#tb"));
bstpTable.inint({})
$(function(){
	$(".search").click(function(){
	    var searchArgs={
	         name:$("input[name='name']").val(),
	    }
	    bstpTable.inint(searchArgs)
	})
})
$(function(){
	$("#update").click(function(){
		$.post("/EstateSales/agency/updateStatus",
				{"agencyVo.id":id,"agencyVo.status":"激活","agencyVo.email":email,"agencyVo.phone":phone},
				function(data){
					$("#myModal").modal("toggle");
					$("#tb").bootstrapTable("refresh",{url:"/EstateSales/agency/list"});
					toastr.info("该经销商已审核成功！");
				},
				"json")
		})
	$("#remove").click(function(){//冻结
		var data=$("#tb").bootstrapTable("getSelections");
		if(data.length==1){
			var row=data[0];
			if(row.status=='激活'){
				$.post("/EstateSales/agency/updateStatus",
						{"agencyVo.id":row.id,"agencyVo.status":"冻结","agencyVo.email":row.email,"agencyVo.phone":row.phone},
						function(data){
							$("#tb").bootstrapTable("refresh",{url:"/EstateSales/agency/list"});
							toastr.info("该经销商已冻结完毕！");
						},
						"json")
			}else{
				toastr.info("该经销商已冻结！");
			}
		}else{
			toastr.error("请选择要冻结的经销商！");
		}
	})
	var id;
	var phone;
	var email;
$("#check").click(function(){
	var data=$("#tb").bootstrapTable("getSelections");
	if(data.length==1){
		if(data[0].status=="激活"){
			toastr.info("该经销商已审核！");
		}else{
			id=data[0].id;
			phone=data[0].phone;
			email=data[0].email;
			$("#intro").html(data[0].intro);
			$("#name").html(data[0].name);
			$("#phone").html(phone);
			$("#email").html(email);
			$("#leader").html(data[0].leader);
			$("#address").html(data[0].address);
			$("#tel").html(data[0].tel);
			$("#status").html(data[0].status);
			$("#time").html(data[0].created_time);
			$("#myModal").modal();
		}
	}else{
		toastr.error("请选择要审核的经销商！");
	}
})
})
function formatDate(value) {
	    if (value == undefined || value == null || value == '') {
	        return "";
	    } else {
	        var date = new Date(value); // 获取js的Date对象
	        var year = date.getFullYear().toString();
	        var month = (date.getMonth() + 1);
	        var day = date.getDate().toString();
	        var hour = date.getHours().toString();
	        var minutes = date.getMinutes().toString();
	        var seconds = date.getSeconds().toString();
	        if (month < 10) {
	            month = "0" + month;
	        }
	        if (day < 10) {
	            day = "0" + day;
	        }
	        return year + "-" + month + "-" + day;
	    }
	}