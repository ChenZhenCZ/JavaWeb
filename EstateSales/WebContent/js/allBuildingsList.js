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
            clickToSelect: true,  //是否启用点击选中行
            toolbar: '#toolbar', //工具按钮用哪个容器
            locale:'zh-CN',//中文支持
            pagination: true,//是否开启分页（*）
            pageNumber:1,//初始化加载第一页，默认第一页
            pageSize: 5,//每页的记录行数（*）
            showToggle:true,//显示试图切换
            pageList: [5,10,15],//可供选择的每页的行数（*）
            sidePagination: "server", //分页方式：client客户端分页，server服务端分页（*）
            showRefresh:true,//刷新按钮
            showColumns:true,
            showExport: true,//显示导出按钮  
            exportDataType: "basic",//导出类型    
            //【样式设置】
            height: 420,//table高度
            //按需求设置不同的样式：5个取值代表5中颜色['active', 'success', 'info', 'warning', 'danger'];
            rowStyle: function (row, index) {
                var style = "";
                if (row.name=="小红") {style='success';}
                return { classes: style }
            }
        })
     }
}

var bstpTable=new BstpTable($("#tb"));
bstpTable.inint({})

$(".search").click(function(){
    var searchArgs={
    		agencyId:$("select[name='agencyId']").val(),
    }
    bstpTable.inint(searchArgs)
})
$("#select").select2();
function logoFormatter(value,row,index){
	return "<img src='"+row.logo+"' width='50' height='50'  class=' img-responsive ' alt='图标'>";
}
$("#look").click(function(){
	var data=$("#tb").bootstrapTable("getSelections");
	if(data.length==1){
		var row=data[0];
		window.location.href="http://localhost:8080/EstateSales/buildings/adminBuildsDetail?buildingsVO.id="+row.id;
	}else{
		toastr.info("请选中要查看的楼盘！");
	}
})