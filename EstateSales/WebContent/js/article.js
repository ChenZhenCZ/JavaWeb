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
            height: 400,//table的高度
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
	return "<img src='"+row.logo+"' width='50' height='50'  class=' img-responsive ' alt='图标'>";
}
function operaFormatter(value,row,index){
	return "<a href='"+row.content_url+"' target='_blank' class=' btn btn-info' role='button'>预览</a>";
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
	$("#delete").click(function(){
		var data=$("#tb").bootstrapTable("getSelections");
		if(data.length==1){
			var row=data[0];
			if(row.msg_status=='激活'){
				$.post("/EstateSales/admin/updateStatus",
						{"article.msg_status":"冻结","article.id":row.id},
						function(data){
							$("#tb").bootstrapTable("refresh",{url:"/EstateSales/admin/articleList"});
							toastr.info("冻结成功！");
						},
						"json");
			}else{
				$.post("/EstateSales/admin/updateStatus",
						{"article.msg_status":"激活","article.id":row.id},
						function(data){
							$("#tb").bootstrapTable("refresh",{url:"/EstateSales/admin/articleList"});
							toastr.info("激活成功！");
						},
						"json");
			}
		}else{
			toastr.info("请选中数据");
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